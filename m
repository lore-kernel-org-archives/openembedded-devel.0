Return-Path: <ashcharles@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 973CF73CF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 00:11:38 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so25113971pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 17:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dgg+qUifJs8K5Gc5MnzghYAYx5cu+TGWlgBhrofb7+U=;
	b=Ka+UTdhix+VGMVFWs2V1zuaYj7mqJZ4bgh3S99PZDcq+PCQ2eYa/acRgSj/LaZOJy4
	ZdT+2uAa4dhLYtOQ9u/FSBYNBP0qhhTTEdmHyYt3eTGGFaBjIE/uqGO23yodG/Ark5b5
	jb+Fcvo2tmz8+DBFUkwwwbfZCG5JMDBjmt09iM/I2AtM3zHaXyk47M/+9550L94HJwEG
	u7ei9828K6YZyN3ajBEv2eVZMNwLFpp+x5j89YaJuSMAEaoKDf0ipGHiKqGogFkGqrvc
	QFO+bsGB4JGref25ZeDv45UAmh4L2NaAeyyZAdyU+yzdt/WzI6Ndea4pXmciE0cKg0LF
	Oz0A==
X-Received: by 10.68.205.33 with SMTP id ld1mr5414222pbc.22.1434499900456;
	Tue, 16 Jun 2015 17:11:40 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by mx.google.com with ESMTPSA id
	fe10sm2575165pdb.59.2015.06.16.17.11.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jun 2015 17:11:39 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jun 2015 17:11:37 -0700
Message-Id: <1434499897-20805-2-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434499897-20805-1-git-send-email-ashcharles@gmail.com>
References: <1434499897-20805-1-git-send-email-ashcharles@gmail.com>
Subject: [fido][PATCH 2/2] gdm: Whitelist it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 00:11:39 -0000

From: Khem Raj <raj.khem@gmail.com>

polkit-gnome has been fixed to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index fcd51ff..723eee8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -6,8 +6,6 @@ DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolek
 
 PR = "r18"
 
-PNBLACKLIST[gdm] ?= "Depends on broken polkit-gnome"
-
 inherit gnome update-rc.d systemd useradd
 
 SRC_URI += " \
-- 
2.1.4


