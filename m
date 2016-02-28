Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE907727F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 22:54:26 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p65so47016016wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 14:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ab6ZI8tEYFUYa/KetIXw2nafhLB+vDT21DvC4Xk1y/I=;
	b=IgdKgncH/KRM6pSxcAUMgbKF4S/3c8ru513MzgehnSJJlWgliGMj+pxP7dDdX/Zps6
	DIwkslHJQJw4p2HwdKPbmcwfQZi7pY/bebLCgsmm/ADrpVhyU0A/0k+fmM/inFL/TgHE
	rCVHgXUyUANwukJv2lRqu2Wv0o+oozyccLqljQQXntY9IzmbC3EzzoW3hEWE/9F5MzLq
	u2uJzYenS31OT9KDiNnKxpPmUoWrrLebCBWj+JiI/NZIh0wQ0vgCT9nvmfd3WH7n5Dwn
	ZblGvPM40OkxWHhVF7GDIhnZDQwRSV6Goe8a82hgidDavL1FKJHT8aPQcJvZoW3CO4Zv
	1OOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ab6ZI8tEYFUYa/KetIXw2nafhLB+vDT21DvC4Xk1y/I=;
	b=HWzKcrS2Do0M8Yaw2BW7sLsQGqrrg47G0+0SK4y8S8iM178FTnj8swBV1o3xOPKJZP
	IA+SoSu+4nC3XpSyYCRrC8MfEpFw0w5R/uC0rEavJgOfZmmxNcZGbppznbsmTRV0t2fA
	B/zpTUVS2Tqn1+W0315PlSuSJC6Iguzpl4MxLPRYgjwJhxHZMeuqB0EsveRvLQxuQcXZ
	eY23dYaZPrn692M3gCnOprHCV0jCrdqy5lki2oub9yvrI1XrjFb7zd6rm07adsIU4wy7
	itZNU+/iLtRHtMv5KUll7AcuzCRnvStGrNy0wWui45ics/NANnGQ2AMI21hmylGXR0Jc
	b9qg==
X-Gm-Message-State: AD7BkJJZNA8sQSDypqLrTD7SFaXNy6Li9NgmriCSnh3BOtPx6z0/BLyVTQSlLBf1ZThUbg==
X-Received: by 10.28.53.4 with SMTP id c4mr8730596wma.34.1456700066995;
	Sun, 28 Feb 2016 14:54:26 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host225-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.225])
	by smtp.gmail.com with ESMTPSA id
	i1sm22919112wjs.45.2016.02.28.14.54.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 14:54:26 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2016 23:54:22 +0100
Message-Id: <1456700062-10754-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexecboot: sync fix for gcc5 with upstream
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
X-List-Received-Date: Sun, 28 Feb 2016 22:54:27 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch           | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch
index e451435..b54199b 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch
@@ -20,15 +20,16 @@ diff --git a/rgb.h b/rgb.h
 index 0ba987a..4f64622 100644
 --- a/rgb.h
 +++ b/rgb.h
-@@ -51,7 +51,7 @@ typedef struct {
+@@ -51,8 +51,7 @@ typedef struct {
  } kx_named_color;
  
  /* Convert RGBA uint32 to red/green/blue/alpha components */
 -inline void
-+extern inline void
- rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
+-rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
++void rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
  		kx_ccomp *blue, kx_ccomp *alpha);
  
+ /* Convert hex rgb color to rgba color */
 -- 
 1.9.1
 
-- 
1.9.1


