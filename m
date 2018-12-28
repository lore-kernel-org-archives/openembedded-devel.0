Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3247A605BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 15:17:22 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z5so21174685wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 07:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SpDFN/CNRcaa8QqvQFzUoMykJs2IBk6H8Ex+TFkQxLE=;
	b=WElxLtRLpSNDfWGOPEsG8bxm2QGuFtUlyUup2lfjlGK7LebZDf2CImPnkx1i87/DP5
	SebNpaSCfPio2R/lupPDFxqbbGjge7NOua6aWvvhqupZTn9azruZxYUxueilROsyWLF/
	oXsLJD4mqTs6T/OJ2e6IWrMvqOTeMecDfvjZUauYWBrATZOCzO91nQLt6PndVSrr2QwB
	9rUnKcIO6hpg0fMvZdfkcpKueQQ/mY67yu0T2mbIZIjy53hHYNXp5Jx/rBZn0k6db8dC
	OhJteAw1NJqYWW5DsCpdj73U3TLEMm+c/O5VtCxUGfQVo6f7PReTdXmGKdfQzDHo4jLJ
	EzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SpDFN/CNRcaa8QqvQFzUoMykJs2IBk6H8Ex+TFkQxLE=;
	b=MEL4nyTjbWxC1ZjZ4zMkRRIQbUFalyyNxTkyLjZkOyuQXbg3e+lqX7MBC7fsnHjheE
	ITLMwQBGYnkeL5SEd4+s3MZCFATtVnYT1KcB/UMiRbFFuEZdOVn4KauY+iZsfKEfip1x
	QRfIAg1CF2UXPB17dBS2e00FYEzCSiPIfNRouHvp/CYbd1KZ4UPgkNbdOpUebN0kRihM
	efypvRqN77iwgLlREjIvcBUoIvql0/lj/lrAw1zPc7x6ZFLxY9V890edV4K57nL5Sa5L
	XdtktcXeyVK+eGairxSu8GSN2AlF7eIOYzh3OPpWbwe/AyqmpilJFHidQTeL7Kq1vd0u
	vjCw==
X-Gm-Message-State: AJcUukcAbm/gBESRXR/LYAHbVEf1FUO4tpeCbVrfD4WuZrKxuXnjNWgx
	xMuYBWFG548jatHHV5yRkj9Tz9Sa
X-Google-Smtp-Source: ALg8bN5Pms9wDotKyf+o0aQKfT4q3DoWzL9qtuqqkjZp4RTUgbyuzul0QA685Xg7in+F7tmlq5UQJA==
X-Received: by 2002:a5d:530a:: with SMTP id e10mr26473482wrv.151.1546010242532;
	Fri, 28 Dec 2018 07:17:22 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC09E931E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:9e93:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v1sm39228834wrw.90.2018.12.28.07.17.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Dec 2018 07:17:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2018 16:17:10 +0100
Message-Id: <20181228151713.19266-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181228151713.19266-1-schnitzeltony@gmail.com>
References: <20181228151713.19266-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [thud][PATCH 1/4] libxklavier: Fix keyboard layout bug for xfce4-settings
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
X-List-Received-Date: Fri, 28 Dec 2018 15:17:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This was one the longest lasting and most annoying bug
* While we are at it: rename path files -> libxklavier

(From master: 97055da2)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...xkb.c-Fix-keyboard-layout-settings-f.patch | 39 +++++++++++++++++++
 .../fix-do_installe-failure.patch             |  0
 .../libxklavier/libxklavier_5.4.bb            |  1 +
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
2.20.1


