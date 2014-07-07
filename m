Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id EC06B7036F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:45:39 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id cc10so6468384wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XocPZ2V+HAcsNCv5yNy9T8lMijHfAq50dKOmmZyplLg=;
	b=vsEuKYORdv+/HebXHvnPq7RaWrPhs/G+MgYgOwq53Iq7c49TDVXhV5ovGL8rWzwzqF
	lQXoqA+/UNemsvDjYtubV5tJTGfm5B92sJaac9dXIwpo36j1MrK01zOt2n8WNbgdPn0o
	ns0DN58A5UnTdECw1qlmV1ln7BFhbgwtVWfPED2447ax1PbB8cF4eK2M7PaPKsb0nCm4
	K495tH8VXad4EKMKhlw0+SWL2U7ahrAxsFAuZhwuKv3zHn/hkgHnyAMe8/ZyaMbWTw4k
	p1x6wP5zJog+Y2C/ewNQxUGU+19UDHS15R/jh7SZtxIB3t24JZA7gLI0yNRLLzuOIlDo
	7XKQ==
X-Received: by 10.181.13.80 with SMTP id ew16mr35845068wid.51.1404729935885;
	Mon, 07 Jul 2014 03:45:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jv9sm88616523wjc.28.2014.07.07.03.45.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 03:45:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jul 2014 12:45:19 +0200
Message-Id: <1404729919-2903-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 7/7] recipes: add missing pkgconfig inherit
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
X-List-Received-Date: Mon, 07 Jul 2014 10:45:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/florence/florence_0.5.1.bb    | 2 +-
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 2 +-
 meta-oe/recipes-support/libgc/libgc_7.2d.bb              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
index 56d8914..9eab385 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
@@ -15,6 +15,6 @@ SRC_URI = "http://switch.dl.sourceforge.net/project/florence/florence/0.5.1/flor
 SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
 SRC_URI[sha256sum] = "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8719a68b192d5bc62"
 
-inherit gettext autotools gconf
+inherit gettext autotools gconf pkgconfig
 
 EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet"
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 95deb37..7aef6cd 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
 SRC_URI[md5sum] = "b53564e553728d4b69f7d366dfeb5299"
 SRC_URI[sha256sum] = "1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c558c43"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 do_configure_prepend() {
     sed -i -e s:AM_BINRELOC::g ${S}/configure.ac
diff --git a/meta-oe/recipes-support/libgc/libgc_7.2d.bb b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
index 66e6b92..82a7f13 100644
--- a/meta-oe/recipes-support/libgc/libgc_7.2d.bb
+++ b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8ebd16aa985b
 
 S = "${WORKDIR}/gc-7.2"
 
-inherit autotools
+inherit autotools pkgconfig
 
 # by default use external libatomic-ops
 PACKAGECONFIG ??= "libatomic-ops"
-- 
2.0.0


