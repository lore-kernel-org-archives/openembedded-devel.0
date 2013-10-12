Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4FABE6CEE2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 23:28:26 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so2635947eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 16:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Up1fZcaIuEsvr6LxwxcSik9pRyPBaySapft+8TC+/c=;
	b=zChGuldsBkubMP/viT3KzTXT9EsAGsR7cxBFCTUvG0Q4PEFfE+fZlQ5MHrtj+77x1x
	g3vigkujL0vGYoZTEFu64A5tbZ9pib6mZ/pgAEJMxKAbUqdpUL7A1IULEAsZ/h5a0fRp
	JgePeuMCsD/o4OPhq3QCyi0Y1EUhVVxuby/nSnDus2OVm3gOmRPNy/t5ffrEMgC/aS3d
	3c/MrLBFZA4eBBwJCHFGYYO+VbwF7WTYVNih/s83j1zxDyek/SSnVDYa5bw63XYfFi4W
	vknnvd/Ooe08a1OVTF6fJkcfazrC0xjZH2pNkxx81uF/2BIoLnAxuQrPcKbhr2MTQKzg
	0L0Q==
X-Received: by 10.15.83.2 with SMTP id b2mr42352698eez.28.1381620507881;
	Sat, 12 Oct 2013 16:28:27 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	j7sm133331466eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 16:28:27 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:28:22 +0200
Message-Id: <1381620502-19278-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381620502-19278-1-git-send-email-andrea.adami@gmail.com>
References: <1381620502-19278-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH] formfactor: h3600: set DISPLAY_BPP=16 even for 12bit LCD
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
X-List-Received-Date: Sat, 12 Oct 2013 23:28:26 -0000

in Kernel mach-sa1100/h3600.c says sa1100fb_rgb h3600_rgb_16

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/h3600/machconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/formfactor/files/h3600/machconfig b/recipes-bsp/formfactor/files/h3600/machconfig
index 8cdb2d0..45d6c54 100755
--- a/recipes-bsp/formfactor/files/h3600/machconfig
+++ b/recipes-bsp/formfactor/files/h3600/machconfig
@@ -9,7 +9,7 @@ DISPLAY_WIDTH_PIXELS=240
 DISPLAY_WIDTH_MM=57
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=76
-DISPLAY_BPP=12
+DISPLAY_BPP=16
 # Real DISPLAY_DPI=105
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=vrgb
-- 
1.8.1.5


