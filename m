Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A706B737A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 07:35:44 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so9448162wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=MFTB/9TjRNWy81D549gZXd/WalnkVMQcOBscHmOCiqY=;
	b=f7Zv/4n4QjyoCikDTnZeMjnyhsuDKkTo8qsA9sGQI7niiC22nCc4DMgRebw+TkkNd/
	R/Oxd9pj5YVY1cfbywhRJ9YhdDeWsssbk3G9GMISegcI0s3kOcxNBNfkEEOyGx4izhZq
	3W+1/ihDvwsTNUbVN3yVB4JJQQzreloz/O0kOeLT9smUZMlXUFZGBpwOb0oUpsBBFQZz
	mdI+BbJQ4cbtP2CrX5QFwZzEiSaRUVACqzapS+Qd0fYcGSm2c4h0MiIGNXxQxLKpqQPS
	hJSserQ6QVZ7EhqQLy+wcpTD7xmy3g8IsYZNRYcQOv5mmf+ZWRarHd3EizvHwa1Z4jM2
	LBrA==
X-Received: by 10.180.182.33 with SMTP id eb1mr3152753wic.8.1435217745219;
	Thu, 25 Jun 2015 00:35:45 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id wx9sm44250156wjb.6.2015.06.25.00.35.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 00:35:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 09:35:12 +0200
Message-Id: <1435217714-20564-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435217714-20564-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435217714-20564-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] libndp: initial add 1.5
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
X-List-Received-Date: Thu, 25 Jun 2015 07:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it is required for later networkmanager

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
new file mode 100644
index 0000000..8f1d1ff
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "beb82e8d75d8382d1b7c0bb0f68be429"
+SRC_URI[sha256sum] = "faf116ab70ce9514ec4e8573556025debea08f606e7f38b616de1f26e120c795"
+
+inherit autotools
-- 
1.9.3


