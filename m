Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A589AC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:53:56 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.1722.1699728829863936722
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQieXgnN;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1e9c9d181d6so1897560fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 10:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699728829; x=1700333629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wfo4c9pPRm9E1Dtbe+fcQuDzoVifkq0U7vSBqMOXMRE=;
        b=fQieXgnN2XQb1Mx26nr5Lj2KbIByv6adrrotfZwkU6whZplWW6xcuq98OVBKf6a2Zp
         beclR0GPNVDPCAkEnGELIrW/Gt3nUuVStxYcNhoNA0FmVeTgrRZ7adV+fZr8RR+RiThc
         JvvQHABR8pX+nZ1UrEqJed4+8MtTBuCfHTAtKv4Ms6AUrsvqELE1O8IzLPfHHE2n5x3E
         YxVFForPRGGQZAdoybrfkfwodIVtN7FVtAGX9BcyL8by7hMt0oE2i3Qtt4yVgfGIp1oD
         ugd01SVipm3rzGux3Yyi/A6aiROExWmLOKMxKOOno064QGDwVZoQcbBKj0iT7+ZotEsQ
         X0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699728829; x=1700333629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wfo4c9pPRm9E1Dtbe+fcQuDzoVifkq0U7vSBqMOXMRE=;
        b=Bd3WVgCNrudvEzIKRuMxOQWpAjV6RDGz7B9gFYQ6yQ/KSJ3+i1Wy0ugt1JzQorDYAT
         b5xMtTo7ZgQWpAeqffYsapFcXIbWbneNfyNFAnpiggF/iwoRD2lxf7WzyAIpRObvpC2H
         5o27Q0K9TpYX2Ibg0QHbtGmd44PSIJm2MZetyG2n6UnI4obQFHAITuhLRY58eqEMOJIq
         JLgZ173ipIvlVYCdquspB1sYDN1qDm1WX4nKENDfwLU9AeN3EKCgfbMFEUP/e4gGMlnT
         9MTkBJBCP8O45cjycbSS1BJwi+xe2yRL7QXW4HQ3G3oyjqWkbaCI5qo9FcHLke08b7Yc
         /Mwg==
X-Gm-Message-State: AOJu0YwqGhUc9SyBI92CbOKrkbkCoA9yiPlt3mlXpEeqggC5i3I8M50d
	fS4AhrUbXSuJ8EdzUwrubL8glETkqTIvfg==
X-Google-Smtp-Source: AGHT+IEDoaSenNB4Ui0dbHhNjfbkmwQSgrKTMbP8kgo9xLsR1QY8PPDCoz89E5vj6fanIEz4DIFY6Q==
X-Received: by 2002:a05:6870:4507:b0:1f0:66fc:22b9 with SMTP id e7-20020a056870450700b001f066fc22b9mr3499147oao.9.1699728828849;
        Sat, 11 Nov 2023 10:53:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a1a5e00b00280469602bcsm3866923pjl.2.2023.11.11.10.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 10:53:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] rygel: Upgrade to 0.40.4 -> 0.42.4
Date: Sat, 11 Nov 2023 10:53:46 -0800
Message-ID: <20231111185346.783171-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 18:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106563

Switch to using libsoup-3 and meson for build system
Disable media-export plugin, since it fails to build

rygel-media-export-dvd-parser.vala:91.27-91.39: error: The name `uri_copy' does not exist in the context of `Soup' (libsoup-3.0)
|    91 |             var new_uri = Soup.uri_copy(file_uri,
|       |                           ^~~~~~~~~~~~~
| libsoup-3.0.vapi:4.1-4.14: note: `Soup' was declared here
|     4 | namespace Soup {
|       | ^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rygel/{rygel_0.40.4.bb => rygel_0.42.4.bb}         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.40.4.bb => rygel_0.42.4.bb} (93%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
similarity index 93%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
index a5df37637d..9662296399 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
@@ -9,18 +9,18 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 \
-           gstreamer1.0-plugins-base libgee libsoup-2.4 libmediaart-2.0 \
+           gstreamer1.0-plugins-base libgee libsoup libmediaart-2.0 \
            libunistring sqlite3 intltool-native gst-editing-services"
 
 RDEPENDS:${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS:${PN} = "rygel-plugin-media-export"
 
-inherit gnomebase features_check vala gobject-introspection gettext systemd meson
+inherit gnomebase features_check vala gobject-introspection gettext systemd
 
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "736d8adbe8615f6cbc8fcfff9845dc985fd10e16629da236b4b52dbedf0a348b"
+SRC_URI[archive.sha256sum] = "6310dfaa2d332b66119b9b020fad6a4bd27d9bc61faf780ca5ca0b62813303f7"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
@@ -28,7 +28,7 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 EXTRA_OEMESON = "-Dengines=gstreamer -Dplugins=${@strip_comma('${RYGEL_PLUGINS}')}"
 PACKAGECONFIG:append = "${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk+3", "", d)}"
 
-PACKAGECONFIG ?= "external mpris ruih media-export gst-launch"
+PACKAGECONFIG ?= "external mpris ruih gst-launch"
 
 PACKAGECONFIG[external] = ""
 PACKAGECONFIG[mpris] = ""
@@ -49,7 +49,7 @@ RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'media-export', ',m
 RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'tracker3', ',tracker3', '', d)}"
 RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'playbin', ',playbin', '', d)}"
 
-LIBV = "2.6"
+LIBV = "2.8"
 
 CFLAGS:append:toolchain-clang = " -Wno-error=int-conversion"
 
-- 
2.42.1


