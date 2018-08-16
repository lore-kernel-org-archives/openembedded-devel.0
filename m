Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A5508792AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:39:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u12-v6so5273399wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nVLeinl+ZbQ7ttPq4RFqJ7aYm0aRFdF9saxvvE9s5js=;
	b=Xdex81EinuLLBCncfeZS5aG/xA5ecx8I0dmonJ3l27rvRj+thkkwcIUxJznV2jaPEj
	1yWjURXxCXh9+TNkYE1T5DsGK4Iv4TSOV0sG+LsElCaPXCKwKVSn4AQKTJtyH3X7PWXq
	U3+kTChGL69nRM79efEXpMB4KbVuKzoOF6u9Z70d3/LLq9yc3Vu7qSV1E1hxoOD7nLIC
	BXSq4PY4M9terzRL4obpTRFqTOVlugBiTLkhUqxedf+a8PbLOO+ESfml0G0aS+ac8R7Z
	3JHLdx2FDfak0f8xWXdJC2MxsheIXCml3QdJ4Njm3DmJZNSvWa9aks8oSOIByaNMx/M/
	zqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nVLeinl+ZbQ7ttPq4RFqJ7aYm0aRFdF9saxvvE9s5js=;
	b=LMq6hHUlMvvOh37CpPIxQisKBdz0eA6m2eNdvXurMu37sSlrgtXeqWFqWXtB89hOaf
	37mg6lhp2LygZ1CuE56hylDyiVHjKVpJYhaLk7JU4wJDQmV70tlFC8Qu3Bu7CyGPjAZE
	vh9J2OpWH/jHHRLpWUMmpK3+wdWPUzf864c+yOJF1LQJkNjJxjtXiPrEB+y/d+11atKO
	t6UKQuDUYN8Z8BDrWXlFoofH+RZB90cybt9z6ySjc6jyDWKAhzC41/nVHVQ2Xs3gWRM5
	PMIAKkNxtCKK5iTQ8CBQtIF9WPbHZiKWYwNQ/oPVKvfiam71ny/4YkzZmNk76XnmjN7D
	AXQA==
X-Gm-Message-State: AOUpUlGltZs+3U1uc5WrrjOrorjiiSACRPMZGKTlW+khdlvgEKMxWqK/
	hpdqjIHGTBDuip7TyDFPi/fP2Tjb
X-Google-Smtp-Source: AA+uWPxPH+6pmxbeXhh1YC5zorcBLY3FAeJgOquykYblHfP32dyOc6oLZc0rc4UQXPA4oVJnLjEmIg==
X-Received: by 2002:adf:e687:: with SMTP id
	r7-v6mr20436985wrm.35.1534451963168; 
	Thu, 16 Aug 2018 13:39:23 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i1-v6sm177329wrq.69.2018.08.16.13.39.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 13:39:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:39:18 +0000
Message-Id: <20180816203920.464-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816203920.464-1-Martin.Jansa@gmail.com>
References: <20180816203920.464-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 4/6] uw-imap: fix build with glibc-2.28
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
X-List-Received-Date: Thu, 16 Aug 2018 20:39:23 -0000

* fixes:
  ld: error: cannot find -lcrypt
  osdep.c:136: error: undefined reference to 'crypt'
  osdep.c:118: error: undefined reference to 'crypt'
  collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 91003f6e93..4c055e54ca 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl virtual/crypt"
 
 SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://quote_cctype.patch \
-- 
2.17.1


