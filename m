Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id A630773D27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 05:58:06 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so10662989pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 22:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8AFa4sT4No/cztcPYuxp/YgasOIJOrQtY6IlBT8DbMo=;
	b=tB2FuCMokkkcbdGyKiQ2uYSQoJnNZPNKxLwrYWPZDMUeyOzqKqZj1sIqY39do1oARN
	FFd6cNAa3DpYVNRMQ3cxd14GofyFAy4/cNl9p5Qbr6kUz3t7369ep8HXH0pF1IiO67Fj
	Z+h0h1hvReNTYW5I0jfcxcUBG2xg0gGeSpNczMa5nIbpqkoWIH7vNen58XcET3hdeF7i
	ZbPmgbKaTjuW6ZmEeCHuyv31CWrY2IGi0OiUMQSzgc4vBv5KeLoxl8McTuE55E/48So1
	j188HC4ZEeyihKk5QhgZ/NS8QwjLsoKoI5j22QV75Kuf7dzDRZonLD+s3vL+5pkgXemV
	Fs9w==
X-Received: by 10.68.114.34 with SMTP id jd2mr69529187pbb.94.1442469486504;
	Wed, 16 Sep 2015 22:58:06 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	j16sm1497921pbq.23.2015.09.16.22.58.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 22:58:04 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 15:58:51 +1000
Message-Id: <1442469531-30074-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] libftdi: update to 1.2
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
X-List-Received-Date: Thu, 17 Sep 2015 05:58:07 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-support/libftdi/{libftdi_1.1.bb => libftdi_1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libftdi/{libftdi_1.1.bb => libftdi_1.2.bb} (85%)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb b/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
similarity index 85%
rename from meta-oe/recipes-support/libftdi/libftdi_1.1.bb
rename to meta-oe/recipes-support/libftdi/libftdi_1.2.bb
index 44e040c..eb4d86c 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
@@ -14,8 +14,8 @@ DEPENDS = "libusb1"
 
 SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "b79a6356978aa8e69f8eecc3a720ff79"
-SRC_URI[sha256sum] = "c0b1af1a13e2c6682a1d8041e5b164a1e0d90267cd378bb51e059bd62f821e21"
+SRC_URI[md5sum] = "89dff802d89c4c0d55d8b4665fd52d0b"
+SRC_URI[sha256sum] = "a6ea795c829219015eb372b03008351cee3fb39f684bff3bf8a4620b558488d6"
 
 S = "${WORKDIR}/${BPN}1-${PV}"
 
-- 
2.5.0


