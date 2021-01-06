Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.9404.1609946256338135172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ET8GT59v;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id p22so4649983edu.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=reqiXw3++lFxhVi/t//i6HDooP3zt3KVEMn+dB9b1UQ=;
        b=ET8GT59vYEpPrbc1Yh4OqXfOgSa3Kx4AV0MerT2pusyZIrk4njqFDsfn8F8Kz/w6SK
         U1P2wdS5ZpoakmZh1ix284xXuIZp9zydiTOUHl/B4T1HpqI+ExENCFwo+ZBZKi6Pm9u5
         bwWmmTr4lUYokCR02bsKzZfGdxOCoDuBZFA8VCSVpV+4JWKftJk9c7+n9zoLZUzp9oiv
         hzAf3NrCtxaaGD/Ii4vZWc+dKwjQIMUlE860SMFWeH1Oel6IvjClJ/Qs83DJ8AmOxUcJ
         OUkuzbaZdZyam3ScFqykZ11J1PRVCyMyZy7BqPnHYyi4ASkvDIOmXyTbaUXb+HqpQiD5
         NHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reqiXw3++lFxhVi/t//i6HDooP3zt3KVEMn+dB9b1UQ=;
        b=K7R0iO2e7rzg3ySzRdz8qjZyTLljKmnzSJ9Wj/C3e0c3sCXCoTGF0UykTZUMu3jau5
         INTVZNybtweGpbJ7uIFkDHzYw3eOrXeZz1kVH8z11LMHMs2O62yiwBSKrgooP3/YLGkF
         ax6zOT35+R5gql8SkfEfb23LI1Q61dtDLoeGE9UHPos//xUeOlqz4pEmPeqo4wvCj6hF
         A3gwhUvi1DwX091BTDbKLFZaemE/1a+QfAqb4VjbOYf8CwRkYDoAhI2fTQKJy2mzeslf
         CRkfLh5XVkxjcSKfjefCiLb2AR3dmj0sAcYq831NI/5kWxdHpwly5t/d3q1AgMrRMXjK
         W/sw==
X-Gm-Message-State: AOAM532UNyJY4oyfAI/+h+gFLg9IPS/YTPfdHOPcTRSRmbX9mAF1Q07w
	Avwz4G6DT7eS7GfdtqptB3XDKHmNaJqOTQ==
X-Google-Smtp-Source: ABdhPJyYCQ8vj5uVlWt2pe2PbixFLQHXh3us5THMKBVvaw6AtPm2xmslll5nMbtY8G0iDFkiH9twfg==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr4331758edj.293.1609946254963;
        Wed, 06 Jan 2021 07:17:34 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:34 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/28] exo: upgrade 0.12.11 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:54 +0100
Message-Id: <20210106151717.1779543-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* exo-csource was removed. It is now xdt-csource shipped by xfce4-dev-tools
  => native build extension can go
* gtk2 support is gone

Release notes for 4.16.0
========================
- Focus must not be required in single click mode (Issue #190)
- Remove GLIB_CHECK_VERSION IFDEFs which are obsolete after glib bump
- Adjust padding only for vertical item orientation (Issue #48)
- bump glib (and gio, gthread, etc) to 2.50.0
- Fix GCC warning (false negative)
- Translation Updates:
  Basque, Estonian, Norwegian Bokmål, Portuguese (Brazil), Russian,
  Slovenian, Turkish, Vietnamese

Release notes for 4.15.2
========================
[Please note that this is a development release.]

- icon-chooser-dialog: Allow removing selected icon (Fixes #2)
- desktop-item-edit: Fix sensitivity of save button (Fixes #28)
- Rework exo_icon_view_scroll_event for overshoot effect (Fixes #25)
- Allow resizing the xfce4-settings window smaller (Fixes #19)
- Drop exo-csource from exo
- Fix build on OpenBSD (!2)
- Fix race condition in make install (Fixes #29)
- Remove unused perl module requirement
- Replace bugzilla occurences with gitlab (Fixes #30)
- Translation Updates:
  Albanian, Chinese (China), Chinese (Hong Kong), Danish, Eastern
  Armenian, French, German, Hebrew, Japanese, Kazakh, Korean,
  Lithuanian, Portuguese, Portuguese (Brazil), Russian, Swedish,
  Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../exo/{exo_0.12.11.bb => exo_4.16.0.bb}     | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.11.bb => exo_4.16.0.bb} (54%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb b/meta-xfce/recipes-xfce/exo/exo_4.16.0.bb
similarity index 54%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.16.0.bb
index 4a5a7720e..5b91b8b7e 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.16.0.bb
@@ -3,12 +3,10 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
-DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native intltool-native"
 
 inherit xfce perlnative gtk-doc features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
-REQUIRED_DISTRO_FEATURES_class-native = ""
 
 # SRC_URI must follow inherited one
 SRC_URI += " \
@@ -16,18 +14,7 @@ SRC_URI += " \
     file://configure.patch \
 "
 
-SRC_URI_append_class-native = " \
-    file://reduce-build-to-exo-csource-only.patch \
-"
-
-SRC_URI[md5sum] = "efeb039d64b3257e39a1a38e75eb19b1"
-SRC_URI[sha256sum] = "ec892519c08a67f3e0a1f0f8d43446e26871183e5aa6be7f82e214f388d1e5b6"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG_class-target ??= "gtk"
-PACKAGECONFIG[gtk] = "--enable-gtk2,--disable-gtk2,gtk+"
-
-PACKAGES =+ "exo-csource"
+SRC_URI[sha256sum] = "1975b00eed9a8aa1f899eab2efaea593731c19138b83fdff2f13bdca5275bacc"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
@@ -35,7 +22,3 @@ FILES_${PN} += " \
     ${datadir}/xfce4/ \
     ${libdir}/xfce4/exo* \
 "
-
-FILES_exo-csource += "${bindir}/exo-csource"
-
-BBCLASSEXTEND = "native"
-- 
2.26.2

