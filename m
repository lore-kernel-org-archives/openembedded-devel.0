Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF3AA794D8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2018 14:43:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w89EhjN8007101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Sep 2018 07:43:46 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Sep 2018 07:43:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 9 Sep 2018 10:42:47 -0400
Message-ID: <1536504167-60239-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1536417214-146096-1-git-send-email-hongxu.jia@windriver.com>
References: <1536417214-146096-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] sanlock: add version 3.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Sep 2018 14:43:46 -0000
Content-Type: text/plain

A shared storage lock manager.

- Fix compile failure with musl

- Fix installed-vs-shipped QA issue

- Fix ldflags QA issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-compile-failure-with-libc-musl.patch  | 80 ++++++++++++++++++++++
 meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb  | 36 ++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch b/meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch
new file mode 100644
index 0000000..e4bde80
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock/0001-fix-compile-failure-with-libc-musl.patch
@@ -0,0 +1,80 @@
+From c51c2c543f3c78b2a68acc61f786f903f2e0fec8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 9 Sep 2018 07:28:09 -0400
+Subject: [PATCH] fix compile failure with libc musl
+
+The lack of random_r in musl:
+[snip]
+|main.c:1393:7: warning: implicit declaration of function 'random_r';
+did you mean 'random'? [-Wimplicit-function-declaration]
+|  rv = random_r(&rand_data, &val);
+|       ^~~~~~~~
+|       random
+|main.c:1408:30: error: invalid application of 'sizeof' to incomplete
+type 'struct random_data'
+|  memset(&rand_data, 0, sizeof(rand_data));
+[snip]
+
+s/random_r/random/, s/initstate_r/initstate/ and remove `static struct
+random_data rand_data'
+
+Here is the man of `random_r()':
+[snip]
+The random_r() function is like random(3), except that instead of using
+state information maintained in a global variable
+[snip]
+
+So use random without state information is OK.
+
+Upstream-Status: Submitted [sanlock-devel@lists.fedorahosted.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/main.c | 12 ++++--------
+ 1 file changed, 4 insertions(+), 8 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index f60b4d3..602c400 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -84,7 +84,6 @@ static char command[COMMAND_MAX];
+ static int cmd_argc;
+ static char **cmd_argv;
+ static struct thread_pool pool;
+-static struct random_data rand_data;
+ static char rand_state[32];
+ static pthread_mutex_t rand_mutex = PTHREAD_MUTEX_INITIALIZER;
+ static const char *run_dir = NULL;
+@@ -1386,16 +1385,15 @@ int get_rand(int a, int b);
+ 
+ int get_rand(int a, int b)
+ {
+-	int32_t val;
+-	int rv;
++	long int rv;
+ 
+ 	pthread_mutex_lock(&rand_mutex);
+-	rv = random_r(&rand_data, &val);
++	rv = random();
+ 	pthread_mutex_unlock(&rand_mutex);
+ 	if (rv < 0)
+ 		return rv;
+ 
+-	return a + (int) (((float)(b - a + 1)) * val / (RAND_MAX+1.0));
++	return a + (int) (((float)(b - a + 1)) * rv / (RAND_MAX+1.0));
+ }
+ 
+ static void setup_host_name(void)
+@@ -1405,9 +1403,7 @@ static void setup_host_name(void)
+ 	uuid_t uu;
+ 
+ 	memset(rand_state, 0, sizeof(rand_state));
+-	memset(&rand_data, 0, sizeof(rand_data));
+-
+-	initstate_r(time(NULL), rand_state, sizeof(rand_state), &rand_data);
++	initstate(time(NULL), rand_state, sizeof(rand_state));
+ 
+ 	/* use host name from command line */
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
new file mode 100644
index 0000000..c51bccc
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "A shared storage lock manager"
+DESCRIPTION = "sanlock  is  a lock manager built on shared storage.  Hosts with access \
+to the storage can perform locking.   An  application  running  on  the \
+hosts  is  given  a small amount of space on the shared block device or \
+file, and uses sanlock for its  own  application-specific  synchronization. \
+Internally,  the  sanlock  daemon manages locks using two disk-based \
+lease algorithms: delta leases and paxos leases."
+HOMEPAGE = "https://pagure.io/sanlock"
+SECTION = "utils"
+
+LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
+
+SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
+           file://0001-fix-compile-failure-with-libc-musl.patch \
+          "
+SRCREV = "90b2ffa77edd46bea007b7bb39bfd4d2db2ff7af"
+S = "${WORKDIR}/git"
+
+DEPENDS = "libaio util-linux"
+
+inherit distutils
+
+do_configure[noexec] = "1"
+
+do_compile_prepend () {
+    oe_runmake -C wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
+    oe_runmake -C src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
+    cd ${S}/python
+}
+
+do_install_prepend () {
+    oe_runmake -C wdmd DESTDIR=${D} LIBDIR=${libdir} install
+    oe_runmake -C src DESTDIR=${D} LIBDIR=${libdir} install
+    cd ${S}/python
+}
-- 
2.8.1


