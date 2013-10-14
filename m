Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id B60D160EED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:10:47 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so3511177eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aLgXkklgpTCTXx+OPSSdSvKRJO5d4S1/8KxvMBFf/Jk=;
	b=n7WyCJaRcr6GPCMcLEJ25318hHLAdHrsZBA9LXSZ2jhwDT5Wr6o3LZR5IYSBZyvCHw
	eiZ+Ka07/YMWzQQDWvyh1Y+p3J9huEt2aTD2KTs3dakDCFwkNgNMAB0KCofkk2L7p4Lv
	3hEl5mwpQwaCy1RPP3S4bxyRSNaSTrDE2ko8SIwksQAM1+0/xUOyqQaoZj8+9AFxqef5
	Ac/QpCxAOayjBeHygbgQ91OhK33G/7DOKqhOFq2JG5HKoxpcHo5B7HAQQAtF/jgq8kbF
	Q08di0LSS6YT4FYdHa/j8Pp8WE28QMXR34u9nkIEWBZ4GO7A9F2/0FDYB64kCKGaHWzN
	6/ew==
X-Received: by 10.14.177.199 with SMTP id d47mr56632195eem.14.1381763449052;
	Mon, 14 Oct 2013 08:10:49 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	j7sm154644612eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 08:10:48 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 17:10:44 +0200
Message-Id: <1381763444-3169-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] formfactor: h1940: unset framebuffer rotation
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
X-List-Received-Date: Mon, 14 Oct 2013 15:10:48 -0000

Device has been reported working w/out fb rotation
with kernel 3.1

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/h1940/machconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/formfactor/files/h1940/machconfig b/recipes-bsp/formfactor/files/h1940/machconfig
index 2276812..9fa7472 100755
--- a/recipes-bsp/formfactor/files/h1940/machconfig
+++ b/recipes-bsp/formfactor/files/h1940/machconfig
@@ -4,7 +4,7 @@ HAVE_KEYBOARD_PORTRAIT=1
 HAVE_KEYBOARD_LANDSCAPE=0
 
 DISPLAY_CAN_ROTATE=0
-DISPLAY_ORIENTATION=270
+DISPLAY_ORIENTATION=0
 DISPLAY_WIDTH_PIXELS=240
 DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
-- 
1.8.1.5


