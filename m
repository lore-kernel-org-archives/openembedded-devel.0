Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6F9356CC86
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 23:12:23 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id g10so2853552pdj.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 16:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wLP7GLYIfOP51PlGuWMm23bD+q7vmPQdKupjwyFNrAA=;
	b=LUhJAByGaqmLue2UBHVTmpdBtmM72NxD1cdas5GakDEjLmfNfkOad8Pjw5bgDIKxaN
	fzgMPb2yVygXHjG1Y27NCDlMRGAXy4YM5AZ/8A3qg04dLoEbBBDZ+5SmNPovzDEbRXRy
	Tx0blJ3zA1J+JCf47m5P6GdbljOZxcMCRLFguiXb32mMe+bu+wdkBhJx6hk6zLGyjlpE
	WO0ahPFGZmE/hfyxqV0Dmf65SDvW9Og4vtuGZqfbADUvmWwbFwRCC3n5KsB4CI+Bt1yP
	Tfp62lyVv8UObCUvWMMjzVin6LK5cH3sH4VduJed57OJHT1ep/oVJp8QYUDQzO4DFfwc
	UOnQ==
X-Received: by 10.66.147.230 with SMTP id tn6mr319867pab.135.1382051545293;
	Thu, 17 Oct 2013 16:12:25 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	fa4sm117337667pab.17.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 16:12:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 16:11:58 -0700
Message-Id: <1382051520-1562-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [meta-oe][PATCHv2 1/3] libraw1394: add recipe
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
X-List-Received-Date: Thu, 17 Oct 2013 23:12:23 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb

diff --git a/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb
new file mode 100644
index 0000000..617ba1b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libraw1394/libraw1394_2.1.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "base library for low-level IEEE 1394 accesses"
+HOMEPAGE = "https://ieee1394.wiki.kernel.org/index.php/Libraries#libraw1394"
+SECTION = "libs"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "d06cccb776b240b6ab5efdee33b87af2"
+SRC_URI[sha256sum] = "a83cff16fb8885831bc29d7d17f3c570dc39251d89e20795c08e87720de0ba70"
+
+inherit autotools
-- 
1.8.3.2


