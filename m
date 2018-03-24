Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7D978744
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 14:18:25 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s188so15861180qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 07:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZOn9k2sHV3ychBHtkP1QnTpgd/kV2A93cjQgMR9HF5A=;
	b=XGSuh6tStOBtvbN9apnRIZnkhwgmp2pTT9dZ8SC6Y3i+cGUZHRDqo2vNxpfJFpN0gQ
	PfVrLsKAGOUinqrdGfCPT1ukI+m+iQdgksMbeG9UxOADK0Fq9Jit1NzWcI8vYRZ4sZ+8
	ljH9nVSLhnbSgopA3XSBPC3psOkPUYtM60LPcqnQmgb8BIkoRSwSoxFtf29d2L0LVz34
	B+Qk21hPWHxcBxu6PorPUfB6Lmph72JuuZHVUxB1Y43Rniw6Pptq3E9lAhlFQBvxFI5d
	yJMfxlcL26MXScZG/NOcRtxW+8PxI3a3EtPLNnMELrAe7ZPRlpCaaCjJTp2CRRwnr4oI
	ACcg==
X-Gm-Message-State: AElRT7H/8ORfxJuxK/ulBzFEl4XAe3UqbW0GT+OFZIYIR8WilgJdGvy0
	smLRiur3aPF2RvSPagRH8m29BaPL
X-Google-Smtp-Source: AIpwx49+sdCm3lXRKlDDGU+bNRqu0uOzm8kCwk5qWhoz3iDGJLApx9vbKvn2ujLQOEAAVwheLGt8FA==
X-Received: by 10.55.86.195 with SMTP id k186mr1074186qkb.0.1521901105576;
	Sat, 24 Mar 2018 07:18:25 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 61sm8067155qtc.49.2018.03.24.07.18.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 07:18:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 10:18:13 -0400
Message-Id: <1521901093-23282-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521901093-23282-1-git-send-email-derek@asterius.io>
References: <1521901093-23282-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography-vectors: update to version 2.2.1
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
X-List-Received-Date: Sat, 24 Mar 2018 14:18:26 -0000

License-Update: Update copyright year and verifed terms remain unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc         | 6 +++---
 .../{python-cryptography_2.1.4.bb => python-cryptography_2.2.1.bb}  | 0
 ...{python3-cryptography_2.1.4.bb => python3-cryptography_2.2.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.1.4.bb => python-cryptography_2.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.1.4.bb => python3-cryptography_2.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 4be7907..54179e9 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 HOMEPAGE = "https://cryptography.io/"
 LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d5ede125ed08d4fd14ec44d334bdb388"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
@@ -10,8 +10,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "9f39d4d8f2b05f295fa0ff52475ec4f2"
-SRC_URI[sha256sum] = "e4d967371c5b6b2e67855066471d844c5d52d210c36c28d49a8507b96e2c5291"
+SRC_URI[md5sum] = "de76fc2cbcb772e572798fee438df2af"
+SRC_URI[sha256sum] = "dddad9d322a3f0867009ff9f25477b8f7c0bdbedf143704b384c9472f11cb2d3"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.2.1.bb
-- 
2.7.4


