Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2B4C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:51:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.101291.1701787850792843275
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OVoqoySm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07030a0134=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B5DsNui018251
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Dec 2023 14:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=ZbCGvfm/l3+j9qGTzag+jEmCNAGpDsY66drSGunZLzc=; b=
	OVoqoySmR6YqBhW2tAXYIi7F8DmQnqOPhL3R/aH5CBqZd1JTszxwU378X+5hMO5+
	Fks+HD09a0PHUTLIrsHtd1zNk86Po0CUBOOrniTyC6/CJcPCCJzoH2ptZXsCGxjp
	7I2i9HqXUHNkpTy1PML4Kq2C2CuKLVX8EOXDgUO2J8ysX+qNPNCwI6Rhd8YgjLvk
	hjlyXN0NGKma9vCwguwgdsOLRhnxpz5ZKqGP2aLIID/O6FXlO1Y/JI2MfQvrBH/X
	flL/y1f6s8fU8JLZoBLcsJ/qwm+lNDrdv1CZJgv2v4bCwWOeTQqeIV9mqrqSx8E8
	WAfz7n3/5VCDdHyczSjnPg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3usss48kab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 14:50:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:50:52 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 06:50:51 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] lvm2: 2.03.16 -> 2.03.22
Date: Tue, 5 Dec 2023 22:50:32 +0800
Message-ID: <20231205145032.1116030-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205145032.1116030-1-kai.kang@windriver.com>
References: <20231205145032.1116030-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BtmjZHPA2ndLwfX5f389LEGrxlGgi7aK
X-Proofpoint-GUID: BtmjZHPA2ndLwfX5f389LEGrxlGgi7aK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 14:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107226

From: Kai Kang <kai.kang@windriver.com>

Update lvm2 from 2.03.16 to 2.03.22.

* remove 0002-Guard-use-of-mallinfo-with-__GLIBC__.patch which has done
  in upstream already
