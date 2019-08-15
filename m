Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 42EB97F30B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k2so3535087wrq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vlzv8JM6tDKZNDJjZm4NEgljmJVMM/yhxVhhjOwmylE=;
	b=ftNLA0MJPVqbEOxxk7gRrjn29XNE4gNMx+MepiUHbOwGucRlXEHUJIUEDoXqzGF3aw
	vFwR4t1ABDIEAO1wQXSiWzRbfY3aeK7XyLqz6MXhDajfQl1dYhqFfdIWq5TTcOw/7ii6
	uAl/Z49/+n1JefSaCoNNdcc9W+QvVWpOMkHy6cLoVmQF6mhAprVP/AGgt1uZi0JxoBco
	Nlya43X6iHO4hdUAQOkl5gc8/dlEiTBHnn8xOR1rKsZ8dYamNoEv/eGMVC3yIytp/opC
	+GpAFYptQ2i9G8uiC6+tvueMSduZIQnDDoKlfImlj1TTVcB8mQsylpzQYOO8qF5ztV6h
	3lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vlzv8JM6tDKZNDJjZm4NEgljmJVMM/yhxVhhjOwmylE=;
	b=fLl0X1yvJ6NJlh/KC/sTJZDSSCGmoOOu4kav8WMXk2GcTZKIlQHe5tQlq/P54bQikW
	bGLhHuVeT5kXLuLsl+A1KOQPmwDIhEp5lZP/IETorVLmKcU2fKdF0ppHlDuA1mJh3O60
	gnzXrTgCDu0NC2Z+S2zMWQb0uV6LCUB7XV+2S+O6SvBFB+GKGR/m7avjeYL+j0cbZWda
	0x/Td7yixrf9RqENDK4eLGhkxY3Gg8zPjox+LIli8Lg5F3AAfBWAprcuf6YWRZDIA3ey
	c8N8K23WctuRcIkO5fqpC9qLZdeJD58NxRqeGXVbgWLHpilnKEaXm+CJbcwOZaD0YC+e
	xuqw==
X-Gm-Message-State: APjAAAXS7qgMM63SARtfGvS1JCzE1/1f064GVd+ZuyM52072rgdojto+
	JndNo76caj/YzUBnjfxawQ8xyEOL
X-Google-Smtp-Source: APXvYqwPYBAa2Ptu+cktOiZENqwuyMTXvJrpat1uVnvdmOU0ndJHpfK7dCa6rQXI6b5sGDSe4PxNTg==
X-Received: by 2002:adf:fd8b:: with SMTP id d11mr6930391wrr.300.1565906184624; 
	Thu, 15 Aug 2019 14:56:24 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:56:02 +0200
Message-Id: <20190815215605.19600-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/13] parole: upgrade 1.0.2 -> 1.0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2019 21:56:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bufixe release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../parole/{parole_1.0.2.bb => parole_1.0.4.bb}       | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.2.bb => parole_1.0.4.bb} (72%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
similarity index 72%
rename from meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
rename to meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
index a286a5adb..68556a2ab 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
@@ -1,15 +1,12 @@
 DESCRIPTION = "Parole is a modern simple media player based on the GStreamer framework"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/parole"
+HOMEPAGE = "https://docs.xfce.org/apps/parole/start"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-app gtk-doc mime
 
 DEPENDS += " \
-    glib-2.0 \
     dbus-glib \
-    gtk+3 \
-    \
     xfce4-dev-tools-native \
     libxfce4util \
     libxfce4ui \
@@ -19,8 +16,8 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[md5sum] = "cd22ab579470c5728db0aa6c0b9d4c7d"
-SRC_URI[sha256sum] = "bff0fc846d0d7b8f435ac5514976f1cd1d82b62dbf1b7d470e253a5b439407da"
+SRC_URI[md5sum] = "c23621eb44df292f828e86074d4e719d"
+SRC_URI[sha256sum] = "e92b8ec369e53d921b47d2473c2e2a1e9e04d3c5d536d419abdff40e5e136dc1"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
@@ -31,6 +28,6 @@ PACKAGECONFIG[clutter] = "--enable-clutter, --disable-clutter, clutter"
 PACKAGECONFIG[notify] = "--enable-notify-plugin, --disable-notify-plugin, libnotify"
 
 FILES_${PN} += " \
-    ${datadir}/appdata \
+    ${datadir}/metainfo \
     ${libdir}/parole-0/*.so \
 "
-- 
2.21.0


