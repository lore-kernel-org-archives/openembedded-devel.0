Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 864136BF59
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 08:44:08 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id q10so6098667pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4gSteTwaOV7BEY6n4dD64Htc2WHTJ1aK3xmIfZPKinY=;
	b=TK6yTziNhjrDJJYZicevkKjXgetwlUQuf2scRp9Ge8Z4rpuqwMDl0HhKzvMPwrN7jH
	xP0gzCKB4yh538NswtqsqeVXNG7A4mpozKOOP6dxVaz/3czTt3rADv6bjxxTfcga0R0i
	iAQb75e+re/MrGjQKXb2X9wDb5LPRfNM6Sap/pSZanmqpFxjsFhxGy7hNmB3EU0wC4Gw
	z/38DcJ2wnpyRaKPtPmbqI7eFPZvVFeK/poTK0qGBeo9QeDYlsgtbv1f+eCBoQt4qB9m
	fqsABv3Rxg2/0gSJbsExUbI8rhAmJ7mICdc34nb90IU4VRoMbroIaSu3qEeJXQNEi/Qw
	BS7w==
X-Received: by 10.66.192.8 with SMTP id hc8mr31124755pac.66.1381653850302;
	Sun, 13 Oct 2013 01:44:10 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id l8sm70753592pbl.22.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 01:44:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:43:50 -0700
Message-Id: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [meta-oe][PATCH 1/6] libraw1394: add recipe
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
X-List-Received-Date: Sun, 13 Oct 2013 08:44:09 -0000

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


