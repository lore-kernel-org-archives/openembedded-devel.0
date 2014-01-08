Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B071D6D114
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 09:32:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s089Wi2Y001964
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jan 2014 01:32:44 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 01:32:44 -0800
From: <wenzong.fan@windriver.com>
To: <xin.ouyang@windriver.com>, <mark.hatle@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2014 04:32:26 -0500
Message-ID: <c060067dec986662be05d9399f77c2e0854c64b5.1389171235.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389171235.git.wenzong.fan@windriver.com>
References: <cover.1389171235.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-selinux][PATCH 06/10] policycoreutils: migrate SRC_URI and patches to 2.2.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2014 09:32:44 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This patch is removed since it is merged by new version:
 - policycoreutils-fix-strict-prototypes.patch

These two patches are updated:
 - policycoreutils-fix-sepolicy-install-path.patch
 - policycoreutils-make-O_CLOEXEC-optional.patch

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 recipes-security/selinux/policycoreutils.inc       |    2 +-
 ...policycoreutils-fix-sepolicy-install-path.patch |   18 +++++------
 .../policycoreutils-fix-strict-prototypes.patch    |   34 --------------------
 .../policycoreutils-make-O_CLOEXEC-optional.patch  |   28 ++++++++--------
 recipes-security/selinux/policycoreutils_2.2.5.bb  |    9 +++---
 recipes-security/selinux/policycoreutils_git.bb    |    8 +++--
 6 files changed, 32 insertions(+), 67 deletions(-)
 delete mode 100644 recipes-security/selinux/policycoreutils/policycoreutils-fix-strict-prototypes.patch

diff --git a/recipes-security/selinux/policycoreutils.inc b/recipes-security/selinux/policycoreutils.inc
index a474cb0..430b03f 100644
--- a/recipes-security/selinux/policycoreutils.inc
+++ b/recipes-security/selinux/policycoreutils.inc
@@ -1,4 +1,4 @@
-PRINC = "3"
+PRINC = "1"
 
 SUMMARY = "SELinux policy core utilities"
 DESCRIPTION = "policycoreutils contains the policy core utilities that are required \
diff --git a/recipes-security/selinux/policycoreutils/policycoreutils-fix-sepolicy-install-path.patch b/recipes-security/selinux/policycoreutils/policycoreutils-fix-sepolicy-install-path.patch
index aaf2e66..617908a 100644
--- a/recipes-security/selinux/policycoreutils/policycoreutils-fix-sepolicy-install-path.patch
+++ b/recipes-security/selinux/policycoreutils/policycoreutils-fix-sepolicy-install-path.patch
@@ -1,35 +1,33 @@
-From 086f715e2a0dd05c07f0428f424017cc96acc387 Mon Sep 17 00:00:00 2001
-From: Xin Ouyang <Xin.Ouyang@windriver.com>
-Date: Thu, 22 Aug 2013 16:40:26 +0800
 Subject: [PATCH] policycoreutils: fix install path for new pymodule sepolicy
 
 Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ---
  sepolicy/Makefile |    4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/sepolicy/Makefile b/sepolicy/Makefile
-index 11b534f..9e46b74 100644
+index 2b8716c..70f4bdd 100644
 --- a/sepolicy/Makefile
 +++ b/sepolicy/Makefile
-@@ -11,6 +11,8 @@ BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
+@@ -12,6 +12,8 @@ BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
  SHAREDIR ?= $(PREFIX)/share/sandbox
- override CFLAGS = $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
+ override CFLAGS = -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
  
 +PYLIBVER ?= $(shell python -c 'import sys;print "python%d.%d" % sys.version_info[0:2]')
 +
- BASHCOMPLETIONS=sepolicy-bash-completion.sh 
+ BASHCOMPLETIONS=sepolicy-bash-completion.sh
  
  all: python-build
-@@ -23,7 +25,7 @@ clean:
- 	-rm -rf build *~ \#* *pyc .#*
+@@ -30,7 +32,7 @@ test:
+ 	@python test_sepolicy.py -v
  
  install:
 -	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
 +	$(PYTHON) setup.py install --install-lib $(LIBDIR)/$(PYLIBVER)/site-packages
  	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
  	install -m 755 sepolicy.py $(BINDIR)/sepolicy
- 	-mkdir -p $(MANDIR)/man8
+ 	(cd $(BINDIR); ln -sf sepolicy sepolgen)
 -- 
 1.7.9.5
 
