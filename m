Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4230AC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 06:49:37 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17532.1789454976615366293
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 23:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pcc9y7OO;
 spf=pass (domain: konsulko.com, ip: 74.125.225.76, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2230734f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 23:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789454975; x=1790059775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dByH1CeVOY+I5K0BYUCBAal3WscH75tGAJxjZdXV+uI=;
        b=pcc9y7OOyRaImChERapbef2Pgpr/8gntVEejLKm8n9jpJVZ4K+ajrvG9cgDMAipgCz
         BoCkNxXPsOY9pcNW5Soazh6PHdFFkd7sKYQ3uyRy5hdEGJE0Jib+JHS73a7xpTLqamAf
         7T5l0ypgJu0ukrj2fnEwKk8p9o0BCcseFuJ3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454975; x=1790059775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dByH1CeVOY+I5K0BYUCBAal3WscH75tGAJxjZdXV+uI=;
        b=vnwWSILtAy0wfIvJJunus/+w7XeCuK8cK+zcvBgSL351rymZB2FTqNbryvwGA6rPJz
         0pFbYu5m6ev677VpQqiKTW1pNhX43qil/Yg8RrTL6mKoBRNGT0OCfqQ5k2j6CEJ/VwaJ
         O0l9OM1ex4knl/k91YcUS3ub928y2ZzlblSYFjpzinMRTOSBv34TXRtUQ53BdZdI8BIF
         j/bjO15Uh9ubFV03m6dRd8ZsEq7ZdqJmaWQywtpYWWqLR/05g59iETY9NbXmmLuY0fxw
         oaQjYtr08y1E3tS3GD7VgUGUvsLGHYNfPTFFA6qx4BUrq2nkDGV2jI6G31mvaKIA2Ho+
         95oQ==
X-Gm-Message-State: AFuF++mPlTJ6EGJgy9KtuJ7u4FydaWRfP42U0+6eyOoID8iABUuIjed/
	ArTo9HfuWnEH3Pb0ppeZWdBF6F+yQUYpIbmX/SNkIiAuhG+Px+jNQ/X0lDQ2413rYCfoHPv6dSb
	80W0w
X-Gm-Gg: AYBFou2FlloSTuAkTmsdzuSEpunQXB+Eukdj5Bluz15glZtwKqjg5MW5XLn+UIib4v7
	j1budKMEtyY7ls27sJ63bBC650wd1vW+CHQ6RwJbYmkN0aqVHbkC3RMGr1y4JqSIeiLWM46pH4A
	rBde63gczwMJK0ASIBtflZi702khUiiFp4ZFrVpsvS0Ek9hEEXCoBrmowTxayVEBfEpXTVC+DBK
	yapHtjNPh0YdwFaHuQGqXQsv0kWiOs3JOQIEY8SumlBh9NBWB1bJUhOfdmdbUU4+7DC/ELSP2n0
	UEDsmyfSpPKQJEyhi3apZKZHN3kmsOXGGJeA0Iij8OngQnufMnjqU6B9tF6LJt/gSryRmzO08el
	OsG3Ncfqh9NsBwRlTO27HdAb9UPCKexdwg1aOJ/apewlFBYa7Jsogda8jOaGgU8N1D4GnmJmAZu
	Q9rfs3EbdIElB2oxJ2Tv9UiqBk/CWqKxVQAHwx9BEfI54dpw2fztzGkzHzSzY/94r6ZyUKPr0G+
	+zEEicjmbEPMD1ppofxJ8fS1eLRHfKrHZp+ML4Q7kd/VYunw2IrG19y1/G3lJ/XOlBkwNGDj1Qs
	Zh2qW+5jvhFTiY2eE5DR1/IN
X-Received: by 2002:a05:6000:1ac7:b0:487:6d9:dbe5 with SMTP id ffacd0b85a97d-48706d9dc9fmr2132584f8f.9.1789454974360;
        Mon, 14 Sep 2026 23:49:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm30002992f8f.10.2026.09.14.23.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:49:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH] rygel: Upgrade 45.2 -> 46.0
Date: Tue, 15 Sep 2026 09:49:31 +0300
Message-ID: <20260915064931.1383007-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 06:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130035

Upgrade to release 46.0:

- Translation updates
- Add missing "dlnaprofile" description for GstLaunch
- Fix rendering issues for web docs
- Remove RUIH implementation
- Allow proper boolean settings through environment variables
- Align list definition through environment with config file
- Remove BasicManagement and EnergyManagement

Remove RUIH from PACKAGECONFIG. Add Python packages PyYAML and
Docutils to the dependencies.

Change HOMEPAGE to https://rygel-project.org which redirects to
the Rygel 46.0 documentation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../rygel/{rygel_45.2.bb => rygel_46.0.bb}             | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_45.2.bb => rygel_46.0.bb} (92%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_45.2.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
similarity index 92%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_45.2.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
index 363f71b989..b27b452ed3 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_45.2.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
@@ -3,14 +3,15 @@ DESCRIPTION = "Rygel is a home media solution (UPnP AV MediaServer) that \
 allow you to easily share audio, video and pictures to other devices. \
 Additionally, media player software may use Rygel to become a MediaRenderer \
 that may be controlled remotely by a UPnP or DLNA Controller."
-HOMEPAGE = "http://live.gnome.org/Rygel"
+HOMEPAGE = "https://rygel-project.org"
 
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 \
            gstreamer1.0-plugins-base libgee libsoup libmediaart-2.0 \
-           libunistring sqlite3 intltool-native gst-editing-services"
+           libunistring sqlite3 intltool-native gst-editing-services \
+           python3-pyyaml-native python3-docutils-native"
 
 RDEPENDS:${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS:${PN} = "rygel-plugin-media-export"
@@ -20,7 +21,7 @@ inherit gnomebase features_check vala gobject-introspection gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 
-SRC_URI[archive.sha256sum] = "20e57b70b15a865d77dc38f9f786abc52c64b111fe5f938a62c28d712df1331d"
+SRC_URI[archive.sha256sum] = "b61512c99307e2de7081f96b002427bbf23b25d5b0c3f6ae8d7798caebce4a86"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
@@ -28,11 +29,10 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 EXTRA_OEMESON = "-Dengines=gstreamer -Dplugins=${@strip_comma('${RYGEL_PLUGINS}')}"
 PACKAGECONFIG:append = "${@bb.utils.contains_any("DISTRO_FEATURES", "opengl vulkan", " gtk4", "", d)}"
 
-PACKAGECONFIG ?= "external mpris ruih gst-launch media-export"
+PACKAGECONFIG ?= "external mpris gst-launch media-export"
 
 PACKAGECONFIG[external] = ""
 PACKAGECONFIG[mpris] = ""
-PACKAGECONFIG[ruih] = ""
 PACKAGECONFIG[media-export] = ""
 PACKAGECONFIG[gst-launch] = ""
 PACKAGECONFIG[localsearch] = ""
-- 
2.47.3


