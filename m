Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 84E0B78A6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 15:18:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y26so8377970pgv.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 07:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ASGE+n2BYSym0Jo1c7ZSPYbLZGJ7MqsegX8EhJHIMIw=;
	b=Cy4nY72Y3yw1h+TeXECROJyI3wC8tBTpEXPrOQM2CDqnfpGgIeLqhDrLwIoRC1kllj
	RplYUL3JfZR9lPiYndGU6CHp0exBCQtoJ/62MTBJuYtFKchTczua4V2Fh9MOAymKLxWL
	2j237iKMcewMAtFglE0azpp0lnIeT2ufI1N710Yz6SYQpIWfbkab7NzXYm4fNCOBuRh2
	5Hk6fabU0cbp2D8jdbtgL76QbtuJFAp+n4UhBkmMXtaEWp+2CHaW9xMpHCLewOv8Ht24
	kHThPfb4S7lahyFBavxITlXloHlH2hFA5kDFUVpVKuQjWDQp9Z3WXbTDqjxDMi97xC0D
	TunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ASGE+n2BYSym0Jo1c7ZSPYbLZGJ7MqsegX8EhJHIMIw=;
	b=XGMey4Rwbh6fu7iQ2zL+Fv1EQRJOgj/vdKriPlwUWghQH9Yy4sfj9QLLzydA5KdUyh
	4o2TrA3gWD/tTgCRhmJPNnYLCNs9edeZxyaKI4uMxlv7/DKo8XV/wj82evePXPg8HAuT
	PW0QvTKQ4WNejSiv0FWSqsK63fLH52iiTbHUd8iGNPqUQOx2thl8ezxjY9Lj4eht50K3
	+o1wsNc4a9D3OrxyJodMs9DGlLWfwKqjEtV4Atai1dHY1SabiBHjVGCO9k71X0iTGYR1
	KyYuM7jSLTb0CzZFZmiIWdYuhxQvxLX9xXfO3+490Gi5Yr1XDvRQDe1QK/Nt6ZQgvqEE
	PDRQ==
X-Gm-Message-State: APf1xPAjkezZHlE6o5DNnDKMpeM/GWOMHt+xgecM1JFftspbK+tQsubI
	8/mVZ7qqCPOiOGfewMPQIXs=
X-Google-Smtp-Source: AG47ELvSyRHtpredM8Nf5gbggaSVvD37OvqeBmMVPTbKrcm71zHAr3KRiWOri69NSEMicHXXpU4OTQ==
X-Received: by 10.99.115.73 with SMTP id d9mr15922086pgn.354.1520349491601;
	Tue, 06 Mar 2018 07:18:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:19f8:73b2:93e:af3a])
	by smtp.gmail.com with ESMTPSA id z4sm23817068pgb.4.2018.03.06.07.18.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 07:18:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 07:18:07 -0800
Message-Id: <1520349489-9063-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/3] glade3: move from oe to gnome layer
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
X-List-Received-Date: Tue, 06 Mar 2018 15:18:10 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch       | 0
 .../glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch   | 0
 .../recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch            | 0
 meta-gnome/recipes-devtools/glade/glade3_%.bbappend                     | 1 -
 {meta-oe => meta-gnome}/recipes-devtools/glade/glade3_3.8.5.bb          | 2 +-
 5 files changed, 1 insertion(+), 2 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch (100%)
 delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_%.bbappend
 rename {meta-oe => meta-gnome}/recipes-devtools/glade/glade3_3.8.5.bb (97%)

diff --git a/meta-oe/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch b/meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
similarity index 100%
rename from meta-oe/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
rename to meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
diff --git a/meta-oe/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch b/meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
similarity index 100%
rename from meta-oe/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
rename to meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
diff --git a/meta-oe/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch b/meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
similarity index 100%
rename from meta-oe/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
rename to meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
diff --git a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
deleted file mode 100644
index 3abacfb..0000000
--- a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-PACKAGECONFIG ??= "gnome"
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb b/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
similarity index 97%
rename from meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
rename to meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
index c4f6000..69162bd 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ?= "gnome"
 PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
 
 FILES_${PN} += "${datadir}/icons"
-- 
2.7.4


