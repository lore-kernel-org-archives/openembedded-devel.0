Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2C13A74586
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 13:00:09 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o205so14923257qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 06:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7oAYwkvmkS39YbNdWSq3nvA+6zcd9csNQh9ddweBchg=;
	b=KumRXb8tweI1SET/jZyUfUtp6T5u6ysp6OL3zt7ZGkRSBwGxsKC3dVUnj/55xgLJ7K
	6lucaT54jjriWtL5C/0Oy5VUbjDZ3sMsn277ALtSrCYedDI8U4n40mFII3GL1VogZE/k
	WJQINd0nHTOBKUdRNQr6Xc8ldu99L2FLR0DD1uUKY7K7aXn1d8AXtcdbu5A39XpRUdBL
	yAgNjKT3Lj90UcewrRVKhyCkf5E/OvB4i+iZ/eqhgSK/Ux8nP3zKRfB71FLJVycx2Z56
	Gl/IW4UbcNukTxHP31ws8GaHGdB7HdHCiO0UUuwAWiTwaLJzamF3qCiBMgf3PyY7aPKS
	plQA==
X-Gm-Message-State: ALQs6tBEJW1c3iexc+eBxvQB2sxg8hwILUhkTmy6NRm8CUu8hnA2f6A9
	HkTmr8RrDKKRtRaQSTZ9f7c/tDAf
X-Google-Smtp-Source: AIpwx48jucEg7yoP7SRSvovuMFqAZsh6CkVDO6F2gekTB38mOsO4WySLc67QmogSSfrn5ly/BVNCEQ==
X-Received: by 10.55.214.131 with SMTP id p3mr5911981qkl.307.1522674010173;
	Mon, 02 Apr 2018 06:00:10 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id a12sm237360qtm.74.2018.04.02.06.00.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Apr 2018 06:00:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 08:59:54 -0400
Message-Id: <1522673994-3319-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dateutil: update to version 2.7.2
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
X-List-Received-Date: Mon, 02 Apr 2018 13:00:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc               | 4 ++--
 .../python/{python-dateutil_2.7.0.bb => python-dateutil_2.7.2.bb}     | 0
 .../python/{python3-dateutil_2.7.0.bb => python3-dateutil_2.7.2.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.7.0.bb => python-dateutil_2.7.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.7.0.bb => python3-dateutil_2.7.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 36cb43d..333b5e2 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 
-SRC_URI[md5sum] = "ba7d27d7788cc9dd04a07bd77203ffab"
-SRC_URI[sha256sum] = "8f95bb7e6edbb2456a51a1fb58c8dca942024b4f5844cae62c90aa88afe6e300"
+SRC_URI[md5sum] = "03a08c8bcf0a2b29f1cd21b9de4d12fb"
+SRC_URI[sha256sum] = "9d8074be4c993fbe4947878ce593052f71dac82932a677d49194d8ce9778002e"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.7.0.bb b/meta-python/recipes-devtools/python/python-dateutil_2.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.7.0.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.7.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.7.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.7.2.bb
-- 
2.7.4


