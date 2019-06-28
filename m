Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 033057EA4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:48:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S1mhHM013899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:48:43 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:48:42 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:48:08 +0800
Message-ID: <1561686490-12445-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
References: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/6] libtdb: upgrade 1.3.17 -> 1.4.0
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
X-List-Received-Date: Fri, 28 Jun 2019 01:48:42 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. switch to python3
2. fix cross-compile problem caused by waf
3. refresh patches

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...akefile-fix-problem-that-waf-cannot-found.patch | 35 ----------------------
 .../libtdb/do-not-check-xsltproc-manpages.patch    | 26 ++++++++++++----
 .../tdb-Add-configure-options-for-packages.patch   | 33 ++++++++------------
 .../libtdb/{libtdb_1.3.17.bb => libtdb_1.4.0.bb}   | 22 +++++++++-----
 4 files changed, 47 insertions(+), 69 deletions(-)
 delete mode 100644 meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.17.bb => libtdb_1.4.0.bb} (69%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
deleted file mode 100644
index 10f2ef8..0000000
--- a/meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7205761d654636a6c1fad03a3ca40d38e253e192 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 25 Jan 2019 16:01:07 +0800
-Subject: [PATCH] Makefile: fix problem that waf cannot found
-
-tdb is subfolder of samba, but it can also build independently.
-so both path need to be added into PATH
-
-Upsteam-Status: Inappropriate [oe specific]
-
-Fix reject by upstream since upsteam need to support both python2/3,
-so drop add append PATH. refer link:
-https://gitlab.com/samba-team/samba/merge_requests/209
-https://gitlab.com/samba-team/samba/merge_requests/211
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 3e70146..64bb393 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,6 +1,6 @@
- # simple makefile wrapper to run waf
- 
--WAF_BINARY=$(PYTHON) ../../buildtools/bin/waf
-+WAF_BINARY=PATH=buildtools/bin:../../buildtools/bin:$$PATH waf
- WAF=PYTHONHASHSEED=1 WAF_MAKE=1 $(WAF_BINARY)
- 
- all:
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch b/meta-networking/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
index bcc45c9..2aae57a 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
@@ -1,15 +1,29 @@
-Don't check manpages for xsltproc.
+From b397e1921e5df79bf5cfa158e73ecd2d26a72994 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 19 Jun 2019 17:42:51 +0800
+Subject: [PATCH] Don't check manpages for xsltproc.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 
---- tdb-1.3.0.orig/wscript	2015-04-22 09:52:32.366000222 +0900
-+++ tdb-1.3.0/wscript	2015-04-22 09:51:57.720000205 +0900
-@@ -90,7 +90,7 @@ def configure(conf):
+Update to version 1.4.0
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ wscript | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index 919004d..5598d02 100644
+--- a/wscript
++++ b/wscript
+@@ -95,7 +95,7 @@ def configure(conf):
          not conf.env.disable_tdb_mutex_locking):
          conf.define('USE_TDB_MUTEX_LOCKING', 1)
  
 -    conf.CHECK_XSLTPROC_MANPAGES()
 +    conf.find_program('xsltproc', var='XSLTPROC')
  
-     if not conf.env.disable_python:
-         # also disable if we don't have the python libs installed
+     conf.SAMBA_CHECK_PYTHON()
+     conf.SAMBA_CHECK_PYTHON_HEADERS()
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
index e6e1023..481fd68 100644
--- a/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtdb/libtdb/tdb-Add-configure-options-for-packages.patch
@@ -1,6 +1,6 @@
-From 13bbc851d9fd7396f087758e614abba60eeb2aad Mon Sep 17 00:00:00 2001
+From 71a10c176c34da898c0169371b3c1b032d2f88b1 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 23 Jan 2019 10:14:05 +0800
+Date: Wed, 19 Jun 2019 17:53:34 +0800
 Subject: [PATCH] tdb: Add configure options for packages
 
 Add configure options for the following packages:
