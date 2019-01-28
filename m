Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED756C494
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:45:44 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 185615C0231;
	Mon, 28 Jan 2019 10:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548668745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=ZYpW1zGn+lQczzUhPLTH+wMo4HGrD+Hbb1vgYhzbvgc=;
	b=u5+Up0K7j8DK+HJTEqwGTHYWL5KEqikkgFfJUB/UL4AodQQda4OQ/pZ3SFGttQojNKZYiy
	Io9ShzwLKX01JGY33ES/TQunXHA7Tt02mKuxdQ0fsuw1PnABHIxRefS6HBCNxvV3I2vnce
	nh8q8bEhMqbQjn02sPRqMAZS+/9wwK4=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2019 10:45:41 +0100
Message-Id: <20190128094541.63253-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] polkit: inherit distro_features_check
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
X-List-Received-Date: Mon, 28 Jan 2019 09:45:45 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Make the recently added REQUIRED_DISTRO_FEATURES effective by
inheriting distro_features_check.

Fixes: 97a1a55f4755 ("polkit: add polkit as a required distro feature")
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.115.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.115.bb b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
index 90c2fb152..13c4b0259 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.115.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.115.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
 
 DEPENDS = "expat glib-2.0 intltool-native mozjs"
 
-inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection
+inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-- 
2.13.6


