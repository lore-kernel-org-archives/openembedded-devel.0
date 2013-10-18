Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id AE4126BA14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 00:16:22 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so3008041pbb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 17:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9dJPmVcpD2kvG3roUSU9nGmqK5zylRRZXSk0u37Uq68=;
	b=i9WroPiWnIppDPSpE2OuySdXcv+UFrOEOd7Oje5kDi6gyqAAqcWyVgcHdVRIR9Z6Qq
	whQNiDb4BKpeidH0nKn8UQZ8U+sOL8Zipc49idpfxQzif3yfPyRmRiNwQPxAIrOz2Pxk
	DjVE7eq1ZTGTCoRmpuYKJvLJKt1Cj2h5iyWHngSKh8aT4IzYyF5nc6qEm4B95Lq+9Yl8
	cxVWbiuN0ISVuzwkxFOy3FdEJ11NQsMV2nlGowDA33gI8mFIWMOtToW+jyDhoRebPH43
	88q+VcS1SfsOEpDVP2wBPfM1MPUmCltAIxiPU5TDKXYPm/irE/69Boi4uHXCPweK6tE4
	FzGQ==
X-Received: by 10.68.233.135 with SMTP id tw7mr187691pbc.112.1382055384532;
	Thu, 17 Oct 2013 17:16:24 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	hz10sm100460951pbc.36.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 17:16:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 17:16:04 -0700
Message-Id: <1382055364-18216-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH V3] libraw1394: Upgrade 2.0.9 -> 2.1.0
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
X-List-Received-Date: Fri, 18 Oct 2013 00:16:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libraw1394/{libraw1394_2.0.9.bb => libraw1394_2.1.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libraw1394/{libraw1394_2.0.9.bb => libraw1394_2.1.0.bb} (55%)

diff --git a/meta-oe/recipes-support/libraw1394/libraw1394_2.0.9.bb b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
similarity index 55%
rename from meta-oe/recipes-support/libraw1394/libraw1394_2.0.9.bb
rename to meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
index b0b4a53..617ba1b 100644
--- a/meta-oe/recipes-support/libraw1394/libraw1394_2.0.9.bb
+++ b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${P}.tar.gz"
-SRC_URI[md5sum] = "faf6b18a92075d80e45b603f9a659670"
-SRC_URI[sha256sum] = "f83268b3f5d37e8d42ae9881c099b55839b70ac0af71549be7ef6af2578e809a"
+SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "d06cccb776b240b6ab5efdee33b87af2"
+SRC_URI[sha256sum] = "a83cff16fb8885831bc29d7d17f3c570dc39251d89e20795c08e87720de0ba70"
 
 inherit autotools
-- 
1.8.3.2


