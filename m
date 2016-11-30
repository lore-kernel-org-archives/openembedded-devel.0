Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id F24A671ADC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:14:01 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id m48so20777166qta.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3P0GZrGLx+fVkI7Nym/8bxSeG5M/FSWLV+lZRuhwsOY=;
	b=SHc/5Gu9ZvL1FGHwWmvFa3F6fDa1WBpBIaMvRP9RfTw6JF8qdpqs/y51pgthDngdSN
	4m4awOIO00tQYEat2Pinqnp8JwVNzyEOsnBEf9oY8UHu4OY8x37e2P1hAxktdptQOueY
	IKCIw7Oz1iDSpwpkWnfR79wAOXO0W4lPLy8QFFKEsn+3ZjTgpmXMw/8g939Hf/otcWm6
	aXemZUxQ6JpLgvUHBmxZ8BtrdN69PUcHu9BwPtpMCUOigmoPIzG/2SWXOumU3rIgUdfP
	cJzmtQMwLe3f/0dz87EXAlmQMmNe7pjLr7OQsMYkMY1MwGyl8EZBn93ttw8gSaeHhbve
	xYwg==
X-Gm-Message-State: AKaTC03eepPTY4fBOZkqji2RlZFZa8iiDWIiVMXxACS8SCGjCyIb0I9SLMCmQMnFvlqYqg==
X-Received: by 10.237.53.102 with SMTP id b35mr33448355qte.266.1480533242852; 
	Wed, 30 Nov 2016 11:14:02 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	x127sm18157878qkd.37.2016.11.30.11.14.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 11:14:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 14:13:55 -0500
Message-Id: <1480533235-27786-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480533235-27786-1-git-send-email-derek@asterius.io>
References: <1480533235-27786-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography: update to version 1.6
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
X-List-Received-Date: Wed, 30 Nov 2016 19:14:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-cryptography.inc     | 17 +++++++++++++----
 ...n-cryptography_1.4.bb => python-cryptography_1.6.bb} |  7 ++++++-
 ...-cryptography_1.4.bb => python3-cryptography_1.6.bb} |  0
 3 files changed, 19 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_1.4.bb => python-cryptography_1.6.bb} (72%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_1.4.bb => python3-cryptography_1.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index d4767b1..50483bd 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1f375ab4f6b9a7c9eec25377c52d3aa1"
 
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
@@ -9,18 +9,27 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "a9763e3831cc7cdb402c028fac1ceb39"
-SRC_URI[sha256sum] = "bb149540ed90c4b2171bf694fe6991d6331bc149ae623c8ff419324f4222d128"
+SRC_URI[md5sum] = "33ed393be75f04cd889a02a11acbab39"
+SRC_URI[sha256sum] = "4d0d86d2c8d3fc89133c3fa0d164a688a458b6663ab6fa965c80d6c2cdaf9b3f"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pyasn1 \
     ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
+"
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_1.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-cryptography_1.4.bb
rename to meta-python/recipes-devtools/python/python-cryptography_1.6.bb
index b05c615..f5b1e0b 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.4.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.6.bb
@@ -10,7 +10,12 @@ DEPENDS += " \
 "
 
 RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-contextlib \
     ${PYTHON_PN}-enum34 \
     ${PYTHON_PN}-ipaddress \
 "
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-enum34 \
+    ${PYTHON_PN}-ipaddress \
+    ${PYTHON_PN}-contextlib \
+"
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography_1.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_1.4.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_1.6.bb
-- 
2.7.4


