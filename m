Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 41CFA6B0F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 09:05:33 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id n12so982902wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FGMVc07Kbg/Ng76Y1+6WPWi/vfEWufDEFCLy4/p7fpc=;
	b=VSXImOOVIJlevjNNFWDrxEr7xFt7zytxKslJdWtjZf3myGmpmk/iOFu4oTI+BoqhQ7
	WcH0t8JGcZRrUGl6JjNj3YM2+hKjH3S/hfWsr+nDCxgTJ+bWi9mXt34cPgqtu/yrfgAM
	xxTa8oo4FeJGatayZiX9RCrQInUz2ZDb/kBVwotXpnr50yN+/uC/SDao5ewmx4+Us7mb
	h8Wtu+DFrou3EiOQwsv4fpXgUNXvTnEMXCi+p/032sG4bzweKW7hvJXht9V2gZ25M715
	7SvNkXly9sh8k4/qPyGUEfB5XLTsEZUz7lTqnAsIs9L7XG+AkRm9hbRA/ZLkp1+uzixo
	YSkg==
X-Received: by 10.194.250.6 with SMTP id yy6mr3411395wjc.13.1383123934290;
	Wed, 30 Oct 2013 02:05:34 -0700 (PDT)
Received: from mizar.localdomain
	(host241-23-dynamic.14-87-r.retail.telecomitalia.it. [87.14.23.241])
	by mx.google.com with ESMTPSA id i8sm13414697wiy.6.2013.10.30.02.05.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2013 02:05:33 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 10:05:29 +0100
Message-Id: <1383123929-28906-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus.inc: set default IMAGE_CMD_sum.jffs2 for devices with NAND
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
X-List-Received-Date: Wed, 30 Oct 2013 09:05:35 -0000

Collie will need a customization.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 9817625..333a337 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -3,7 +3,7 @@
 ########################
 
 IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2 ubifs"
-EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
+EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK} -n"
 
 INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 IMAGE_DEVICE_TABLES = ""
-- 
1.8.1.5


