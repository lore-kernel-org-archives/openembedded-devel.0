Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF4678296
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 14:23:46 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id r39so2229841qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 06:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ex6msS2gaUB4z8d4rYN1DBZYJnV7zUHiuFMe1hAiunE=;
	b=G/y9/goxhz76AM9TfjKDSBzHdNlW+mo/5L9gMq/A2d0ecY2jpq5jWulKfb7bYHACLD
	7C8JNsthyf1ahg5ytYLByx50T42AphMYYWH1CfgnWzGhTwUTsxLT3kuf4Loqxqwc8Z3e
	COQ3ounQXs3bH0B6R7yt0Cikv1GmmjqSb9HdGpl4HxX869U8Sibe0wxOxsi2ON5pueG0
	P9/l6JOCkFyOaesz+JdKyoSliJU47uy4L2upDbbB/78IjkNHd11X1uyVFHTTodIxXQm+
	9RHvBZb+QmZhzqCTh+w5eatTW6+sED+NaCx5bUqPTOGksxQF1bmcrIJSrVex0eRPYeyD
	c0+g==
X-Gm-Message-State: AKGB3mJKtHZnwutbacXmFdivRXWEwlz8fi169WCLfAM0sgfwnIKFVAu8
	TtTdf9rXUmoIr4VsZCYctzcJ5Fao
X-Google-Smtp-Source: ACJfBot5fcgNKxR1vfg2DNnOGdcSaCuJfnBMBWbxYAIKqTamxDP07uANnfDqBrZnQ2r4IJzpCZ2ZOw==
X-Received: by 10.200.3.65 with SMTP id w1mr1910068qtg.297.1514989427725;
	Wed, 03 Jan 2018 06:23:47 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id n81sm664788qki.87.2018.01.03.06.23.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 06:23:47 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 09:23:41 -0500
Message-Id: <1514989421-15276-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-protobuf: update to version 3.5.1
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
X-List-Received-Date: Wed, 03 Jan 2018 14:23:47 -0000

Add RDEPENDS to work on minimal python and don't pull in python-six in python3

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-protobuf.inc | 17 +++++++++++++----
 ...ython-protobuf_3.4.0.bb => python-protobuf_3.5.1.bb} |  0
 ...hon3-protobuf_3.4.0.bb => python3-protobuf_3.5.1.bb} |  0
 3 files changed, 13 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.4.0.bb => python-protobuf_3.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.4.0.bb => python3-protobuf_3.5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 2f59ef9..07346d3 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -2,15 +2,24 @@ DESCRIPTION = "Protocol Buffers"
 HOMEPAGE = "https://developers.google.com/protocol-buffers/"
 SECTION = "devel/python"
 
-RDEPENDS_${PN} = "python-six"
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
 
 inherit pypi
 
-SRC_URI[md5sum] = "bfc0c61c156a995e909521697e755780"
-SRC_URI[sha256sum] = "ef02609ef445987976a3a26bff77119c518e0915c96661c3a3b17856d0ef6374"
+SRC_URI[md5sum] = "27b52592aab674f96a1762d66d48a57c"
+SRC_URI[sha256sum] = "95b78959572de7d7fafa3acb718ed71f482932ddddddbd29ba8319c10639d863"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-unittest \
+"
 
 # For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.4.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.5.1.bb
-- 
2.7.4


