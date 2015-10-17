Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1A65F77127
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 17:14:50 +0000 (UTC)
Received: by pasz6 with SMTP id z6so6963235pas.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Oct 2015 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=N5elTslEINYBY494yCyrzeoYhlml/s3jljyLnOvYD24=;
	b=YXxuk8fAbOpC9VxkXKA60qKxrkISndC+9y8DkknlK7GS9YIe0IZhA1f32RBQaNg3JT
	chLttFxWKw/fjLpQpa13Bp+wOS5TkCBH7tf2Y++8+9nyzrj/xYnGTACTm4Fx3CQDGrOs
	0ccgIXpW5mbw0zafyJoWQpZhbrOruunP664qyJRYmw95ipCiElnXhGFVRx9rFNgaBq0G
	oEZS4znUsWO+USdn+mgLLqSHz141vqHeO1YOCebIFxpyQgz7/rGXKRm/ZaR9vdu+K4kl
	GDgXkXI0Lj6iwUoTJ3KtD+H4tp8A1k072NqjVKLVpiuuOd7sjyYeHSF9CgtZ+aVU0Wzq
	yGag==
X-Received: by 10.68.91.193 with SMTP id cg1mr24040309pbb.98.1445102090467;
	Sat, 17 Oct 2015 10:14:50 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	u10sm27528132pbs.63.2015.10.17.10.14.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Oct 2015 10:14:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Sat, 17 Oct 2015 10:14:45 -0700
Message-Id: <1445102085-25236-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: update package to 1.12.8
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
X-List-Received-Date: Sat, 17 Oct 2015 17:14:51 -0000

changes include  CVE-2015-7830

see https://www.wireshark.org/docs/relnotes/wireshark-1.12.8.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_1.12.7.bb => wireshark_1.12.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.7.bb => wireshark_1.12.8.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.7.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
index f8ab3ca..eee9f30 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "c8ae53f648b1dcbf6e74495401a0f1ab"
-SRC_URI[sha256sum] = "c74a1c14e72ce0f198a93d832e71742c7f312cbbe719e5def9ecef176860f92c"
+SRC_URI[md5sum] = "988a4595a4a87dafb3c4870ea40e89b5"
+SRC_URI[sha256sum] = "357e0a4e49525d80cdc740bb16539fcdb526ad38cc2ed6cabedafc9bdee5c7e7"
 
 inherit autotools pkgconfig
 
-- 
2.3.5


