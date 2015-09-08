Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 840FA65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:40 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so83423185wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=84xYIJarh55M6jSlzZ8p8RRZprXNCB3cKzTbIl2Tgh0=;
	b=i9t4myTHMeYIvlOT6oyb0Cp/4+K4KfPhZx4szT+c1gjj0k2AkDceKD4FxKwjrdG9+j
	unkj7PzpHreT0xIsRjLM7RWFKtNALHZ70augaQ6f7KL6PZJB0CeH/sc948e5aehEof2X
	OOJBIuLzu/Ca6uydCk9LcXKub6DecNpvwQkPlnSF9zApYOmSbBGHOr0foHBp4JPNULcZ
	RNjqO2EqFC/c3bT4Z75M6tItGp8EK6oSuhHAebI8N9Di0k5ypLvjxDaOAJmiAVIGE032
	oS3KDi1qWKcw30HJXnAhGdM9TucnXnfKVlAXWYY2OrPWJid9P1B+7rnac9YySjE57vOo
	kSzA==
X-Received: by 10.194.175.99 with SMTP id bz3mr50025760wjc.48.1441727020253;
	Tue, 08 Sep 2015 08:43:40 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:52 +0200
Message-Id: <1441726980-32656-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] xfce4-equake-plugin: update to 1.3.8
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-equake-plugin_1.3.7.bb => xfce4-equake-plugin_1.3.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.7.bb => xfce4-equake-plugin_1.3.8.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.7.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.7.bb
rename to meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.bb
index 5969021..76d25f8 100644
--- a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.7.bb
+++ b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "4f8b8fc85e9506f43c9343f3c3c99ae1"
-SRC_URI[sha256sum] = "6b9e14c2f54060d182b61e90b4c84a79b57aab1955e3ff877c757f26cefa23bf"
+SRC_URI[md5sum] = "c8f6cb2aec62513c343281eacc4fc395"
+SRC_URI[sha256sum] = "431575da3d49fea3afa60f02e83c8d74e20e9a229c9c4ec82c21d45e2c986925"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
-- 
2.1.0


