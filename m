Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3DD73155
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 17:25:15 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id s186so1368178qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 09:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TQYJ5MK4gaaZMhS9Mb34DubbQ2ZqEnYkXdCWFPVEX3E=;
	b=orILWqoYJmHb0QSpw4Pr/4X1PXIqx3eF+55YBPMtARu8sqdnUbcz1gzmt1vqL4aB73
	fPFRcvV8Vufj7NA632lN1zyGYhNn4cYlkx6gm3vMyO7MHFKtZdvhxZVP/10xRQJG/f9H
	kSZY/1pcfx/L+ZsI/J7O4r8w68MfUwecPK5cu/eURET9O10mS7iBiRIyoboB5/MgL5Ye
	GEkA3wZc1Ut8PQ9ARLNk9hPGf8pf6xmYiLklaCvZYilBJDS65YdnL/6ddIPAkDR5c8Sn
	egHsBAnZD8h2NSMwyIt705ZydKyF8tCtT+BbHPtm3NBXEKPYoxb0NoOCKjT4hPaA0ip+
	wwjQ==
X-Gm-Message-State: AMke39l48htIP51BsbD/NjuDr2yHjROeNy2gotin1ivllzWSXLZZDhutYjxSnSORRmmzrA==
X-Received: by 10.55.87.198 with SMTP id l189mr30812413qkb.106.1487784316929; 
	Wed, 22 Feb 2017 09:25:16 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id u43sm703405qtc.11.2017.02.22.09.25.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 09:25:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 12:24:53 -0500
Message-Id: <1487784294-28547-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography: update to version 1.7.2
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
X-List-Received-Date: Wed, 22 Feb 2017 17:25:16 -0000

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


