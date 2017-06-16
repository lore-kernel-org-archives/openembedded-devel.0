Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD7377853C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:11:56 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id o21so12426392qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OnKgVKqqSlEqE82LbGauJ0WhF5nDCeNnWirLYae3w/w=;
	b=Nir2shshwvM/9qtLZwdpYZksMtz7UZWBfLk/PZupByNaAxqcHl0pZD7TZl0q7mSazp
	XHMMgDYdUU4ZpGu8ZABX4lEdLbYf2EoYjoC88bY1X/0xlIc2nBzM4igStbmPTiU4llMs
	SnYG50t14XgLyrhyP9t8DqyBzJhkPM1EHyUZEy1y9CMMflIWEaUliXgetyl08To8LeDD
	cuxQmaecocWdQ4dcqQB3vluN0ujqZVLqTDUTST6SegJgTc4gqbA/mp6hm90SEl98tMed
	utr/4D8VNp3/mX50ZoWNf3TBC82zJ25oMXSysvWhe6LfAYIGGaGSg5dhxBm9Hr4Eh0Ew
	gLOg==
X-Gm-Message-State: AKS2vOzLitmCVURM2N1kqAPLoNsHnYUUSxvmIRcF3V4UFgTVZmshoaY8
	2gyimsPodtMJ4ClnGf0=
X-Received: by 10.200.58.38 with SMTP id w35mr13948317qte.93.1497640317620;
	Fri, 16 Jun 2017 12:11:57 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	l23sm2234739qtl.24.2017.06.16.12.11.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:11:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:11:50 -0400
Message-Id: <1497640310-32596-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pybind11: update to version 2.1.1
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
X-List-Received-Date: Fri, 16 Jun 2017 19:11:57 -0000

Verify the license terms are the same and update the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pybind11.inc            | 7 +++----
 .../python/{python-pybind11_2.0.1.bb => python-pybind11_2.1.1.bb}  | 0
 .../{python3-pybind11_2.0.1.bb => python3-pybind11_2.1.1.bb}       | 0
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pybind11_2.0.1.bb => python-pybind11_2.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.0.1.bb => python3-pybind11_2.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
index 6d36d87..adaf289 100644
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ b/meta-python/recipes-devtools/python/python-pybind11.inc
@@ -1,8 +1,7 @@
 SUMMARY = "Seamless operability between C++11 and Python"
 HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=485d9f8aa1ab513bec0de2f55cd69672"
-PR = "r0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ee5f0682c5afe930bd8ae42c96fe7bd3"
 
-SRC_URI[md5sum] = "c96103168e9abceaa6d46f6074dcaf38"
-SRC_URI[sha256sum] = "1b1a4824aad88b1073fe8dbd21683e1e5228f3ed3b29c2785fbf5dea6bf1063c"
+SRC_URI[md5sum] = "67752f9da3ce822b5bd6c55b41b89d3e"
+SRC_URI[sha256sum] = "c169a384ea046a1672ac83e9aed30660133e9bad3afd82fa99b794df7b416f6d"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_2.0.1.bb b/meta-python/recipes-devtools/python/python-pybind11_2.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pybind11_2.0.1.bb
rename to meta-python/recipes-devtools/python/python-pybind11_2.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.1.1.bb
-- 
2.7.4