diff --git a/recipes-security/selinux/policycoreutils/policycoreutils-fix-strict-prototypes.patch b/recipes-security/selinux/policycoreutils/policycoreutils-fix-strict-prototypes.patch
deleted file mode 100644
index 9bb353a..0000000
--- a/recipes-security/selinux/policycoreutils/policycoreutils-fix-strict-prototypes.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5944e9908fc12d69d19a1d24128cbc6d1a423c3d Mon Sep 17 00:00:00 2001
-From: Xin Ouyang <Xin.Ouyang@windriver.com>
-Date: Tue, 18 Jun 2013 12:29:00 +0800
-Subject: [PATCH] policycoreutils: fix build strict-prototypes failure
-
-| policy.c:90:6: error: function declaration isn't a prototype
-[-Werror=strict-prototypes]
-| cc1: all warnings being treated as errors
-| error: command 'i586-poky-linux-gcc' failed with exit status 1
-| make[1]: *** [python-build] Error 1
-
-Upstream-Status: pending
-
-Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
----
- sepolicy/policy.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sepolicy/policy.c b/sepolicy/policy.c
-index 4eca22d..e454e75 100644
---- a/sepolicy/policy.c
-+++ b/sepolicy/policy.c
-@@ -87,7 +87,7 @@ static PyMethodDef methods[] = {
- 	{NULL, NULL, 0, NULL}	/* sentinel */
- };
- 
--void init_policy() {
-+void init_policy(void) {
- PyObject *m;
- m = Py_InitModule("_policy", methods);
- init_info(m);
--- 
-1.7.9.5
-
diff --git a/recipes-security/selinux/policycoreutils/policycoreutils-make-O_CLOEXEC-optional.patch b/recipes-security/selinux/policycoreutils/policycoreutils-make-O_CLOEXEC-optional.patch
index aaaa1e5..d50356e 100644
--- a/recipes-security/selinux/policycoreutils/policycoreutils-make-O_CLOEXEC-optional.patch
+++ b/recipes-security/selinux/policycoreutils/policycoreutils-make-O_CLOEXEC-optional.patch
@@ -1,7 +1,4 @@
-From dca6a89058d818827d6f1c80c9b6abb46002b855 Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe.macdonald@windriver.com>
-Date: Fri, 11 Oct 2013 09:55:43 -0400
-Subject: [PATCH 1/2] policycoreutils: make O_CLOEXEC optional
+Subject: [PATCH] policycoreutils: make O_CLOEXEC optional
 
 Various commits in the selinux tree in the current release added O_CLOEXEC
 to open() calls in an attempt to address file descriptor leaks as
@@ -17,29 +14,30 @@ produce curious AVC Denied messages.
 Uptream-Status: Inappropriate [O_CLOEXEC has been in Linux since 2007 and POSIX since 2008]
 
 Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ---
  restorecond/user.c |    8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/restorecond/user.c b/restorecond/user.c
-index 00a646f..50f3ab6 100644
+index 2c28676..6235772 100644
 --- a/restorecond/user.c
 +++ b/restorecond/user.c
-@@ -201,7 +201,13 @@ static int local_server() {
+@@ -202,7 +202,13 @@ static int local_server() {
  			perror("asprintf");
  		return -1;
  	}
--	int fd = open(ptr, O_CREAT | O_WRONLY | O_NOFOLLOW | O_CLOEXEC, S_IRUSR | S_IWUSR);
-+	int fd = open(ptr, O_CREAT | O_WRONLY | O_NOFOLLOW 
-+#ifdef O_CLOEXEC
-+                 | O_CLOEXEC
-+#else
-+#warning O_CLOEXEC undefined on this platform, this may leak file descriptors
-+#endif
-+                 , S_IRUSR | S_IWUSR);
+-	local_lock_fd = open(ptr, O_CREAT | O_WRONLY | O_NOFOLLOW | O_CLOEXEC, S_IRUSR | S_IWUSR);
++	local_lock_fd = open(ptr, O_CREAT | O_WRONLY | O_NOFOLLOW
++	#ifdef O_CLOEXEC
++		| O_CLOEXEC
++	#else
++		#warning O_CLOEXEC undefined on this platform, this may leak file descriptors
++	#endif
++		, S_IRUSR | S_IWUSR);
  	if (debug_mode)
  		g_warning ("Lock file: %s", ptr);
  
 -- 
-1.7.10.4
+1.7.9.5
 
diff --git a/recipes-security/selinux/policycoreutils_2.2.5.bb b/recipes-security/selinux/policycoreutils_2.2.5.bb
index 64f0d8d..23cc42f 100644
--- a/recipes-security/selinux/policycoreutils_2.2.5.bb
+++ b/recipes-security/selinux/policycoreutils_2.2.5.bb
@@ -1,15 +1,14 @@
-PR = "r3"
+PR = "r0"
 
-include selinux_20130423.inc
+include selinux_20131030.inc
 include ${BPN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI[md5sum] = "f34216414b650a0a25dec89a758234fb"
-SRC_URI[sha256sum] = "b6881741f9f9988346a73bfeccb0299941dc117349753f0ef3f23ee86f06c1b5"
+SRC_URI[md5sum] = "a2963d7024c5c4ce89f2459d48f91ec8"
+SRC_URI[sha256sum] = "bbf850a8c3c2f371f439d6525663eecdd3a737acd594d2f27f8d8f3a07830cc4"
 
 SRC_URI += "\
-	file://policycoreutils-fix-strict-prototypes.patch \
 	file://policycoreutils-revert-run_init-open_init_pty.patch \
 	file://policycoreutils-fix-sepolicy-install-path.patch \
 	file://policycoreutils-make-O_CLOEXEC-optional.patch \
diff --git a/recipes-security/selinux/policycoreutils_git.bb b/recipes-security/selinux/policycoreutils_git.bb
index fb7b48f..9a6425b 100644
--- a/recipes-security/selinux/policycoreutils_git.bb
+++ b/recipes-security/selinux/policycoreutils_git.bb
@@ -1,9 +1,13 @@
 PR = "r0"
-PV = "2.1.14+git${SRCPV}"
+PV = "2.2.5+git${SRCPV}"
 
 include selinux_git.inc
 include ${BPN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI += "file://policycoreutils-fix-strict-prototypes.patch"
+SRC_URI += "\
+	file://policycoreutils-revert-run_init-open_init_pty.patch \
+	file://policycoreutils-fix-sepolicy-install-path.patch \
+	file://policycoreutils-make-O_CLOEXEC-optional.patch \
+	"
-- 
1.7.9.5


