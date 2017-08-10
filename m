Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACA877F70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:03:21 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d10so7422358qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LpHuzF6lZI1y5/+5Vd3qPo7+K+woWO67P95kplvmsGE=;
	b=MmL2AosAhkdeMCr4in30tUWFv1JRmtOfteH14XAjC4G1yJuohVI1tzeGnYult/YCBh
	bflpZtuLRUCthUCTN+dfNYpmvM3KA8t7pgmvMEO9ZYo4EAiiHjgSkJRbt/G20o2zJeE2
	bMWrvZ6rhfJOQImU3aXxdntVoBRXrA27bylaBNJYwu/+YxO4H4lJGyTCSZa5KzJgsiAm
	DBz/4MjjPc022Im/2gs4tRF5zBrghjBN/bMoVcG3WdYFfTLvtgkaGyDxzISGThEEmCCQ
	5Lt4pkv4gLBStN99pRTkjffEgHT3qHp6DcKaQz4UYMkQJqVf3DvRD2wO6EKZBb24IW6M
	3uRA==
X-Gm-Message-State: AHYfb5hvBA2zdRakxMqqrFlEPgaZBf2K8mRPBEAtkzTvAaQsayetT5Na
	rHFnFskuGqr9awmzcUU=
X-Received: by 10.200.51.133 with SMTP id c5mr14340563qtb.51.1502327003052;
	Wed, 09 Aug 2017 18:03:23 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	a48sm3035568qtb.59.2017.08.09.18.03.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:03:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:03:14 -0400
Message-Id: <1502326994-31793-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-certifi: update to version 2017.7.27.1
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
X-List-Received-Date: Thu, 10 Aug 2017 01:03:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2017.4.17.bb => python-certifi_2017.7.27.1.bb}    | 0
 .../{python3-certifi_2017.4.17.bb => python3-certifi_2017.7.27.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2017.4.17.bb => python-certifi_2017.7.27.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2017.4.17.bb => python3-certifi_2017.7.27.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 0318f7f..e550f7e 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "db40445044feda1437ce3ccd5fc28a57"
-SRC_URI[sha256sum] = "f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a"
+SRC_URI[md5sum] = "48e8370da8b370a16e223ee9c7b6b063"
+SRC_URI[sha256sum] = "40523d2efb60523e113b44602298f0960e900388cf3bb6043f645cf57ea9e3f5"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2017.4.17.bb b/meta-python/recipes-devtools/python/python-certifi_2017.7.27.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2017.4.17.bb
rename to meta-python/recipes-devtools/python/python-certifi_2017.7.27.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2017.4.17.bb b/meta-python/recipes-devtools/python/python3-certifi_2017.7.27.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2017.4.17.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2017.7.27.1.bb
-- 
2.7.4


