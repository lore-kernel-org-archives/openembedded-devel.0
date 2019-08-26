Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CBE657F52D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 08:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46H4TD3L9jz4q
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 10:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566807072;
	bh=gH+aid5iQkYv+ygdlrBYM6uhAk5HUMxk3o+Ddng4nrA=;
	h=From:To:Subject:Date:From;
	b=DutYlXynYtbJmppqel4KH9pHTkIFnnsrqwS+hPRdDb8zP0UjrCUtBEdpeBfL0+/Xx
	eyFMjQ8drH6QdPmFXyQHxr05VmYjcVs7EDb2Zw/mUEQ+vPRBMrmIEFdfqiPJl0Csh1
	u8luD8rWkr0ZgaHCXPkHZ4rR6n/Oyibco+RAIIhRjXoslBVPbLtTGR4zqkzD4qCfI8
	2U0/4ZEeQo3wsDvSwxkSMt5eGXUO6CMyTkJtzpV4UXUhVAQkArx3Av9vjD33IvJ9rb
	Z/cBGkOJVU6a/2Zw5HnXbmQbxFY0YsW+RFRXKq/AW/xz434stFOTmlQJiCh7NtrtuP
	zKACORV7aknyIQgjG1bpZqfSulmLLjfIOfCFuqkmW+rJWSilIvDhwwDoI8F9f4Kc+t
	Peds6L/Yftwj1K49vx1+Y8SXYqscPCMYtUuvbD8eQZ+7kmzH1T9ls9uEBN2bG38H2r
	FRdoWpZf46qqYLo/1y1Cww7WEaqXvqWCdRlJAiuOGzWD2jd8AD7RIf82qUqT7FKjGi
	oSKgQN46T77GKO8tRR2bfi1Vj+W6dJ2iZgVOLj8i1suP1xHcFJTMvdqbU0sorWGJk8
	55f2+XG03LXFjLWU6nnorh0b/3w9QjZmJQyefeiS4kVvEiG2+UVzHyVs5SEG7MO4Cy
	LoWFyfzy7ZA+29/o/RlfTlNU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2019 11:11:11 +0300
Message-Id: <20190826081111.25920-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][warrior][PATCH] gnome-desktop3: Fix REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 26 Aug 2019 08:11:12 -0000

Append instead of overwriting the previous one.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index 0acbb2117..1dad1e95b 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -25,7 +25,7 @@ SRC_URI += " \
 DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES += "x11"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 EXTRA_OEMESON = "-Ddesktop_docs=false"
-- 
2.17.1


