Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1626D09D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:43:52 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id y13so1572773pdi.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4gSteTwaOV7BEY6n4dD64Htc2WHTJ1aK3xmIfZPKinY=;
	b=WSEPXgbZV75vFRRdlQRBNNxxic2s2UE2maOtzaeEvV2B9bAChrh4dUD8lCg5aSGf1W
	aOXIxPRHLaRae5+MhEDmON2UjA2DFoJzmI50IXSt8X4Sd2204FxGOl2d+DPM0EsEqju3
	/YR0HpIK/t2r5YG7bFO3HtlLDlPf7rnTOvhNta6agsIvHxq1qzCgtjHHJ+WZVNCWI1o1
	RJ4VHeGYcaBL/p7r9/n1EvYQ6DlYgaoBEPOUfAg4CRpr72Fu8q/MKZh6iyHrzH52XQWC
	q1G87flrr1jQE7yIHW22K7E9tD3gjm8QtW3bbpPv3HBsK0mqFPBjexD8g+fJYBldd6bI
	agLw==
X-Received: by 10.68.170.225 with SMTP id ap1mr389016pbc.117.1381877034260;
	Tue, 15 Oct 2013 15:43:54 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ve9sm86900850pbc.19.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 15:43:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:43:25 -0700
Message-Id: <1381877008-698-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
References: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [meta-oe][PATCH 3/6] libraw1394: add recipe
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
X-List-Received-Date: Tue, 15 Oct 2013 22:43:52 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb

diff --git a/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb
new file mode 100644
index 0000000..b0b4a53
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "base library for low-level IEEE 1394 accesses"
+HOMEPAGE = "https://ieee1394.wiki.kernel.org/index.php/Libraries#libraw1394"
+SECTION = "libs"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${P}.tar.gz"
+SRC_URI[md5sum] = "faf6b18a92075d80e45b603f9a659670"
+SRC_URI[sha256sum] = "f83268b3f5d37e8d42ae9881c099b55839b70ac0af71549be7ef6af2578e809a"
+
+inherit autotools
-- 
1.8.3.2


