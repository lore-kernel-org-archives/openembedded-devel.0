Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30F5477747
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 21:25:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2ELPsBl013389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 14:25:54 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 14:25:53 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Mar 2017 14:25:53 -0700
Message-ID: <1489526753-14469-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][morty][v2][PATCH 1/1] chrony: fix build failure for arma9
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
X-List-Received-Date: Tue, 14 Mar 2017 21:25:54 -0000
Content-Type: text/plain

Eliminate references to syscalls not available
for ARM_EABI.  Also add a dependency on libseccomp
which is needed for scfilter to work.

Set PACKAGECONFIG to not enable scfilter, since
kernel CONFIG_SECCOMP is unlikely to be set.  This
aligns the usage of libseccomp with that of other packages.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-support/chrony/chrony/arm_eabi.patch   |   57 ++++++++++++++++++++
 .../recipes-support/chrony/chrony_2.4.bb           |    5 +-
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/arm_eabi.patch

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
new file mode 100644
index 0000000..d1586bb
--- /dev/null
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -0,0 +1,57 @@
+    chrony: fix build failure for arma9
+    
+    Eliminate references to syscalls not available
+    for ARM_EABI.  Also add a dependency on libseccomp
+    which is needed for scfilter to work.
+    
+    Set PACKAGECONFIG to not enable scfilter, since
+    kernel CONFIG_SECCOMP is unlikely to be set.  This
+    aligns the usage of libseccomp with that of other packages.
+
+    Upstream-Status: Pending
+    
+    Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/sys_linux.c
++++ b/sys_linux.c
+@@ -453,13 +453,12 @@ SYS_Linux_EnableSystemCallFilter(int lev
+   const int syscalls[] = {
+     /* Clock */
+     SCMP_SYS(adjtimex), SCMP_SYS(gettimeofday), SCMP_SYS(settimeofday),
+-    SCMP_SYS(time),
+     /* Process */
+-    SCMP_SYS(clone), SCMP_SYS(exit), SCMP_SYS(exit_group), SCMP_SYS(getrlimit),
++    SCMP_SYS(clone), SCMP_SYS(exit), SCMP_SYS(exit_group),
+     SCMP_SYS(rt_sigaction), SCMP_SYS(rt_sigreturn), SCMP_SYS(rt_sigprocmask),
+     SCMP_SYS(set_tid_address), SCMP_SYS(sigreturn), SCMP_SYS(wait4),
+     /* Memory */
+-    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap), SCMP_SYS(mmap2),
++    SCMP_SYS(brk), SCMP_SYS(madvise), SCMP_SYS(mmap2),
+     SCMP_SYS(mprotect), SCMP_SYS(mremap), SCMP_SYS(munmap), SCMP_SYS(shmdt),
+     /* Filesystem */
+     SCMP_SYS(access), SCMP_SYS(chmod), SCMP_SYS(chown), SCMP_SYS(chown32),
+@@ -470,14 +469,21 @@ SYS_Linux_EnableSystemCallFilter(int lev
+     SCMP_SYS(bind), SCMP_SYS(connect), SCMP_SYS(getsockname),
+     SCMP_SYS(recvfrom), SCMP_SYS(recvmsg), SCMP_SYS(sendmmsg),
+     SCMP_SYS(sendmsg), SCMP_SYS(sendto),
+-    /* TODO: check socketcall arguments */
+-    SCMP_SYS(socketcall),
+     /* General I/O */
+     SCMP_SYS(_newselect), SCMP_SYS(close), SCMP_SYS(open), SCMP_SYS(pipe),
+-    SCMP_SYS(poll), SCMP_SYS(read), SCMP_SYS(futex), SCMP_SYS(select),
++    SCMP_SYS(poll), SCMP_SYS(read), SCMP_SYS(futex),
+     SCMP_SYS(set_robust_list), SCMP_SYS(write),
+     /* Miscellaneous */
+     SCMP_SYS(uname),
++    /* not always available */
++#if ! defined(__ARM_EABI__)
++    SCMP_SYS(time),
++    SCMP_SYS(getrlimit),
++    SCMP_SYS(select),
++    SCMP_SYS(mmap),
++    /* TODO: check socketcall arguments */
++    SCMP_SYS(socketcall),
++#endif
+   };
+ 
+   const int socket_domains[] = {
diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-networking/recipes-support/chrony/chrony_2.4.bb
index deb2148..088708f 100644
--- a/meta-networking/recipes-support/chrony/chrony_2.4.bb
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -33,6 +33,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
     file://chrony.conf \
     file://chronyd \
+    file://arm_eabi.patch \
 "
 SRC_URI[md5sum] = "d0598aa8a9be8faccef9386f6fc0d5f2"
 SRC_URI[sha256sum] = "8d04e7cda2333289c2104b731d39c3c1db94816e43bae35d7ee4e7ae8af6391f"
@@ -58,14 +59,14 @@ inherit update-rc.d systemd
 #     chrony.conf and init script.
 #   - 'scfilter' enables support for system call filtering, but requires the
 #     kernel to have CONFIG_SECCOMP enabled.
-PACKAGECONFIG ??= "editline scfilter \
+PACKAGECONFIG ??= "editline \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
 "
 PACKAGECONFIG[readline] = "--without-editline,--without-readline,readline"
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
 PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
-PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp"
+PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp,libseccomp"
 PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
-- 
1.7.9.5


