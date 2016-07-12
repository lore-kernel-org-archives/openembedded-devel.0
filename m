Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id A070C731A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 02:39:07 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id l125so148802ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 19:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P90z94W3c3qZeEDOGau/wdscQYFZJT8/5/pu5EXbR9I=;
	b=hTEU9Eai7pD1bRAWaXHzA1FgrkNbcuwiJhsQy0Zr1k6EdJy/stLSbXQjThZDKX29Jl
	PIehPTShM6h6VCN0WeHHG18rtOzlAUZsE7x0FPr03A32x9t/jzIzHfn37ncqhKxlJfry
	RdtPwSwpkTB2XT9hhX2ZRagk/8xAip9xdIX1sM5Wq4rPVW2J9mrrxvcwixXIcDOc/DEC
	PYjhrJG4YgdSFWDbnSwfEzBCmbsZeyJtYlMDT+jRfMWF5Ss5vXt2jxJCFWZ+ClRQaFB1
	WoDIZSQzItx7IL+Yu273kcOh1bdENpVEI8MqTY0YZeVF/iyGqububynY35klrSTs2u1E
	ZI+g==
X-Gm-Message-State: ALyK8tIOZ2zKI6y+yW5RPREramdB+J03eUyVjwlHDJscmWoDbphPWLv56K7nXy5bGx+bhw==
X-Received: by 10.37.118.130 with SMTP id r124mr14864514ybc.80.1468291148437; 
	Mon, 11 Jul 2016 19:39:08 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id
	i62sm1629912ywd.11.2016.07.11.19.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 19:39:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jul 2016 22:38:58 -0400
Message-Id: <1468291138-28152-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-werkzeug: update RDEPENDS to work for minimal python2.7 and python3
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
X-List-Received-Date: Tue, 12 Jul 2016 02:39:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-werkzeug.inc    | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index f6f75d0..73c3515 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -16,15 +16,17 @@ SRC_URI[sha256sum] = "cc64dafbacc716cdd42503cf6c44cb5a35576443d82f29f6829e5c4926
 PYPI_PACKAGE = "Werkzeug"
 
 RDEPENDS_${PN} += " \
-    python-difflib \
-    python-email \
-    python-html \
-    python-json \
-    python-netserver \
-    python-numbers \
-    python-pkgutil \
-    python-subprocess \
-    python-threading \
-    python-unixadmin \
-    python-zlib \
+    ${PYTHON_PN}-datetime \    
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-io \    
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-zlib \    
 "
-- 
1.9.1


