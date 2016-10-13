Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 69ECC6AC00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:21:59 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n189so7253748qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kaVHCWQD0nVS2A7j6GVPBqbXNcTTjRcI9PYAfqmdn6Y=;
	b=bdMoO5sPjinhNxh+vErxoToJ6scpNT6/49h/Ubxdv2wsINu+wX0cMSdPHLcdsLaAXD
	fgfsptLt3bs++cD5y71p3x23d99QK/zsW4FPIYAP9QyKGDZgCioVwry7ydZP3dzaAe0h
	BmZAKtpckpl8fwWwEuy/Z+EIkd3Y4kPFPpwE8NW6W6StIX2f4cJFPxMHPoZBVsLqG7el
	rTwZSuXskRJL8g8lYYV5Op3QPszk8+tAeohoSba3L26YsvJ0PgTlv2IEVK6B0xeW7ytr
	MxKS0j8kEx6Joe+WodM90CEZWPKRjj6TIR9u+rs4yGMtnldBMOs2iSExFXp0MRnpxro/
	geJA==
X-Gm-Message-State: AA6/9RkkntiZC7WARHNC1BR0K9xiYVqwNgu0Z3ECDve+Ay3m2y+FOtxPMKcf8WGTvDJJ0Q==
X-Received: by 10.55.167.66 with SMTP id q63mr8535463qke.61.1476397320819;
	Thu, 13 Oct 2016 15:22:00 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	z41sm3472608qtb.13.2016.10.13.15.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:21:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:21:50 -0400
Message-Id: <1476397310-1206-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.51.1
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
X-List-Received-Date: Thu, 13 Oct 2016 22:22:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc               | 6 +++---
 .../python/{python-pymisp_2.4.49.bb => python-pymisp_2.4.51.1.bb}   | 0
 .../python/{python3-pymisp_2.4.49.bb => python3-pymisp_2.4.51.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.49.bb => python-pymisp_2.4.51.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.49.bb => python3-pymisp_2.4.51.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index abeed93..2b2601a 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=67a9496dcf5cf97af38edc77834fb4b9"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=200286bb8d148a5a157bf22abf623cbb"
 
-SRC_URI[md5sum] = "7cd8279f658899aabc606567b094896d"
-SRC_URI[sha256sum] = "45527078d48efc493f30c27d0dedc4143670b0cf85ecb8f2118c9c6463b1c86c"
+SRC_URI[md5sum] = "03b5def47d8fde29f2303ed42ab1e375"
+SRC_URI[sha256sum] = "2bb35c365470ad46f9afbb96408c01894aaa10b369fac0f6b92010190a7087ad"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.49.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.51.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.49.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.51.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.49.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.51.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.49.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.51.1.bb
-- 
2.7.4


