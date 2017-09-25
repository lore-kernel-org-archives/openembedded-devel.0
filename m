Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id E3F8878260
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 22:36:01 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id q4so8565094qtq.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 15:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KoI2MxKKGsXxYnL7XontQgK4RtjA+wikEgv+l87aspE=;
	b=ZvuqBuMteECxhZ//jGQVG7KFdExPvyJs0lvmvIo3GDaPJ6rhj9grxBazMBoVspSdUY
	gD/TGkEXz8dw2Ga17h1TspuV/HixaJDhRYXOT5GK75h1lWna121ugN731smT82S4wnNy
	jUPoQ9eCnFH1E7OgcdtSBDjOWMYlYmYvo6a88Sz8v63mNVavk8XAL9dF7vD37aKtn73O
	c6BafF2R/NVJyG4E7X671vXdPoHKSEg3MkNKukE39sR2uD0RrrDQWy4vFZKYZTdW17qD
	YX5pyXfdpNrZMGTlgjt60HB+qmo8G1beQ+9ao/ZXG1iy64m8krrbNdj+bZYmV3wPN5wm
	3cBw==
X-Gm-Message-State: AHPjjUiTvKLZt4pT13cp0qDSzwWBqg10lq4aQrqjn2UWaJoQ9XVwkIjC
	OAAAlE/tfhZ8AiSnZmVxOWoVf0IZ
X-Google-Smtp-Source: AOwi7QBhSsXWG+MubFAgZya0c4J29nYMNd5bUkP8qKO9rBppdnV2khPR8t9lp7zXywLihwI/P/6xbQ==
X-Received: by 10.200.51.137 with SMTP id c9mr12543721qtb.263.1506378962922;
	Mon, 25 Sep 2017 15:36:02 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	p126sm966392qka.61.2017.09.25.15.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 15:36:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Sep 2017 18:35:55 -0400
Message-Id: <1506378955-10860-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.2.2
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
X-List-Received-Date: Mon, 25 Sep 2017 22:36:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.2.1.bb => python-pytest_3.2.2.bb}         | 0
 .../python/{python3-pytest_3.2.1.bb => python3-pytest_3.2.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.2.1.bb => python-pytest_3.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.2.1.bb => python3-pytest_3.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index ccc8232..ae1d81d 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "635976c2a9b2c2599d69fb0ad5abaf7d"
-SRC_URI[sha256sum] = "4c2159d2be2b4e13fa293e7a72bdf2f06848a017150d5c6d35112ce51cfd74ce"
+SRC_URI[md5sum] = "401c005bd57f71e63ba015ab086fe67d"
+SRC_URI[sha256sum] = "f46e49e0340a532764991c498244a60e3a37d7424a532b3ff1a6a7653f1a403a"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch"
 
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.2.1.bb b/meta-python/recipes-devtools/python/python-pytest_3.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.2.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest_3.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.2.2.bb
-- 
2.7.4


