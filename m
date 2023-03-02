Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A258CC678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 02:09:16 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.5348.1677722953188409354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 18:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UzFgdBHW;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so1299644pjb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 18:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0nX06sgWID/ct89q+2TmSjsmn/7snbws+7ZcVEEUMgI=;
        b=UzFgdBHWV85lQafoF1qE8+ec3mYO/gtAyVGl98yb0SceoWsVgF5i14w+773TE6lztA
         Lw/XW4TA7XlRy2NpQcHh5W+DOW3IpVJcpSGTYs1qtwiZ+wlUtfRVxmv/gzaC9ahm2PS0
         q38jMn6wAZUPjCQzJktPDKXpGSCwLOl88S9wFA00z/Ak9vUxF3rPV3PXrAXvb7vlz1aC
         rUVXbomUpJanSJHvaEzfKbbyWIarriTagh6OFAXL6KqzpQ/AQbw8cvmFrQ1euRw//HM6
         lhLLvuQvdbwXXRfDmVgUm1MBhOmZrUQKTSsFVTtA7E6rKrPbS37IZhojygeGBtezV2A8
         cHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nX06sgWID/ct89q+2TmSjsmn/7snbws+7ZcVEEUMgI=;
        b=Rcuu0VV5VyIb38PflZ0RFPbCqw4RXNMQFnxtI+Pwm8qeDtLT1ytWfzOYFWtNnoFO6A
         63GQ2iVAkbnW5EybPuGEKTQc4C3UcdH+toIM10t5NYUqemi6PpSVsIPv3gmWsUsnWDrB
         wj8ChCM20JteuZYyiTbiCYV6ethA0mB0FDtL7GoWsRO/NxmbrrsTMul5AfT9qJ4XFoVW
         efoN9hJwcnzgRmBQAgaj/RxwKZz/TLa+dslwiP5Mje/NnUqAxxg0Rl56kayIPxjalRfu
         m6KLA41HGTa+Go4yBZq9eK2AuC2jIO1te644ylcjWeK8Pu62PrpJXIqXnzf1F1YR9gHk
         Z9MQ==
X-Gm-Message-State: AO0yUKXnty9E3yYfKX51RlMn+zlxA1kKd5/B1N7dpXKmApG0j30O+tH2
	k+WojmFUGakb4/QUnqHBDr/oMYbtL0c=
X-Google-Smtp-Source: AK7set/JsEtiGoK91fhs0Wc6M470+bHwLitY73gwfRkbTVeyWcKWgjGTIGqo+/um9jR2+0J8+4Jxig==
X-Received: by 2002:a17:90a:341:b0:237:ae7c:1591 with SMTP id 1-20020a17090a034100b00237ae7c1591mr9654296pjf.26.1677722952128;
        Wed, 01 Mar 2023 18:09:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090ad38900b00233ebcb52a6sm402497pju.36.2023.03.01.18.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 18:09:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gnome-commander: Upgrade to 1.16.0 release
Date: Wed,  1 Mar 2023 18:09:09 -0800
Message-Id: <20230302020909.511403-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 02:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101320

- Switch to using meson for build system
- Add -D_LIBCPP_ENABLE_CXX17_REMOVED_AUTO_PTR to continue using std::auto_ptr
  from exiv2

- The changes are here [1]

[1] https://gcmd.github.io/2023/01/22/Release-v1-16-0.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-commander/gnome-commander_1.14.3.bb | 22 -------------
 .../gnome-commander/gnome-commander_1.16.0.bb | 31 +++++++++++++++++++
 2 files changed, 31 insertions(+), 22 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
deleted file mode 100644
index b16400cf38..0000000000
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "A light and fast file manager"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = " \
-    glib-2.0-native \
-    gtk+ \
-"
-
-inherit gnomebase itstool gettext gnome-help features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-SRC_URI[archive.sha256sum] = "78d8dce70fb922b2909cf767783053b0811213a4d6a49b3875510cf3a84efd7b"
-
-PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
-PACKAGECONFIG[exiv2] = "--with-exiv2,--without-exiv2,exiv2"
-PACKAGECONFIG[taglib] = "--with-taglib,--without-taglib,taglib"
-PACKAGECONFIG[libgsf] = "--with-libgsf,--without-libgsf,libgsf"
-PACKAGECONFIG[poppler] = "--with-poppler,--without-poppler,poppler"
-
-FILES:${PN} += "${datadir}/metainfo"
-FILES:${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV}"
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.0.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.0.bb
new file mode 100644
index 0000000000..8c4b79160a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "A light and fast file manager"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS += " \
+    desktop-file-utils-native \
+    glib-2.0-native \
+    gtk+ \
+"
+
+CXXFLAGS += "-D_LIBCPP_ENABLE_CXX17_REMOVED_AUTO_PTR"
+
+inherit gnomebase itstool gettext gnome-help features_check meson gtk-icon-cache mime-xdg
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
+GNOMEBASEBUILDCLASS = "meson"
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
+SRC_URI[archive.sha256sum] = "d80ac70b99a7059c8f28ca0bf37305f09daeaecfceb1528d68a435ace9e8ec5d"
+
+PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
+PACKAGECONFIG[exiv2] = "-Dexiv2=enabled,-Dexiv2=disabled,exiv2"
+PACKAGECONFIG[taglib] = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
+PACKAGECONFIG[libgsf] = "-Dlibgsf=enabled,-Dlibgsf=disabled,libgsf"
+PACKAGECONFIG[poppler] = "-Dpoppler=enabled,-Dpoppler=disabled,poppler"
+PACKAGECONFIG[samba] = "-Dsamba=enabled,-Dsamba=disabled,samba"
+PACKAGECONFIG[tests] = "-Dtests=enabled,-Dtests=disabled,"
+
+FILES:${PN} += "${datadir}/metainfo"
+FILES:${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV}"
-- 
2.39.2


