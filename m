Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FF7C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:50:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.13708.1639414235724178590
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=5x2BmlWL;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id b40so31976449lfv.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=46OPwULPZCEcq71i2ANmZzsCX/vPB1zWpZljT56bYgA=;
        b=5x2BmlWLhv/eiRpbrDmA29ZlTq592ZVx2jV28kRGIl8iA0ivKxTIFbScp3Ompb3PmZ
         PeGkx4pNy6Lm2/bWdPb5saiwMBzLAGr38JWQf2Y7a2d3vwqyXH4pk+MX3cjV8P5IcLi0
         /+SQikKXC5vz1/YPpzaZkg20kivBh9tgAjT9IhA5iuWMYgTb5Fx86ez2tZ8a2OjMaoxa
         BBflJ4ueRTTSdHS5rwiVf56bZAPJPPQuDkjoEwF2HxTIJl6oNsCNHSe80PGiLVHQAo0J
         HSHz5d8IKKzhzk8HfUFBc2tkCg4vZUYgY6dDamvUz1dlSGIVuLVlc4ui4FTGuJjtdprk
         aORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=46OPwULPZCEcq71i2ANmZzsCX/vPB1zWpZljT56bYgA=;
        b=YiCIFqigQoDivL2HbQnuTIbAnw3jQleXVzESqw6aHvZABUhTMjdoJaFFJ7QFy+hhQD
         WdWE0TdnqokH17st9N9bVSbE7ObtrW7iJtxvzWIbqfG6RU1WDHPmoHJGgevPUakenUT4
         nHMa6IiewREnLf8FWpyBB0lNK9pYq+V5DGQd9Gii4fbfWYUpWKkT7acFdNG1YgHaQLkN
         ZeYHEK3APsJCYoMhzlPvMoSXRizGbSyJRNbV4kTj8HEPQBBvUVa+eGQ1pnmj3SyXBlyV
         JO6+EFNe6dku642WwxXR1U2i0uCIQdUf3yuQ76Vn8HhUFB83kF1Tv3Uwyp3U4/qTEWzn
         9kQQ==
X-Gm-Message-State: AOAM532yy8XHNZFDw6texqMQtWG27IgLcLZGVRAe1dLGx2ZDNBxGfzkF
	XM5H1BGaU7qIgclAU6jOTyRKZtA0axsNFq3l
X-Google-Smtp-Source: 
 ABdhPJzm8ZG3zQrXemNxrYn0gqVzjnn3/hCAPpTrisrSNxJr/dOT6bxHl7XIXNl5XTRYAQTVEBGImw==
X-Received: by 2002:a05:6512:138b:: with SMTP id
 p11mr15817971lfa.508.1639414232908;
        Mon, 13 Dec 2021 08:50:32 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 q1sm1493350lfo.255.2021.12.13.08.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 08:50:32 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH v2] gssdp: update to 1.4.0.1
Date: Mon, 13 Dec 2021 17:50:28 +0100
Message-Id: <20211213165028.707874-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 16:50:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94341

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/gupnp/gssdp_1.2.3.bb | 20 --------------
 .../gupnp/gssdp_1.4.0.1.bb                    | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 20 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
deleted file mode 100644
index 8f27ae292..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Resource discovery and announcement over SSDP"
-DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4"
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "ef3295a965c06ce0f683522391fbb910"
-SRC_URI[sha256sum] = "a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8"
-
-GTKDOC_MESON_OPTION = 'gtk_doc'
-
-inherit meson pkgconfig gobject-introspection vala gtk-doc
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
-PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
-
-PACKAGES =+ "gssdp-tools"
-
-FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
new file mode 100644
index 000000000..056ea83aa
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Resource discovery and announcement over SSDP"
+DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP \
+               (Simpe Service Discovery Protocol)."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/gssdp/"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582"
+
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+DEPENDS = " \
+    glib-2.0 \
+    libsoup-2.4 \
+"
+
+inherit meson pkgconfig gobject-introspection vala gtk-doc
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
+PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+4,"
+
+PACKAGES =+ "gssdp-tools"
+
+FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
-- 
2.25.1


