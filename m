Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2E65A758E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2015 22:46:23 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so23677944pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2015 15:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=y8A3RWItKufWQ1pE4imvMn2V3jVNt23emtmDfbReAFQ=;
	b=uTUkk8MHC1lOeV+owz8HTD78tnd9FTytos7UZH3RgLPQ3kDEudlCHpx+GPBaZBQ7lD
	y1R24u2wwAoAk3l9iLoNKYnQvWEGPrqlQg12VoE+rzHOJDdvkdIdjmM6ytxd8Gs5+zg+
	XUPEDXeaYGNxFqjG9qOKcxL00pDAwO7JXGMjMSpKGldHeX6ImPhr7Q/Q3iKLlTbuzprU
	SWYlgDf7hQmxEE68Pl68yV7LC9/xZdb2+d/loAbiRN4Opc2+i3s4ZS7AZU9EDcp2nKcw
	X4AzXsvraG6hK7b9+MXvfuxftSS+EXu9DGr75H0ya16gmsa3uBbrTj/2uxeWdDg48raC
	ddmw==
X-Received: by 10.70.91.136 with SMTP id ce8mr101003pdb.29.1433889984440;
	Tue, 09 Jun 2015 15:46:24 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ux4sm6573880pbc.61.2015.06.09.15.46.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 15:46:23 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jun 2015 15:46:16 -0700
Message-Id: <1433889976-14705-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libjpeg-turbo: update 1.4.0 -> 1.4.1
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
X-List-Received-Date: Tue, 09 Jun 2015 22:46:27 -0000

Also make minor cleanup of moving DEPENDS nearer to the top of the recipe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../jpeg/{libjpeg-turbo_8d+1.4.0.bb => libjpeg-turbo_8d+1.4.1.bb}  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/jpeg/{libjpeg-turbo_8d+1.4.0.bb => libjpeg-turbo_8d+1.4.1.bb} (90%)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
similarity index 90%
rename from meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
rename to meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
index 8e214c9..e79f800 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
@@ -7,11 +7,13 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e
                     file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
 "
 
+DEPENDS = "nasm-native"
+
 BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
-SRC_URI[md5sum] = "039153dabe61e1ac8d9323b5522b56b0"
-SRC_URI[sha256sum] = "d93ad8546b510244f863b39b4c0da0fa4c0d53a77b61a8a3880f258c232bbbee"
+SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
+SRC_URI[sha256sum] = "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
 
 S = "${WORKDIR}/${BPN}-${BASEPV}"
 
@@ -34,6 +36,5 @@ FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
 INSANE_SKIP_libturbojpeg = "dev-so"
 
 BBCLASSEXTEND = "native"
-DEPENDS = "nasm-native"
 
 LEAD_SONAME = "libjpeg.so.8"
-- 
1.9.1


