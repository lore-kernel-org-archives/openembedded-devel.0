Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id DA9A560103
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 20:51:04 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c15-v6so22711945qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 13:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xaRhfMb7sx8MmLdZWI7dN84PciWyuELueatlosAT2W0=;
	b=GOKSd9jQEgL8cbW26sCQ/tLCf6PmgOKWFLUzq0UT6gD2fduDjSvFjIF6hbH4lD6koF
	+BEcb8+XjTGu5x75I6AbJ4xUT/jgTEAwis5ite9VKsl+uDKt5TFdcdnwPEDZabUxQyw9
	ApWc20mKAYE4OsL7Z7aK0P/i9GKLSZ3Qk6QxvpaJucS/4CxdjdKer6idngqutOEFeFtA
	qdcxcaLKRA4aiLQjVaPVQBjttBLd8WDpG8M/dg75YMQqNp4hS1FlEyHp1Q3GxoENog+z
	pcGSThWUSjIM75hV1c1TtzWKpQA80I2K5DBCCHj1cya//9y+cKVCUSrfjmmZSRUdK1Q2
	fJTA==
X-Gm-Message-State: AOUpUlH/708leAKx5HXIx1dAky9RF8AxeUaEdbutduRAjevvu2Cnruna
	cSOHDaOx/zmtQl3PWnSm5Es2bBJxFu8=
X-Google-Smtp-Source: AA+uWPzkE88B08K3YJZX0fsNqGqq4OFqnpeA6nqxAcWW/vXM04IBHiwj/sIJ/SJISDHh5Eh4jSqqhg==
X-Received: by 2002:a0c:ad3a:: with SMTP id
	u55-v6mr20656167qvc.132.1534279865465; 
	Tue, 14 Aug 2018 13:51:05 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	t11-v6sm14289948qtc.2.2018.08.14.13.51.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 13:51:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 16:50:57 -0400
Message-Id: <1534279857-12829-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-certifi: update to version 2018.8.13
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
X-List-Received-Date: Tue, 14 Aug 2018 20:51:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2018.4.16.bb => python-certifi_2018.8.13.bb}      | 0
 .../{python3-certifi_2018.4.16.bb => python3-certifi_2018.8.13.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2018.4.16.bb => python-certifi_2018.8.13.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2018.4.16.bb => python3-certifi_2018.8.13.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index a930ff9..c7955c5 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[sha256sum] = "13e698f54293db9f89122b0581843a782ad0934a4fe0172d2a980ba77fc61bb7"
-SRC_URI[md5sum] = "f5d81d0048e84285611412b0dea0630a"
+SRC_URI[md5sum] = "a84571995a209dcd00a1702a74302b88"
+SRC_URI[sha256sum] = "4c1d68a1408dd090d2f3a869aa94c3947cc1d967821d1ed303208c9f41f0f2f4"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2018.4.16.bb b/meta-python/recipes-devtools/python/python-certifi_2018.8.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2018.4.16.bb
rename to meta-python/recipes-devtools/python/python-certifi_2018.8.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2018.4.16.bb b/meta-python/recipes-devtools/python/python3-certifi_2018.8.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2018.4.16.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2018.8.13.bb
-- 
2.7.4


