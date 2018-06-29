Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id D8DFC75223
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:55:00 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id c131-v6so5606191qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L9c+nBXtNJL9tRmIKFJ62kpX7Ku/vWN24ZeTUURz990=;
	b=MyYOnYpIHQ6TdKvp5NdBNR0gLMunQzB/SYN/Y7HXf7nPS9mPVndfj0+VE1NMlBA12R
	QsFv8+UsH4OmG0qZaU2If08eU7FiaF34tczsrl2CjZNpF5kEuFz59nAEBF3zca+39ouq
	tP0Ml+fMa2BTb5cX2mcAPtbY5eq8cwUs2rPzeMjqsxkKH23NvTfmuQNsRX5a2mKaUGFK
	1FuJ/7CFZFh6V52qy68X5yiXEIWtdK7bSDhwy6zwTG4M9mhLky5dgaXXaz9jH+Gysav5
	pJGFRnvX6fP2pO3OEuYemUVtOnmXJ+YxX33DfMcRBKaegHfqn1FgAAdYCVsA2iiAdqaF
	RdHw==
X-Gm-Message-State: APt69E0HgDJIyuyvG1+cAAC345e8hqd2vh4bylpdOJWwZgWtgPlLci2d
	+iWbmhfkv2P9UgGNmY2R0lYdhk4i
X-Google-Smtp-Source: AAOMgpeoH9RHrw4raImanncNywaVDx6uTFm933dtpxumyRfYXAh97WT0dTg6/nE12/oplyPtjod3hQ==
X-Received: by 2002:a37:7101:: with SMTP id
	m1-v6mr14181477qkc.19.1530302101244; 
	Fri, 29 Jun 2018 12:55:01 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	h43-v6sm7601737qth.6.2018.06.29.12.54.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 12:55:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:54:46 -0400
Message-Id: <1530302086-13347-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyjwt: update to version 1.6.4
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
X-List-Received-Date: Fri, 29 Jun 2018 19:55:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyjwt.inc                  | 4 ++--
 .../python/{python-pyjwt_1.6.1.bb => python-pyjwt_1.6.4.bb}           | 0
 .../python/{python3-pyjwt_1.6.1.bb => python3-pyjwt_1.6.4.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyjwt_1.6.1.bb => python-pyjwt_1.6.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_1.6.1.bb => python3-pyjwt_1.6.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyjwt.inc b/meta-python/recipes-devtools/python/python-pyjwt.inc
index 9f9282e..00c38e3 100644
--- a/meta-python/recipes-devtools/python/python-pyjwt.inc
+++ b/meta-python/recipes-devtools/python/python-pyjwt.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[md5sum] = "f7dbe0d62f2087a7605946aeeca02541"
-SRC_URI[sha256sum] = "dacba5786fe3bf1a0ae8673874e29f9ac497860955c501289c63b15d3daae63a"
+SRC_URI[md5sum] = "2731c6b66b67b95d1944f072f5fa35a9"
+SRC_URI[sha256sum] = "4ee413b357d53fd3fb44704577afac88e72e878716116270d722723d65b42176"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyjwt_1.6.1.bb b/meta-python/recipes-devtools/python/python-pyjwt_1.6.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyjwt_1.6.1.bb
rename to meta-python/recipes-devtools/python/python-pyjwt_1.6.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.6.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_1.6.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyjwt_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_1.6.4.bb
-- 
2.7.4


