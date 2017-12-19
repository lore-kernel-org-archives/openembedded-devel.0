Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 02EFE6E671
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:42:11 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r184so15342748qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=REYwf8Ihn+RMWv4Mdwb2YaAU9UxIYUsJ3GzYcA66XEs=;
	b=gt/G1fGUay4h6J7c5yfUVokhQKnkCKLh0Ct6ehRjV+n7rdbA/2vfDreaRCvcfbmw1/
	pwbRPlPw+/qx3txQuLjLIL13zpr3jf/d0jV9iug/vYfr6p9DpzuF/hKmIHOowDk7u8/7
	I8cKQGpvM4rH44+n3WJj+ErrHEE4mgjN7eDtvYyP7JQrhblV6dZ5JuRDh/N18JgwIl+I
	6kKzzkFwMzy2lKtEzF+4g+6i7bWsl0wbc7zPul1mfF+5S3s0oV0SO8UnDA1kSNvlpjnU
	2sSRxlryyds0j2+BzlQqmBEOIJzlZK1fKLt3upD+wc3u/36d6pYQFUYEQtxug5jgQhV9
	pL5Q==
X-Gm-Message-State: AKGB3mImatXvJRx2zYJfVgevhO3sC4Ew48M/Og6fSn5wON9X8fSDldge
	X+vmqiDF58vpbQu5bzeG4vSVqkOQ
X-Google-Smtp-Source: ACJfBoskQ5oYaDsmvxg1F986QOZbOiE//1ukDFBKChdDCHuB98sD7ZYzGF68+0GDKrcXRjhJuCtmnA==
X-Received: by 10.55.70.77 with SMTP id t74mr5303774qka.342.1513698132744;
	Tue, 19 Dec 2017 07:42:12 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	124sm9882199qkf.96.2017.12.19.07.42.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 07:42:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 10:42:06 -0500
Message-Id: <1513698126-22522-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-asn1crypto: update to version 0.24.0
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
X-List-Received-Date: Tue, 19 Dec 2017 15:42:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc             | 4 ++--
 .../{python-asn1crypto_0.23.0.bb => python-asn1crypto_0.24.0.bb}      | 0
 .../{python3-asn1crypto_0.23.0.bb => python3-asn1crypto_0.24.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-asn1crypto_0.23.0.bb => python-asn1crypto_0.24.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-asn1crypto_0.23.0.bb => python3-asn1crypto_0.24.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 92c7198..0d3ee41 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
 
 PYPI_PACKAGE = "asn1crypto"
 
-SRC_URI[md5sum] = "97d54665c397b72b165768398dfdd876"
-SRC_URI[sha256sum] = "0874981329cfebb366d6584c3d16e913f2a0eb026c9463efcc4aaf42a9d94d70"
+SRC_URI[md5sum] = "de3520426e81a6581352d4366f310eb1"
+SRC_URI[sha256sum] = "9d5c20441baf0cb60a4ac34cc447c6c189024b6b4c6cd7877034f4965c464e49"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-asn1crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-asn1crypto_0.23.0.bb
rename to meta-python/recipes-devtools/python/python-asn1crypto_0.24.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-asn1crypto_0.23.0.bb
rename to meta-python/recipes-devtools/python/python3-asn1crypto_0.24.0.bb
-- 
2.7.4


