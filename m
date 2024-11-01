Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F522E674BB
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 09:07:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33549.1730452044260031974
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 02:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=103524b381=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A18jB9Q023074
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Nov 2024 09:07:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42mf2e8qdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 09:07:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 02:07:21 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 02:07:20 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-networking][Kirkstone][PATCH] openipmi: upgrade 2.0.32->2.0.36
Date: Fri, 1 Nov 2024 17:10:02 +0800
Message-ID: <20241101091002.3740003-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=K4dwHDWI c=1 sm=1 tr=0 ts=67249a4a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=FP58Ms26AAAA:8 a=VhezN14C5EISivN7u2sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: o4C6nx28c84V6JVQUY0ru5VqmAmaZSDg
X-Proofpoint-ORIG-GUID: o4C6nx28c84V6JVQUY0ru5VqmAmaZSDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_04,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411010064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 09:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113380

From: Jiaying Song <jiaying.song.cn@windriver.com>

Openipmi full changelog:
https://sourceforge.net/p/openipmi/news/

To facilitate the upgrade, the following modifications were made:
Deleted openipmi-remove-host-path-from-la_LDFLAGS.patch as the issue is fixed upstream.
Removed the dependency on the now-removed Python distutils, resolving related issues.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ..._devel.m4-do-not-check-for-distutils.patch | 41 ----------------
 ...fix-symlink-install-error-in-cmdlang.patch | 11 +++--
 ...pmi-remove-host-path-from-la_LDFLAGS.patch | 49 -------------------
 ...{openipmi_2.0.32.bb => openipmi_2.0.36.bb} | 15 +++---
 4 files changed, 13 insertions(+), 103 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
 delete mode 100644 meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.32.bb => openipmi_2.0.36.bb} (87%)

diff --git a/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch b/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
deleted file mode 100644
index 00956fb11..000000000
--- a/meta-networking/recipes-support/openipmi/files/0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3a35611687864cf3599712d0d2ff54532b0118ac Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 3 Oct 2021 21:42:32 +0200
-Subject: [PATCH] m4/ax_python_devel.m4: do not check for distutils
-
-With py 3.10 this prints a deprecation warning which is
-taken as an error. Upstream should rework the code to not
-use distuils.
-
-Upstream-Status: Inappropriate [needs a proper fix upstream]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- m4/ax_python_devel.m4 | 15 ---------------
- 1 file changed, 15 deletions(-)
-
-diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
-index e0804c5..cfc0b24 100644
---- a/m4/ax_python_devel.m4
-+++ b/m4/ax_python_devel.m4
-@@ -138,21 +138,6 @@ variable to configure. See ``configure --help'' for reference.
- 		fi
- 	fi
- 
--	#
--	# Check if you have distutils, else fail
--	#
--	AC_MSG_CHECKING([for the distutils Python package])
--	ac_distutils_result=`$PYTHON -c "import distutils" 2>&1`
--	if test -z "$ac_distutils_result"; then
--		AC_MSG_RESULT([yes])
--	else
--		AC_MSG_RESULT([no])
--		AC_MSG_ERROR([cannot import Python module "distutils".
--Please check your Python installation. The error was:
--$ac_distutils_result])
--		PYTHON_VERSION=""
--	fi
--
- 	#
- 	# Check for Python include path
- 	#
diff --git a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
index 243488424..262c1f87a 100644
--- a/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
+++ b/meta-networking/recipes-support/openipmi/files/fix-symlink-install-error-in-cmdlang.patch
@@ -1,4 +1,4 @@
-From 7854c60c92243adb14ea89e16fc226d2e47dd4f9 Mon Sep 17 00:00:00 2001
+From 4d6904ec43981216e995fb28c4dfa73d3a130fd1 Mon Sep 17 00:00:00 2001
 From: Aws Ismail <aws.ismail@windriver.com>
 Date: Thu, 7 Jun 2012 16:00:13 -0400
 Subject: [PATCH] Fix symlink install error in cmdlang
@@ -14,14 +14,17 @@ Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 0ca3827..d9a941f 100644
+index 7235446..e99c67b 100644
 --- a/cmdlang/Makefile.am
 +++ b/cmdlang/Makefile.am
-@@ -35,6 +35,7 @@ openipmish_LDADD =  libOpenIPMIcmdlang.la \
+@@ -41,6 +41,7 @@ openipmish_CFLAGS = -Wall -Wsign-compare -I$(top_builddir)/include \
  # compatability.
- install-data-local:
+ install-exec-hook:
  	rm -f $(DESTDIR)$(bindir)/ipmish
 +	mkdir -p $(DESTDIR)$(bindir)/
  	$(LN_S) openipmish $(DESTDIR)$(bindir)/ipmish
  
  uninstall-local:
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch b/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
deleted file mode 100644
index 1aea32eae..000000000
--- a/meta-networking/recipes-support/openipmi/files/openipmi-remove-host-path-from-la_LDFLAGS.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5a4abf223d79d4e1a58bbad1e4f2f406c7cab748 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 29 Dec 2014 18:16:04 +0800
-Subject: [PATCH] remove host path from la_LDFLAGS
-
-Upstream-Status: Inappropriate [ cross compile specific ]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- cmdlang/Makefile.am | 2 +-
- unix/Makefile.am    | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index 9cf180d..da46ceb 100644
---- a/cmdlang/Makefile.am
-+++ b/cmdlang/Makefile.am
-@@ -18,7 +18,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
- 	$(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(top_builddir)/lib/libOpenIPMI.la
- libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- bin_PROGRAMS = openipmish
- 
-diff --git a/unix/Makefile.am b/unix/Makefile.am
-index baf0815..80c3d5d 100644
---- a/unix/Makefile.am
-+++ b/unix/Makefile.am
-@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
- libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
- 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
- libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
- libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(GDBM_LIB) $(RT_LIB)
- libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir) -no-undefined
-+	-no-undefined
- 
- noinst_HEADERS = heap.h
- 
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
similarity index 87%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
index 8625afaa7..35fea7879 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
@@ -26,26 +26,23 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://fix-symlink-install-error-in-cmdlang.patch \
            file://openipmi-no-openipmigui-man.patch \
-           file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
            file://ipmi-init-fix-the-arguments.patch \
            file://include_sys_types.patch \
            file://openipmi-helper \
            file://ipmi.service \
-           file://0001-m4-ax_python_devel.m4-do-not-check-for-distutils.patch \
-           "
+"
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "532404c9df7d0e8bde975b95b9e6775b"
-SRC_URI[sha256sum] = "f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945"
+SRC_URI[sha256sum] = "a0403148fa5f7bed930c958a4d1c558047e273763a408b3a0368edc137cc55d9"
 
-inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
+inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-                --with-python='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
-                --with-pythoninstall='${PYTHON_SITEPACKAGES_DIR}' \
-                --with-glibver=2.0"
+                --with-glibver=2.0 \
+                --with-pythoncflags='-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}' \
+		"
 
 PACKAGECONFIG ??= "gdbm"
 PACKAGECONFIG[gdbm] = "ac_cv_header_gdbm_h=yes,ac_cv_header_gdbm_h=no,gdbm,"
-- 
2.25.1


