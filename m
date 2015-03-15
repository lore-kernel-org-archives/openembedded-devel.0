Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id AF3C673944
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:32 +0000 (UTC)
Received: by wibg7 with SMTP id g7so25192904wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=jg3bgX+3uZBkInG/iy4XVn7EFwkO05fznUB9X+AJEX4=;
	b=lidf7nnKLfcA+x/980AeiKxtV3MwOHw7sLc32ECdpaoh5YI/H2vZDpqo5ummPXPnp3
	2Ze04jgXvlI71w9BYGETnynw3g0fSEsDKvoXPDtSagSSeRHtiwOX6jWE5s/r12JDIV3s
	2OZ0k634z/VapVR3MKeM4L92+u8WIxtN+SsQI4IWA2tEm4yAz6veyvuYRoFL29lMqRPe
	mBMC6E+xBNesWJKhvMFwVQ+LYwf4vqn2QYL9z5JsrFCydlfIb/fWZwmahCJ0bDczI4nR
	lthb4HBN6r+zNu+z94lljJryq8agrVsm0oiZqdPB6ynz5qQ+XYwIspv5smqHEKT+/6xz
	CmcA==
X-Received: by 10.194.90.210 with SMTP id by18mr113391787wjb.80.1426462473473; 
	Sun, 15 Mar 2015 16:34:33 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:36 +0100
Message-Id: <1426462419-10173-28-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 27/30] xfce4-places-plugin: update to 1.7.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-places-plugin_1.6.0.bb => xfce4-places-plugin_1.7.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.6.0.bb => xfce4-places-plugin_1.7.0.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.6.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.7.0.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.6.0.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.7.0.bb
index c76340f..16be09d 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.7.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "8f3ec883efb0775052eeea816bbd8a23"
-SRC_URI[sha256sum] = "07b044025a75f02b84e8848d6f81b0fcbb0cd9b8a4bf919cb7f0777b096b27a4"
+SRC_URI[md5sum] = "fcae9b38a8affcd82699a94991bba29b"
+SRC_URI[sha256sum] = "4175c614749abbb5bcf6f49c88125fb0dd36db69f4c374df23563907b16e2c3f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
1.9.3


