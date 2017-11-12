Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 04E27782CC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 15:14:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id p7so16995987qkd.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 07:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7yWh52kw3Va7PsQFS3xCEjEZSTkdfBTMGRVNn3V/Ad0=;
	b=HtXhhYU/girploo74virtxx9zlB1guBuht5ozKY4Z/hQZKt0N5S3u50UkkaPzgS3lm
	TPeOZAE2ttyYX+HvVAuNMdLEvMyHk98lUqufpSdOa4Icy3Dcqpp9955b1pcrKMqUwkJ+
	HNMkpVzjxBEeLNk7I+VqVHSsx7kHH2JWOX20Pg0yfMdn4c2Shg1dGy0WqW2Du9JN5S4Z
	+YtEwfT6Afkk5wrpfjyREbe6pKitgW0wwv6WeQs3ic1SRecbQhKYU8s3gBBSJ7AKVuT6
	TuMxAPB1my/LWQ0zdwwTZcz8zJiSEPbF/1InTfCz0Ul1OrwbCCJz0X89q4L90pWk4FuX
	AUtg==
X-Gm-Message-State: AJaThX5riX0f5xPNfoohjDwMqiXUdAx4mIbZM0oZ7Lcq/UybAd70hNMG
	iHnCNRZwS0yoS4uYL8RyEiUJXCvn
X-Google-Smtp-Source: AGs4zMZdjU7+WKk95sQZisUFv+xZZd1cY5R0ERrnFRv4z92anjSBH9GA+zL0L93704IVIxVZJkDEFA==
X-Received: by 10.55.20.105 with SMTP id e102mr10013237qkh.89.1510499674459;
	Sun, 12 Nov 2017 07:14:34 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y29sm9537983qtk.64.2017.11.12.07.14.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 07:14:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 10:14:21 -0500
Message-Id: <1510499661-15677-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-certifi: update to version 2017.11.5
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
X-List-Received-Date: Sun, 12 Nov 2017 15:14:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2017.7.27.1.bb => python-certifi_2017.11.5.bb}    | 0
 .../{python3-certifi_2017.7.27.1.bb => python3-certifi_2017.11.5.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2017.7.27.1.bb => python-certifi_2017.11.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2017.7.27.1.bb => python3-certifi_2017.11.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index e550f7e..97be1fb 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "48e8370da8b370a16e223ee9c7b6b063"
-SRC_URI[sha256sum] = "40523d2efb60523e113b44602298f0960e900388cf3bb6043f645cf57ea9e3f5"
+SRC_URI[md5sum] = "c15ac46ed1fe4b607ff3405928f9a992"
+SRC_URI[sha256sum] = "5ec74291ca1136b40f0379e1128ff80e866597e4e2c1e755739a913bbc3613c0"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2017.7.27.1.bb b/meta-python/recipes-devtools/python/python-certifi_2017.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2017.7.27.1.bb
rename to meta-python/recipes-devtools/python/python-certifi_2017.11.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2017.7.27.1.bb b/meta-python/recipes-devtools/python/python3-certifi_2017.11.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2017.7.27.1.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2017.11.5.bb
-- 
2.7.4


