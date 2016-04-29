Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8173D700F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 16:06:17 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id 90so28827072qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 09:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fkkGGXHGT0Toamo+CK9VHeVqRoEwBHPQAetpeiqVCzI=;
	b=JqVjSOH0fn/3CkNhEb4Fd4ZURwkrQSf/VpyyFoT+0QgbSkiyOqhgrSg+14Po5sPaSh
	uSSwtYKgfPV/Q2Tz3HM7oFPJQw3K8rHoCFpm8TUsI9K7GaX0/YNw52K85eIO1b/+OUso
	rLlfNp2tXLzjbAk/TFyT1LvOXJUVagzDLKcgHj+nMU3rluwqHqKIw8/7PyyCKBHuYVQp
	YcPAO5AlLCM+O200KWdWBIZ3WD4MCjZ0T92JTs1xyjXVHpfoFX9D9KRHkOnbn8esMGxG
	7402oDCUm7tIprmspc+jfXQ5mzI/ZwmQ9CofiJ3R2EZ2aSWX/ZOXnZiubAUk7vITkYjw
	1abg==
X-Gm-Message-State: AOPr4FXnCU9flTKVGaWtj7fDD+0idB8ZlS/Zt9Hn11a/fH/FFS+bZiY1Hb3dWn4wSY2t3w==
X-Received: by 10.140.36.231 with SMTP id p94mr19595677qgp.79.1461945977779;
	Fri, 29 Apr 2016 09:06:17 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 23sm4671350qkd.8.2016.04.29.09.06.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Apr 2016 09:06:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2016 12:05:52 -0400
Message-Id: <1461945952-10232-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] giflib: update to version 5.1.4
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
X-List-Received-Date: Fri, 29 Apr 2016 16:06:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/giflib/{giflib_4.1.6.bb => giflib_5.1.4.bb}  | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/giflib/{giflib_4.1.6.bb => giflib_5.1.4.bb} (67%)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
similarity index 67%
rename from meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
index e59d0e5..855a603 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
@@ -2,14 +2,12 @@ SUMMARY = "shared library for GIF images"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
 
 inherit autotools
 
-EXTRA_OECONF = "--disable-x11"
-
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${libdir}/libgif.so.*"
 FILES_${PN}-utils = "${bindir}"
@@ -18,5 +16,5 @@ BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}-utils = "perl"
 
-SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
-SRC_URI[sha256sum] = "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
+SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
+SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
-- 
1.9.1


