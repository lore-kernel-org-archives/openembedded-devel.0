Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADF57F3D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 22:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4637wf2P2Pz4s
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 00:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565129106;
	bh=IDOv1+Dr+Y8aBk8NSqpfwOIxwKQnCJCrx5xCSaqpHus=;
	h=From:To:Subject:Date:From;
	b=Yr0ICqBZ84XLNA0aegTOyZxoA/X/No/i3lzV7GqTTNSjG1VXG8pkEw/40ijcoimPX
	icByNPvkzJnh1QVvzp+cvqI41VaPjPV1Ez9QN6m/urpSGUEyuCAF6qpZsB/wPehFrF
	rFyfVWc+5sFsldXFsWy24CUJZLQnoUUaZi4cFGmc7CkzITP3PsMsQ9ly9APF23nEGw
	QQSJkPGF7NHIjxtmA/gST/0c9CibBvvw2Re6vurnNKKADKBk6twrYfOTDsnjGOSwsI
	0o8Zq6zkrkU1cMy+2NE/7L358vPKO2umCZrCKKN/jI+XG1sY6XgmumZI1WQn7pLrer
	bp8/zOaMMGaH23QwpGHJxrR+DNTd/fax/UjlH4qpq4iSYQ5or2jWwssOwfpxPl7jmw
	enz5XjBMKjtiHD6mXHdiy2L1yETIpxJK/TMG0Zg1euPi8/HiYihZWT8/49JK4RCMin
	OFONS9ZJdjCS/5QKtMnDGMl6vOBfokj9nFBXGSxOZ0ZuNNBDgaCy98jmFQDW9ZQc/L
	O2PMKBar45BrzbFp0AYLPPMwldzgeGXRN8tt70RiIUHLXl6WOzE6OIp4gR7/A/VeWa
	Ci+AkXykE1lXERBAZvusa//LBaWbG2QiZ3WT5cdqdELej/LlQRn4OirNDdsRZGwNtj
	L46SDaXFR89Q25DxqgGTqZjo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 01:05:04 +0300
Message-Id: <20190806220505.21835-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] network-manager-applet: Remove obsolete do_configure_append
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
X-List-Received-Date: Tue, 06 Aug 2019 22:05:06 -0000

Upstream no longer enables -Werror by default.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../network-manager-applet_1.8.22.bb                       | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
index 1f3f6112b..e7033aec6 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
@@ -23,13 +23,6 @@ EXTRA_OECONF = " \
     --without-selinux \
 "
 
-do_configure_append() {
-    # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
-    for i in $(find ${B} -name "Makefile") ; do
-        sed -i -e s%-Werror[^[:space:]]*%%g $i
-    done
-}
-
 # gobject-introspection related
 GI_DATA_ENABLED_libc-musl = "False"
 
-- 
2.17.1


