Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 895967C141
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 12:22:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c14so18211294wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 04:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K3ylEYUmNXGlRUCvhWHm+4zuWh+ElFbHMeGT6D+wgOA=;
	b=kazVTSrL046bPGqT7x1eYqL4IMQWdWmK7nFNPqI46HNxIndtVDsVGq34ZU42LkEa+P
	SSQ9kcgOprkoAd/ovsED6r5wU2omuCeUhACslYHchsJ0hqRupUCVrrJapfJg+3s+1chz
	gy2R1MSRpv3WjiA9AtYy5K2l8c6bKJRyiHUsvK0/tFJfH3S82Mdo1tbvgTzjKqQG7yQA
	V2ZNVp6nZm9UKrXl4K839ERgXrqPJLYOjCS4B6ji/RhGIURa6og5/D9Ao/kIruhU4APE
	unvXflU8c/jICo7qpYt5jvdattOgEJ0CMkET6qXf3GHOPQk7gm1jBlE5WoZLkQsFE7wA
	MjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K3ylEYUmNXGlRUCvhWHm+4zuWh+ElFbHMeGT6D+wgOA=;
	b=a63svPDsBVmPBQ1tJEWe7sEy1TlPP+9H1kdpydPEHLFaSH0eTjdSeEp5CWdBuWtm5w
	O9yj/iVsFxV1RV3BcHDGnmSX5Anm2zUkHJ2NaZdCA/41cbxi7Zw4EaSl+Z0YoPwzLlSq
	yUGUj5oE0T4aGnDRg8W8jr8so9MbpVyHinp08JxfGljPrZHLdT7IaSpYZSrYGFNs1J4X
	A5kfXkIG1u1ho4+msFq7ekPhHstE1cv8DEFt4aQdetBX+ehlLn45HW6FUtjEKDM7Hhff
	iYnjZsjaodoshlA7wuyRtd2PTXvXyzfC6dI7FX4pyGPDFo4MgxK0erNLvxDa9gN48/+i
	2kXQ==
X-Gm-Message-State: AJcUukcBn4kVKtTGIpOqHrav2keIvlbRBqJ2CQM7WWkP9D8mvPVoGy/q
	7XPglUKuasHqV0q1kfiYLiWxFJKZ
X-Google-Smtp-Source: ALg8bN7e0nkUQYI2qeLd9Tm6nXPJjrBwiNUWJ+Y4MEkXhURg+MZM5oZhBs/+MGhu5etLXWaDOPN9sA==
X-Received: by 2002:adf:92a4:: with SMTP id 33mr20101070wrn.11.1547900563822; 
	Sat, 19 Jan 2019 04:22:43 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F1BE998930CD041FFEA0CD4.dip0.t-ipconnect.de.
	[2003:f0:7f1b:e998:930c:d041:ffea:cd4])
	by smtp.gmail.com with ESMTPSA id
	v6sm52697393wrd.88.2019.01.19.04.22.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 Jan 2019 04:22:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jan 2019 13:22:32 +0100
Message-Id: <20190119122233.5388-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190119122233.5388-1-schnitzeltony@gmail.com>
References: <20190119122233.5388-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] glibmm: upgrade 2.56.0 -> 2.58.0
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
X-List-Received-Date: Sat, 19 Jan 2019 12:22:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove-examples.patch was refreshed with devtool

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-core/glib-2.0/glibmm/remove-examples.patch   | 9 +++++----
 .../glib-2.0/{glibmm_2.56.0.bb => glibmm_2.58.0.bb}      | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.56.0.bb => glibmm_2.58.0.bb} (89%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
index d32fe78d3..42f252017 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
+++ b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
@@ -1,6 +1,7 @@
-From f48a69fd11b2eda6c43ff046c202cbc4dcd4e92d Mon Sep 17 00:00:00 2001
+From 52360260c0d73a00082d867bc416225fbc2b657e Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 12 Jul 2011 11:46:37 +0200
+Subject: [PATCH] glibmm: add 2.28.2
 
 ---
  Makefile.am  | 7 +------
@@ -8,7 +9,7 @@ Date: Tue, 12 Jul 2011 11:46:37 +0200
  2 files changed, 1 insertion(+), 7 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index a0df8af..c3d5e06 100644
+index 1b366b4..0ff58b5 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -23,12 +23,7 @@ src_subdirs = glib/src gio/src
@@ -26,7 +27,7 @@ index a0df8af..c3d5e06 100644
  glibmm_includedir = $(includedir)/$(GLIBMM_MODULE_NAME)
  glibmm_include_HEADERS = glib/glibmm.h
 diff --git a/configure.ac b/configure.ac
-index c20e778..74203be 100644
+index e706687..198e0d0 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -166,7 +166,6 @@ AC_CONFIG_FILES([Makefile
@@ -36,4 +37,4 @@ index c20e778..74203be 100644
 -                 examples/Makefile
                   docs/Makefile
                   docs/reference/Doxyfile
-                  MSVC_Net2013/glibmm/glibmm.rc
+                  MSVC_NMake/glibmm/glibmm.rc
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.58.0.bb
similarity index 89%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.58.0.bb
index 2f048d2f6..77774585d 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.58.0.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
 "
-SRC_URI[md5sum] = "5aa7a60084fe3e01d746c96f4a115302"
-SRC_URI[sha256sum] = "6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9b1e816c5209e79a9"
+SRC_URI[md5sum] = "4a0402ac65a7c47424b4e21b81b079c0"
+SRC_URI[sha256sum] = "d34189237b99e88228e6f557f7d6e62f767fe356f395a244f5ad0e486254b645"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.20.1


