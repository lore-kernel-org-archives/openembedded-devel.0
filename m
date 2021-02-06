Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.13756.1612653431690957426
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C8Le4Z5B;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id z21so7371925pgj.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GkNA4hMGuV53132xVumyra8A3rwJjXHn8Enm3WrM7+A=;
        b=C8Le4Z5BtLSqEpMjmtha+2K3l0XQiotM5dpEcHRee+nU/NFmhr2hoCoDWWlVuEzc8U
         Rt+dAz9B2BrZaWHfSnZCNw20jrequVj0rGHPby9RJFTiAqHd9oP9lF+l7fWmXkBD2ubS
         m7eqcqxQVP1ka7hj23xGKLPhBBgVtyuhr47kMLGRGvdv/dkWgsx7/W9uWsfSRtSUtKzJ
         P1mGeBX7nAiq15VW948bfeVeq8H8W0QAYxTC9mRKTpycnUiK9wjEOBP527TVUAmwtQf+
         R+rzrdHD3W6rEh9S6niRNbJWFkJDDYI4UV1bKg6vKLC3PXxneoM6ArSwgRszxUp6UPEJ
         rE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GkNA4hMGuV53132xVumyra8A3rwJjXHn8Enm3WrM7+A=;
        b=fuff6hOrrG925tGojN2+hpjaII30A8/aLR+/xoQVSHqJhlbrM6IzzJa22y1XqZEa6M
         clhJYwYDHS1XfRoMNHDuQx1tF2WmCL15tITfc2oePsM1vKHcTQw1CA03KMaCq7yK/yAc
         Ps/oxpKKMw5MDHPLYY7InG6Hct7ry2hxdmfiskK8kugFX+9O01/UxMx6yVeDOEAViRJw
         DXwiaNbND0/oPaKRvvTO91jdZBv10uDApLqejLpUFGXb81g7PFt2k8Cy46dgtVqJ4jmR
         hX4tnjYT0ITBxodHXBgTg2WwETAFo06LAgH7/loSSnMBOcxfGhuUPbVD9S00lNFHSmxo
         pmEw==
X-Gm-Message-State: AOAM530vOfeuKorNisKk+X9X5Qc4F7F4z11VyeCTVvvZouJzdhiWWy1G
	7CCn1L7dvoOEnvYLGGk7e3L+QcPeVBa4wg==
X-Google-Smtp-Source: ABdhPJwtPGkRme2vmJPKb1btTDp9gnfdo0bUmHoTpV9D0B77fLYVNedOuocc9RhYmqBCEAjEDa3L8A==
X-Received: by 2002:a63:f953:: with SMTP id q19mr10990579pgk.120.1612653431026;
        Sat, 06 Feb 2021 15:17:11 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:10 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 01/10] xterm: install xterm and uxterm desktop files
Date: Sat,  6 Feb 2021 15:16:57 -0800
Message-Id: <a653238398d483c805c3d026d890162f131ecc01.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Modify recipe to install application desktop files for xterm.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 593f21eda5b119f6408975c6b15e94fb168cc9dc)
---
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 6de704d0b7..6376388c27 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -1,6 +1,6 @@
 require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
-DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
+DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
 
@@ -13,6 +13,9 @@ SRC_URI[sha256sum] = "e521d3ee9def61f5d5c911afc74dd5c3a56ce147c7071c74023ea24cac
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
+# Let xterm install .desktop files
+inherit mime-xdg
+
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
                  FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
@@ -30,6 +33,10 @@ do_configure() {
     oe_runconf
 }
 
+do_install_append() {
+    oe_runmake install-desktop DESTDIR="${D}" DESKTOP_FLAGS="--dir=${D}${DESKTOPDIR}"
+}
+
 # busybox can supply resize too
 inherit update-alternatives
 
-- 
2.17.1

