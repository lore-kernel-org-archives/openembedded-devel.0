Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 80A836AF50
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 17:41:15 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so2950928eaj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Q8hdzvdQGywCVJEFeq/8pSBdpvzMgkEk0VJPBgT7TP8=;
	b=GfRWiAtc6xZoGMsd7U8bjb0mY/E7DSRRSnUCOTrOPlhWPlkRCwgzrlb8CEJiIkWkpj
	UCgqEz8A/6bdQYuHVE8RkSkeMy57gfRtypE8/ZjIOWRFSOaU+M8oJ29PnO6HqMRbvYSO
	4j2FsqzUf4F9qkVowY9goGIJkrnoBx2TY9CET0fr1BH2Qx3vxgXEuB3uRl3N69a+rbhv
	jU8aUMXyQgEa5ySOK9NPrtWWedIFqNG9tqO9qEKN3Gu0rFHBo5PM4A/okkWqkS/Od5zx
	+yR9oC4cgwXPhfRkhSZ9XylU/yCmzWRan+/8Idi2HNRkzQuROIGZTj0uTjqwquvV9KE0
	WEdA==
X-Received: by 10.15.83.2 with SMTP id b2mr49450460eez.28.1381686076755;
	Sun, 13 Oct 2013 10:41:16 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	h52sm142813575eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 10:41:16 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 19:41:13 +0200
Message-Id: <1381686073-5452-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] formfactor: add ben-nanonote machconfig
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
X-List-Received-Date: Sun, 13 Oct 2013 17:41:18 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/ben-nanonote/machconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/ben-nanonote/machconfig

diff --git a/recipes-bsp/formfactor/files/ben-nanonote/machconfig b/recipes-bsp/formfactor/files/ben-nanonote/machconfig
new file mode 100755
index 0000000..c19fac7
--- /dev/null
+++ b/recipes-bsp/formfactor/files/ben-nanonote/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=0
+HAVE_KEYBOARD_LANDSCAPE=1
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=70
+DISPLAY_HEIGHT_PIXELS=240
+DISPLAY_HEIGHT_MM=51
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=133
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


