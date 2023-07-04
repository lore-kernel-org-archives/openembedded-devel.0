Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D067FEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 20:22:21 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.2954.1688502140024422633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 13:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=muvH9Zfm;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-262b213eddfso23018a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688502139; x=1691094139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHhuKQ646TwIK7EH0WFjQndkZJ1aKZip7pJT5wJeTIs=;
        b=muvH9Zfmt1EuhLAPk9sFn127Nn87VY+5V+jCy4TRkC0x+Qnp+XjxI8hwm5xNhq+4Of
         K6FSoJUW/DGtIP5Rj/LhNxVLz5jMu0FmkNbUvQSe6T6pK56QmjFifEt2wEqkfwpjDxbj
         C4t9CTqJDKFKGgr2Xwk0t26SmEwT3wLLtmqHb54ivKo16z8uWDPGvtUM8Vd7MixDIMiV
         oTCwrQIkT389DfEvuHZFecwadBLoG+mqB6SeVloIK8Xa0m9fCWdQptvPnzLXuV85yOur
         hSdUu9GxEATIeUSGX3mvyMUG+lWjynZeRihsjJHXmayrLb72Zq4Bqzp73goUSAWA029M
         TXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688502139; x=1691094139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHhuKQ646TwIK7EH0WFjQndkZJ1aKZip7pJT5wJeTIs=;
        b=TP9XRNRbRGIiars1Tsz9OJrTq2vmC9EHXhL09fxIRT++epSz8BVzh8nwj5I1W+9zlP
         FP90EB6QQnZ6g7jwHPsrp6qcesW53huToYAeeXLO7ADMRxAgrzEbbDF0o4Na1qh8Sta5
         7uxjNc3LgBzWcpm1/2AIoM7/nJ1MYdNQgW+6SY7DrJxRvOnNo2oYrE3CkEjsUNiPO3zy
         tV60rPNzcWOFb9g2mL+upqIgAvEyvcWbBlxXvXyisCW9buI/gS17i04R8cQ8A5KH9LBO
         Meho+0wPo9GtMGrTw/aajc5j3BOHH+SJkBg/4Nc8Yur3j3iJKjx6czV5LjHr+ZGVnbQS
         QGYg==
X-Gm-Message-State: ABy/qLbRYwY9MZ3xcPNjtrMVUxnpA44VVUlBlfXm9P+e4Xct3saAuzwV
	+6iobi24JxpYbT4ygdqPSvEWpDXRNd4=
X-Google-Smtp-Source: APBJJlFY0qR9HXc7VSt+lxttxlcN9JtyswQ5FjIC89cseGGX8xTX8npgL8Id9vZrm/gvnLGVHRWScg==
X-Received: by 2002:a17:903:230b:b0:1b8:1636:b26 with SMTP id d11-20020a170903230b00b001b816360b26mr395078plh.3.1688502138894;
        Tue, 04 Jul 2023 13:22:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::e2fe])
        by smtp.gmail.com with ESMTPSA id jg3-20020a17090326c300b001a2104d706fsm16701267plb.225.2023.07.04.13.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 13:22:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pcp: Update to 6.0.5
Date: Tue,  4 Jul 2023 13:22:16 -0700
Message-ID: <20230704202216.1775139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 20:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103661

- Forward port patches
- Package libpcp-archive.so.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cp-native_5.3.6.bb => pcp-native_6.0.5.bb} |  5 --
 meta-oe/recipes-support/pcp/pcp.inc           | 25 ++++++----
 ...ove-unsuitble-part-for-cross-compile.patch | 14 ++----
 ...e-Limit-the-header-search-to-sysroot.patch | 49 ++-----------------
 .../pcp/{pcp_5.3.6.bb => pcp_6.0.5.bb}        | 32 +++++++-----
 5 files changed, 42 insertions(+), 83 deletions(-)
 rename meta-oe/recipes-support/pcp/{pcp-native_5.3.6.bb => pcp-native_6.0.5.bb} (88%)
 rename meta-oe/recipes-support/pcp/{pcp_5.3.6.bb => pcp_6.0.5.bb} (88%)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_5.3.6.bb b/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
