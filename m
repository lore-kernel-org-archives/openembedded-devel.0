Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 91F5C719E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 23:58:08 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z50so32690721qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 16:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sHMXTW/V6yWbCid2tX8LUw/rDTZA5TOqqz34ubvlap0=;
	b=EuU0bkIF4FN9SYbjI+/VJUWAR1VDQKGQTh5+mj8n3BLtRr9xdxjp4mQBR89YnenWmw
	xToBBbnmcSYe0qqpC9mAVp5F0Uvxnz90a+HX6M3T3GyzaA/8OHVcqzpRA3dqZahOdMK1
	LsVseNeJ4oQNIvM6x13/f+hjdqc4AViXDePwcxeXmDTE0wzXsbcqphPpJQrWCcGWfhD1
	RF8kVa79JagFLMQoEuOIz7kQP9C0G4pGVx3WxbFelkXO1tzMud60gfjNNmS9tV2C5zkd
	oBWXxK4X/3URbc0g348CUeO4sLDL/MRyK6hDWJMFEfjmC1IthZPJAxfvhz3C2NZ0nCgO
	9iyA==
X-Gm-Message-State: AMCzsaW47OLEy0/wzQNM6J2+rfCJhsk0Ym/9fha1w+G7yN9syotqTdpk
	e64o/fzTd5/LMH4IVTY1KkA1j8vw
X-Google-Smtp-Source: ABhQp+TwipfnBc7wQJcQBQfV0JucoomShEFebh5y+owcZBho5X/JkZ9LRiprH0YLy/CBwkf5ECXaiA==
X-Received: by 10.200.63.100 with SMTP id w33mr15005688qtk.214.1508889489113; 
	Tue, 24 Oct 2017 16:58:09 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	d143sm1010579qkc.41.2017.10.24.16.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 16:58:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 19:57:59 -0400
Message-Id: <1508889479-18673-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bcrypt: update to version 3.1.4
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
X-List-Received-Date: Tue, 24 Oct 2017 23:58:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-bcrypt.inc                 | 4 ++--
 .../python/{python-bcrypt_3.1.3.bb => python-bcrypt_3.1.4.bb}         | 0
 .../python/{python3-bcrypt_3.1.3.bb => python3-bcrypt_3.1.4.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bcrypt_3.1.3.bb => python-bcrypt_3.1.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-bcrypt_3.1.3.bb => python3-bcrypt_3.1.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-bcrypt.inc b/meta-python/recipes-devtools/python/python-bcrypt.inc
index 667a3fb..1ea62a3 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt.inc
+++ b/meta-python/recipes-devtools/python/python-bcrypt.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
 
-SRC_URI[md5sum] = "20da8b40790caad99c4086dba533154b"
-SRC_URI[sha256sum] = "6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488"
+SRC_URI[md5sum] = "8408abc974446e64862a9742104e97b6"
+SRC_URI[sha256sum] = "67ed1a374c9155ec0840214ce804616de49c3df9c5bc66740687c1c9b1cd9e8d"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb
rename to meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.3.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-bcrypt_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-bcrypt_3.1.4.bb
-- 
2.7.4


