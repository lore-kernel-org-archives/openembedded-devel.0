Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6C36D063
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 22:42:16 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so2190027ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nsZJrZXC29tLNevPbDi9BCrxL9RAiPzK+FB1/iPIj+Q=;
	b=ovd/chHmpFXXIBlQF0Ak0st7ThtUHwmefhcATb7q2Z0SI67bhXtWODfKIiDL8sBTU0
	CgKNNW3EjZ1aCj1+JWQypgUeU0WGT7m/6HwrPsR4vNvpM3kPHNBwDWp6BLTN0Awuzppy
	G/E2usfs/cnW7UZ27ax+LN5J9ixbDzAICvdEiZtBq+h+MQddby0LXlTp19G33mPP/vq2
	WZyfA/4N3TfEWotTuIwYtpcYrdpm+zKMFpkXxEAkvYugGoDT56DQRRqsRs+KcU1Hon2b
	fqG6F8jUwCZUMuIAxg3rCG8S9Qwhh/B1dZKi6biU3KstBGMUMCS2Fe0Ew9EpqkK99KoA
	F1oQ==
X-Received: by 10.15.43.13 with SMTP id w13mr32438108eev.37.1381531337627;
	Fri, 11 Oct 2013 15:42:17 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	a43sm119901208eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 15:42:17 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 00:42:14 +0200
Message-Id: <1381531334-26434-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto-handhelds.inc: add missing bootlogo for hx4700
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
X-List-Received-Date: Fri, 11 Oct 2013 22:42:16 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-handhelds.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/linux/linux-yocto-handhelds.inc b/recipes-kernel/linux/linux-yocto-handhelds.inc
index e23437f..f1569fa 100644
--- a/recipes-kernel/linux/linux-yocto-handhelds.inc
+++ b/recipes-kernel/linux/linux-yocto-handhelds.inc
@@ -30,6 +30,7 @@ SRC_URI_append_h3600 = " \
 SRC_URI_append_hx4700 = " \
            file://defconfig \
            file://hx4700-change-led-trigger-assignments.patch \
+           file://vga/logo_linux_clut224.ppm.bz2 \
            "
 
 SRC_URI_append_poodle = " \
-- 
1.8.1.5


