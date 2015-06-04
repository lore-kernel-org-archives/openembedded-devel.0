Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id D1584734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:21:15 +0000 (UTC)
Received: by igbzc4 with SMTP id zc4so16533803igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CD4S3SHg/KiXtkpOMy94TiA5R+GTg1jtESLu5MGiT5E=;
	b=QY4fnecpEaRVkJbW2M6VcMNVXFd8s/DjSoBRxhkFBlWXuL9o1JxMw0VY6BcZPLAlcs
	o2kB9bjDodJ+cUBbm9PeZq1Edcnt21/DxMJxFJShP5y0ze4Lnl3nqw9kAF1xtPGgG5NV
	Uwb2jTdDeny6WYTueweJs2/IZak460/+WTfJCFc1xSub0TgsiASFpgB/X2DdWIcFHNY5
	so5CJzY+iyUGVNp7fX26OmcSKzUJ7bWYawx90MBCLZ6QkjImvPA70fYyOJXK0ZQJL4cz
	yn7rTch4WY6cPmLPSJJaEtDXvOO3dxj169YgPo3owEod5q61Nk6oLF8xyqacQYPgshiL
	bacQ==
X-Received: by 10.42.178.7 with SMTP id bk7mr6062817icb.79.1433445676200;
	Thu, 04 Jun 2015 12:21:16 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	je10sm9950529igb.15.2015.06.04.12.21.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:21:14 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:21:00 -0700
Message-Id: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/7] elbow: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:21:16 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-efl/recipes-efl/e17/elbow_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/elbow_git.bb b/meta-efl/recipes-efl/e17/elbow_git.bb
index 16664f9..064b794 100644
--- a/meta-efl/recipes-efl/e17/elbow_git.bb
+++ b/meta-efl/recipes-efl/e17/elbow_git.bb
@@ -8,7 +8,7 @@ SRCREV = "b41fd0bc9514ff61bb2a50d957efe4155fa3e6a8"
 
 # webkit-efl isn't available for < armv7a
 COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-- 
1.9.1


