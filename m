Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33FF560620
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:52 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id s64so700388lfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=w0//dP/5WhO6xHbL0tNxVtQyFoWphVwjYj/JshRRbAY=;
	b=DvIUdNb/Z9EQs1YYMFaqXCYYQAgKvOtXagE3flDL1egkzEMg13t5qIodsOlTPsF3cn
	bfMsz5ICAtkrLiRHmwbw37XGVKQHUuLZ8GVqINq6JHPF6aG14yIRPSemeYIn0r+Ag1j8
	JhE2BeEKteOu94NRScBgsCxhJZz1xs2743kby9WwsRslUxDEQ4ih4dD6E9Ki0OdhUNYy
	NwlabnVD9aa5sFtg7jlsVUy4rbqN1T02ufmAJZGxpE27ah/NiEVEnLp9atzgQ1UZoo2F
	Yg/ZLBHIf1oSZvpmDZaee4SP0AetVXO5nEPX1X96zyjZZtEkcmuCIpLg4TClgETw2GZ2
	j9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w0//dP/5WhO6xHbL0tNxVtQyFoWphVwjYj/JshRRbAY=;
	b=K5O+70p8oDU7qZIkWD/9A5srJXQP7BhwL2WNczJrtmBWPNmRAKaDUJfi6SiSjVLmBy
	qTNs8WF6g4bo79fdDe5kuqh7LmhX5wOIu/j9cz/u6aBYTlarDoISuq5niiCrcdIRGcKr
	NSdhYGebdlXBf41taCjAU20zo0sTgZ7LgMofiXrWDtYLb1sphn/Z92KjDKkywEC2ag9y
	kgqD6BbxMQhKZdLsPd/kvMeLk1dceRAVXrs+rbK9lm1REQeQ+MweLCkJdbTY2Oh94fTl
	HvtEqCq4M7f0/Cp5tl9HQ9jr0vosxRt2NR5CGirdGWrJb4/2Roqmk+kMOLKxJfJ744tt
	YQ6w==
X-Gm-Message-State: AA6/9RkbdmEi+e2dSyyIP1DmftpsMtYOivmwIoxMyw1wrhLKbBmesGh+T+vYcYv9UWu2Mg==
X-Received: by 10.28.50.199 with SMTP id y190mr1175950wmy.61.1474955752427;
	Mon, 26 Sep 2016 22:55:52 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:27 +0200
Message-Id: <1474955733-30185-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] xfce4-whiskermenu-plugin: update to 2.0.1
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_1.5.3.bb => xfce4-whiskermenu-plugin_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.5.3.bb => xfce4-whiskermenu-plugin_2.0.1.bb} (63%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.1.bb
similarity index 63%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.3.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.1.bb
index 60bf114..7cf1e43 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.3.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "ef51234117dabdf02f2f415643d858d6"
-SRC_URI[sha256sum] = "68a8273395671d5163fd8cd9a73755ef03d4ea74891204498a21582a9c2e925b"
+SRC_URI[md5sum] = "0718eb713809df0049fcc5b7ddd9b533"
+SRC_URI[sha256sum] = "ced25394512d102090a504b95f19dffad8bf38754c3ddad85c765b184a7eb616"
-- 
2.5.5


