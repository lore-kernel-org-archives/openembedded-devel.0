Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 919BD60079
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 00:23:25 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k90so29297314wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 16:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2QIqFNNWYBXqhzuskur+hnjChYiLt4Tx19PR/PdW5vo=;
	b=QC1Bz56RRVZY2fJr9TkPiOqz4Sf8YIN8jzKJ3dlhJYFb4oOwtxlMSi6ZPeQ5mEk9fV
	pwY9VlUSbvTlONkJA0PTiAORWK3xfNak6Hxy8zudNz1ISjXgW8VR/unk6RlKxTv2A3bQ
	J+AD98ga9tdUXYX4H2cgfBnrgs8MTDQt7S68eEgoLfiMh5D7zxYxo/bgffcyfVmiX2RR
	MKZRqMpUulSSj1jFYoqSfjPObdKB2P5aIAMoRMTG0L64cWw6jUDIGhGJb8OrRr6p9ix8
	4e1FLKGftjKuw+roAHfdf+rWkfaSf+mTMCFmmrVJngAV34gN0YyyqUhHX2NNrqZiViSg
	758A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2QIqFNNWYBXqhzuskur+hnjChYiLt4Tx19PR/PdW5vo=;
	b=e0INIHPesCwPSGiNB30DyLDgBe8gWGQzScoVxPpGrJIWilzI9mXgcNqZhrUBrPFa79
	4FVQrI75EqN7gIJeF0KFqDQZNuEEEjkchrkA5fc52/AWVWQp+vDQW5Q55xdJYv+iVxce
	1CTNJMwUCMPcvOaIkdHAsEKaPy6jzqB460RLLkyWc/TerWct2ZU7Bc3jkPC1oh1v4SeX
	45DbX73USE8MsF+0jef8kdYv7nkQ7CryivQ0YBJXNjG6YThGSzmQ4PJH+pDg6apdqN7K
	7PnjOzkMMsaXvp5kA+mWX0Vo3zIBEHY2PpUm/+VqeLfcKW/Ls/u6wbAi+PuDgDi3jSEH
	G6Pw==
X-Gm-Message-State: AMke39n+V4X5M/OjfrAu6f/bOccVLFrkYbKI6MaNlegXnXE5gOJ0SAv1DZhHdYEPVVSgQw==
X-Received: by 10.223.134.104 with SMTP id 37mr25490849wrw.121.1487118206004; 
	Tue, 14 Feb 2017 16:23:26 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	g40sm2716232wrg.19.2017.02.14.16.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 16:23:25 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2017 01:22:53 +0100
Message-Id: <1487118174-23647-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-gnome][PATCH][master-next 1/2] gnome-mime-data: add depends on glib-2.0-native
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
X-List-Received-Date: Wed, 15 Feb 2017 00:23:29 -0000

This installs the needed glib-gettextize.
Remove blacklist.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

Note that this is badly tested. On my host the build did pickup
glib-gettextize from /usr/bin/glib-gettextize..

I inspected the native sysroot with devshell. The binary was missing
without the patch and got installed with it.

Max

 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
index 6dc80b5..eeac1bb 100644
--- a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
@@ -15,7 +15,5 @@ SRC_URI[archive.md5sum] = "541858188f80090d12a33b5a7c34d42c"
 SRC_URI[archive.sha256sum] = "37196b5b37085bbcd45c338c36e26898fe35dd5975295f69f48028b1e8436fd7"
 GNOME_COMPRESS_TYPE="bz2"
 
-DEPENDS += "shared-mime-info intltool-native"
+DEPENDS += "shared-mime-info intltool-native glib-2.0-native"
 RDEPENDS_${PN} = "shared-mime-info"
-
-PNBLACKLIST[gnome-mime-data] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130589/"
-- 
2.6.6


