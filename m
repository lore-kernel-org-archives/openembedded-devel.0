Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF1160684
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 21:50:02 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a18-v6so16709163qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 14:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LRdmmW9Oxu5QNHqboh/JcfKuTlOWzvPBgMjavOCqi5I=;
	b=PIhOTzmaiJmGZ/6N4p+Vd0BxHhT3y7iUl2e0fmZy1Ik7c1y5PvTa0l9ZYIdqxu3tBA
	7CPOUZuQ7nRX6FT9UCs4wYb+xCaDO2lQzGcSOJmFPmaTM93jZU04tFoT3F7B6EvssfYe
	r6ix9mTwBsEvlFABf1aAZEiDbLaD9rSSlEL36s6t1e8oeFHfg5GIPOKk7KRKkKnBT1iC
	OdL2lzFv2/0emha5QRlOVSwnVbLGki9SXScLSLQ89evFXcb4t0YOUDOsWp2r26GarQCS
	TItIp2uLDxENNVkdoQaiLaeBwaCBVMRyP+j+8IYIZ3YvXTMFn0lDb2QL7GS6vqYXluKi
	N1hw==
X-Gm-Message-State: APt69E0CYvsposKrBtLy9AFTIyjT4WgqYcJQC8cnF/O664em4epH2iYR
	Tbh5AtDPbjKy3Z2/+288HwdwS0aV
X-Google-Smtp-Source: AAOMgpc/t8QQwmjekyMK7DTSzeGwr8FP8n2BR2sFYnHCj6jMbrAqgpL+pvo/GY7LKTDp9XxlxO+rEA==
X-Received: by 2002:a0c:f1d4:: with SMTP id
	u20-v6mr19483586qvl.124.1531173002661; 
	Mon, 09 Jul 2018 14:50:02 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	w64-v6sm1067743qkd.27.2018.07.09.14.50.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 14:50:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 17:49:44 -0400
Message-Id: <1531172984-16299-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-cassandra-driver: update to version 3.14.0
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
X-List-Received-Date: Mon, 09 Jul 2018 21:50:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc       | 4 ++--
 ...-cassandra-driver_3.13.0.bb => python3-cassandra-driver_3.14.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.13.0.bb => python3-cassandra-driver_3.14.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index 1648d3e..1cc1f4c 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "5c8b4a3adfc48180e8ec38b8c4e996fd"
-SRC_URI[sha256sum] = "61b670fb2ba95d51d91fa7b589aae3666df494713f5d1ed78bb5c510778d77f0"
+SRC_URI[md5sum] = "c5bed026bf48c821424c1f6296193908"
+SRC_URI[sha256sum] = "b65218e2582277f5b77d1436e420db8616f63e3437a9e839cdcd7172d760e861"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.13.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.13.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
-- 
2.7.4


