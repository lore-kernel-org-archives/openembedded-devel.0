Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87F3C73180
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 17:51:29 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 11so753923qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 09:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=azNOzKXnZqUQTSUmIrtu7Pjf7m7qVclCCt+GeQF3pyA=;
	b=OefUMgI14s7bUrojhKJmqAOGb9O/Ez1jzA/20jhtZ1XEHNrJs1bP4+ORLg/Er3ond3
	ZB5e5ZSZcziU2mPCtJZwoshlI3yT1WwH3k2B+8X3gT/NdeJHpF95X/n7LoMn2gOxRHx0
	kcErPAhVAjEP85G1Q4gplBV0qapsSiPMl+pr55x9J5bs9St8CK/ZlRldCm25yUmi3B7M
	RJ+TBjSOtxKbLDEf6DGhsKiw2vli2W+Umz+ZtFS9VHEXMtO3j/NOcgrfemQhwYIlzgUp
	WWb1QOHb8HDo7wbA6/HfIRurHjYbRLoJDyF1vALgEbFTiKNGsFJMBiryDooxkpJ+AgWp
	YLsA==
X-Gm-Message-State: AIkVDXKapLscImES9+LeRMJTrJkil4YWRcGNlvHr7E608SMLEg1E+HkOMEyc7FIlnJvWrg==
X-Received: by 10.55.162.147 with SMTP id l141mr14185577qke.272.1486144289574; 
	Fri, 03 Feb 2017 09:51:29 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	v187sm7867764qkd.20.2017.02.03.09.51.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 09:51:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 12:51:17 -0500
Message-Id: <1486144277-7201-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486144277-7201-1-git-send-email-derek@asterius.io>
References: <1486144277-7201-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 3/3] python-requests: update to version 2.13.0
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
X-List-Received-Date: Fri, 03 Feb 2017 17:51:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-requests.inc               | 4 ++--
 .../python/{python-requests_2.12.0.bb => python-requests_2.13.0.bb}   | 0
 .../python/{python3-requests_2.12.0.bb => python3-requests_2.13.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.12.0.bb => python-requests_2.13.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.12.0.bb => python3-requests_2.13.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 9f851e4..b66f66e 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
 
-SRC_URI[md5sum] = "d0d3e5fb81c6b4d87c08ed5cad677337"
-SRC_URI[sha256sum] = "57b6c314a2c5f014dce634a0e1eeeb1707741b2e30bc7fee9c5b01fa216d57a3"
+SRC_URI[md5sum] = "921ec6b48f2ddafc8bb6160957baf444"
+SRC_URI[sha256sum] = "5722cd09762faa01276230270ff16af7acf7c5c45d623868d9ba116f15791ce8"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-email \
diff --git a/meta-python/recipes-devtools/python/python-requests_2.12.0.bb b/meta-python/recipes-devtools/python/python-requests_2.13.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.12.0.bb
rename to meta-python/recipes-devtools/python/python-requests_2.13.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.12.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
-- 
2.7.4


