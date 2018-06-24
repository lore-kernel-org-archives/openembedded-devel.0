Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D32274EB2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id x23-v6so1500699pfn.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fne/ZJonzm/GKoXx5wOTOwiaADH5dYNfQ8B7sqkOgag=;
	b=rSLjKejVsaK7OsKAOtNnzXkhSSFBl+r/nA6UuObehkepiE+ogQ0Ha32sFTr1bJ8yMP
	QjkyG9IOsGsQ4NDdFBkzsCtht74SU2tmgNSIIg251nNLtBv3+IQfw6ZYXv6uZr9nZjM9
	WCXmfzUsOkvdYBswJSfJgkVHd9ov1u+Dc4dzl1H0VCLB2TSbSKv2GaEq1Enwc8LyQl/u
	9fVw2vYSvriG7Thr517fnmHFuI4KbzJWazbZhjz7gnG7/C2Vj/m1+PAlzJ08PR8UHT/y
	kuAwotvkmWVLXRsQXU5XN8Bih2gjgB3xvGmdwRmzMDEijbh7Tx7cviiiElcPISHiKuPG
	Zd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fne/ZJonzm/GKoXx5wOTOwiaADH5dYNfQ8B7sqkOgag=;
	b=Ke36hG2GT7VD5AP1r+yVYh8RegfvkYs9iQThX9c0qwqQ8IPlbLs6VIm2DixgQAMueT
	RAAgngHAJDB2z7uogPb6X5D0FG1xjDnsLUomU1Rb8TwqTLfmC3+7+zCskMcQkoXVhKVE
	rBlvhu36Pr4hExM+vO/uuZUyMDeMO89a73QhGwJ/0Pvu+zyaiMYmLEiNiONedd2g6Vy/
	k+wsP0w8PUNVvoLvUx1nOdGHrhtlu1C/Fs+QlHiTr9BbSh15qo41OMGDbM/8I6Ha1Tj+
	mq4gsUeu/kjjvhlp0t0TDZl5dCoWkswll2CyZ//8RTIOuHsKnnTcmjgN6/GfKwln77Ws
	+RrA==
X-Gm-Message-State: APt69E3+L6Y/qkpDgRYBqWOZu6WZy9+AjtAHU2Qo2/wINOlc9bHy8Sqt
	OsLjRPx6R1mD2UZizY31eYQO9A==
X-Google-Smtp-Source: ADUXVKLtixQsd9a3R4Gqhrg2iimWEd9xBuvZtA27IY8JGTZtQQpJOaT9vy68ksE1IoiDQwicAWTodA==
X-Received: by 2002:a65:6103:: with SMTP id
	z3-v6mr8252194pgu.125.1529867982906; 
	Sun, 24 Jun 2018 12:19:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:38 -0700
Message-Id: <20180624191845.31082-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Cc: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Subject: [meta-python][PATCH 13/20] python-cryptography-vectors: 2.1.4 -> 2.2
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:42 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade python-cryptography-vectors from 2.1.4 to 2.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...hy-vectors_2.1.4.bb => python-cryptography-vectors_2.2.bb} | 0
 ...y-vectors_2.1.4.bb => python3-cryptography-vectors_2.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.1.4.bb => python-cryptography-vectors_2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.1.4.bb => python3-cryptography-vectors_2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 00bb87b0c8..31461ecf48 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "ef115b870cc8d8b9f0f4189b512bc170"
-SRC_URI[sha256sum] = "78c4b4f3f84853ea5d038e2f53d355229dd8119fe9cf949c3e497c85c760a5ca"
+SRC_URI[md5sum] = "303a08ff50a5590d0ba05252981417ee"
+SRC_URI[sha256sum] = "cf601c7d87ad6a938bcea29062375dce1d3e26dabd1db52bbc37eeaf4aac970d"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.bb
-- 
2.18.0


