Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68D16606D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 02:58:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v182wD1P016966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Feb 2017 18:58:14 -0800 (PST)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 18:58:13 -0800
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Feb 2017 10:58:05 +0800
Message-ID: <1486522685-22052-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [OE-core] [PATCH] ltp: Fix containers/userns05 failure for lib32
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
X-List-Received-Date: Wed, 08 Feb 2017 02:58:14 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch to fix userns05 case:
<<<test_output>>>
user_namespace5 1 TFAIL : userns05.c:95: userns:parent should be not equal to cpid2
user_namespace5 1 TFAIL : userns05.c:95: userns:parent should be not equal to cpid2
user_namespace5 0 TINFO : Child process returned TPASS
user_namespace5 0 TINFO : Child process returned TPASS
user_namespace5 0 TINFO : Child process returned TFAIL
incrementing stop

Rename the previous patch to add a number prefix

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...039-fcntl-fix-the-time-def-to-use-time_t.patch} |  0
 ...iners-userns05-use-unsigned-int-for-ns-id.patch | 60 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  3 +-
 3 files changed, 62 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/ltp/ltp/{fcntl-fix-the-time-def-to-use-time_t.patch => 0039-fcntl-fix-the-time-def-to-use-time_t.patch} (100%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0040-containers-userns05-use-unsigned-int-for-ns-id.patch

diff --git a/meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch b/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
similarity index 100%
rename from meta/recipes-extended/ltp/ltp/fcntl-fix-the-time-def-to-use-time_t.patch
rename to meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
diff --git a/meta/recipes-extended/ltp/ltp/0040-containers-userns05-use-unsigned-int-for-ns-id.patch b/meta/recipes-extended/ltp/ltp/0040-containers-userns05-use-unsigned-int-for-ns-id.patch
new file mode 100644
index 0000000..4dee1f5
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0040-containers-userns05-use-unsigned-int-for-ns-id.patch
@@ -0,0 +1,60 @@
+From 3b63d350e9fe9e4271916cc0abfac65a5d6419ff Mon Sep 17 00:00:00 2001
+From: Jiri Jaburek <jjaburek@redhat.com>
+Date: Tue, 7 Feb 2017 07:58:16 +0000
+Subject: [PATCH] containers/userns05: use unsigned int for ns id
+
+The kernel defines it as 'unsigned int' in 'struct ns_common'
+and formats it as
+
+  snprintf(buf, size, "%s:[%u]", ns_ops->name, ns->inum);
+
+This change makes the test work on 32bit systems where LONG_MAX
+is smaller than UINT_MAX.
+
+Signed-off-by: Jiri Jaburek <jjaburek@redhat.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/containers/userns/userns05.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/testcases/kernel/containers/userns/userns05.c b/testcases/kernel/containers/userns/userns05.c
+index 8d8c40a..8eac729 100644
+--- a/testcases/kernel/containers/userns/userns05.c
++++ b/testcases/kernel/containers/userns/userns05.c
+@@ -49,18 +49,18 @@ static int child_fn1(void)
+ 	return 0;
+ }
+ 
+-static long getusernsidbypid(int pid)
++static unsigned int getusernsidbypid(int pid)
+ {
+ 	char path[BUFSIZ];
+ 	char userid[BUFSIZ];
+-	long id = 0;
++	unsigned int id = 0;
+ 
+ 	sprintf(path, "/proc/%d/ns/user", pid);
+ 
+ 	if (readlink(path, userid, BUFSIZ) == -1)
+ 		tst_resm(TFAIL | TERRNO, "readlink failure.");
+ 
+-	if (sscanf(userid, "user:[%ld]", &id) != 1)
++	if (sscanf(userid, "user:[%u]", &id) != 1)
+ 		tst_resm(TFAIL, "sscanf failure.");
+ 	return id;
+ }
+@@ -68,7 +68,7 @@ static long getusernsidbypid(int pid)
+ static void test_userns_id(void)
+ {
+ 	int cpid1, cpid2, cpid3;
+-	long parentuserns, cpid1userns, cpid2userns, newparentuserns;
++	unsigned int parentuserns, cpid1userns, cpid2userns, newparentuserns;
+ 
+ 	parentuserns = getusernsidbypid(getpid());
+ 	cpid1 = ltp_clone_quick(SIGCHLD, (void *)child_fn1,
+-- 
+2.9.3
+
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 72d465b..aaa63c2 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -65,7 +65,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0037-containers-netns_netlink-Avoid-segmentation-fault.patch \
            file://0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch \
-           file://fcntl-fix-the-time-def-to-use-time_t.patch \
+           file://0039-fcntl-fix-the-time-def-to-use-time_t.patch \
+           file://0040-containers-userns05-use-unsigned-int-for-ns-id.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.3


