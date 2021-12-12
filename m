Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC350C433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 18:36:18 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.1378.1639334176907130017
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 10:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=An4kvrJt;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id e24so1355886lfc.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 10:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oiJGFpTPiML7XFNziWNNhJyroaJPjq09D9QozeimnfI=;
        b=An4kvrJtonFv0NWrCNOUZKW4v3dBiGQEjHjJBlqjzojSiDt0Q+AJVlfM4NaORK0ECe
         X382cpBXTRlvz99bu7YSC5iItpXrN2pHokohpQRBZj3KbnIBnsZO7LgdvsL9377D7JJ2
         ogYFdPRCKJY8b4hOPuoNZQ39V8+diM9E0/DD0rqyjieaR0+egF7PS69N7cLIw4f9ZBau
         lvKAMpgZ5O3CugFszAqrAbEQAjvPe16dFLQ5UMYHV60Jaizg55AdPEu/pOHHIamjFqLE
         s2mDc12Gif9sWrYiRpVRlgFakZZ67akJsdu4G2k38vwFEYuOZgL9H+F1XS6V0NFQzz6M
         IYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oiJGFpTPiML7XFNziWNNhJyroaJPjq09D9QozeimnfI=;
        b=IZiunw4YREgBuIr/kMQ6IVF1fWt5T3IExVaU3agPqoRpJa2yv8nnWUtG94A9V3UQo7
         6K8+gOxgT4XDhn35LT62bMtVC8ndJpP3zqU91Xt76MsRyGrcxlc0MC69pIai4sdKC2Sk
         ZPvsoN5Q+TnDJ6wk4d/YEPDK2pRaM5AAZbM9LGEiOxDY4WQvOn/Wcdo8T9ijaJB4oZLP
         /9jIBM4b4+rbJ70lVP7DcV2StPZ4h0cp3Yh/xmjRcyyRuE1h1bHinecEwlh5/SvZvG6+
         0FKoC0vCIy1IBOkKAIdu2a8GcoWZHx8+U+Sm61I09iojMcr8xhP7B5a66F8p4YoPf5xY
         qiMQ==
X-Gm-Message-State: AOAM530RpbLAC3DgqusBp7Dj6xMSHbuWby47hTooLTGc3EP2q+smnVzr
	6JUs7Q9dlOdr1mY1TDuG2bEStMJX8l4sfyew
X-Google-Smtp-Source: 
 ABdhPJyLoYPi9MF7FqKY9c0dqHv5Aucr08ahGEUN4bSIGNKSCbdzdDUxMPf+yPjitcJH4Hhw/c5IYg==
X-Received: by 2002:a05:6512:23a0:: with SMTP id
 c32mr24635342lfv.150.1639334174620;
        Sun, 12 Dec 2021 10:36:14 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 p22sm1116222lfe.257.2021.12.12.10.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 10:36:14 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-multimedia][PATCH] gssdp: update to 1.4.0.1
Date: Sun, 12 Dec 2021 19:36:12 +0100
Message-Id: <20211212183612.3489223-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Dec 2021 18:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94306

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-connectivity/gupnp/gssdp_1.2.3.bb | 20 --------------
 .../gupnp/gssdp_1.4.0.1.bb                    | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 20 deletions(-)
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
index 000000000..43d2fcfa0
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
@@ -0,0 +1,27 @@
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
+    gtk4 \
+"
+
+inherit meson pkgconfig gobject-introspection vala gtk-doc
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
+PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
+
+PACKAGES =+ "gssdp-tools"
+
+FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
-- 
2.25.1


