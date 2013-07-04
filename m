Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 431FA6AFBE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 19:55:06 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hq4so1539472wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yfhrR45pv0SBB/aECeEQV4Hsyp335lshoR7HQig9y2A=;
	b=ei8OFNmV3cpsl1YMRWjPXVm1KwVOM/ujin90c8zlBrWeuuu1T7At4RRXvxUG7O8QCh
	CEfE27yVOd/k/pE+10GDchLvLEr8y6XKnzAQ7MCIiIDAV2YwEAAgoal6VPAu0NH9pIBC
	LFGslTRJw38+iIkvt9QCE89LyNXmnk62/+AMtZQQY6xmtOgMwJH0WkEoTIRkeI5PMcKh
	BFoTrLIrwcYD9ersNIxkrtWumQK+zhImMVs5x6COdsGqKvwzgTg1t6oUnWPXWyhzUL6w
	0OkOsYMD4F4GwmcFmvMUTsRlhPjw2SkOhQwfGiAO2+WXB4HXgakNwLedjY4asgZCD+N1
	7x0A==
X-Received: by 10.194.93.74 with SMTP id cs10mr4235667wjb.9.1372967706228;
	Thu, 04 Jul 2013 12:55:06 -0700 (PDT)
Received: from mizar.localdomain
	(host69-50-dynamic.0-79-r.retail.telecomitalia.it. [79.0.50.69])
	by mx.google.com with ESMTPSA id i1sm36855980wiz.6.2013.07.04.12.55.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 12:55:05 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jul 2013 21:54:56 +0200
Message-Id: <1372967696-23853-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] initramfs-kexecboot-image: remove obsolete IMAGE_ vars
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
X-List-Received-Date: Thu, 04 Jul 2013 19:55:06 -0000

* above variables are not in oe-core anymore

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index dd6d07d..35eb245 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -15,10 +15,6 @@ IMAGE_INSTALL = "kexecboot kexec mtd-utils-ubifs"
 IMAGE_FEATURES = ""
 
 IMAGE_LINGUAS = ""
-IMAGE_LOGIN_MANAGER = ""
-IMAGE_INIT_MANAGER = ""
-IMAGE_INITSCRIPTS = ""
-IMAGE_DEV_MANAGER = ""
 
 FEED_DEPLOYDIR_BASE_URI = ""
 LDCONFIGDEPEND = ""
-- 
1.8.1.5