* add patch to check egrep & grep
* rebase patches
* add package config 'dbus' and fix errors about it

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/0001-configure.ac-check-egrep.patch | 33 +++++++++++++++++
 ...Guard-use-of-mallinfo-with-__GLIBC__.patch | 29 ---------------
 ...tweak-MODPROBE_CMD-for-cross-compile.patch | 10 +++---
 ...per_2.03.16.bb => libdevmapper_2.03.22.bb} |  0
 meta-oe/recipes-support/lvm2/lvm2.inc         |  4 +--
 ...findmnt-bin-lsblk-bin-sort-not-found.patch | 12 +++----
 ...1-lvmdbusd-create-dirs-for-lock-file.patch | 29 +++++++++++++++
 .../tweak-installation-for-lvmdbusd.patch     | 36 +++++++++++++++++++
 .../lvm2/{lvm2_2.03.16.bb => lvm2_2.03.22.bb} | 19 ++++++++--
 9 files changed, 128 insertions(+), 44 deletions(-)
 create mode 100644 meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch
 delete mode 100644 meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.16.bb => libdevmapper_2.03.22.bb} (100%)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-create-dirs-for-lock-file.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/tweak-installation-for-lvmdbusd.patch
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.16.bb => lvm2_2.03.22.bb} (78%)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch b/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch
new file mode 100644
index 000000000..474c2f8ac
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/files/0001-configure.ac-check-egrep.patch
@@ -0,0 +1,33 @@
+configure.ac: check egrep
+
+The macro AC_HEADER_STDC which requires AC_PROG_EGREP has been removed
+from configure.ac, then it fails to substitute '@EGREP@':
+
+|     [GEN] command-lines-input.h
+| /bin/bash: line 2: @EGREP@: command not found
+|     [GEN] command-count.h
+
+Call AC_PROG_EGREP to fix the error.
+
+Upstream-Status: Submitted [https://gitlab.com/lvmteam/lvm2/-/merge_requests/4]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 2e52498f9..d9462e22c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -78,6 +78,7 @@ AC_PROG_LN_S
+ AC_PROG_MAKE_SET
+ AC_PROG_MKDIR_P
+ AC_PROG_RANLIB
++AC_PROG_EGREP
+ AC_CHECK_TOOL([READELF], [readelf])
+ AC_CHECK_TOOL(AR, ar)
+ AC_PATH_TOOL(CFLOW_CMD, cflow)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
deleted file mode 100644
index 1fbaf0c9a..000000000
--- a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Tue, 25 Oct 2016 11:52:44 +0000
-Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
-
-This API is glibc-only
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
----
-Upstream-Status: Pending
-
- lib/mm/memlock.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: LVM2.2.02.177/lib/mm/memlock.c
-===================================================================
---- LVM2.2.02.177.orig/lib/mm/memlock.c
-+++ LVM2.2.02.177/lib/mm/memlock.c
-@@ -151,7 +151,7 @@ static void _touch_memory(void *mem, siz
- 
- static void _allocate_memory(void)
- {
--#ifndef VALGRIND_POOL
-+#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
- 	void *stack_mem;
- 	struct rlimit limit;
- 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
diff --git a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
index 517b9a5f2..ed9972a5f 100644
--- a/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
+++ b/meta-oe/recipes-support/lvm2/files/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -21,18 +21,18 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e427708..aa374ea 100644
+index b43d8b9be..efe3062c1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1791,8 +1791,6 @@ if test "$BUILD_DMFILEMAPD" = yes; then
- fi
+@@ -1646,8 +1646,6 @@ AS_IF([test "$BUILD_DMFILEMAPD" = "yes"], [
+ ])
  
  ################################################################################
 -AC_PATH_TOOL(MODPROBE_CMD, modprobe, [], [$PATH_SBIN])
 -
- if test -n "$MODPROBE_CMD"; then
+ AS_IF([test -n "$MODPROBE_CMD"], [
  	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'modprobe', if available.])
- fi
+ ])
 -- 
 2.7.4
 
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 277e76f0d..c96989bfa 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -10,15 +10,15 @@ DEPENDS += "libaio"
 SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
-           file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
            file://0004-tweak-MODPROBE_CMD-for-cross-compile.patch \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
            file://reproducible-build.patch \
+           file://0001-configure.ac-check-egrep.patch \
            "
 
-SRCREV = "6d1e894a867681af7a811ed63bc435f3aa55fec8"
+SRCREV = "016e469caf856f1eb8dde39df0d1aa2e74225aed"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
index 34e0620a1..c0cf836ce 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4811d4a3d..137b31a82 100644
+index 991a0cf85..e59c82472 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1611,6 +1611,8 @@ fi
+@@ -1660,6 +1660,8 @@ AS_IF([test -n "$MODPROBE_CMD"], [
  
  SYSCONFDIR="$(eval echo $(eval echo $sysconfdir))"
  
@@ -27,10 +27,10 @@ index 4811d4a3d..137b31a82 100644
  SBINDIR="$(eval echo $(eval echo $sbindir))"
  LVM_PATH="$SBINDIR/lvm"
  AC_DEFINE_UNQUOTED(LVM_PATH, ["$LVM_PATH"], [Path to lvm binary.])
-@@ -1829,6 +1831,7 @@ AC_SUBST(SACKPT_CFLAGS)
- AC_SUBST(SACKPT_LIBS)
- AC_SUBST(SALCK_CFLAGS)
- AC_SUBST(SALCK_LIBS)
+@@ -1886,6 +1888,7 @@ AC_SUBST(PYTHON2DIR)
+ AC_SUBST(PYTHON3)
+ AC_SUBST(PYTHON3DIR)
+ AC_SUBST(RT_LIBS)
 +AC_SUBST(BINDIR)
  AC_SUBST(SBINDIR)
  AC_SUBST(SELINUX_LIBS)
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-create-dirs-for-lock-file.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-create-dirs-for-lock-file.patch
new file mode 100644
index 000000000..f6b293553
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-lvmdbusd-create-dirs-for-lock-file.patch
@@ -0,0 +1,29 @@
+lvmdbusd: create dirs for lock file
+
+Create leading dirs for lvmdbusd lock file, otherwise it fails to start:
+
+| systemd[1]: Starting LVM2 D-Bus service...
+| lvmdbusd[1602]: [1602]: Error during creation of lock file(/var/lock/lvm/lvmdbusd): errno(2), exiting!
+
+Upstream-Status: Submitted [https://gitlab.com/lvmteam/lvm2/-/merge_requests/7]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ daemons/lvmdbusd/utils.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/daemons/lvmdbusd/utils.py b/daemons/lvmdbusd/utils.py
+index d479175f6..830648659 100644
+--- a/daemons/lvmdbusd/utils.py
++++ b/daemons/lvmdbusd/utils.py
+@@ -778,6 +778,7 @@ class LockFile(object):
+ 
+ 	def __enter__(self):
+ 		try:
++			os.makedirs(os.path.dirname(self.lock_file))
+ 			self.fd = os.open(self.lock_file, os.O_CREAT | os.O_RDWR, stat.S_IRUSR | stat.S_IWUSR)
+ 
+ 			# Get and set the close on exec and lock the file
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2/tweak-installation-for-lvmdbusd.patch b/meta-oe/recipes-support/lvm2/lvm2/tweak-installation-for-lvmdbusd.patch
new file mode 100644
index 000000000..95ffde6d3
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/tweak-installation-for-lvmdbusd.patch
@@ -0,0 +1,36 @@
+Remove $(DESTDIR) from install destination that it is not suitable for oe. And
+no generate python cache files too.
+
+Upstream-Status: Pending [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ daemons/lvmdbusd/Makefile.in | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/daemons/lvmdbusd/Makefile.in b/daemons/lvmdbusd/Makefile.in
+index 9c2629279..a79daabf7 100644
+--- a/daemons/lvmdbusd/Makefile.in
++++ b/daemons/lvmdbusd/Makefile.in
+@@ -16,7 +16,7 @@ top_srcdir = @top_srcdir@
+ top_builddir = @top_builddir@
+ 
+ lvmdbuspydir = $(python3dir)/lvmdbusd
+-lvmdbusdir = $(DESTDIR)$(lvmdbuspydir)
++lvmdbusdir = $(lvmdbuspydir)
+ 
+ LVMDBUS_SRCDIR_FILES = \
+ 	automatedproperties.py \
+@@ -55,11 +55,9 @@ install_lvmdbusd: $(LVMDBUSD)
+ 	@echo "    [INSTALL] $<"
+ 	$(Q) $(INSTALL_DIR) $(sbindir)
+ 	$(Q) $(INSTALL_SCRIPT) $(LVMDBUSD) $(sbindir)
+-	$(Q) $(INSTALL_DIR) $(lvmdbusdir) $(lvmdbusdir)/__pycache__
++	$(Q) $(INSTALL_DIR) $(lvmdbusdir)
+ 	$(Q) (cd $(srcdir); $(INSTALL_DATA) $(LVMDBUS_SRCDIR_FILES) $(lvmdbusdir))
+ 	$(Q) $(INSTALL_DATA) $(LVMDBUS_BUILDDIR_FILES) $(lvmdbusdir)
+-	$(Q) PYTHON=$(PYTHON3) $(PYCOMPILE) --destdir "$(DESTDIR)" --basedir "$(lvmdbuspydir)" $(LVMDBUS_SRCDIR_FILES) $(LVMDBUS_BUILDDIR_FILES)
+-	$(Q) $(CHMOD) 444 $(lvmdbusdir)/__pycache__/*.py[co]
+ 
+ install_lvm2: install_lvmdbusd
+ 
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
similarity index 78%
rename from meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
index 6a6cdc7ce..81283aeb5 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
@@ -2,11 +2,13 @@ require lvm2.inc
 
 SRC_URI += " \
             file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch \
+            file://tweak-installation-for-lvmdbusd.patch \
+            file://0001-lvmdbusd-create-dirs-for-lock-file.patch \
            "
 
 DEPENDS += "autoconf-archive-native"
 
-inherit multilib_script
+inherit multilib_script python3native
 
 MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/lvm/lvm.conf"
 
@@ -28,13 +30,22 @@ do_install:append() {
             rm -rf ${D}${sysconfdir}/rc.d
         fi
     fi
+
+    # following files only exist when package config `dbus` enabled
+    sed -i -e '1s,#!.*python.*,#!${USRBINPATH}/env python3,' \
+        ${D}${sbindir}/lvmdbusd \
+        ${D}${PYTHON_SITEPACKAGES_DIR}/lvmdbusd/lvmdb.py \
+        ${D}${PYTHON_SITEPACKAGES_DIR}/lvmdbusd/lvm_shell_proxy.py \
+    || true
 }
 
 PACKAGE_BEFORE_PN = "${PN}-scripts ${PN}-udevrules"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
-                         blk-availability.service"
+                         ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'lvm2-lvmdbusd.service', '', d)} \
+                         blk-availability.service \
+                         "
 SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -45,6 +56,8 @@ DEPENDS += "util-linux"
 LVM2_PACKAGECONFIG:append:class-target = " \
     udev \
 "
+
+PACKAGECONFIG[dbus] = "--enable-dbus-service,--disable-dbus-service,python3-dbus-native python3-pyudev-native "
 PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev,${PN}-udevrules"
 
 PACKAGES =+ "libdevmapper"
@@ -57,6 +70,8 @@ FILES:libdevmapper = " \
 FILES:${PN} += " \
     ${libdir}/device-mapper/*.so \
     ${systemd_system_unitdir}/lvm2-pvscan@.service \
+    ${PYTHON_SITEPACKAGES_DIR}/lvmdbusd \
+    ${datadir}/dbus-1/system-services/com.redhat.lvmdbus1.service \
 "
 
 FILES:${PN}-scripts = " \
-- 
2.34.1


