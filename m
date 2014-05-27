Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-la0-f42.google.com (unknown [209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 00D406FAE9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 15:50:24 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id el20so6665415lab.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 08:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ufK5CahbiF6oYfIAd1mVb8Hb2sWCsZApyEd9l3j0z+I=;
	b=PTwrsNuWfKyaSViaJLpxUOx9hXz9BRrNxqL6VgAfx3ixm0vvqJQ1J4sOs8sbfVJ1sV
	v3vIhZVc+9nCiW7z6wSvbtzINk2UUv2IqqkP2prkPsUCINCYFcODAzV0TEojq7Pw/HmN
	3VAj0+Lw5sN6b/CiGmSImxiOwziigaL0I6olimNFYW3XyANPR+4/hF8pwJQNL/E/HKeu
	DSf5XbjoJjOsLEaGCgxznNqs4MiD83fh5CHjKoNOmcNEj0KDPYFSc//BArN66BgfWDuH
	zB4qMiVgsx4aKyuFt1GhIeVRnGyv5FRohNjiAt2HBSEpZhxSXIcc/T1MFAd5UXG2yrMt
	2E3g==
X-Gm-Message-State: ALoCoQnEXP72btwQ4dJn41cwEvuAUD2swcbLzShVIvPs3XSthGTob0CGrBM6J9J+fL+7WhRZQXsW
X-Received: by 10.152.21.130 with SMTP id v2mr24331773lae.1.1401205824565;
	Tue, 27 May 2014 08:50:24 -0700 (PDT)
Received: from maxim-lap.localhost.onion ([92.39.133.154])
	by mx.google.com with ESMTPSA id
	h11sm15509186lbm.13.2014.05.27.08.50.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 May 2014 08:50:23 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 19:50:19 +0400
Message-Id: <1401205819-21761-1-git-send-email-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 1.8.5.1.163.gd7aced9
Subject: [PATCH] update snort to 2.9.6.0
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
X-List-Received-Date: Tue, 27 May 2014 15:50:28 -0000

1. looks like snort dropped reference to barnyard2. At least it's missing in configure.
Also download link to barnyard2 is not available now. Drop this package.
2. update snort version from 2.9.4.6 to 2.9.6.0.
3. fix libdnet paths.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 .../barnyard2-1.8/barnyard2-cross-fix.patch        | 24 ----------------------
 .../barnyard2/barnyard2_1.8.bb                     | 18 ----------------
 .../snort/{snort_2.9.4.6.bb => snort_2.9.6.0.bb}   |  8 ++++----
 3 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
 delete mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.4.6.bb => snort_2.9.6.0.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch b/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
deleted file mode 100644
index 7b5a60c..0000000
--- a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-Index: barnyard2-1.8/configure.in
-===================================================================
---- barnyard2-1.8.orig/configure.in	2010-08-03 15:12:06.000000000 +0400
-+++ barnyard2-1.8/configure.in	2010-08-03 15:13:46.000000000 +0400
-@@ -73,7 +73,7 @@
-     # libpcap doesn't even LOOK at the timeout you give it under Linux
-     AC_DEFINE([PCAP_TIMEOUT_IGNORED],[1],[Define if pcap timeout is ignored])
-     AC_SUBST(extra_incl)
--    extra_incl="-I/usr/include/pcap"
-+    extra_incl="-I=/usr/include/pcap"
-     ;;
-   *-hpux10*|*-hpux11*)
-     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
-@@ -230,7 +230,7 @@
- # In case INADDR_NONE is not defined (like on Solaris)
- have_inaddr_none="no"
- AC_MSG_CHECKING([for INADDR_NONE])
--AC_RUN_IFELSE(
-+AC_COMPILE_IFELSE(
- [AC_LANG_PROGRAM(
- [[
- #include <sys/types.h>
diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
deleted file mode 100644
index 14acdac..0000000
--- a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Barnyard2 is a fork of the original barnyard project, designed specifically for Snort's new unified2 file format"
-HOMEPAGE = "http://www.securixlive.com/barnyard2/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "libpcap"
-
-SRC_URI = " \
-	http://www.securixlive.com/download/barnyard2/${BP}.tar.gz \
-	file://barnyard2-cross-fix.patch \
-	"
-SRC_URI[md5sum] = "72fc6c490db6ea6a0f46c27d24998067"
-SRC_URI[sha256sum] = "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--enable-prelude --enable-gre --without-mysql"
-
-CONFFILES_${PN} = "${sysconfdir}/barnyard2.conf"
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
index acb1b1a..aba2850 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
@@ -13,8 +13,8 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
             file://0001-libpcap-search-sysroot-for-headers.patch \
 "
 
-SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd"
-SRC_URI[tarball.sha256sum] = "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc"
+SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
+SRC_URI[tarball.sha256sum] = "3cc6c8a9b52f4c863a5736a73b4012aff340b50b5e002771b04d4877f47cd19e"
 
 inherit autotools  gettext  update-rc.d
 
@@ -28,6 +28,8 @@ EXTRA_OECONF = " \
 	--enable-reload-error-restart \
 	--enable-targetbased \
 	--disable-static-daq \
+	--with-dnet-includes=${STAGING_INCDIR} \
+	--with-dnet-libraries=${STAGING_LIBDIR} \
 	"
 
 do_install_append() {
@@ -69,5 +71,3 @@ FILES_${PN}-dev += " \
 	${libdir}/snort_dynamicrules/*.so \
 	${prefix}/src/snort_dynamicsrc \
 	"
-
-RRECOMMENDS_${PN} += "barnyard2"
-- 
1.8.5.1.163.gd7aced9


