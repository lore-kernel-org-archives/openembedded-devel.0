Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE027F2E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:21 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v15so2468110wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZfSQDwLY+A8e4DOI9SXkVloS0a9wvPPcmDwkYaPuf5g=;
	b=twJVpWu6+A64PrPoqALJd3dOY36z+Y8MZh/ftKGKY3BGViQkRIUbgAMfgjRY8C/v9J
	8Ey5BSpN1mPC/iASlZXQtCsZ1ddCwouMI48YGzsDTn44TuZEJOTcx4D4KRT6qCVg728j
	yMZ0efFg0wDwBZPqi8O2/DPsNzfIrBA7IKfKBD5Uc33yMuPaJUlyr8MyiBPV3whI8g+z
	I38jdaOpgmrB/zuLpSpmpiW2P90Av1dUyWDkd6S0/ptOETwP6yQi43wt587oqfN/l8Uc
	g54YwJGf5oYF2Si28rGeO+0jvvgrm9AS86fcjob+Eh7JZjEs7+CKBSlBGPCo0wkOKZIg
	O7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZfSQDwLY+A8e4DOI9SXkVloS0a9wvPPcmDwkYaPuf5g=;
	b=Wo8TUQ2ucEttjw8bvcvcF8WB+K48VueDqshSYh/cEdEOtfclZse6dr4GPNdyxV4SWy
	oIYQRMLm7qEchSWfenB5NygBxFVOHAb3A8qer3pekvRxVc/C03GrbZSTYJ57oA1B1nM7
	KF216uRxI1FkAg6wJI62fL2m8lIBUl1wI5z/eWmxytYg54jF2KWFj42VelogKrU6kbeh
	HCQTvI628F2wZJR6Wi7hYqt8Zt8NqKaEPeEXM5mU3aGc6OJzIr2tK+mLc/0leSjnJ+j4
	jMjyMEb7f89Mjg0CFbPNZCvWYnX0BywxkzlutySo+M4KVKXYqCnQ1iawu2zxSaPLPwdn
	xfBg==
X-Gm-Message-State: APjAAAXuDNmK2h89kHBNtsBUYEKUBQ9G26H1rpnMzR5dU/plD6ygUfQb
	lJvB0ZiL4HPcgikZkrMvSC1NVH2u
X-Google-Smtp-Source: APXvYqwd7tcJ6OSbB3M8zAjCqJ9X6LwRKb+qgynfuhNA8bzZUlA6ljR/wjir8EHyvqomhjfq3ShtMw==
X-Received: by 2002:a1c:9c8a:: with SMTP id f132mr4408752wme.29.1565906182273; 
	Thu, 15 Aug 2019 14:56:22 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:56:00 +0200
Message-Id: <20190815215605.19600-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] ristretto: upgrade 0.8.4 -> 0.10.0
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* GTK3 port
* overall recipe cleanup

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-Fix-build-after-update-of-xfconf.patch | 40 -------------------
 ...ristretto_0.8.4.bb => ristretto_0.10.0.bb} | 12 +++---
 2 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.4.bb => ristretto_0.10.0.bb} (33%)

diff --git a/meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch b/meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch
deleted file mode 100644
index 5cdc8c728..000000000
--- a/meta-xfce/recipes-apps/ristretto/files/0001-Fix-build-after-update-of-xfconf.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2b6bdb860ef53975c7e866f393b61d253c00754d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 22 Jan 2018 15:52:09 +0100
-Subject: [PATCH] Fix build after update of xfconf
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-xfconf stopped using dbus-glib so required flags must be included here
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- src/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 36a31dc..3dd56bc 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -30,6 +30,7 @@ ristretto_CFLAGS = \
- 	$(GIO_UNIX_CFLAGS) \
- 	$(LIBEXIF_CFLAGS) \
- 	$(XFCONF_CFLAGS) \
-+	$(DBUS_GLIB_CFLAGS) \
- 	$(EXO_CFLAGS) \
- 	$(CAIRO_CFLAGS) \
- 	$(LIBXFCE4UTIL_CFLAGS) \
-@@ -48,6 +49,7 @@ ristretto_LDADD = \
- 	$(GIO_UNIX_LIBS) \
- 	$(LIBEXIF_LIBS) \
- 	$(XFCONF_LIBS) \
-+	$(DBUS_GLIB_LIBS) \
- 	$(EXO_LIBS) \
- 	$(CAIRO_LIBS) \
- 	$(LIBXFCE4UTIL_LIBS) \
--- 
-2.14.3
-
diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.4.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
similarity index 33%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.8.4.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
index 416ac2adc..9c5bb12e8 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.4.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.10.0.bb
@@ -1,16 +1,16 @@
 SUMMARY = "Tiny image-viewer"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/ristretto"
+HOMEPAGE = "https://docs.xfce.org/apps/ristretto/start"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35d145429ad3cbf5308d1dc93f66376b"
-DEPENDS = "exo libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo file"
+
+DEPENDS = "exo libexif libxfce4ui libxfce4util xfconf cairo file"
 
 inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "0142c8b9c492cf447e563b00c6204359"
-SRC_URI[sha256sum] = "3a0be4526c93ec0ebbf2e63e69dd0c98f16b20b863d3b6426272592e5b00cea2"
-SRC_URI += "file://0001-Fix-build-after-update-of-xfconf.patch"
+SRC_URI[md5sum] = "4249e14fba78728481d89ce61a8771fc"
+SRC_URI[sha256sum] = "16225dd74245eb6e0f82b9c72c6112f161bb8d8b11f3fc77277b7bc3432d4769"
 
-FILES_${PN} += "${datadir}/appdata"
+FILES_${PN} += "${datadir}/metainfo"
-- 
2.21.0


