Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BC72B774DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 01:37:48 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id h201so10419732qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JtfrgoMPBHrCFYWqhyoSIlZ+VSydlNRAyZBwqHqxd2w=;
	b=DYR/QCaOAAsJIcn1aUe3LbLMo3Zadv2dLZeSFUBjY3WZLD2xvPsEqmi2ArfFIt1JIH
	1jx1Kl4mqI5rCrfT2YT5R8onr5bVUhDxmKMteGG8E0eyFxBQHyWw6sDN0KAwvj6NoKVj
	9rrfdZsoc6Xo4JhM8K2YSrUPRZzzFsYsEh8vVksW+zMOIQYQMnjOGXofI/Xqqxiv6O1e
	Zd5IBwuNn3wOSYv1UTGUbQZBqDCzr3UTDGMbVzxEpvGlzRAwB5CgqtoqwmhG+2eyliNP
	Y7xd5ubwbLRv1zujd5A1+Zniu5ejZQqdCYE4n3hIjZbNvajvTIthCnwEDRexbClulgDm
	swYg==
X-Gm-Message-State: AIkVDXJzQMymPYWW1cDFwgs9v6Yx1dhuCV07tXY3GNClRKQIoQV0aCe5vahgGOKOVpUDkw==
X-Received: by 10.55.7.2 with SMTP id 2mr6796214qkh.228.1482370669286;
	Wed, 21 Dec 2016 17:37:49 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 33sm16924491qtq.1.2016.12.21.17.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 17:37:48 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 20:37:36 -0500
Message-Id: <1482370656-19274-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-passlib: update to version 1.7.0
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
X-List-Received-Date: Thu, 22 Dec 2016 01:37:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-passlib.inc              | 6 +++---
 .../python/{python-passlib_1.6.5.bb => python-passlib_1.7.0.bb}     | 0
 .../python/{python3-passlib_1.6.5.bb => python3-passlib_1.7.0.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-passlib_1.6.5.bb => python-passlib_1.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-passlib_1.6.5.bb => python3-passlib_1.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
index 3cd2c0a..b1e214a 100644
--- a/meta-python/recipes-devtools/python/python-passlib.inc
+++ b/meta-python/recipes-devtools/python/python-passlib.inc
@@ -7,7 +7,7 @@ tasks, from verifying a hash found in /etc/shadow, to providing full-strength pa
 hashing for multi-user applications."
 HOMEPAGE = "https://bitbucket.org/ecollins/passlib"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bae8faa3e2689ee0df3f2127fc4517f5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7ed8269648e55f7d37532503de04d3fe"
 
-SRC_URI[md5sum] = "d2edd6c42cde136a538b48d90a06ad67"
-SRC_URI[sha256sum] = "a83d34f53dc9b17aa42c9a35c3fbcc5120f3fcb07f7f8721ec45e6a27be347fc"
+SRC_URI[md5sum] = "3c3c5733f2ada427060c33b5ece0560f"
+SRC_URI[sha256sum] = "0be4f6053357c4ebba5578a065fbdad75a844501d4c6d91d4a3a0c1594c6abed"
diff --git a/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb b/meta-python/recipes-devtools/python/python-passlib_1.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
rename to meta-python/recipes-devtools/python/python-passlib_1.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb
rename to meta-python/recipes-devtools/python/python3-passlib_1.7.0.bb
-- 
2.7.4


