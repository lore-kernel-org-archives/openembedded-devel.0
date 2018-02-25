Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 11FEB60053
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:18:18 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d206so16776815qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jSKAkq1hl3xEbyWoRB5SdtNlaM8pn/EdGdzzD6My6qM=;
	b=q9qWTXduYMEuSfVyqag4M9/z60FTZRYIiMSBgXp9vNgUZS8UgS64zArJmDXgDNWofr
	SPmLZGuILoJJExc+9PD6IhjKAhey4FtnhPp8UkLseJ0C8dnOpRUb7ETwzWqrG/O35fNU
	Y5IMckN2Sjgu2hDugGxqOB2qvDTu9oi7YqFfMzmnl7x+86xWG4h1QKsuPvWm29mJATvk
	W12ZHezXp6zsofobaVg+RhJ1o5nWiZMN86yDpVmzBUKiq76fCFbIIUFm5tlBneX3BusP
	PVvVm9vFynXXrzsAscPUj4CMWyYzT6ze1I0GT47IxmT4Aft/Es75uyDovNtq6if+CXSY
	JCIQ==
X-Gm-Message-State: APf1xPCH1ozlQjlnnIB7OpaWzU+qL1SnhAek7U/95HBj+NgOi4a0IW6Y
	UD1ULTSg/3moiz7ebt6eArVsCiaT
X-Google-Smtp-Source: AG47ELu9LB6Sz55LiQ8HpVkWUFz8sQIuKBkfkLIvMGLyd79EnVG9ER5I/DXRGhtyBdCTJMWsXCCc9A==
X-Received: by 10.55.21.102 with SMTP id f99mr13307759qkh.185.1519589899810;
	Sun, 25 Feb 2018 12:18:19 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v55sm4458544qtc.14.2018.02.25.12.18.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:18:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:18:11 -0500
Message-Id: <1519589891-25296-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-isort: update to version 4.3.4
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
X-List-Received-Date: Sun, 25 Feb 2018 20:18:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-isort.inc                  | 4 ++--
 .../python/{python-isort_4.2.15.bb => python-isort_4.3.4.bb}          | 0
 .../python/{python3-isort_4.2.15.bb => python3-isort_4.3.4.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-isort_4.2.15.bb => python-isort_4.3.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-isort_4.2.15.bb => python3-isort_4.3.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-isort.inc b/meta-python/recipes-devtools/python/python-isort.inc
index 9884c44..c9e8192 100644
--- a/meta-python/recipes-devtools/python/python-isort.inc
+++ b/meta-python/recipes-devtools/python/python-isort.inc
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "34915a2ce60e6fe3dbcbf5982deef9b4"
-SRC_URI[sha256sum] = "79f46172d3a4e2e53e7016e663cc7a8b538bec525c36675fcfd2767df30b3983"
+SRC_URI[md5sum] = "fb554e9c8f9aa76e333a03d470a5cf52"
+SRC_URI[sha256sum] = "b9c40e9750f3d77e6e4d441d8b0266cf555e7cdabdcff33c4fd06366ca761ef8"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-isort_4.2.15.bb b/meta-python/recipes-devtools/python/python-isort_4.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-isort_4.2.15.bb
rename to meta-python/recipes-devtools/python/python-isort_4.3.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-isort_4.2.15.bb b/meta-python/recipes-devtools/python/python3-isort_4.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-isort_4.2.15.bb
rename to meta-python/recipes-devtools/python/python3-isort_4.3.4.bb
-- 
2.7.4


