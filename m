Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428B0C87FCA
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 00:08:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.32390.1753488538919565780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 17:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZqxJkILw;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23602481460so27685685ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 17:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753488538; x=1754093338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXgRsetWSfhrMrH8bzd+Oe4t8eZxirO2xIstDR/r9Ws=;
        b=ZqxJkILwVKyGzFbCMnMi9+28mMuougqOS9QRNqYYqDYqJy7qDNZbk6n6exFu2PyoT3
         MBSddrRol6nOabwBk140gPxUdnsHzMNQk2k3k8tx28ULSaL9O8fZEwE+VE/DSjndDJHs
         Zh6dj51bGnVmEJRccEDNmxBgEXjKpz/KoaFmIjNRN4hJE649plHYeqx/5/Qr+Ql7HavR
         pNect+8UrFl80ginaeDLmqn24cX0eEu7aFvOQbjnk0MeRcFTyA/joe1mNq362w88RNg4
         MNF/zDu0nNvQbJR6q2IB0vJSqT9/vaXwA+QaXCtFknkygk3RPyobHnqoGiYQwDfaNWiY
         hZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488538; x=1754093338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXgRsetWSfhrMrH8bzd+Oe4t8eZxirO2xIstDR/r9Ws=;
        b=mLV9IaOzP8dNmkhQhf3XCHu+XX5H2pAooSsxxReVZtYAzyr0aO2Ra4o5PSyPntTdqS
         sfAdph1WB03z8pTtOLZ8MdOj09/9+mHKUMpXvDRnHdKUq2mUxbLjsj012jRh+hKxrcqc
         PaQVIWuDeXgFDDMerQNdky81NI63AAnHmI7VQIe2OPBp1lwmVVzV8s02v/yVrcSq/ZiA
         OfcPwDDk/iESuzzZL7tpvpKAdtb7KJtE0UpN98yF6bQgbrH+vgOcTISU9QOIlxymWimn
         rYxoScu5CCYK5PyUnI/Uw/r5YWeQMWntWa51Pb3E877Kclt7vpDQYAU94aHVNPW6fkDJ
         04vA==
X-Gm-Message-State: AOJu0YzDhVcxkG5ID/wLiawJnW10Fvxaw7sJbwopr5IJbhxbiOzSAyxK
	yBoMDYo7WrYrvD3b3FrDogdweDQXgWCM0VC2OzNXTCUvGmkPEssPnv514VcjsU/ejL8=
X-Gm-Gg: ASbGncs/MF1tBxKOJVOeJGkg60Yniy3B7keZv06hHKTp14L17rYdOM1Cxa1JvJ3yBvH
	u7hf9FDpAp24ZHb0Uq1xqgU6HvG0bxqM/19anYAXnUHt4vzoEDteNx6F99ghDxV0JjxEyR1/W7z
	hINkW7LBA2EAfLSL6bjMO6oxIlJ4qoPPHPyU2zaetR/rx3qGFFMf8xnq41y8eya8gUTiU1xFVc9
	xsWMHFGhzKKy7SNAyIXLc7zXNbLNuvT7/mIEEYrxKcY18lr4XKyIu99WTEA7dVdGmkGeC4NBoKN
	2XBI4KN6scwFGPCV2OtBf1bavyEYCdGFpdM89d6U7MJ+7yEYzi4cO/PbxPfCec4O3cW/HeTyR7S
	lZ+Xqm/x/nU/uHg==
X-Google-Smtp-Source: AGHT+IF/Fp36neYhRMoKpnIsEOE8FrJYHcgfrBOZhXT3cGsJb/1Aun3OZ6opn+DsydefNhnYoehE9A==
X-Received: by 2002:a17:903:94b:b0:234:c8f6:1b03 with SMTP id d9443c01a7336-23fb317a022mr57278435ad.47.1753488537987;
        Fri, 25 Jul 2025 17:08:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe57753bsm5504185ad.208.2025.07.25.17.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:08:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] uim: Upgrade to 1.9.6
Date: Fri, 25 Jul 2025 17:08:54 -0700
Message-ID: <20250726000854.2481612-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726000854.2481612-1-raj.khem@gmail.com>
References: <20250726000854.2481612-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 00:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118737

uim 1.9.6 (May 16, 2025)
Improvements:

Changed the default value of --enable-default-toolkit to automatically detect the default toolkit
GTK+ 3: Simplified implementation
GTK+ 2: Added support again (after being dropped in 1.9.4)

Fixes:

sqlite3: Added missing libuim-scm.la dependency

uim 1.9.5 (May 6, 2025)
Fixes:

GTK+ 3: Fixed a build problem

uim 1.9.4 (May 6, 2025)
Improvements:

Suppressed incompatible-pointer-types warnings
Updated bundled SigScheme to 0.9.3
Dropped support for GTK+ 2 (later restored in 1.9.6)

uim 1.9.3
Improvements:

Updated bundled SigScheme 0.9.2 that is C23 ready (to support GCC 15's default C23 mode)

uim 1.9.2
Improvements:

Qt: Changed to use metadata.json from metadata.desktop because metadata.desktop is deprecated
Qt: Specified cmake_minimum_required() explicitly for CMake 4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/uim/{uim_1.9.0.bb => uim_1.9.6.bb}    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/uim/{uim_1.9.0.bb => uim_1.9.6.bb} (96%)

diff --git a/meta-oe/recipes-support/uim/uim_1.9.0.bb b/meta-oe/recipes-support/uim/uim_1.9.6.bb
similarity index 96%
rename from meta-oe/recipes-support/uim/uim_1.9.0.bb
rename to meta-oe/recipes-support/uim/uim_1.9.6.bb
index cb3aee3f0d..6e6ed522d8 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.0.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.6.bb
@@ -8,12 +8,12 @@ SRC_URI = "https://github.com/uim/uim/releases/download/${PV}/uim-${PV}.tar.bz2"
 SRC_URI:append:class-target = "\
     file://uim-module-manager.patch \
 "
-SRC_URI[sha256sum] = "271f0ed5f455e5bffa859f01b2d0f7fb966554ebd4822657afb67a0431dd85a8"
+SRC_URI[sha256sum] = "67f0e5fa4292a533edc6f98b842df60c531a89cf82d0336a4e1ab72202ab8c83"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool libedit"
+DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool libedit autoconf-archive-native"
 DEPENDS:append:class-target = " intltool-native gtk+ gtk+3 uim-native"
 
 RDEPENDS:uim = "libuim0 libedit"
@@ -31,8 +31,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 GTKIMMODULES_PACKAGES = "uim-gtk2.0 uim-gtk3"
 
-CFLAGS += "-std=gnu17"
-
 EXTRA_OECONF += "--disable-emacs \
     --with-libedit=${STAGING_EXECPREFIXDIR} \
     --without-scim \
@@ -57,7 +55,7 @@ do_configure:prepend () {
 }
 
 do_install:append() {
-    rm -rf ${D}/${datadir}/applications
+    rm -rf ${D}${datadir}/applications
 }
 
 PACKAGES =+ "uim-xim uim-utils uim-skk uim-gtk2.0 uim-gtk3 uim-fep uim-anthy uim-common libuim0 libuim-dev"

