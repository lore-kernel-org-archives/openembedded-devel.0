Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B70471AAE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 68so13534970wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gqWqxZ2uxWVVNN2slnY32Fe0+y5MYOl5HPiLwQqy7zw=;
	b=hlQNEDQmeyJpaV4OOz1dJIaBsQrYj/gAqFlQXQM5uBoDNfj4IFqoonuoM0KGh8o6hL
	rwIb/sMjGxXQJKwk1uigYLwuzmJ24mWNQ/6sqfx2d4Z4gJR3zn9U9KaHxynvgbUydQ2v
	w1BNnaFqFmNxrKo6W34mbHtVVGIpSPHSxqI62uyoki4ZG3nqWxbzy7+PDElrFh6UAcBt
	feURXlrDDKOj0SPDGEO7xj3y/vVu5LA/UE633nUgy2ek6tl2MKArKknvl7nG9qNZQ2pz
	9lJE/EijQkAyyHMllF0qQDuvwf4vEQrrRzwBEACSaX+SZHEvzw745zAh6uRXyoJezn9g
	CFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gqWqxZ2uxWVVNN2slnY32Fe0+y5MYOl5HPiLwQqy7zw=;
	b=YNxrWhN7nasWmP5UmIdQQ4VMU+5ZXZGeOiOjUTQGqd8jyZfv/NyD0X+5IhtYlarH1b
	xNLQB25TjFsm+81G939dCFKOUgO6UGofCyIwkEtLmNv1xxPepB2DOQAZpzQutvQoYCOU
	c2POOiT5xyy0Ou3089P9HLFSqkqz7FrdvC+EZCUyIacYe3j/sG/h7rTikV56KnNl7diW
	XT/ly7M3q+4VOt7QuEqPxVM2LElIrr0erEw3pHCrcy5GvNB5H/3bihiW+A+OXBJVR1r6
	AVN4IGlmYr1MMLKS0wXgWA4DNnofZ7cyLg/8hUfdozFrqytl3QvDpTVs3q/TLrAkpfUo
	fpNQ==
X-Gm-Message-State: ABUngvdCKrvU8if34uHvyiCzasfC50eCCVmLBkri7qxXmSS/xBIAA4+0mNHHF6lTsGVOLg==
X-Received: by 10.194.100.225 with SMTP id fb1mr1401636wjb.128.1477951869330; 
	Mon, 31 Oct 2016 15:11:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:41 +0100
Message-Id: <1477951849-32149-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] xfce4-whiskermenu-plugin: update to 2.0.2
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_2.0.1.bb => xfce4-whiskermenu-plugin_2.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.0.1.bb => xfce4-whiskermenu-plugin_2.0.2.bb} (63%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
similarity index 63%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
index 7cf1e43..6950234 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "0718eb713809df0049fcc5b7ddd9b533"
-SRC_URI[sha256sum] = "ced25394512d102090a504b95f19dffad8bf38754c3ddad85c765b184a7eb616"
+SRC_URI[md5sum] = "abaae8068fdcca9e72a41f4a6d28c685"
+SRC_URI[sha256sum] = "c8ba09b3cc0b2ec863af310752a9ca69560fc4c27cbd3174a9dceca1af79e412"
-- 
2.5.5


