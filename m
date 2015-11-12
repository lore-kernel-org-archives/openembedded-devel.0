Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1BF77274
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 20:17:32 +0000 (UTC)
Received: by wmec201 with SMTP id c201so51361598wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rWeY88NLilnIUZYhgnbbFQEcRBuEXj8hlYUML1MghmU=;
	b=sv64+jHlzg6ZO9QJsamRXydCb1eEIkCTCFZfyvNPqcjO++UJlu+nI8cy5iW+ta/OK8
	qTCU4HQ5FD++EkfomxqXXnvHJ3x9C8EN71vlASjv9zdbyKRARdnDIibdgO9BJUasUbPr
	PkqUTodXQyB13sWnH4/yyctVmTYv1WwxwmLNvBaGG31IukNVDRSh+8CAF+5tk6tLs8uH
	rpJwXlqeN9p15zhQYwSGuvDxJc8YTVN7+fr3shp56uvx5xIOH2kKflEArbrH0w8hWbV2
	BKoU4DH24B5PSwfLenkXXDcuPnz4JTtg5DXhWgTgXLOTFRClV+mjBDFKYwuQJguIwY4E
	/lvw==
X-Received: by 10.194.84.42 with SMTP id v10mr18801276wjy.116.1447359452148;
	Thu, 12 Nov 2015 12:17:32 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u185sm276863wmu.19.2015.11.12.12.17.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 12:17:29 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 13:17:21 -0700
Message-Id: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 1/5] canutils: rdep on iproute2
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
X-List-Received-Date: Thu, 12 Nov 2015 20:17:32 -0000

From: Christopher Larson <chris_larson@mentor.com>

busybox ip fails to configure can interfaces, so we need iproute2 to do so.
See also http://www.armadeus.com/wiki/index.php?title=CAN_bus_Linux_driver.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index c220ead..e1508af 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -15,3 +15,6 @@ SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git \
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+# Busybox ip doesn't support can interface configuration, use the real thing
+RDEPENDS_${PN} += "iproute2"
-- 
2.2.1


