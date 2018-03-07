Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0B15878A12
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:15 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id a16so1308728pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=EBRtrtB51KTNFmhWOU+8z3Ccx3gPJoa0YAmldDCYYjo=;
	b=Jez8Z+k0PmQ3IbL98mgvrmOpaoL67g+X900U7vBcztSrZBIm8a1HqQfPW0tNJ3ps8m
	3aPlkSFFh87zRWL7nC6uvCNNrwZIOZoeAyGXpc+k7T+NkuU8NVMryY5/auuutK1NmPkB
	KnOALiE5HVphDw4zEp/5IKpUENnalIspG0vblGjZN90oli1EmPee8ZH5bFlTNNPSe9rp
	GEh/4aieDi/JK47+OuIzCN2boLP37zCimMIj6OOpuFc+78NT184aaHei8UxPNesSUKWF
	bW31BK+YH+5JYAZCnzPb2px81wamjYqLJkB54/hEG1Hi2vNgI74TU+KG8pwjJdmXgegu
	TzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EBRtrtB51KTNFmhWOU+8z3Ccx3gPJoa0YAmldDCYYjo=;
	b=fUSrLHc4vz1xNPqoubBR1FHAb+muC9QZfxqE7lgGm6bzx4Yks39yYW7e6srgcAtw4o
	PEUtVUohjOX3jgOUQxVo0xGhYb6Rvj+wV3g5lUwLJNvOJI1PlLE3OmFLSHyeE4CoWi5T
	8wG4UlCBdWgWbTC+bPYSpDC3/Tq2C52g0Pzoq0ZJ7hBxcznLjH/PcGqqGPxzL2qaplaW
	qas1i4XQoOxtZy/FxT3fQrKlQ+E1SBIPsGoqvM4ViSaUo8s43Z9VFRe4y8UplG2OhP+9
	PahykIttBeXjd97y1k+mtw1waIJdvDbatcIqpoksckFQ6ocEme1zBaC+3nSLPUGtZTsD
	wrsg==
X-Gm-Message-State: APf1xPAD+n5eP4eO6zQNEJjLpdqNtvptL6B/hukjcqpmD8iKeORL4tpJ
	YZvhPhBBDQbO9qF4u/sISRYH5A==
X-Google-Smtp-Source: AG47ELvsQclOqnts1tqyUyPDqscNjBawoJWYUWlHXlP0aLwh0E8VAxEXBUcHwaRTLpwiwV+XgY4zRg==
X-Received: by 10.101.98.17 with SMTP id d17mr19074174pgv.221.1520449277186;
	Wed, 07 Mar 2018 11:01:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:00:53 -0800
Message-Id: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-gnome][PATCH 01/23] santiy-meta-gnome: add class for bbappend files checking
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:16 -0000

Idea taken from meta-virt

Add a new class, sanity-meta-gnome.bbclass, to check for whether necessary
settings are available for bbappend files in this layer to be effective,
and warn users if not.

In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable users
to explicitly skip the checking to avoid unwanted warnings.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/README                            | 23 +++++++++++++++++++++++
 meta-gnome/classes/sanity-meta-gnome.bbclass | 10 ++++++++++
 meta-gnome/conf/layer.conf                   |  4 ++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/classes/sanity-meta-gnome.bbclass

diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..ef3a6f3 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,3 +1,25 @@
+meta-gnome
+===========
+
+The recipe in this layer needs to have 'x11' in DISTRO_FEATURES 
+to have effect. To enable them, add in configuration file the following line.
+
+  DISTRO_FEATURES_append = " x11"
+
+If meta-gnome is included, but x11 is not enabled as a
+distro feature a warning is printed at parse time:
+
+    You have included the meta-gnome layer, but
+    'x11' has not been enabled in your DISTRO_FEATURES.
+
+If you know what you are doing, this warning can be disabled by setting the following
+variable in your configuration:
+
+  SKIP_META_VIRT_SANITY_CHECK = 1
+
+
+Dependencies
+------------
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
@@ -14,3 +36,4 @@ When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
 
 Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+
diff --git a/meta-gnome/classes/sanity-meta-gnome.bbclass b/meta-gnome/classes/sanity-meta-gnome.bbclass
new file mode 100644
index 0000000..331ea19
--- /dev/null
+++ b/meta-gnome/classes/sanity-meta-gnome.bbclass
@@ -0,0 +1,10 @@
+addhandler gnome_bbappend_distrocheck
+gnome_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
+python gnome_bbappend_distrocheck() {
+    skip_check = e.data.getVar('SKIP_META_GNOME_SANITY_CHECK') == "1"
+    if 'x11' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
+        bb.warn("You have included the meta-gnome layer, but \
+'x11' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
+may not take effect. See the meta-gnome README for details on enabling \
+meta-gnome support.")
+}
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index fb89c14..37215a7 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -13,3 +13,7 @@ BBFILE_PRIORITY_gnome-layer = "7"
 LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
+
+# Sanity check for meta-gnome layer.
+# Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
+INHERIT += "sanity-meta-gnome"
-- 
2.7.4


