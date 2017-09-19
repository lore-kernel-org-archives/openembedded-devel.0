Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3614E78087
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 19:38:48 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l25so415705qtf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 12:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CA0GlCzWi0SP6GcqdMFRFzikgBV1DkZyax0UKfK97b8=;
	b=N4ippgSmIIiWR2Gllk7OU3WjrCY8afcI5DYvFVFtIHjXYte22q7+SmA2m3kC6vTvnm
	aZgezCdqjP8hMxluczWisVKnLkKjdQLN28CrS4AeewAEBTK7kHCNZCrhO0COxytQ9MuD
	wuHjwZycxPm8nUmSKxgZQzX7NxRvvBcc5vvBKsBNydG04MUBQG2Nrzdnl8hRI18ZM9l5
	maVggkOGj7hjkYnHik3OoQrIOV8oQUcqWnWmM9RChxMtbdNzd2BK0Z+1Rp0g2K/yWS1y
	FBF1rbEXlP8dfDQpDfnWujVo6Y0ZjezARyJFLmGNctUEePJ0vSbjS+gynlSqmE1Y+WZ0
	+KhA==
X-Gm-Message-State: AHPjjUgaDF8LDFAgxJ5rlyzn+7gMu6B/uQDJnDdpRIvUCPou1vVpGGlq
	l+8kEXfItvYAJswo9anqg1E3OHEP
X-Google-Smtp-Source: AOwi7QCvRgnb0x/FfpCn3KurI3R6068mkP3QKJeI31ID7dfQVpmM4LJsWXbf0tmKvbxmtVwBHJI3fQ==
X-Received: by 10.200.46.146 with SMTP id h18mr3957394qta.100.1505849929171;
	Tue, 19 Sep 2017 12:38:49 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 75sm67508qkx.58.2017.09.19.12.38.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 12:38:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 15:38:41 -0400
Message-Id: <1505849921-26400-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bitarray: add a python3 version of the recipe
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
X-List-Received-Date: Tue, 19 Sep 2017 19:38:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-bitarray.inc     | 11 +++++++++++
 .../recipes-devtools/python/python-bitarray_0.8.1.bb        | 13 ++-----------
 .../recipes-devtools/python/python3-bitarray_0.8.1.bb       |  2 ++
 3 files changed, 15 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-bitarray.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-bitarray_0.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
new file mode 100644
index 0000000..7b6e0d1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-bitarray.inc
@@ -0,0 +1,11 @@
+SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
+HOMEPAGE = "https://github.com/ilanschnell/bitarray"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ba469353f9f2a244b2075902351e37d"
+
+SRC_URI[md5sum] = "3825184f54f4d93508a28031b4c65d3b"
+SRC_URI[sha256sum] = "7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd9290ab18"
+
+inherit pypi
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb b/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
index 145f1fb..f78c7ab 100644
--- a/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
@@ -1,11 +1,2 @@
-SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
-HOMEPAGE = "https://github.com/ilanschnell/bitarray"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3ba469353f9f2a244b2075902351e37d"
-
-SRC_URI[md5sum] = "3825184f54f4d93508a28031b4c65d3b"
-SRC_URI[sha256sum] = "7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd9290ab18"
-
-inherit pypi setuptools
-
-BBCLASSEXTEND = "nativesdk"
+inherit setuptools
+require python-bitarray.inc
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_0.8.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_0.8.1.bb
new file mode 100644
index 0000000..7ee444d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bitarray_0.8.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-bitarray.inc
-- 
2.7.4


