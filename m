Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.3854.1612596642719396946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 23:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BxThKaeD;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id my11so7551783pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Feb 2021 23:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4bY2iXTAeAj/6DLTmxMkQ6/oXbn9kQAwtZyyiaVyBuc=;
        b=BxThKaeDzI84r+7yHJ2SKxUzQ9vq+SjyP9uFLuewB69Y9aHBngEaVvfIojc3hOCD6R
         1/nfWUSbQ2pr72ZoimkaahYsba45SdXgMOMa1Svg6AeLpJDize2ooUkgCGDHMusa1Jj/
         YeUUFDDOKv/pa11MJcviv37SnrfyNJ2jYClVJYbv82qEBamudT0cSASBRfh0ic9g2qCU
         bCI9pkQg5EKS0cmd7vfAFM8Pus70tjrOP7Mh/R7z3VgV13ez0zEggwjzFLhZXyR1Avyf
         jMj5gMhwB8JnsFEUn4zUcFqdJ9jm1NV792dWjiBxA+mgLB+sKZbMtO1t7PcOg5gQMzdN
         Xceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4bY2iXTAeAj/6DLTmxMkQ6/oXbn9kQAwtZyyiaVyBuc=;
        b=DEJp85za0H+psdtoI68zPCuixLgsN+FssolzGlLPsfocc7l/BBfTdB/04wq0kuVW3s
         +q4N6i4ar1LJbHw95gppPqq+tYAMSJCI465EtKvPJLBKRnsSsZn+3AP5RzMZoSuYo+Tl
         2Be8qKiJNxXDn6s8ax5sgEEnGGnU5EVvmXViJWO3OTDSJBsvQhahQI+sEVt6JVJzjSvV
         mgzVFJyE+MrVj/yW0x/vtYxkTxnEugSZJdNdkRNNTcoAumw+TkkxWM8PFCiny8ZLIAHq
         3WGspZXgGmMQv6x3mbbCoumG/bRpqVcYn53lzBjW3OKieZ+CRVIyRZR0SViqfzGuI/oi
         v27A==
X-Gm-Message-State: AOAM531M6+xco1Wajjx7IJ/Gp0YpJmw3gubrxzVhrKRGRZlouDRVHxTh
	EM1kNQWMiLYEGMvRhciGHXHrz/L7NFR9yg==
X-Google-Smtp-Source: ABdhPJyO7xEBQbMkm4PPQHoO3aX+UL0ismRsvqeyRVwGGkCK8j187jTrP86frEGd8+AO3Ugt6OWjeQ==
X-Received: by 2002:a17:90a:f18f:: with SMTP id bv15mr7771769pjb.51.1612596641949;
        Fri, 05 Feb 2021 23:30:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id h12sm12323147pgs.7.2021.02.05.23.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 23:30:41 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] geany: Fix build with autotools 2.70+
Date: Fri,  5 Feb 2021 23:30:39 -0800
Message-Id: <20210206073039.2282415-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onfigure-Upgrade-to-a-modern-Gettext.patch | 22 +++++++++++++++++++
 .../recipes-devtools/geany/geany_1.37.1.bb    |  9 +++-----
 2 files changed, 25 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch

diff --git a/meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch b/meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch
new file mode 100644
index 0000000000..b966847195
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany/0001-configure-Upgrade-to-a-modern-Gettext.patch
@@ -0,0 +1,22 @@
+From 51e145b43e66134aa4b33c9af0319331ec8a5bce Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Feb 2021 23:15:45 -0800
+Subject: [PATCH] configure: Use AC_PROG_INTLTOOL
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -8,7 +8,7 @@ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_MACRO_DIR([m4])
+ AM_INIT_AUTOMAKE([1.11 -Wall parallel-tests subdir-objects])
+ AC_CONFIG_HEADERS([config.h])
+-
++AC_PROG_INTLTOOL
+ m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
+ 
+ GEANY_PREFIX
diff --git a/meta-oe/recipes-devtools/geany/geany_1.37.1.bb b/meta-oe/recipes-devtools/geany/geany_1.37.1.bb
index 330daaace2..b361b11879 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.37.1.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.37.1.bb
@@ -9,16 +9,13 @@ inherit features_check autotools pkgconfig perlnative gettext mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://download.geany.org/${BP}.tar.bz2"
+SRC_URI = "https://download.geany.org/${BP}.tar.bz2 \
+           file://0001-configure-Upgrade-to-a-modern-Gettext.patch \
+          "
 SRC_URI[sha256sum] = "18c5756444c1d8bcd737c8ecfd4ef0b3607c924fc02560d4e8b78f6121531a18"
 
 FILES_${PN} += "${datadir}/icons"
 
 EXTRA_OECONF = "--disable-html-docs"
 
-do_configure_prepend() {
-        cd ${S}
-        intltoolize --copy --force --automake
-}
-
 RRECOMMENDS_${PN} += "source-code-pro-fonts"
-- 
2.30.0

