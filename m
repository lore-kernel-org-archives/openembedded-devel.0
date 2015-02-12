Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 50BBD73465
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:33 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id l15so7026883wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=M79nciyJKf86bYW5oS/GZr9VaER70lt8jt54NU1zbd4=;
	b=D68PQpxvnxb3TmIi8WERFHvcGGzMxLPgBGgqW60XyhqFA00uSy1w2vPk8j0YFkySCD
	Bin2DCq7qMIM4pw6u5b73LZVJ8ouIxOazSDPOzEeFUlj7RDxPr+e7jSKvlEInhqafBnI
	1uZ54Lpml7/xglqstFg+eFL0ACMNfRvCRirRWRQvXbSHCa6S12ycNyGV70IYKGnYaiX2
	uTb/Ow/N0JFFRfKZvY3M+ZLW3NfGy2XglTXYRmHLIYEpTqEqP01+oG8jYdPJUKcBDUlj
	E8x9zP1Pl/lIFFUHKuHhJBCg3P7vlSEV2rfCtVsr+9DRR9D17aP4OxWyXK3ulld81NJZ
	ftag==
X-Received: by 10.194.205.228 with SMTP id lj4mr11501770wjc.77.1423776147160; 
	Thu, 12 Feb 2015 13:22:27 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:50 +0100
Message-Id: <1423776119-14981-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/19] xfce4-whiskermenu-plugin: update to 1.4.2
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rename recipe's folder to whiskermenu to match convention used by all panel
plugins

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-whiskermenu-plugin_1.4.2.bb}                                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/{whisker/xfce4-whiskermenu-plugin_1.3.2.bb => whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
index dd3d8fd..7764109 100644
--- a/meta-xfce/recipes-panel-plugins/whisker/xfce4-whiskermenu-plugin_1.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 inherit xfce-panel-plugin cmake
 
 SRC_URI = "http://gottcode.org/${BPN}/${BPN}-${PV}-src.tar.bz2"
-SRC_URI[md5sum] = "f4de7546588952f84df8a4ad3552c526"
-SRC_URI[sha256sum] = "a104b2266675a3ea3c7b98aab7b075a351d813ea29098504031a62f365e5a0fc"
+SRC_URI[md5sum] = "967bbff0e98fdf0c1b78e61b3b152c2d"
+SRC_URI[sha256sum] = "7266d7a16df4bffe6f00d3d4711b8b8fd972491bac70f13a9d7edd9f0472d311"
-- 
1.9.3


