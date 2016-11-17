Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB6865C90
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 03:09:23 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id n34so13098312qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 19:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ENdN2nDNcrwdU1sEr9gOlmyDMXgFbhylPRs9ybq+cIc=;
	b=It8MANkzFVGHoJBnjVWOt+ZjYFSLW/lzupYlGJJ2zl+8qTDxNVymAbFX7O3OXPXOWI
	18YtHR9NM9lbLNEryjf5EYcKsQNiIbuDdr+iYPbCrBP8YGZziPNZ4MCnhDH7qHSAR7hw
	Eu6/tnpZ+rSP3ixFwgPLoZBUDAa7WJiR1SFhwROqAVhvY+spE4z1YD/2gu+gnOs0Sptc
	rzQKRCVpLqYoiMERh0sN9O1Uj+QmZm8f8KI8r5q4H0DMCIcSNd28yfh53LAlDYsgd1u/
	4sbj3Hi2PWR1+y3XlNVxV3MVkUO/rtNqjxu6PMgyzTGh1hUI6aKDBOFNC2X8ynykiBhj
	fXbQ==
X-Gm-Message-State: AKaTC02qRhgp7Oj1aV2T09HMnG2ENEWbo7anmh09Z9nvmKRW2sbGfGc7xQZzPGGYVgvYNA==
X-Received: by 10.200.39.230 with SMTP id x35mr458942qtx.259.1479352165108;
	Wed, 16 Nov 2016 19:09:25 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id y52sm494496qty.11.2016.11.16.19.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Nov 2016 19:09:24 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 22:09:15 -0500
Message-Id: <1479352155-15344-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-requests: update to version 2.12.0
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
X-List-Received-Date: Thu, 17 Nov 2016 03:09:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-requests.inc               | 4 ++--
 .../python/{python-requests_2.11.1.bb => python-requests_2.12.0.bb}   | 0
 .../python/{python3-requests_2.11.1.bb => python3-requests_2.12.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.11.1.bb => python-requests_2.12.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.11.1.bb => python3-requests_2.12.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 287078a..9f851e4 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
 
-SRC_URI[md5sum] = "ad5f9c47b5c5dfdb28363ad7546b0763"
-SRC_URI[sha256sum] = "5acf980358283faba0b897c73959cecf8b841205bb4b2ad3ef545f46eae1a133"
+SRC_URI[md5sum] = "d0d3e5fb81c6b4d87c08ed5cad677337"
+SRC_URI[sha256sum] = "57b6c314a2c5f014dce634a0e1eeeb1707741b2e30bc7fee9c5b01fa216d57a3"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-email \
diff --git a/meta-python/recipes-devtools/python/python-requests_2.11.1.bb b/meta-python/recipes-devtools/python/python-requests_2.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.11.1.bb
rename to meta-python/recipes-devtools/python/python-requests_2.12.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.11.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.12.0.bb
-- 
2.7.4


