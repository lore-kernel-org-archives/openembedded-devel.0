Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id A38447BFB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 00:45:56 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id n2so2175396pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2019 16:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pfkTUvCuz/zv6RWix6n/0wOfSd1M1jooxYrHkIvreLM=;
	b=NLdVsgAEzFIWsec4i5ewCLMYEAvUymgFhzk8yC282ZFsPSpKHhVc/+7E8QHJCsszka
	O3Vnz1FN75kVuOmOPybeTGX7bpcHUYLN0D7zV3vAW8KR8rwuxdzd38t1o5m0/znOPrjW
	SCFEWqIKH4HFIC7oGmR3wEUHnD7qeAPY/1sfGVT7zmBFNDLcxn+fJR4NFuSTo/MYLZVK
	tH8SSjJxP4cvOnuMtarEYb5LfOqa9F7iFO1r9kaP3zYmBxU8U/S8rpbTGAt8BGaVf/Qn
	fud9GYfPcErN9Eduhg2k8s5KjLXFZIIflFQJk7FX4riT1UuQhKQa5HarQUYLhvPtRdw+
	XFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pfkTUvCuz/zv6RWix6n/0wOfSd1M1jooxYrHkIvreLM=;
	b=uUHZ5mY87raRQ5y+1+Y8PSSFM2VUUdQXySFdeHhJZTI+zwVKzB8CAjn+G1WkfY4pwQ
	YiBMjTdRnOXILSwaN83jLs5lmkokKqfqfG9ZAMvE72Ogjh+IHcX6T0Fm/ZEXNCpf32rG
	lKWKW4Ogv6+RDKqtP0SpTSw34DS/pkZ5Fj89Bn1kR9/7RDhssuqDLq9Ed4yfjZnsOAnS
	tL0KuuKGY/cSMFY9yCjtkDdx3Sfur+6nbydE7lioX1PUPCavWTaz0jV/IrDr2DVmjhL2
	XbqIhQchHDWhM7lSdYxq8dQTsbD6+YqIK2nno/kApb3h8j8NGPQ0l7sfNLH+WTEhMl50
	f3vw==
X-Gm-Message-State: AHQUAuYJbrKKMrUeSvhPLgqy6eIc39sn0hrsBgKUGZ4ceD+Gbv37uVFk
	9CwFIn3fG2R4UHzVbJhZoV3JPqAT
X-Google-Smtp-Source: AHgI3IZznWPXDLzeKLfUntD3rf8+PQ86l7FRklR/W5WxZOCWmoz4BUUQQSXW5Uusidzp0Nq5Bd7S8g==
X-Received: by 2002:a63:193:: with SMTP id 141mr7160236pgb.136.1549413957240; 
	Tue, 05 Feb 2019 16:45:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	l74sm7684098pfb.145.2019.02.05.16.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 16:45:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2019 16:45:44 -0800
Message-Id: <20190206004547.32351-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206004547.32351-1-raj.khem@gmail.com>
References: <20190206004547.32351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/6] rocksdb: Update to 5.18 branch ( 5.18.2 )
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
X-List-Received-Date: Wed, 06 Feb 2019 00:45:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index b7faa02bf2..ebe50a58ec 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "f438b98e552010613cff8684a7d84191ed785148"
-SRCBRANCH = "5.17.fb"
-PV = "5.17.2"
+SRCREV = "a1774dde9a5bd51bc6ece5988781c6f28cc69d48"
+SRCBRANCH = "5.18.fb"
+PV = "5.18.2"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
           "
-- 
2.20.1


