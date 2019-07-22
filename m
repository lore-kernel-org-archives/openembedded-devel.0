Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2E30E7EDF1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:09:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45sXm35Xncz4M
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563779364;
	bh=Pcz79ikrkhwV0rlog23xWFWZcdGTSTOsTTOp+luEH4I=;
	h=From:To:Subject:Date:From;
	b=qYjhzvJlSC74KS7Zk92rr1YZDkuJ/EVM358CqKUd1FlWjh2oX0ptlWHNV64B7Vuxp
	Sk6uWcwVpcKNqgu0GCm++hcsHpw2j5mUhzXzklw5rmVpFYHFAcVtjJcbuQjcmRV40W
	+WN38O/Jr6uelgCtonPkTxFhZjeWK0BmSezjhsysYtmhBg5Ux4vUqpKTQvnwiVUFv/
	r1sey5kjK/v5sjW7RnRA+hvoE21+lrZoj0UJxyKyjWyeJfZAb+Q5JC7ZZCAAMYtmeh
	nVjjVE2IIxKhsMtzWdhEB9yI23Lkj6IOA6SJzxZijq0WrOdd+2RPEQWBOBfimtyZ9F
	ZJY5FVRIA5SGW1bQj88t6C4HQpCwhHsrlqhRPsp08i1obGrD7xC1aIGli/k9T5NkrD
	nin3QMCKJstKkdKUI9OlHBBfNqkZofAEyA9Y9wthbn682knK4XPLiho6FvJkXMWPl8
	+b0bkO0z+I9Roj5sRnj/Jgx3rs+/CyJY6HhVz5HoAz71lQLzdegJTk3xZ2h0SNVe7Q
	jOdZKsl4MfIw+xa8uhqwUfg3b6seNHke5lbirKz9p+h8Z+SmMBYOIb3kzOXjSMunnV
	2Ryu3AsH7zc8jeqqZNvArZwNuOcpKDhMgAnuUBeltNP0r0A5RcBLeDTsJf0U4+3rFn
	uX3ypTHVFyqaD8gvX59wm0Jw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 10:09:18 +0300
Message-Id: <20190722070919.27579-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] gnome-desktop3: Fix REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 22 Jul 2019 07:09:24 -0000

Append instead of overwriting the previous one.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
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


