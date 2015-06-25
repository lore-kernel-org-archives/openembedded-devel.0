Return-Path: <kirgene@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 23A7E60132
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 16:36:12 +0000 (UTC)
Received: by lbbpo10 with SMTP id po10so49030733lbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mDfe+xJ/qgsoZqJExwQzsIQ/5pcU7XYBtutUFY8fyqk=;
	b=Mklb+QTQqdR5xC8doLL2HF/+RQBbw08DO38tYat2U8+XMdQXAp86rlj66pe3msKHXF
	XjEkmZfWMw2PWLAMxj9dvZlX66okUSn54L4gfjJ5PXU5HQIaUkaIl0SFyXefQrmp1S2S
	fT89d8n0rtAaWBSK2Hc00Ze84DWJMWexaOWKlXL4HP89JYXKM0VJraK9lSWjVznM5BHe
	paNmXN6NBQyNdfFQiTstYeqdmj+LrOcGeEvaa1BdIPaJaEZmIkjYU3V0jkZDPxSx3ut2
	+6w2NKEq9pwIrRnWudf0QcNapcMVmrJVlxlZw6QETV1si6XoJy1RE7YvOEAsf81tr4Yz
	J9CQ==
X-Received: by 10.112.131.98 with SMTP id ol2mr46647331lbb.56.1435250172867;
	Thu, 25 Jun 2015 09:36:12 -0700 (PDT)
Received: from localhost.localdomain ([194.44.84.130])
	by mx.google.com with ESMTPSA id x10sm3302472laa.32.2015.06.25.09.36.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jun 2015 09:36:11 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 19:36:08 +0300
Message-Id: <1435250168-14195-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [meta-oe][PATCH v2] rabbitmq-c: update to v0.7.0.
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
X-List-Received-Date: Thu, 25 Jun 2015 16:36:13 -0000

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.6.0.bb => rabbitmq-c_0.7.0.bb}        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.6.0.bb => rabbitmq-c_0.7.0.bb} (65%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
similarity index 65%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
index cd68ba4..e9846fd 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
-SRC_URI = "https://github.com/alanxz/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "80b350ce0de3f44cbd7b501bbbd8daf3"
-SRC_URI[sha256sum] = "3a89349880582c24d81d52ee42a93a0633dc366a4cc96174512af88c32509dc2"
+SRC_URI = "git://github.com/alanxz/rabbitmq-c.git"
+SRCREV = "4dde30ce8d984edda540349f57eb7995a87ba9de"
+
+S = "${WORKDIR}/git"
 
 DEPENDS = "popt openssl"
 
-- 
1.9.1


