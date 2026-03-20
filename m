Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F4D108B91E
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:06 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18031.1774026121353001216
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lTFypMiv;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c107ef474fso426609eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026120; x=1774630920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M/IZmkZOwCFx9Fr6rrjjSTpHQYMo/ZIOVVuk9+SnkY=;
        b=lTFypMivzmA3j5RdD++ftJEhmzOgmgl+riULnu5IYLLO2cYhipHeM8IjvKxq2gTuc9
         tCWyHkAH2Cd/l8nbhbGUjYni2IIJVI68E/JmOVwnYgV6DClIsOPugVMEclaRLHd3A/58
         Jm0KOpZfkaXk0yXiA8t8Vei0iub1Aj5xQ07MnoNL+47Zjigt1uijqq/D6y+6TfHqQIIs
         NGUiqJei7Y3hg87cYiIjNWHeZtj0JNrjWHknnP/oEyppXk8p2HSAIsmRtGy4sxlDUClF
         PCloIndNCLFvvAIJrRW0tbI6kXYjlPNkJGOAbxCX50nQTFHn4FySpCaYXFZCexs1+GZU
         Ri4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026120; x=1774630920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+M/IZmkZOwCFx9Fr6rrjjSTpHQYMo/ZIOVVuk9+SnkY=;
        b=JAdB71QHpLydjtl1TnnffnBbxokJvrbDx9BHuEysX/vkQXR7BVLlmUmRCL1GE5TpW9
         jIz+N71grvO3/ylD9YI/92IfxsAFBuPlkQvvW6XUZ8MieRr1xOfPSNVMNEuHBITJdEpP
         pCvi35EwMNnzm1dlXkKn4ELeO+APXrlY1a5PRy9MwBCTKPYJq1bXzIiIIrh59deHTo3b
         gC2AQ9n48PT5HofpV10TvoyYJoZzajZgtbo0C5bpgcNyRPMIPQNOVg0HhZ7cziHULBVK
         rNvK1TQUEaf56zJqSPffepH7RL8m8qVzifSdpy8SZrQhEfQFDzk/jceUStMz6extX/lF
         eIpw==
X-Gm-Message-State: AOJu0YwgD77/1vcwXk8oT6SUoQw39xspe0OaSt7a6WOYOKHmUHVpDxbX
	YTB+SnXwD1KzyicwkvcMwTXYD0GVG8z+CUsn5gJv0+IBBFTFiTzFqjv0guuhVE6G
X-Gm-Gg: ATEYQzyYL9Jyv4zjEAO4t/CJFujwcKBKplwspZZoJugISsytaI1xUxnSqJP2W3YJiXl
	Exrg9BKovcaIygoAFUW85U/bWODq2yFccljROFeSd842/KwMDUuRV9sjeYDSWbtobMLVZEOiLFu
	ks+5fFJpL2nvyhG+wisRfMHELjFmbAgTFqLkwEHFxVQj3io3+24JmlRSMoD+n9O+DIO71wKF3XT
	Sd9JF8br/5fuz180oNWc3k4y+j0huM+LaRV7wGOCULpbLKLKE9gmN2pjKSGDdisaIPttk2A+5/A
	IwkNPrB0lntQLpMxn4kqz4+tlQsN/bS5Q7ieBtvrQu2HEfwKKNx5YzshYxm5BJCqyu8GMlIs6Iq
	a6e1dNMsB6QgSfctI6wrTv6sKZXgVS6lHR8QaYym/EoPFRaNWTFw/r5/0XDtiRVKkMG2RVoPS4W
	KjpRIBFqB3OIcHjzDful7CfEbhRZpZ6HzSIhAJ7vqAim6gEzcMa6j2J/WkpHEIqFAc4B63pxf8m
	D2IEgRekD5NpyCP8adE5A1P2TYI8WXv9qoI0FSj+aQWwz/MYdYNkWPr4ayU
X-Received: by 2002:a05:7300:e785:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c1095d7861mr2174025eec.1.1774026120285;
        Fri, 20 Mar 2026 10:02:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:01:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/8] ndpi: Upgrade to 5.0 release
Date: Fri, 20 Mar 2026 10:01:49 -0700
Message-ID: <20260320170155.1413929-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125442

From: Khem Raj <raj.khem@gmail.com>

Drop downstream cross compile patch, the relevant code is removed in new version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-autogen.sh-not-generate-configure.patch | 35 ------------
 ...Stop-embedding-pwd-at-configure-time.patch | 55 +++++++++++++++++++
 .../ntopng/{ndpi_4.2.bb => ndpi_5.0.bb}       | 16 ++----
 3 files changed, 61 insertions(+), 45 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch
 rename meta-networking/recipes-support/ntopng/{ndpi_4.2.bb => ndpi_5.0.bb} (53%)

diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
deleted file mode 100644
index d5c7f5f1cc..0000000000
--- a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d482bcc8fca90afc95ac3cbe848a3c9d7ad81ddc Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 4 Nov 2020 23:37:44 -0800
-Subject: [PATCH] autogen.sh: not generate configure
-
-Only use autogen.sh to generate configure.ac.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
-refresh patch to 4.0
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- autogen.sh | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/autogen.sh b/autogen.sh
-index 0aa7507..36e0423 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -33,10 +33,3 @@ if test -z $PKG_CONFIG; then
-     echo "pkg-config is missing: please install it (apt-get install pkg-config) and try again"
-     exit
- fi
--
--autoreconf -ivf
--
--echo "./configure $@"
--chmod +x configure
--./configure $@
--
---
-2.25.1
-
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch b/meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch
new file mode 100644
index 0000000000..b8b0b04bf4
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch
@@ -0,0 +1,55 @@
+From 25129a49bd220b4668e1df474b1b1549885aaced Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Mar 2026 09:47:12 -0700
+Subject: [PATCH] configure: Stop embedding pwd at configure time
+
+NDPI_BASE_DIR seems to unused and currently encodes hardcoded
+absolute paths in for it breaking repeoducible builds
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6984b38b5..1b9aae4df 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -353,7 +353,7 @@ case "$host" in
+ 	 if test -f $PCAP_HOME/lib/libpfring.a; then :
+    	   PFRING_LIB=$PCAP_HOME/lib/libpfring.a
+ 	 fi
+-
++
+          PCAP_LIB="$PCAP_HOME/libpcap/libpcap.a $PFRING_LIB $LIBNUMA `$PCAP_HOME/lib/pfring_config --libs`"
+          AC_CHECK_LIB([rt], [clock_gettime],   [PCAP_LIB="$PCAP_LIB -lrt"])
+          AC_CHECK_LIB([nl], [nl_handle_alloc], [PCAP_LIB="$PCAP_LIB -lnl"])
+@@ -438,7 +438,7 @@ PCRE2_ENABLED=0
+ AC_ARG_WITH(pcre2, AS_HELP_STRING([--with-pcre2], [Enable nDPI build with libpcre2]))
+ if test "${with_pcre2+set}" = set; then :
+   AC_CHECK_LIB(pcre2-8, pcre2_compile_8, AC_DEFINE_UNQUOTED(HAVE_PCRE2, 1, [libpcre2(-dev) is present]))
+-
++
+  if test "x$ac_cv_lib_pcre2_8_pcre2_compile_8" = xyes; then :
+    ADDITIONAL_LIBS="${ADDITIONAL_LIBS} -lpcre2-8"
+    PCRE2_ENABLED=1
+@@ -456,11 +456,6 @@ if test "${with_maxminddb+set}" = set; then :
+   fi
+ fi
+
+-dnl> Use absolute source directory for NDPI_BASE_DIR
+-NDPI_ABS_SRCDIR="`cd ${srcdir} && pwd`"
+-AC_DEFINE_UNQUOTED(NDPI_BASE_DIR, "${NDPI_ABS_SRCDIR}", [nDPI base directory])
+-AC_SUBST(NDPI_BASE_DIR, "${NDPI_ABS_SRCDIR}")
+-
+ dnl> Curl
+ dnl> AC_CHECK_LIB([curl], [curl_easy_perform])
+ dnl> if test ${ac_cv_lib_curl_curl_easy_perform} = "no"; then
+@@ -515,5 +510,4 @@ AC_SUBST(DISABLE_NPCAP)
+ AC_SUBST(EXE_SUFFIX)
+ AC_SUBST(NDPI_CFLAGS)
+ AC_SUBST(NDPI_LDFLAGS)
+-AC_SUBST(NDPI_BASE_DIR)
+ AC_OUTPUT
diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
similarity index 53%
rename from meta-networking/recipes-support/ntopng/ndpi_4.2.bb
rename to meta-networking/recipes-support/ntopng/ndpi_5.0.bb
index 66d24e4cd8..e2040eda18 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
@@ -8,23 +8,19 @@ RDEPENDS:${PN} += " libpcap"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"

-SRCREV = "8b5c6af71b562549f8416b31803daae223e09f46"
-SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.2-stable;protocol=https \
-           file://0001-autogen.sh-not-generate-configure.patch \
-           "
+SRCREV = "375f99ef9fb4999d778b57bbeece171b3fa9fba6"
+SRC_URI = "git://github.com/ntop/nDPI.git;branch=5.0-stable;protocol=https;tag=${PV} \
+           file://0001-configure-Stop-embedding-pwd-at-configure-time.patch \
+          "

-
-inherit autotools-brokensep pkgconfig
+inherit autotools pkgconfig

 CPPFLAGS += "${SELECTED_OPTIMIZATION}"

 do_configure:prepend() {
-    ${S}/autogen.sh
+    (cd ${S} && ${S}/autogen.sh)
 }

 EXTRA_OEMAKE = " \
     libdir=${libdir} \
 "
-
-# remove this CVE_STATUS, when the recipe is updated to 4.12 or newer
-CVE_STATUS[CVE-2025-25066] = "cpe-incorrect: Version 4.2 is not vulnerable yet"

