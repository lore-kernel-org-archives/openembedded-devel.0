Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id A38DD600E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:59:45 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id s9so15811459qke.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 06:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bY+DJISqFW8b6DrL3sjMq9KPMPFRoil8gzqDpdKskg4=;
	b=MkPbJeOrmltY3u4dgAQICwbEmPpFZ/v6GG2MJA0LYZ5lqq7/wtZEfplylfHVD8l8W4
	ltvn6y9s5xROEBZSe1oD8IwXLAnvnl/gSbMu+N9NWux8ET4ZTnOM64/NAjkyxcaNXKft
	8J0eGqH1ekM/dfzbNJIvXT5wJaVwHxrLfqO9T8Ydwle+oWZnnBtRuO+X1JdObxj8GjEJ
	t1Az+46RedDFTCkvL5FCB1DJqC6Je1wV4eMa5MaGdJbePxQhNqHeuubHhjmJoFyCiPaa
	XvfhXvJa+taBUdR4Ilj8KaNatMRBUZokqNmZzwhQ3pOljzbLGxH25B8RlGecJ3x8Amr1
	HEpQ==
X-Gm-Message-State: AElRT7HxNhY6JHFEmcTvRCpolzXOpRiiQZQKYjBWjh54xOjy/cHWen3b
	7ABEvrr6fVLE8sxSK+79DDt/atCL
X-Google-Smtp-Source: AG47ELslswLhudVEdlRlt7WoTlJY1DmMZyGt5ppREB5hZKTGeHW+BvaEmBFMmWdej7mbWRDQcaW00A==
X-Received: by 10.55.164.23 with SMTP id n23mr33368283qke.259.1521899985962;
	Sat, 24 Mar 2018 06:59:45 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id g9sm8172549qti.11.2018.03.24.06.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 06:59:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 09:59:34 -0400
Message-Id: <1521899974-8517-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.28.1
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
X-List-Received-Date: Sat, 24 Mar 2018 13:59:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.28.bb => python-cython_0.28.1.bb}         | 0
 .../python/{python3-cython_0.28.bb => python3-cython_0.28.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.28.bb => python-cython_0.28.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.28.bb => python3-cython_0.28.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 550d9a3..5a69cd0 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "459a7980c508e61fc37b3245612969ac"
-SRC_URI[sha256sum] = "518f7e22da54109661e483a91a63045203caf9fd78da4a69185a7622f759965f"
+SRC_URI[md5sum] = "c549effadb52d90bdcb1affc1e5dbb97"
+SRC_URI[sha256sum] = "152ee5f345012ca3bb7cc71da2d3736ee20f52cd8476e4d49e5e25c5a4102b12"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.28.bb b/meta-python/recipes-devtools/python/python-cython_0.28.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.28.bb
rename to meta-python/recipes-devtools/python/python-cython_0.28.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.28.bb b/meta-python/recipes-devtools/python/python3-cython_0.28.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.28.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.28.1.bb
-- 
2.7.4


