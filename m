Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.22907.1596976523722768080
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 05:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GfCgXySH;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id m22so6688998eje.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MiFhIul7hvgaqoanhK5IzFjTeu2znjoqFeuH74KJXTU=;
        b=GfCgXySH7D1aw9YQbEnTR85mKFpSSucHCyPXZ0zprLmjCU0gi411mUSSvaA1bdkSCn
         cO19qK1w1hpFFoKJHs9PIwPjBPtRKEfbIZjMskGw0Iroo8WjaRYJlELpQzctBhfkAkLi
         gQvAjvujrLGiEiFO+PHO47ciZl6MqisFKk/RTBHxVWxWD+hm6+Z8i9d/A7bSJU7vRLrV
         pK8r1ghckIw53xN2Iixl++01JcipH5bybR3QfcYugFWNzyJBzAw5o0rnfpsqwxDtyzQa
         UtzJlY6XfLkXR4DRXuIkZ5LguoNWpviEqECHnxxBFca1vGQukQAVBLMy2arQRQOuJLtV
         RdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MiFhIul7hvgaqoanhK5IzFjTeu2znjoqFeuH74KJXTU=;
        b=VT9QjhcObaA5FygsQSCzv1BS99H1pARkpz9DTJG3+WcZNlcp7HpkPpiN/Sc9t1seu5
         Kx9y9q+lLYOefY94v1v88AjO2hNgkYEUqZYMOGLnCbFbf+Z3Px0HPZHk/niUuwwAQ7JI
         PBvCf/aQgTMbubqTjOYV/J5xBBVOGFdKE7Bp4U0HmSDAqxTewsiZ1GwEGWfflCsqIU5O
         gILEFIhLeceQ1oNUIJV+P9K/Mk3txLH/8cRb0HMfGAR0G1jq87AJIrmtwR0AsdUYrnSJ
         A0ZarXfw2rQ/xotLOGZT0WNM3lvkwKCFtpzT93c0iczY4TlJFG1xPOuyYXTCIvmCKLGb
         VILA==
X-Gm-Message-State: AOAM533DJUVpCLBAD0O61WsqS/janr0QfuImTaEXRcSYe3RT5edfijZT
	1O33qRJuzgtQc5nydrJcqsXxzNxx
X-Google-Smtp-Source: ABdhPJz5fXE0yQmO5YTEQPyROPVR4G2YGUkQca4GmhkD2Sdoy41ZI7jf+lUtTZXj3YSe+ptpN9AqBA==
X-Received: by 2002:a17:906:2296:: with SMTP id p22mr17138591eja.510.1596976522052;
        Sun, 09 Aug 2020 05:35:22 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f102180f54bc478636fc7f8.dip0.t-ipconnect.de. [2003:f0:7f10:2180:f54b:c478:636f:c7f8])
        by smtp.gmail.com with ESMTPSA id b24sm10070260edn.33.2020.08.09.05.35.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 05:35:21 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/6] gnome-calendar: initial add 3.36.2
Date: Sun,  9 Aug 2020 14:35:06 +0200
Message-Id: <20200809123507.267616-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200809123507.267616-1-schnitzeltony@gmail.com>
References: <20200809123507.267616-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-calendar/gnome-calendar_3.36.2.bb   | 32 +++++++++++++++++++
 .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.36.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.36.2.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.36.2.bb
new file mode 100644
index 000000000..4605857f5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.36.2.bb
@@ -0,0 +1,32 @@
+SUMMARY = "GNOME calendar"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+
+SECTION = "x11/gnome"
+
+DEPENDS = " \
+    gtk+3 \
+    libical \
+    gsettings-desktop-schemas \
+    evolution-data-server \
+    libsoup-2.4 \
+    libdazzle \
+    libhandy \
+    libgweather \
+    geoclue \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.sha256sum] = "d0b05345c0555a085e6e5426eab49494aba2826c856eb06fd7fdb762ec0c4c1f"
+
+FILES_${PN} += " \
+    ${datadir}/gnome-shell \
+    ${datadir}/metainfo \
+    ${datadir}/dbus-1 \
+"
+
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 934101f9b..2d2d6b599 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -13,6 +13,7 @@ RDEPENDS_${PN} = " \
     gedit \
     ghex \
     gnome-calculator \
+    gnome-calendar \
     gnome-font-viewer \
     gnome-photos \
     gnome-terminal \
-- 
2.26.2

