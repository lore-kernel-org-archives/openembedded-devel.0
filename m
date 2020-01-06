Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 54ABC7FD67
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 18:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47s3M46Rrrz52
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 19:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578333905;
	bh=u80RluBgPPkXWlnhi3VFRsHoDtRS+W1lSvIGRq5z+U4=;
	h=From:To:Subject:Date:From;
	b=CQ4WqIFh1qzh52EdG3bpgn5WqU7mvrKtn+PPZZxEp7vR92abjnhYJYWjjeIZ4JCEY
	kbfVR4dyMzpFIUVMBuT6SJYy5m1Zx91TJH4N7ONt5vARSEcHN7NJ/uvqT/Qs92SqGD
	J/5Ft28VetVCPjdX9r5DA9UFdN2Z4agmMyvoeskvNgBciObDKupg0oFxQrV4SPXmL8
	khII6vtO1bdf3CNRgxZ/rwLHpPqp/gikEG+i2hZYlmJB14ogQuhrwWt6S3zU5gToKd
	dBJCqravYjPgc6xxDL2dI2USGdiv6bkBdYM2jgeN0ZRHPjmvZ7+2kO3m6kmLWBqMfg
	iOIpc3buoDCv6GQMENLMWm8i0mKM2me5fKSWmGBEQKXXGXtHQXdBg2d/z2xciKbsMr
	b/x9Do5FgRpiyqcX29zAAFPRyT0mzruX7C+y1mBLU+YPwZeQMity2bjPN6H2JUfMwe
	TUM/FNmvMJIFv5bFJHXwU+A6Z3MHgd1ogyzJltghmgo8LPFsJBdK9ivNd6xn8O+BT/
	Tu7tnvrFMcY/rJQV65yALQVMb/TClr+O6iCIusH5xDNEQggRAC5Pq/e17O0YXv0PqR
	rrI/mrd4agxSxcpM6OCe6+5MiF8XHOG3R1U+mLEwX2x2n8WhqceTAo3myANcGTdkkO
	T+DjWZRifE7jT8Av+gFxF+pI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 20:05:03 +0200
Message-Id: <20200106180503.8105-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] geany-plugins: Use enchant2 instead of the old enchant
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
X-List-Received-Date: Mon, 06 Jan 2020 18:05:06 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
index c43d23b34..a6a0b17dd 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     geany \
     libxml2 \
     libsoup-2.4 \
-    enchant \
+    enchant2 \
     intltool-native \
     libassuan \
     gpgme \
-- 
2.17.1


