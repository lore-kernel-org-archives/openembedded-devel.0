Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B04A771A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:03:36 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id 8so32733549qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 17:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LV2PD7pabwxvPJ+QkyPnl5PB1EDfwwstXLZx0YZ1zz4=;
	b=paHN847fMZA3MiEHwAEBSetDEHOTZ2+uXx6FSm+08T8iFR6Z25THnLNps748WPfY2H
	BQfgOHPTGKcorg24qo7NMYHpuAaFKinz1ZmNtCD6uYhkFKHr2LHTlDflNql+blUZPnsx
	UIrgExbTuwYnMnEQtoV7/DD2xIiK1WKvNvYdnf2Nq21gdN9/VLMp0pxzTVDbAhqiJ0BQ
	SOZzPygixE67zR6Egd5zEwnbIi9xMboqv3LsTQcFG3i74oi0uObRwzyb+SI6IMP/llWo
	iSSCItgWcxsqePscGb6eTw/hxS1tpN5zhZhG2qGIsXWANWHtcT0sTzPJpN6OHb+mLawC
	mZAA==
X-Gm-Message-State: AMCzsaVAtZ+oCAznAV21nSMmZaDC54RBJqAnqupoEvB8yubO8xroFW/+
	EdqJT1X7OtpPQgMVqPG1W9lhUUjT
X-Google-Smtp-Source: ABhQp+RnOaMf522pxYhd8yGFx5bwhvFVl3JwAlhEEImjaN27X3vMQiwbuRkOio/Ekg/G3W1yj9pTYQ==
X-Received: by 10.200.55.253 with SMTP id e58mr28187130qtc.234.1508889817262; 
	Tue, 24 Oct 2017 17:03:37 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	b45sm1109553qta.89.2017.10.24.17.03.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 17:03:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 20:03:29 -0400
Message-Id: <1508889809-23758-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.27.2
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
X-List-Received-Date: Wed, 25 Oct 2017 00:03:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.27.1.bb => python-cython_0.27.2.bb}       | 0
 .../python/{python3-cython_0.27.1.bb => python3-cython_0.27.2.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.27.1.bb => python-cython_0.27.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.27.1.bb => python3-cython_0.27.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 572cb96..f830557 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "b93750b34382b025d678bea819b7491b"
-SRC_URI[sha256sum] = "e6840a2ba2704f4ffb40e454c36f73aeb440a4005453ee8d7ff6a00d812ba176"
+SRC_URI[md5sum] = "64abe5847736eb413a525b70b48afd7f"
+SRC_URI[sha256sum] = "265dacf64ed8c0819f4be9355c39beaa13dc2ad2f85237a2c4e478f5ce644b48"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.27.1.bb b/meta-python/recipes-devtools/python/python-cython_0.27.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.27.1.bb
rename to meta-python/recipes-devtools/python/python-cython_0.27.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.27.1.bb b/meta-python/recipes-devtools/python/python3-cython_0.27.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.27.1.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.27.2.bb
-- 
2.7.4


