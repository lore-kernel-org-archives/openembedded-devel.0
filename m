Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA94077A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:37 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 70so1438325ita.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KpqmkWrNS5QkTkShQP6V83+FDp0TPJKxT8DsgnEhugE=;
	b=PeCUIfv7x16tnwgGbs5yBW2gAR2ZJyGRhrs1Sc5/hYW23o+4Rs7nOmaAC9Q3j1NpY2
	F/Y3MpYj7S6QofTOs1V9j6NbvpClj9bSvyRjwFreNJBGlfTmFIikUBOSpmHpJWstbKgw
	HPHOCW6iRd54ZCCnH7yIRJegM7qxQJbvDl9oBexVe677nJ/ngeEgXRDKAnnz/o5VuQ0g
	vD3cgVoIEZRkK3Fz46egUffN82W/D1VMxDEgcgc7nijyR8azw4hoTYLC69+nZCRewJS6
	vBbEDb0FRNm4QhY54r44/9yW3VHS/5Xr/4OKoa3oZp6ySwCGVFoHOT1kebXQY92umMcx
	Rk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KpqmkWrNS5QkTkShQP6V83+FDp0TPJKxT8DsgnEhugE=;
	b=XVoRp2LWE5TI58gALt9zsJQx4kYna+P4SttPM+W1tJJTrDMEWZdLTVwKKdAvZWiZuW
	3+Ji0UxH7DqIqXpes/Yb0Vq3GrbKLL+wR3PFptWzdnZlZYb5zfoC5jWzdQ5k4j26Mad9
	INHiiRE69iGpmko2HPWmwhgn/Vwub9LDhckG7jluKU+B+KDynM38qcbmTlLO87pxxt5I
	NgOgqKtUUWmlpMPUrU2iW1/ARjrhmiPG4U+1huzt0jDr5UCgFGbkXlzkDGWClzS3OhcB
	T7bZ/f6StgJXTcssR4CZ+fjO8qpp5WSwY2SqEV5sd4tf4gIBwe577x4wt99t2D8+QvD8
	X0Tw==
X-Gm-Message-State: AN3rC/7CPhZ29BYaqu6MovXfB72O0KmdP2Fhg5hJUYaFvRg/9CmNfvt+
	6eWHz7+K3FhrRQ==
X-Received: by 10.36.16.83 with SMTP id 80mr1714397ity.65.1493092058752;
	Mon, 24 Apr 2017 20:47:38 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:12 -0700
Message-Id: <20170425034719.8630-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-python][ 04/11] python-unidiff: Upgrade to 0.5.3
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python-unidiff_0.5.2.bb => python-unidiff_0.5.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-unidiff_0.5.2.bb => python-unidiff_0.5.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
rename to meta-python/recipes-devtools/python/python-unidiff_0.5.3.bb
index 3b018c750..6d40cca74 100644
--- a/meta-python/recipes-devtools/python/python-unidiff_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python-unidiff_0.5.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[md5sum] = "20dd70ba5a35bc95bf869322d6852227"
-SRC_URI[sha256sum] = "344330ec3637e96b44dca77e086b205645b55648cf4d2b80fc673200f8a6a7e9"
+SRC_URI[md5sum] = "31a61729e64ee409135a2ccec80c7104"
+SRC_URI[sha256sum] = "79b4be3e5479dfc6d77747d23ec98200559ca6a842fad1f92c2a7eb56b99195b"
 
 inherit  pypi setuptools
 
-- 
2.12.2