@@ -15,22 +15,16 @@ Upstream-Status: Inappropriate [oe deterministic build specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
-Update for libtdb_1.3.14.
+Update to 1.4.0
 
-Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
-
-Update for libtdb_1.3.16
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Update for libtdb_1.3.17
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/replace/wscript | 95 ++++++++++++++++++++++++++++++++++++++++-------------
+ lib/replace/wscript | 94 ++++++++++++++++++++++++++++++++++++++++-------------
  wscript             |  6 ++++
- 2 files changed, 79 insertions(+), 22 deletions(-)
+ 2 files changed, 78 insertions(+), 22 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 6cbae93..7aeaf46 100644
+index 1d01e1e..2336dc3 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -104,26 +98,26 @@ index 6cbae93..7aeaf46 100644
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
      conf.CHECK_HEADERS('port.h')
-     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h sys/fs/vx/quota.h')
+     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,10 @@ def configure(conf):
+@@ -110,9 +158,10 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
 -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
 -    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
+-    conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
 +    if Options.options.enable_valgrind:
 +        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
 +        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
 +
-     conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -379,21 +429,22 @@ def configure(conf):
-     conf.CHECK_FUNCS('prctl dirname basename')
+     conf.CHECK_HEADERS('syscall.h sys/syscall.h inttypes.h')
+@@ -380,20 +429,21 @@ def configure(conf):
  
      strlcpy_in_bsd = False
--
+ 
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK_FUNCS('strlcpy strlcat'):
 -        if conf.CHECK_FUNCS_IN('strlcpy strlcat', 'bsd', headers='bsd/string.h',
@@ -138,7 +132,6 @@ index 6cbae93..7aeaf46 100644
 -
 -    if not conf.CHECK_FUNCS('closefrom'):
 -        conf.CHECK_FUNCS_IN('closefrom', 'bsd', headers='bsd/unistd.h')
-+    
 +    if Options.options.enable_libbsd:
 +        # libbsd on some platforms provides strlcpy and strlcat
 +        if not conf.CHECK_FUNCS('strlcpy strlcat'):
@@ -158,7 +151,7 @@ index 6cbae93..7aeaf46 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index bc5ee26..9ac10b6 100644
+index 5598d02..8d47244 100644
 --- a/wscript
 +++ b/wscript
 @@ -69,6 +69,12 @@ def options(opt):
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.17.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb
similarity index 69%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.17.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb
index 4c7755c..764de79 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.17.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.0.bb
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
 
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
-           file://do-not-check-xsltproc-manpages.patch \
+           file://do-not-check-xsltproc-manpages.patch\
            file://tdb-Add-configure-options-for-packages.patch \
            file://0001-waf-add-support-of-cross_compile.patch \
-           file://0001-Makefile-fix-problem-that-waf-cannot-found.patch \
 "
 
-SRC_URI[md5sum] = "519d373ac72a66b0a2739dbb495de127"
-SRC_URI[sha256sum] = "1cb4399394c60a773430ca54848359adcf54fb6f136afdcfcbbe62b5f4245614"
+SRC_URI[md5sum] = "c4c2f8cf9e691244a7f2ecfa3baadecc"
+SRC_URI[sha256sum] = "c1a0729c5400fb495465fa4bd953ae290db43c28dacd0506aef50dc482132d35"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
@@ -42,11 +41,18 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
 
-PACKAGES += "tdb-tools python-tdb"
+do_install_append() {
+     # add this link for cross check python module existence. eg: on x86-64 host, check python module
+     # under recipe-sysroot which is mips64.
+     cd ${D}${PYTHON_SITEPACKAGES_DIR}; ln -s tdb.*.so tdb.so
+}
 
-RPROVIDES_${PN}-dbg += "python-tdb-dbg"
+PACKAGES += "tdb-tools python3-tdb"
+
+RPROVIDES_${PN}-dbg += "python3-tdb-dbg"
 
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_tdb-tools = "${bindir}/*"
-FILES_python-tdb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
-RDEPENDS_python-tdb = "python"
+FILES_python3-tdb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+RDEPENDS_python3-tdb = "python3"
+INSANE_SKIP_python3-tdb = "dev-so"
-- 
2.7.4


