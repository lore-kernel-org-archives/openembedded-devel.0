Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9F97972FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:15:37 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n127so2784417qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TQYJ5MK4gaaZMhS9Mb34DubbQ2ZqEnYkXdCWFPVEX3E=;
	b=O5yLNQqINvIaTwkvrnsjJfrHcyTk1PnsyyVtLwISnD9HSArqcXxlfBoTE3K3lZAieA
	nRQ0pqAJwZ4mSvX0qZpPUnrTnEx7G1XM7vXm9EF++A1dDJhh5dAkJ5TGOkyzxavMoBa/
	DtH//e2PqTm6SLOWoIIlNzpDxKvm+NpuKOviV8gZTYmWI7kdD9n+T5IMKNwYTC1dEolu
	KS12u4As8A9zbMxXViyK2C+hydoJrBKHFMvEkJzxcna3iACdH9PfuhgYgv0F6dF71j4R
	Dk+zaN4CARnsrErjyGrNxhk3ECtf5JmtCicGc/bF1vB5ZHsZ97yQ1T8g4TfIieZlQAn6
	YiKw==
X-Gm-Message-State: AMke39kKzUwlCgFqrjNh2nti8ozqdZJd6FJAFEI9AiPVxyutAcJZH68J2hrIee/jP+SOxw==
X-Received: by 10.55.150.199 with SMTP id y190mr31663828qkd.273.1487808938802; 
	Wed, 22 Feb 2017 16:15:38 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r186sm203813qke.26.2017.02.22.16.15.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:15:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:15:31 -0500
Message-Id: <1487808931-26175-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-cryptography: update to version 1.7.2
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
X-List-Received-Date: Thu, 23 Feb 2017 00:15:37 -0000

Verify the license terms remain the same and update the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc         | 6 +++---
 .../{python-cryptography_1.6.bb => python-cryptography_1.7.2.bb}    | 0
 .../{python3-cryptography_1.6.bb => python3-cryptography_1.7.2.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_1.6.bb => python-cryptography_1.7.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_1.6.bb => python3-cryptography_1.7.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 50483bd..601b12b 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1f375ab4f6b9a7c9eec25377c52d3aa1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d5ede125ed08d4fd14ec44d334bdb388"
 
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
@@ -9,8 +9,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "33ed393be75f04cd889a02a11acbab39"
-SRC_URI[sha256sum] = "4d0d86d2c8d3fc89133c3fa0d164a688a458b6663ab6fa965c80d6c2cdaf9b3f"
+SRC_URI[md5sum] = "fade66de437392ed1ba6980768626204"
+SRC_URI[sha256sum] = "878cb68b3da3d493ffd68f36db11c29deee623671d3287c3f8d685117ffda9a9"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.6.bb b/meta-python/recipes-devtools/python/python-cryptography_1.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_1.6.bb
rename to meta-python/recipes-devtools/python/python-cryptography_1.7.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_1.6.bb b/meta-python/recipes-devtools/python/python3-cryptography_1.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_1.6.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_1.7.2.bb
-- 
2.7.4


