Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 12EDA74E1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 20:56:50 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id y20-v6so9048005qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ox5uQFDytPEAi/Lul1AyNhhgtz9McExqUuGEVJ9JEs8=;
	b=oXmxZ8sgesE46XetlL2gJyZE7SIiOBrFPrlQkUiouESwQu7S2pTQRxnWNx53gBJJje
	CE411f3NJsEGrPy3lqH+4siS8inaej36loThnb3Qq/d93xDe5bVpF27o4fKranLtCDuX
	W8M40HP7vTXuTX9io23Yhl8/VRPQ6I5gzgAAWdyAuQ3/nyrMrAi80ZTH3FSdVeEfA018
	9O+HtMLp9Ju1LtlY8DNKHoZxxuE3ATi3NyRD/iOfPNJEwZYD8Ln9vHH5FbL2NLUUyb1u
	Bqb6vBagXKadd1VU+dAj5y8smxC0egiO+cdZp2QkogAKE5ow/NKTqAcr3nko1J+YGX2I
	Jz8Q==
X-Gm-Message-State: APt69E1nCwOVv83D+ifdV5tMDy0yO44a/SPH6/DtArwJBkUfNtw2rvkJ
	d2+S/ljZpaWEg82AIMZyGed2dDFS
X-Google-Smtp-Source: AAOMgpe9Mv//15LZ5Yuwn2KN2X7D3xT1S1iEGCillasFg4QBBmVKe4PyXLpOt16ovhaR906ChyjxuQ==
X-Received: by 2002:a0c:d842:: with SMTP id
	i2-v6mr14942743qvj.77.1530305811721; 
	Fri, 29 Jun 2018 13:56:51 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	d14-v6sm6355957qtn.90.2018.06.29.13.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 13:56:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 16:56:44 -0400
Message-Id: <1530305804-11097-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.7.0
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
X-List-Received-Date: Fri, 29 Jun 2018 20:56:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.6.1.bb => python-pymongo_3.7.0.bb}       | 0
 .../python/{python3-pymongo_3.6.1.bb => python3-pymongo_3.7.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.6.1.bb => python-pymongo_3.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.6.1.bb => python3-pymongo_3.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index baf3dd5..02264e9 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "0d72c87fb93cea0759529befafefce54"
-SRC_URI[sha256sum] = "f7ebcb846962ee40374db2d9014a89bea9c983ae63c1877957c3a0a756974796"
+SRC_URI[md5sum] = "f493c23d4ee22255eb85288726907f95"
+SRC_URI[sha256sum] = "3327afb38017ac1de32e4ca3a6c8edb1fe19d6024771609590684d3a37e7c250"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.6.1.bb b/meta-python/recipes-devtools/python/python-pymongo_3.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.6.1.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.6.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.7.0.bb
-- 
2.7.4


