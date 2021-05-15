Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.589.1621121948573625108
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OM+xes9V;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id f1so2634879edt.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6a58Xf19Ke1k5oDvq+wBl0iTh/0zN3F1saz6vS6Y1fE=;
        b=OM+xes9Vupu4Qjh1AhB++iYBjl1sgcNtLJRX3mPGrsVSIk1pNvfuq+Bwn9zjsFSLkj
         Enw5bgEv4VAJTWzmmoBBer0Eb5p0pwZVncPEQ4ASD7LIkbloFGEAKOrgxBpcQXX0MdP0
         KvAwlj18MtNrPaAtXalznvDuSCRVypqRfzPubUrui+cRwja/ehsUQPdwK/xvgORMQgqr
         Ml7pEf20FBgsie+RI6PfIoRnn1p2D2xgMuoMtTuB/a9n42jXMoWUMAbCq1wPE6h2RUOV
         GpwKJKkC7KztKbDt+bQNUDddS0IKspK9Q9FNsC4kq9CL0Ke5rUNiXVMXW1ucjTNCq3DI
         nMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6a58Xf19Ke1k5oDvq+wBl0iTh/0zN3F1saz6vS6Y1fE=;
        b=Sb7JurLQlHwTCsdwmfRyOenzShEwea1Ms46XcoDabqar61KWL4DFz2HwteLT9G424G
         pCKNB2rUGwVBnKBVHvHQhbLU1zm37S1SmPoMyDqskSpLHmb2vSat8q5Lj0STsCKImcS+
         ACra4+Xx1BR4HlWGDC7CljP6W+K/lkWRRKdPrzPaK7/YeBR8JpfObJnsCeGHh7Cgd0Eo
         6x64S+JPgNwbcXw4YouBJQ/zBveRaIBRq5InCBE2we7zTuhT22DVyJC8zklJC5ZIUQMC
         GBcgxVjsRJvKVSEQWPWIyJONJJ3USnUyqG+ZEvsGwxYlTEH0KCiFOJ0HSBkGqO+/UrjM
         +vMg==
X-Gm-Message-State: AOAM531tNCJJo2cFfV+ty6lWInzYnLpfaV+5962SR0DC+CciJvr1+YO+
	9/+RBfk/JV6m2uFxam/55RRnf6NJIto=
X-Google-Smtp-Source: ABdhPJxUWvlPJspiMeWHY8sphIv6n3mVp9lSroDISCKHJGWruOjsr5WCB1JXP5w8kgYj6SPj7bC7kw==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr63857978eds.166.1621121947218;
        Sat, 15 May 2021 16:39:07 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:06 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/20] tracker-miners: upgrade 2.3.5 -> 3.0.5
Date: Sun, 16 May 2021 01:38:35 +0200
Message-Id: <20210515233853.583490-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* follow tracker upgrade
* adjust PACKAGECONFIGs to new sources

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...iners_2.3.5.bb => tracker-miners_3.0.5.bb} | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_2.3.5.bb => tracker-miners_3.0.5.bb} (73%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb
similarity index 73%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb
index 07fa10a0e..6672195e0 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.0.5.bb
@@ -13,9 +13,9 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
+inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
-SRC_URI[archive.sha256sum] = "9509d37fb29acd233058f4df5bd1234b692ac6f946bc2e5f7b8dbf51dfe5b9fa"
+SRC_URI[archive.sha256sum] = "c9be14871b1398e6e656a354a8f8f59e69e93169017f2b28308ef439324fd12b"
 SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
 
 # gobject-introspection is mandatory and cannot be configured
@@ -24,34 +24,33 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "ffmpeg", "", d)} \
-    flac \
     gexiv2 \
     gstreamer \
     icu \
     libexif \
     libgsf \
     jpeg \
+    pdf \
     png \
     tiff \
     xml \
-    pdf \
 "
 
+PACKAGECONFIG[battery]     = "-Dbattery_detection=upower,-Dbattery_detection=none,upower"
 PACKAGECONFIG[ffmpeg]     = ",,ffmpeg"
-PACKAGECONFIG[flac]       = "-Dflac=enabled,-Dflac=disabled,flac"
 PACKAGECONFIG[gexiv2]     = ",,gexiv2"
 PACKAGECONFIG[gstreamer]  = ",,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[gupnp]      = ",,gupnp-dlna"
+PACKAGECONFIG[gif]        = "-Dgif=enabled,-Dgif=disabled,giflib"
 PACKAGECONFIG[icu]        = ",,icu"
+PACKAGECONFIG[jpeg]       = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
 PACKAGECONFIG[libexif]    = "-Dexif=enabled,-Dexif=disabled,libexif"
 PACKAGECONFIG[libgsf]     = "-Dgsf=enabled,-Dgsf=disabled,libgsf"
-PACKAGECONFIG[jpeg]       = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
+PACKAGECONFIG[pdf]        = "-Dpdf=enabled,-Dpdf=disabled,poppler"
 PACKAGECONFIG[png]        = "-Dpng=enabled,-Dpng=disabled,libpng"
 PACKAGECONFIG[tiff]       = "-Dtiff=enabled,-Dtiff=disabled,tiff"
 PACKAGECONFIG[xml]        = "-Dxml=enabled,-Dxml=disabled,libxml2"
-PACKAGECONFIG[vorbis]     = "-Dvorbis=enabled,-Dvorbis=disabled,libvorbis"
-PACKAGECONFIG[pdf]        = "-Dpdf=enabled,-Dpdf=disabled,poppler"
-PACKAGECONFIG[upower]     = ",,upower"
+PACKAGECONFIG[networkmanager] = "-Dnetwork_manager=enabled,-Dnetwork_manager=disabled,networkmanger"
 
 # For security reasons it is strongly recommended to set add meta-security in
 # your layers and 'libseccomp' to PACKAGECONFIG".
@@ -60,12 +59,14 @@ PACKAGECONFIG[libseccomp] = ",,libseccomp"
 PACKAGECONFIG[rss]        = "-Dminer_rss=true,-Dminer_rss=false,libgrss"
 
 EXTRA_OEMESON += " \
-    -Dsystemd_user_services=${systemd_user_unitdir} \
+    -Dman=false \
+    -Dsystemd_user_services=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)} \
+    -Dsystemd_user_services_dir=${systemd_user_unitdir} \
 "
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-    ${datadir}/tracker \
-    ${libdir}/tracker-miners-2.0 \
+    ${datadir}/tracker3-miners \
+    ${libdir}/tracker-miners-3.0 \
     ${systemd_user_unitdir} \
 "
-- 
2.31.1

