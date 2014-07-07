Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA8D70386
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:45:24 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so4161218wgh.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1tfM6UznYFTNWnQ1H8eW8mxs6cK11h0/NJ94x59LACA=;
	b=RfQ3Q2C+Jum5f7XaOmuq3BszapJUfg3co0aHP48zECHwy1nANYj5F4g16/nG9yoK0x
	sZULr/kDmwuaNVWNFOg4MewoqILpAcnVz1qXFJ22EWGfEXc/QFqEsfBi0lfXqLB6DbSi
	3AHSsF19/JkOMslCI2l6YKr9yI+Z0Wn4mC+PjwKTKucZPCFMLKUOZqz+NehRCVWZFG72
	ABmQEySXr79L9MrZX0Kig5Il7v0+4I4Gh0cxmr2PGcz5GuWDQOxy97rJhwSM8ob+5Nl9
	WlLpAJcNyQUkgQs+e2nkUNKNyqqeHo0ivuFx6WWX9iEWn5uYesw/gynmuRkkTXh7aDU5
	kPPg==
X-Received: by 10.180.221.133 with SMTP id qe5mr36686307wic.79.1404729925278; 
	Mon, 07 Jul 2014 03:45:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ja9sm113771352wic.8.2014.07.07.03.45.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 03:45:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jul 2014 12:45:15 +0200
Message-Id: <1404729919-2903-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/7] libgnomeprint: Blacklist because of missing freetype-config
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
X-List-Received-Date: Mon, 07 Jul 2014 10:45:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index c224d86..c5fd152 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -1,6 +1,10 @@
 LICENSE = "GPLv2"
 SECTION = "x11/gnome/libs"
 
+# | checking for freetype-config... no
+# | configure: error: You need FreeType2 (freetype-devel v 2.x package) for this version of libgnomeprint
+PNBLACKLIST[libgnomeprint] = "Broken without freetype-config"
+
 DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common freetype"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-- 
2.0.0


