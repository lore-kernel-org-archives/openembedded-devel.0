Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E22F460621
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 20:07:07 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 77so49520161ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 12:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=8hKREPmOUeTyVUchlF4i8oB6YVKKgAdRPnowkYK3Iok=;
	b=SbNvXftoITEsMH5S6GERN6BWfRBBY8ZhpHvtF1hKrevp+Pk3dUWJbSrrZUPJnK1j3R
	SRHe084jzWg/s7SKTGCGEtUo8CrTzZuhIuxdINc0p8iRAU2CGYc6RJ/pC4a6fTLClb95
	UlAkjAu2t/1JsWCrFXJVz8FNdu/fgc2+G30m2IRMQ91Z/FtZZEZDdYLSM0JuotvCTIzT
	I0sEYy3WTfI0TYc7fEjY5fjInI1c0bDBIha5aWUSyAEoPaiP81ePWhuifbAOTimXprFC
	kNc+k2ORr9yKhNzPyQsFXcji2y0kF32ip/kzZ8YyHBEqYtonICEN9eEcDT6x7Vl83Wcv
	Vz7Q==
X-Received: by 10.107.46.228 with SMTP id u97mr14568189iou.136.1451506028147; 
	Wed, 30 Dec 2015 12:07:08 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	ki7sm23244231igb.2.2015.12.30.12.07.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 12:07:07 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 15:06:57 -0500
Message-Id: <1451506017-6206-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [meta-oe][PATCH v2] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Wed, 30 Dec 2015 20:07:08 -0000

Additionally, the LICENSE file changed: Updated node LICENSE file with new npm
license:

- npm's license changed from being copyrighted "Isaac Z. Schlueter" to "npm,
  Inc. and Contributors"; more text was added clarifying the copyrights to
  things such as the npm logo, the typeface, and trademarks

- further text was added clarifying the separation between npm itself and the
  various npm packages, their data and licenses

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
index 66a3c11..18e23b7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=963ca39eebcb15ac618bc3006504ae3f"
 
 DEPENDS = "openssl"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "529a8abd4ca5a2225636767d3f14c382"
-SRC_URI[sha256sum] = "5008ade5feb4b089f59163f66bffddc113f27de5d78edf203e39435c2c5d554f"
+SRC_URI[md5sum] = "86e4d0d8b626f6e60ca7bef02f2543d2"
+SRC_URI[sha256sum] = "4ee244ffede7328d9fa24c3024787e71225b7abaac49fe2b30e68b27460c10ec"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.0.rc3


