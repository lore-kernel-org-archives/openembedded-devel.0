Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B5F467809C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:19:26 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x77so7258137qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3APkOwhp9kNa0q1d8yTTXBNGO484pGk27bOfa816q8Y=;
	b=KRZlyPWJ/bzyKj9QExNQqPLGHcRqIwQRxYmkeYzaR7hzZBL2n/U8kcf7KVLqfkJy6w
	em8aPIwHGFHVbmtChxOZbU9Yk6uNL5greQ0Nxyw6JV+Kd6SGySakdYBpB+oysBK3dsM6
	tN4y3jmMVwU3asMArupiXm5E+bBGQ+vhLSTeqwjPD2pWYMg6+nBfuEKfkP6JzYi0Rk96
	cRAOmGkh3OOeRtuTYRHeG5gndByu8E7/JncxjD4YRXKg5Fuya1TIEmkEq+Dml/YTLJP/
	xPx0g/+Z8EWlHZT7UEuNbZUErCRBqbtR51aJ4Rr5ENKx1dQipl/Yw1Aea2OvCvzhshN4
	92HQ==
X-Gm-Message-State: AHYfb5h2Y7Z/4YERObltNORlNqNFfn7d/HV2bS47kSiPtiOvuh8ebkU4
	FhHTWkWnWQDpFQn9V0U=
X-Received: by 10.55.33.77 with SMTP id h74mr13754111qkh.353.1502327967593;
	Wed, 09 Aug 2017 18:19:27 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	f55sm3087984qtc.18.2017.08.09.18.19.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:19:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:19:20 -0400
Message-Id: <1502327960-2404-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-iso8601: update to version 0.1.11
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
X-List-Received-Date: Thu, 10 Aug 2017 01:19:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-iso8601.inc                | 4 ++--
 .../python/{python-iso8601_0.1.11.bb => python-iso8601_0.1.12.bb}     | 0
 .../python/{python3-iso8601_0.1.11.bb => python3-iso8601_0.1.12.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-iso8601_0.1.11.bb => python-iso8601_0.1.12.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-iso8601_0.1.11.bb => python3-iso8601_0.1.12.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
index dd4b83c..05cd6d3 100644
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
+++ b/meta-python/recipes-devtools/python/python-iso8601.inc
@@ -2,7 +2,7 @@ SUMMARY = "Simple module to parse ISO 8601 dates"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 
-SRC_URI[md5sum] = "b06d11cd14a64096f907086044f0fe38"
-SRC_URI[sha256sum] = "e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30"
+SRC_URI[md5sum] = "4de940f691c5ea759fb254384c8ddcf6"
+SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb
rename to meta-python/recipes-devtools/python/python-iso8601_0.1.12.bb
diff --git a/meta-python/recipes-devtools/python/python3-iso8601_0.1.11.bb b/meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-iso8601_0.1.11.bb
rename to meta-python/recipes-devtools/python/python3-iso8601_0.1.12.bb
-- 
2.7.4


