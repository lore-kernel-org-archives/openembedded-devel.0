Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id A49A86D268
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 01:53:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id r24so609527wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 17:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pPzzw8bJ2FM6O4cQaNkanahi/d3+w1RhJB7ECtrQkco=;
	b=cDWBSRvUMTvKazfcn9nuo3sy3UenRGNSpzy2utIkBBrH1o0Np4CLLCU4FjAUeLvFxI
	XZcoc3y2qxisYRCRqd4mj25mA+MsYxSddh/gGGJWzTI8TIrYwPdK1ou4pZSwNljb2leH
	s6PA6d8SwkICu60aZIkSv7wFfjGPP+NQbtGcLCipoQd3Rsmfd3wHTkX5YeBp/3J8Z8Q6
	qX48YmgrK3MkLR/ZU5L3WqqOvjcxSyL3iIdvvbx4A17QF86ClsU179YTQQI/PZssv5YB
	lrFbgcZi+Ad09w1yApRR92gaZvjq3cn8jznwVSDSdTQWMTcJSOmnQY2AdqcRogV15o5k
	Tjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pPzzw8bJ2FM6O4cQaNkanahi/d3+w1RhJB7ECtrQkco=;
	b=NH79PLBp0oToBKYVCmB+DpTg/qsgdQVeN/9ch9UBNVPsb29Gsrttpy9PO6C7nmVH5R
	PG2B2iNLLI+DZZwA75xoPmrqjRAvSlqv8GqR/pFEpjUC5SRqh5mkQLiBeNCRA4u95aHS
	VMrAFL0Ps2zH9r5rojfdY9OAqj+XzsV6FJbLAt3IqhXLkFHJz2QjLAhgx+Vd2SYToWGW
	h70pebKMrhxiENbfBaL0F86iukZuHNFoOFh4HXoJmmuHggQWHH8qwZnobJJUS3Lk1HGj
	Nl15Lb95C0jjLOBRVcLfHfVsoAyTusLQ/97BzcGfh4IE/s/4vKdwI54F/H2HZmjjaZB8
	eXFQ==
X-Gm-Message-State: AA+aEWYCqxPSmmdSTMQ/aWBB9Wm7oNnjDapi1acm6AYeC/C74PWI1Y61
	uSSopkBULcM6kuYo0kfmVfC43rK/
X-Google-Smtp-Source: AFSGD/UJ0wkfBKbj0gc3udClqWE8yrlUUef9M804GnFJPMZ/UM9bwexI20X6qrtp98ZpgYceZUFHCQ==
X-Received: by 2002:a7b:c11a:: with SMTP id w26mr4630219wmi.77.1543456426019; 
	Wed, 28 Nov 2018 17:53:46 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC0EA561E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:ea56:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id f66sm681480wmd.28.2018.11.28.17.53.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Nov 2018 17:53:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2018 02:53:33 +0100
Message-Id: <20181129015333.1274-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181129015333.1274-1-schnitzeltony@gmail.com>
References: <20181129015333.1274-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libxklavier: Fix keyboard layout bug for xfce4-settings
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
X-List-Received-Date: Thu, 29 Nov 2018 01:53:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This was one the longest lasting and most annoying bug
* While we are at it: rename path files -> libxklavier

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nfig_xkb.c-Fix-keyboard-layout-settings-f.patch | 39 ++++++++++++++++++++++
 .../fix-do_installe-failure.patch                  |  0
 .../recipes-gnome/libxklavier/libxklavier_5.4.bb   |  1 +
 3 files changed, 40 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-xklavier_config_xkb.c-Fix-keyboard-layout-settings-f.patch
 rename meta-gnome/recipes-gnome/libxklavier/{files => libxklavier}/fix-do_installe-failure.patch (100%)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-xklavier_config_xkb.c-Fix-keyboard-layout-settings-f.patch b/meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-xklavier_config_xkb.c-Fix-keyboard-layout-settings-f.patch
new file mode 100644
index 000000000..6c2d09112
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-xklavier_config_xkb.c-Fix-keyboard-layout-settings-f.patch
@@ -0,0 +1,39 @@
+From 1a75ebdde705ab2a4f9459a60ab824d9f770bba4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 28 Nov 2018 18:03:31 +0100
+Subject: [PATCH] xklavier_config_xkb.c: Fix keyboard layout settings for xfce
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* Got helping hint at [1]
+* Patch stolen from [2]
+
+[1] https://bugzilla.xfce.org/show_bug.cgi?id=14185
+[2] https://launchpadlibrarian.net/399410035/revert-default-group-change.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ libxklavier/xklavier_config_xkb.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/libxklavier/xklavier_config_xkb.c b/libxklavier/xklavier_config_xkb.c
+index baec569..c823e5b 100644
+--- a/libxklavier/xklavier_config_xkb.c
++++ b/libxklavier/xklavier_config_xkb.c
+@@ -403,10 +403,6 @@ xkl_config_get_keyboard(XklEngine * engine,
+ 			/* Return to normal X error processing */
+ 			xkl_engine_priv(engine, critical_section) = FALSE;
+ 
+-			if (activate)
+-				xkl_config_set_group_by_description(engine,
+-								    preactivation_group_description);
+-
+ 			xkl_debug(160,
+ 				  "Unlinking the temporary xkb file %s\n",
+ 				  xkb_fn);
+-- 
+2.14.5
+
diff --git a/meta-gnome/recipes-gnome/libxklavier/files/fix-do_installe-failure.patch b/meta-gnome/recipes-gnome/libxklavier/libxklavier/fix-do_installe-failure.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/libxklavier/files/fix-do_installe-failure.patch
rename to meta-gnome/recipes-gnome/libxklavier/libxklavier/fix-do_installe-failure.patch
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
index 2ef54f212..501a44972 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
@@ -13,6 +13,7 @@ RDEPENDS_${PN} += "iso-codes xkbcomp"
 SRC_URI = " \
     http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-${PV}.tar.bz2/13af74dcb6011ecedf1e3ed122bd31fa/${BPN}-${PV}.tar.bz2 \
     file://fix-do_installe-failure.patch \
+    file://0001-xklavier_config_xkb.c-Fix-keyboard-layout-settings-f.patch \
 "
 SRC_URI[md5sum] = "13af74dcb6011ecedf1e3ed122bd31fa"
 SRC_URI[sha256sum] = "17a34194df5cbcd3b7bfd0f561d95d1f723aa1c87fca56bc2c209514460a9320"
-- 
2.14.5


