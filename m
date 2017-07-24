Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2718782A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:26:40 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id t2so10673059qkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vaVftxTvwTSlA4c+JgnciJMeaigh7UmgKlCWZjTp5VM=;
	b=q/DMTrpNzcQMY/1llfnlWO+2NisY9xLc3xOh1D2wjAe1DnWMOhdvbs4A38dfTc19Fn
	VpieFiZzKpPjmJMVONZq0f7ajSAKjhoBWUaaRBdMVfQoNAFh8vbe8+1akMyseC02FGM0
	NIvYUrKKmISEQRVu1O8v4+RzSewLSpbmQR9QFwlgdbFll83nv+Rb5S1hcvKdX73ymwrt
	vAS83pgxMeoOKL6rI7rqzzNhAUe0agBzmrTnv/jQDecDyFbN4CUjIAKb2oBcUAV9QxZI
	5Us3xIsG2zHdDIOQppNo+h0s1EN2q4FsOKhjG3/oFBmp1xU5ejNe8eFG28y9rBRs4EbM
	DDjQ==
X-Gm-Message-State: AIVw110odEQOdVPYiYps52TKOJBSpoY2hxwXgD2+sY2KFaxEuuMSjqdE
	32y6kODnH465nrmD1ts=
X-Received: by 10.55.198.132 with SMTP id s4mr19849381qkl.280.1500920801805;
	Mon, 24 Jul 2017 11:26:41 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	x125sm8290375qkc.87.2017.07.24.11.26.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:26:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:26:34 -0400
Message-Id: <1500920794-15071-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-simplejson: update to version 3.11.1
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
X-List-Received-Date: Mon, 24 Jul 2017 18:26:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-simplejson.inc             | 4 ++--
 .../{python-simplejson_3.10.0.bb => python-simplejson_3.11.1.bb}      | 0
 .../{python3-simplejson_3.10.0.bb => python3-simplejson_3.11.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-simplejson_3.10.0.bb => python-simplejson_3.11.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.10.0.bb => python3-simplejson_3.11.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index 2eed199..13c0456 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "426a9631d22851a7a970b1a677368b15"
-SRC_URI[sha256sum] = "953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2"
+SRC_URI[md5sum] = "6e2f1bd5fb0a926facf5d89d217a7183"
+SRC_URI[sha256sum] = "01a22d49ddd9a168b136f26cac87d9a335660ce07aa5c630b8e3607d6f4325e7"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.10.0.bb b/meta-python/recipes-devtools/python/python-simplejson_3.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-simplejson_3.10.0.bb
rename to meta-python/recipes-devtools/python/python-simplejson_3.11.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.10.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.11.1.bb
-- 
2.7.4


