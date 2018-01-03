Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 17554780FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 16:28:13 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d202so2172111qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 08:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=We1SEIRUPQHx4A8LgTvNqEVw4EmmDdkZhBoF2Wjud/Y=;
	b=Qh+gAQETBYaXfLItRNkFgp/2c8U9A5/tnvhUwC2JFF/3e14kznvGAbLkL3NIWKq3EC
	II/FW5WqL4i4yjrb+KAxnGhYK0qZytahXplXZfUnSW56TPyVsQrYqwlRP9alnbRneJfJ
	CkytW+I7FngEbHroi9ZBk0WuSQgGO1Rsg6Y5dab6XeAbTvPCDfCwxRLm1NseYcu7PYjS
	M/qaLjmDGBIhhqtwhEywlqerxA2Qb/8Xe38CUC/t7ibeN8DouENNYf1xenyvZ+tlM1ra
	zp4abz3hXnqZ1r/aDMZfmkGcnzt5lIqRkGfQhYXk0ZbuMLpCxOrYXziRVwL2RqRUd0UZ
	/vIw==
X-Gm-Message-State: AKGB3mJVeTy5W36ypIIS08mKmglYh45fYMCTwn1FOfdMjN+TLLOO7sFJ
	YWpc30QQRcKuRCCoBHCIttvKW8JK
X-Google-Smtp-Source: ACJfBotzcHUSd5btSL3XBvSzgP2OJ1O8hi6Tyt5f0SEOPd/JCAsgHg7icIGtZbfXKIHHF9oIWDU4hw==
X-Received: by 10.55.3.14 with SMTP id 14mr2263316qkd.234.1514996894685;
	Wed, 03 Jan 2018 08:28:14 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id j40sm778515qtj.79.2018.01.03.08.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 08:28:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 11:28:08 -0500
Message-Id: <1514996888-29854-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pandas: update to version 0.22.0
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
X-List-Received-Date: Wed, 03 Jan 2018 16:28:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pandas.inc                 | 4 ++--
 .../python/{python-pandas_0.21.1.bb => python-pandas_0.22.0.bb}       | 0
 .../python/{python3-pandas_0.21.1.bb => python3-pandas_0.22.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pandas_0.21.1.bb => python-pandas_0.22.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pandas_0.21.1.bb => python3-pandas_0.22.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index 266f8b7..3a41e8b 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "42ae7f81b81a86c3f91f663b66c525f7"
-SRC_URI[sha256sum] = "c5f5cba88bf0659554c41c909e1f78139f6fce8fa9315a29a23692b38ff9788a"
+SRC_URI[md5sum] = "c7a2757b607748255f3270221ac61d59"
+SRC_URI[sha256sum] = "44a94091dd71f05922eec661638ec1a35f26d573c119aa2fad964f10a2880e6c"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.21.1.bb b/meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pandas_0.21.1.bb
rename to meta-python/recipes-devtools/python/python-pandas_0.22.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.21.1.bb b/meta-python/recipes-devtools/python/python3-pandas_0.22.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pandas_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_0.22.0.bb
-- 
2.7.4


