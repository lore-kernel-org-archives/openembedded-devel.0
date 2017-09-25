Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD2465C5B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 22:29:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d70so5764072qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 15:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mXXmfmrCRkixzKoZwWlCwmpxyYWKyAddoxSTr9ytynA=;
	b=R/q6UpqO67ZyOdt+wKh/fEzwiSIl8xd/lC/c30rOfmqhmCBJEcRgLXwUhKlygQmx+v
	lclp2vqnir8G9V9vBf5MQvKsTX5OO6giCB5FqQnZdKCAmuYjrK7e2hKdpooRX7KjRIwM
	9Pkd2pUGv+0uzaWP4woLNbWj3HfNPs6fq5Vn+G7gCzneNXO90i9jWp7dJ2wYHDnHYJKc
	SFhZN1WEpWMDfy/IniersGlM6KjhjoymVc6mE027Pvw2PvIs9o+YzNwGdeEWbIC2PAka
	BuGUvkiisxg5Ildul7cnntcSF1gR5Sgy0JvKHTD1PkUkoi5eM7g2QGLQUDYv9FXGP8b6
	abQw==
X-Gm-Message-State: AHPjjUjbA5sxN0fwCUzzVXSu4+Hxax4Jl2gzM3O5OBNPlx0YAVCai/q/
	EFvLexC6xdEOpBneyhqsFNTY73r+
X-Google-Smtp-Source: AOwi7QC1F0nz2kUfFh3N20i8kBgkY20wE6IXj91FMJJWlo3pk/cIc9+O2xVpcCGkKnaAnfwTsSesmw==
X-Received: by 10.55.118.7 with SMTP id r7mr12897233qkc.276.1506378541051;
	Mon, 25 Sep 2017 15:29:01 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	b26sm5790991qkj.64.2017.09.25.15.29.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 15:29:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Sep 2017 18:28:52 -0400
Message-Id: <1506378532-6375-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.27
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
X-List-Received-Date: Mon, 25 Sep 2017 22:29:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.26.1.bb => python-cython_0.27.bb}         | 0
 .../python/{python3-cython_0.26.1.bb => python3-cython_0.27.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.26.1.bb => python-cython_0.27.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.26.1.bb => python3-cython_0.27.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 900e88a..38ee51f 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "8853dcb78749a786ad5ccdc007a8932f"
-SRC_URI[sha256sum] = "c2e63c4794161135adafa8aa4a855d6068073f421c83ffacc39369497a189dd5"
+SRC_URI[md5sum] = "3a26a5940da1e9f95d8776eabd888b07"
+SRC_URI[sha256sum] = "b932b5194e87a8b853d493dc1b46e38632d6846a86f55b8346eb9c6ec3bdc00b"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.26.1.bb b/meta-python/recipes-devtools/python/python-cython_0.27.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.26.1.bb
rename to meta-python/recipes-devtools/python/python-cython_0.27.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.26.1.bb b/meta-python/recipes-devtools/python/python3-cython_0.27.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.26.1.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.27.bb
-- 
2.7.4