similarity index 88%
rename from meta-oe/recipes-support/pcp/pcp-native_5.3.6.bb
rename to meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
index 5f3c9b6f00..2f37b099b4 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_5.3.6.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
@@ -46,8 +46,3 @@ do_install () {
     PCP_MAN_DIR=${D}/${mandir} \
     PCP_DOC_DIR=${D}/${docdir} 
 }
-#| chkacc1.c:8:10: fatal error: localconfig.h: No such file or directory
-#|     8 | #include "localconfig.h"
-#|       |          ^~~~~~~~~~~~~~~
-PARALLEL_MAKE = ""
-
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 708ebfe7ab..276be7ffaa 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -11,21 +11,26 @@ SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/${
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://config.linux \
 	   "
-SRC_URI[sha256sum] = "6ef33b7aa14c09860ba7cd8873e76d38ccd24eab0c94a50e235f813e77fe3610"
+SRC_URI[sha256sum] = "dacf92ba195f1f2ea8f40bf0c455d2cd2456273a1e30dcc3ee5b5bfd099a99ee"
 
 inherit setuptools3-base pkgconfig autotools-brokensep
 
 # Specify any options you want to pass to the configure script using EXTRA_OECONF:
 CACHED_CONFIGUREVARS = "PACKAGE_DISTRIBUTION=arch"
-EXTRA_OECONF:append = " --with-dstat-symlink=yes --with-infiniband=no \
-                --with-pmdapodman=no --with-python=no --with-python3=yes --with-perl=no \
-		--with-pmdabcc=no --with-pmdajson=no  --with-perfevent=no \
-		--with-pmdabcc=yes \
-		--with-rundir=${localstatedir}/run \
-                --with-sysconfigdir=${sysconfdir} \
-                --with-logdir=${localstatedir}/log \
-                --with-docdir=${docdir} \
-                "
+EXTRA_OECONF:append = "\
+                    --with-dstat-symlink=yes \
+                    --with-infiniband=no \
+                    --with-python=no \
+                    --with-perl=no \
+                    --with-python3=yes \
+                    --with-pmdajson=no  \
+                    --with-perfevent=no \
+                    --with-pmdabcc=yes \
+                    --with-rundir=${localstatedir}/run \
+                    --with-sysconfigdir=${sysconfdir} \
+                    --with-logdir=${localstatedir}/log \
+                    --with-docdir=${docdir} \
+                    "
 
 PACKAGECONFIG[qt5] = "--with-qt=yes --with-qt3d=yes,--with-qt=no --with-qt3d=no,qtbase qt3d"
 
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
index 292499850e..abf4aee61d 100644
--- a/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
+++ b/meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
@@ -11,11 +11,9 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  src/libpcp/src/GNUmakefile | 1 -
  2 files changed, 7 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 5b25382..5d24714 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -623,12 +623,6 @@ fi
+@@ -607,12 +607,6 @@ fi
  which=$WHICH
  AC_SUBST(which)
  
@@ -28,18 +26,14 @@ index 5b25382..5d24714 100644
  ar=$AR
  AC_SUBST(ar)
  
-diff --git a/src/libpcp/src/GNUmakefile b/src/libpcp/src/GNUmakefile
-index 3c4ccd6..d1eba19 100644
 --- a/src/libpcp/src/GNUmakefile
 +++ b/src/libpcp/src/GNUmakefile
-@@ -176,7 +176,6 @@ exports:	exports.in mk.exports
- # cases
+@@ -179,8 +179,6 @@ exports:	exports.in mk.exports
+ # consistent in all placess.
  #
  check.done:	$(OBJECTS)
 -	./check-statics
+-	./check-errorcodes
  	touch check.done
  
  ifneq ($(LIBTARGET),)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch b/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
index 591f94f374..b03c48e581 100644
--- a/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
+++ b/meta-oe/recipes-support/pcp/pcp/0001-configure-Limit-the-header-search-to-sysroot.patch
@@ -14,11 +14,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 20 ++++++++++----------
  1 file changed, 10 insertions(+), 10 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 5d24714..4e2d8ec 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -913,7 +913,7 @@ AC_DEFUN([PCP_CHECK_PYTHON_HEADER],
+@@ -907,7 +907,7 @@ AC_DEFUN([PCP_CHECK_PYTHON_HEADER],
    [ PY_MAJOR="$1"
      PY_MINOR="$2"
      PY_VERSION="python$PY_MAJOR.$PY_MINOR"
@@ -27,7 +25,7 @@ index 5d24714..4e2d8ec 100644
      saved_CFLAGS="$CFLAGS"
      saved_CPPFLAGS="$CPPFLAGS"
      CFLAGS="$CFLAGS $PY_INCLUDE_DIRS"
-@@ -1524,7 +1524,7 @@ AC_SUBST(qmake)
+@@ -1603,7 +1603,7 @@ AC_SUBST(qmake)
  
  enable_qt3d=false
  AS_IF([test "x$do_qt3d" != "xno"], [
@@ -36,45 +34,7 @@ index 5d24714..4e2d8ec 100644
      then
  	enable_qt3d=$enable_qt
      elif test x"$do_qt3d" = x"yes"
-@@ -3810,13 +3810,13 @@ then
- 
-     saved_CFLAGS="$CFLAGS"
-     saved_CPPFLAGS="$CPPFLAGS"
--    NSS_INC_DIRS="-I/usr/include/nss -I/usr/include/nss3"
--    NSPR_INC_DIRS="-I/usr/include/nspr -I/usr/include/nspr4"
-+    NSS_INC_DIRS="-I${STAGING_INCDIR}/nss -I${STAGING_INCDIR}/nss3"
-+    NSPR_INC_DIRS="-I${STAGING_INCDIR}/nspr -I${STAGING_INCDIR}/nspr4"
-     CFLAGS="$CFLAGS $NSS_INC_DIRS $NSPR_INC_DIRS"
-     CPPFLAGS="$CPPFLAGS $NSS_INC_DIRS $NSPR_INC_DIRS"
- 
--    AC_CHECK_HEADERS([nss/nss.h], [NSSCFLAGS=-I/usr/include/nss], [
--	AC_CHECK_HEADERS([nss3/nss.h], [NSSCFLAGS=-I/usr/include/nss3], [
-+    AC_CHECK_HEADERS([nss/nss.h], [NSSCFLAGS=-I${STAGING_INCDIR}/nss], [
-+	AC_CHECK_HEADERS([nss3/nss.h], [NSSCFLAGS=-I${STAGING_INCDIR}/nss3], [
- 	    enable_secure=false
- 	    if test "$do_secure" = "yes"
- 	    then
-@@ -3826,8 +3826,8 @@ then
-     ])
-     AC_SUBST(NSSCFLAGS)
- 
--    AC_CHECK_HEADERS([nspr/nspr.h], [NSPRCFLAGS=-I/usr/include/nspr], [
--	AC_CHECK_HEADERS([nspr4/nspr.h], [NSPRCFLAGS=-I/usr/include/nspr4], [
-+    AC_CHECK_HEADERS([nspr/nspr.h], [NSPRCFLAGS=-I${STAGING_INCDIR}/nspr], [
-+	AC_CHECK_HEADERS([nspr4/nspr.h], [NSPRCFLAGS=-I${STAGING_INCDIR}/nspr4], [
- 	    enable_secure=false
- 	    if test "$do_secure" = "yes"
- 	    then
-@@ -3837,7 +3837,7 @@ then
-     ])
-     AC_SUBST(NSPRCFLAGS)
- 
--    AC_CHECK_HEADERS([sasl/sasl.h], [SASLCFLAGS=-I/usr/include/sasl], [
-+    AC_CHECK_HEADERS([sasl/sasl.h], [SASLCFLAGS=-I${STAGING_INCDIR}/sasl], [
- 	enable_secure=false
- 	if test "$do_secure" = "yes"
- 	then
-@@ -3938,7 +3938,7 @@ AC_SUBST(enable_decompression)
+@@ -3699,7 +3699,7 @@ AC_SUBST(enable_decompression)
  AC_SUBST(enable_lzma)
  
  dnl check for array sessions
@@ -83,6 +43,3 @@ index 5d24714..4e2d8ec 100644
  then
      pcp_mpi_dirs=libpcp_mpi\ libpcp_mpiread
  else
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.6.bb b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
similarity index 88%
rename from meta-oe/recipes-support/pcp/pcp_5.3.6.bb
rename to meta-oe/recipes-support/pcp/pcp_6.0.5.bb
index 0543d77a78..b337df6ea4 100644
--- a/meta-oe/recipes-support/pcp/pcp_5.3.6.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
@@ -18,17 +18,26 @@ SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
 export PCP_DIR="${RECIPE_SYSROOT_NATIVE}"
 #export PCP_RUN_DIR="${RECIPE_SYSROOT_NATIVE}"
 EXTRA_OEMAKE = "CC="${CC}" LD="${LD}""
-inherit useradd systemd features_check
+inherit useradd systemd features_check python3targetconfig
 
 # Needs libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
-SYSTEMD_SERVICE:${PN} = "pmcd.service pmcd.service pmie_check.service pmie_farm_check.service \
-                         pmlogger_daily.service pmlogger_farm_check.service pmfind.service \
-                         pmie_daily.service  pmlogger.service pmlogger_daily_report.service \
-                         pmproxy.service pmie.service pmie_farm.service pmlogger_check.service \
-                         pmlogger_farm.service"
+SYSTEMD_SERVICE:${PN} = "\
+                        pmie_farm_check.service \
+                        pmie_farm.service \
+                        pmfind.service \
+                        pmlogger_farm_check.service \
+                        pmcd.service \
+                        pmie.service \
+                        pmlogger_daily.service \
+                        pmlogger.service \
+                        pmlogger_farm.service \
+                        pmie_check.service \
+                        pmproxy.service \
+                        pmlogger_check.service \
+                        pmie_daily.service"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --home ${localstatedir}/lib/pcp --no-create-home \
@@ -88,7 +97,7 @@ do_install () {
 
 PACKAGES += " ${PN}-export-zabbix-agent ${PN}-testsuite \
 	libpcp-gui2  libpcp-gui2-dev \
-	libpcp-import1 \
+	libpcp-import1 libpcp-archive1 \
 	libpcp-mmv1 libpcp-mmv1-dev \
 	libpcp-pmda3 libpcp-pmda3-dev \
 	libpcp-trace2 libpcp-trace2-dev \
@@ -97,6 +106,8 @@ PACKAGES += " ${PN}-export-zabbix-agent ${PN}-testsuite \
 "
 FILES:libpcp-gui2 = "${libdir}/libpcp_gui.so.2 \
 "	
+FILES:libpcp-archive1 = "${libdir}/libpcp_archive.so.1 \
+"	
 FILES:libpcp-gui2-dev = " \
 	${libdir}/libpcp_gui.so \
 	${libdir}/libpcp_gui.a \
@@ -166,6 +177,7 @@ FILES:${PN} = " \
 	${datadir}/zsh \
 	${systemd_system_unitdir}/ \
 	${libdir}/pcp/ \
+	${libdir}/sysusers.d/pcp.conf \
 	${datadir}/pcp \
 	${libdir}/*.sh \
 	${datadir}/man \
@@ -184,7 +196,7 @@ FILES:${PN}-export-zabbix-agent += " \
 	${mandir}/man3/zbxpcp.3.gz \
 	${libdir}/zabbix \
 "
-FILES:${PN}-testsuite = "${localstatedir}/lib/pcp/testsuite/"
+FILES:${PN}-testsuite = "${localstatedir}/lib/pcp/testsuite/ ${libdir}/sysusers.d/pcp-testsuite.conf"
 FILES:python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
 FILES:${PN}-dev += " \
         ${includedir}/pcp \
@@ -222,7 +234,3 @@ FILES:${PN}-dev += " \
         ${datadir}/man/man3/pms* \
         ${datadir}/man/man3/pmt* \
 "
-#| chkacc1.c:8:10: fatal error: localconfig.h: No such file or directory
-#|     8 | #include "localconfig.h"
-#|       |          ^~~~~~~~~~~~~~~
-PARALLEL_MAKE = ""
-- 
2.41.0


