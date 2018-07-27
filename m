Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AAC2560064
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:41:22 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u21-v6so3808755qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QacVaZlwXmEa4syT+pyIG9wuqya7M9ko3U1+9g9bm44=;
	b=Ld9a8K3i+CPirooDaV1mS61q6OqVXzNZSr6EfY4RomO6ZAz0n/O21X/kAQtg/TnPg6
	kHdqtGsIMgvP1GoQh9PB9OhsvN4Q5VgZ8t2uQnsk/U4MyV4/AiQnJoxbOjWuEwJFpyJm
	TfBzQfYWUd2sUwMuoFWsYCIEUS0n9ziY9O98gabkyYcIzHL2LHrU2CipEoFKz9tXv8Ii
	QYdLTbTkEwcJuj6emA3M0zAMJIK5MO9tKD4LALad6nPu7CEk3Fn8r6tLWyBtxedmVdyF
	ODN/iFXx4LpmGGFUdRrPxRFBu55Xe7tdKtUcQtdDx73okiHFlcM5qXf7RMPMhsy16pzt
	BWtA==
X-Gm-Message-State: AOUpUlGurqO64/yfEO0hWPZjzGCBC+aStoSrvc898Ae1og+xyugCIYYJ
	W0aM4F/80c3kGFUDdl7+Ku45hmwQ8fo=
X-Google-Smtp-Source: AAOMgpdGXWfROpPPikUF4LHeOicKo1jO0beAg3kH/6JqRmE3mUW7Z2ZtO3A6EkM/5mPjpXPxCLT0Vw==
X-Received: by 2002:ae9:d885:: with SMTP id
	u127-v6mr6594534qkf.219.1532713283253; 
	Fri, 27 Jul 2018 10:41:23 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	z133-v6sm2759905qkb.91.2018.07.27.10.41.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 10:41:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 13:41:16 -0400
Message-Id: <1532713276-1765-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.7.1
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
X-List-Received-Date: Fri, 27 Jul 2018 17:41:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.7.0.bb => python-pymongo_3.7.1.bb}       | 0
 .../python/{python3-pymongo_3.7.0.bb => python3-pymongo_3.7.1.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.7.0.bb => python-pymongo_3.7.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.7.0.bb => python3-pymongo_3.7.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 02264e9..b5277f1 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "f493c23d4ee22255eb85288726907f95"
-SRC_URI[sha256sum] = "3327afb38017ac1de32e4ca3a6c8edb1fe19d6024771609590684d3a37e7c250"
+SRC_URI[md5sum] = "7449c81a6c32c3c8cb9bebebc848fded"
+SRC_URI[sha256sum] = "f14fb6c4058772a0d74d82874d3b89d7264d89b4ed7fa0413ea0ef8112b268b9"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.7.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.7.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.7.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.7.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.7.1.bb
-- 
2.7.4


