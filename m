Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8496BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 07:33:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45XLcy3MndzGB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561361618;
	bh=cuURhZjLWTmUWJFWWnF4z355vbgmuTscxXKW/slWtYo=;
	h=From:To:Subject:Date:From;
	b=Bozu3DfG0HXpyvK11g+dkOgxaqmXiGDZkIaHNHHUaC/zaJDhWK/vRqjtUdSnIabeu
	FoS31Z/aqDtCa5qAU5HWDHRm1ONfcBMtfUMlwFvh7txR4iDQLGS2Qz9Hq4BX+tzg8M
	O1Bb8nE5UezfeXbbNKTu3R0EbfkFku122UWlRM7E7k+LJPSNHPjLKoi9qYI5kYIFMB
	XepCjlIxCzshqaj2eom86HralzCodc6EzJutAQqZ4lS5J+lPdNnwil2sSYVkk7Cc3e
	wUv7joCm89gh93ZaxW/hrRXQuGYkrbiQlqztAwX9RFFozf+yG36hcM7ksZH/GSbdYb
	wBfjFtX9947g3gio6eAiLxTOe8gloy4Q/78/JfzMQgPZeE9b3uqiIu5FNyZuYQz5bt
	IG+Y2BCHwfqfN9EsSSdF8qFBFQPmsbPegQh3Pv94G6GcDFQMtt3N2GEronFVDuIHsw
	heIQdl3Q2kyY79uX6K9UvRmftOUMph8qlyx5n/kxccwGqmyfTU3tx2dMYB3TuPPoep
	LEPBLylqCj0E+aaTluNi0kH74W5ySi+MTxkjO7gCWUgBbbsZAVMDGnvynHrVxnHDat
	+K4zmuRD+6tZxv3o2HY9YTg+L3XhyFm13vFjJVtwvFxWzkLKs1U57xP0HR0h8Qlpcm
	ueqJQjGd+Tt95TIrafp9Lw94=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2019 10:33:37 +0300
Message-Id: <20190624073337.14103-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] sanity-meta-gnome: Remove obsolete class
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
X-List-Received-Date: Mon, 24 Jun 2019 07:33:39 -0000

There are no bbappend left in meta-gnome.
Individual recipes that require x11 already provide a proper
error for that.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-gnome/README                            | 20 --------------------
 meta-gnome/classes/sanity-meta-gnome.bbclass | 10 ----------
 meta-gnome/conf/layer.conf                   |  4 ----
 3 files changed, 34 deletions(-)
 delete mode 100644 meta-gnome/classes/sanity-meta-gnome.bbclass

diff --git a/meta-gnome/README b/meta-gnome/README
index 2a682e72d..3c5b4c5f9 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,23 +1,3 @@
-meta-gnome
-===========
-
-The recipe in this layer needs to have 'x11' in DISTRO_FEATURES 
-to have effect. To enable them, add in configuration file the following line.
-
-  DISTRO_FEATURES_append = " x11"
-
-If meta-gnome is included, but x11 is not enabled as a
-distro feature a warning is printed at parse time:
-
-    You have included the meta-gnome layer, but
-    'x11' has not been enabled in your DISTRO_FEATURES.
-
-If you know what you are doing, this warning can be disabled by setting the following
-variable in your configuration:
-
-  SKIP_META_GNOME_SANITY_CHECK = 1
-
-
 Dependencies
 ------------
 This layer depends on:
diff --git a/meta-gnome/classes/sanity-meta-gnome.bbclass b/meta-gnome/classes/sanity-meta-gnome.bbclass
deleted file mode 100644
index 331ea193d..000000000
--- a/meta-gnome/classes/sanity-meta-gnome.bbclass
+++ /dev/null
@@ -1,10 +0,0 @@
-addhandler gnome_bbappend_distrocheck
-gnome_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
-python gnome_bbappend_distrocheck() {
-    skip_check = e.data.getVar('SKIP_META_GNOME_SANITY_CHECK') == "1"
-    if 'x11' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
-        bb.warn("You have included the meta-gnome layer, but \
-'x11' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
-may not take effect. See the meta-gnome README for details on enabling \
-meta-gnome support.")
-}
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 0b68232de..9ed142198 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -15,7 +15,3 @@ LAYERVERSION_gnome-layer = "1"
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
 LAYERSERIES_COMPAT_gnome-layer = "thud warrior"
-
-# Sanity check for meta-gnome layer.
-# Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
-INHERIT += "sanity-meta-gnome"
-- 
2.17.1


