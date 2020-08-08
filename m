Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4517.1596891236568936898
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 05:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=FIhdpAVr;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=zwnw=bs=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BP2Gn1VVGz4N
	for <openembedded-devel@lists.openembedded.org>; Sat,  8 Aug 2020 14:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1596891233;
	bh=p3TJt+hz6OwwzKUSUFpkGL48ySvCnXj22cGivyAHSKk=;
	h=From:To:Subject:Date:From;
	b=FIhdpAVr9qHb4PYi5+aPosN06nViZFs4AM/zKFcb9+tVG+JSCzww+4fbjKpTxXk3u
	 j8PNLCGw9Bs7OqVR1l1eqQDhd9YfT/ouo73++p0AGTGah93SyPQwiFwq1r7iZlzDmB
	 VvIPEtvBodJnLCKaTMG5tjdRly7D/e1TaW/eHoOppReu+dzECMi6VCypDPAzs4SVhE
	 1mZBlmVjDrJs68HCAjHfJEvsfdir3NlkcGf0CmuiEE9Y2M9Z9TqInPD/SQEps5iS1/
	 vFduGZmUVOU+4ay8xPHiace90p56mQQPJHTAj003SXvzodh/9veii7NGKzbY/veaLi
	 qD56HrHPYfmej3UEKGgFpwkh+AVCnLlz0Jxi9qUPh2dAVlaZHWOLiomI+UWrCVDo+Z
	 zQN9IcWBFPnnyNsv2RTJ/ttB8fB3aVwtsEzRHjCLnX3V1yE/5TwKOAnvhf7pCUD72E
	 ySBpyEnpctYn5K6Ff/oSaHuUhBMMmH+9BLmA8SqOTRqPHY1SC38sMaQnJDS+dC5W71
	 6c+zwvNxWNd3S52VtOiEBxuR0zGTVPHSAveBf+lS63DnImJsz6yF8dq+UJvTPALLqZ
	 KOykf2dpQ7+79uc45zbWFMi5bBfz4BtAXGErPGLSxWt5QLQ0lowganYlu1pY5pwhdW
	 TyXaLHEojzlW4YMwvo6vaVaI=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libpeas: gobject-introspection is mandatory and cannot be configured
Date: Sat,  8 Aug 2020 15:53:51 +0300
Message-Id: <20200808125351.17467-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR: Unknown variable "libpeas_gir".

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
index 881751008..1b754343a 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
@@ -10,6 +10,10 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI += " \
-- 
2.17.1

