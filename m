Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAD7722E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:52:18 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id r2so4525522igi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 16:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U8hH3RTnNFbhMew8xIzQIZuFL83oyfVEHEv+KSU3amY=;
	b=BWBL3uJeHAmsTjGXjdVau/wWJznss8jQ8b6LTQ1PSmv8lg9m+Rj39Stm3hGnwK2+Sf
	i2l2oikSDyjN3qrQ0ZpT3aEpVFeP7ef67mT1e59Ik25Psw2UUly/bYduchLKu4FEPF7B
	g8lowszvSM/DxwYKqCxOXmO4tbi+qTXv8OFjquVXjXOh8yDr8+xFmUaaUHQGXbqipnaI
	7rwua/o6xlKVNdHP0OyyEvWetj9B0aW0EyO//s5gwQo/aW77mSgz/AVZVKkHitvDeKAK
	a6zeoAoP4siG4sHAbGYOgd8Z+wj3OLHN9jlhhMnN9ce1q/qoKkqhvC6s+Sjvn6I/wB74
	3ioA==
X-Received: by 10.50.178.143 with SMTP id cy15mr1653298igc.8.1421196738047;
	Tue, 13 Jan 2015 16:52:18 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	l14sm11227125ioi.31.2015.01.13.16.52.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jan 2015 16:52:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jan 2015 16:52:09 -0800
Message-Id: <1421196729-31411-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] libjpeg-turbo: update 1.3.1 -> 1.4.0
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
X-List-Received-Date: Wed, 14 Jan 2015 00:52:26 -0000

The LIC_FILES_CHKSUM updates are needed to account for minor
formatting changes and the addition of 2014 to copyright notices.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../{libjpeg-turbo_8d+1.3.1.bb => libjpeg-turbo_8d+1.4.0.bb}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/jpeg/{libjpeg-turbo_8d+1.3.1.bb => libjpeg-turbo_8d+1.4.0.bb} (72%)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
similarity index 72%
rename from meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
rename to meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
index 6a09fda..8e214c9 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
@@ -2,16 +2,16 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
-                    file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
-                    file://djpeg.c;endline=9;md5=7629c51aed78174711c20a40194a8f1b \
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
+                    file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
+                    file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
 "
 
 BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
-SRC_URI[md5sum] = "2c3a68129dac443a72815ff5bb374b05"
-SRC_URI[sha256sum] = "c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc7ea50d6be9666fb9"
+SRC_URI[md5sum] = "039153dabe61e1ac8d9323b5522b56b0"
+SRC_URI[sha256sum] = "d93ad8546b510244f863b39b4c0da0fa4c0d53a77b61a8a3880f258c232bbbee"
 
 S = "${WORKDIR}/${BPN}-${BASEPV}"
 
-- 
1.9.1


