Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 173DA731F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 21:51:04 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q11so967755qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 14:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GuG+QNSTdtFjUeTVlCszC5Czr1QTpiXdDMJ3L3p7Uig=;
	b=kTqyoB1HfbAZEuc9QQ0w/a+UKHz1KFYpk6+/cbYrJr3ftF0YGpqw1TNcpY+4GYuHiN
	6UL7GcGR5BWn/wQNzNg35rP33sFtoe8eJjzYfhF/ZDltSUMMAyj1pgO2tZxcE4Fy0/u/
	kh2xH5SKPIZS+Z4Uk/Sv6/jYzsQN129LVaJOyCCy0HgP3rgcZZqAKMFjScRnzGX5iGYB
	jDVY5iSjbS1Vn+GTnREVmrxC9qTYTC6gk7IlsEk+7U7gX8kifWoq98Moq1ojZSQDddRS
	EnLIzOQM9uLNpfeWdgwZBhbPGsDS81yHk72bLLLl9IOTzluXC0vVzEshDq3gkZ2IcUWE
	lWBQ==
X-Gm-Message-State: AEkoouvIls9HqCSWMH7v0E1XZl8oL+fSscNyAT0BIORWVwclVt7OESoIeXU3hC8FYdkJ1w==
X-Received: by 10.237.53.157 with SMTP id c29mr704539qte.75.1470779464977;
	Tue, 09 Aug 2016 14:51:04 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	48sm21579089qtu.39.2016.08.09.14.51.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 14:51:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 17:50:41 -0400
Message-Id: <1470779441-5487-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] cryptsetup: update to version 1.7.2
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
X-List-Received-Date: Tue, 09 Aug 2016 21:51:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../cryptsetup/{cryptsetup_1.7.0.bb => cryptsetup_1.7.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.7.0.bb => cryptsetup_1.7.2.bb} (89%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
similarity index 89%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
index 16c21d3..d160a09 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 DEPENDS = "util-linux lvm2 popt libgcrypt"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
-SRC_URI[md5sum] = "56c385fe87fc2b6873df4b7f89202d0f"
-SRC_URI[sha256sum] = "075524a7cc0db36d12119fa79116750accb1c6c8825d5faa2534b74b8ce3d148"
+SRC_URI[md5sum] = "a11a140cea496961222170944db01fc1"
+SRC_URI[sha256sum] = "dbb35dbf5f0c1749168c86c913fe98e872247bfc8425314b494c2423e7e43342"
 
 inherit autotools gettext pkgconfig
 
-- 
1.9.1


