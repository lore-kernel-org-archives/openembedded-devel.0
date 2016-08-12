Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60B73760B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:22:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o1so2286102qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=byxdRRy1b3jkpG+VZ429NYAluzD77sCjQplzQhvUbes=;
	b=jJzwKMluUdhXLiW/HZuV26z5YynzJHunZyQ/qxqSwDEbWjnEljS7a8jp0jybDAe+aO
	eMvDcDuLrTFnX3GpOLsx6iQCrqkUVNagkHWdy04rC87I7iReolPvSQb+H9AEqeY7Rp9K
	tF9Sw0XlCcX4UGPi8e3kEcjg4TC9ks9jYtW6/++JNtJQrHS76SNoZlbnnQxbcu3J01Gs
	8WtMAin40dMqeUViD9f+O/sEbVg9gRJ3VGD/TPnfxlT0xq7QWN+8PEXcMV9MWpRkUmfP
	pYUMtd7CVrcVgAzjK8j3Ski12TFmWnBccM4PPRpkGmM6RDsC9o/Ofy70Fo/Oju2MUr2t
	7QDQ==
X-Gm-Message-State: AEkoouvwYI9UO0gE87ztmj0S7EsnCzPO1NzLhxpx/yZjAewR9Jh7rEUv5TeQ/WshlS8CRg==
X-Received: by 10.55.165.193 with SMTP id o184mr19363835qke.284.1471018922570; 
	Fri, 12 Aug 2016 09:22:02 -0700 (PDT)
Received: from argos.minotaurinc.com (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a63sm3518909qkb.26.2016.08.12.09.22.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Aug 2016 09:22:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:21:04 -0400
Message-Id: <1471018864-18906-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-pymisp: Update to version 2.4.49
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
X-List-Received-Date: Fri, 12 Aug 2016 16:22:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc               | 6 +++---
 .../python/{python-pymisp_2.4.48.1.bb => python-pymisp_2.4.49.bb}   | 0
 .../python/{python3-pymisp_2.4.48.1.bb => python3-pymisp_2.4.49.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.48.1.bb => python-pymisp_2.4.49.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.48.1.bb => python3-pymisp_2.4.49.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index c49bf47..f80858e 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f64d66a9942f5e2de6c06b0dab2764b3"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=67a9496dcf5cf97af38edc77834fb4b9"
 PR = "r0"
 
-SRC_URI[md5sum] = "581ec9d30e15b537dcb203f0756aa136"
-SRC_URI[sha256sum] = "ba909f0d2186f10f59da383d9fccd20ce3d589b6ff243e7ea8a8ebbfce135f68"
+SRC_URI[md5sum] = "7cd8279f658899aabc606567b094896d"
+SRC_URI[sha256sum] = "45527078d48efc493f30c27d0dedc4143670b0cf85ecb8f2118c9c6463b1c86c"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.48.1.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.49.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.48.1.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.49.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.48.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.49.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.48.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.49.bb
-- 
1.9.1


