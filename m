Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D61774BCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 17:08:49 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u62-v6so10068768qkf.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 10:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VDOmHPIAUPVnRDMzUOkjQGAkUJUCuDXcoS04qxUh6iE=;
	b=sxqJJtX6PG8vou8lhseh369l2nrAPfvo4EwZbUmajS7e2+cuW02ZQIY5FJnkc45L9a
	NwZQ9+5n0hQPhFGwT8i2QaikfqaRESlDhbhLPZA6M8gNbD9kKgvIVRTJQeDA8Dkbj+Cn
	t7pReXXEDP9Oyqy+5aznh7/liB++z2nWUdhdageyEBfdvo+klRuDWfL/huyBon0ihNWW
	64V78WCV7SvmH0xS0iObnY7E9KD6VcQ843K28aNfd3JsAzADhC+/Po1+NUZ1wlGb6Myq
	+RA26nVDrrA3W5QWdeeu9syk2+XaZpVCOnYZNxdyGItYAEJjI+9JiawRx5hCzxD8Y3Tc
	PXQQ==
X-Gm-Message-State: APt69E1s9hzlvl8qhzySxQq8Z8umfIlKN1dJX+mB9f+mDKSl+fp0k4Q8
	7UnmYFYvkbUldUL1+8p3h+RhNbBR
X-Google-Smtp-Source: AAOMgpdvRlUr8RGZI6LopTKfFN+02wQf9t58ifW5m1HriT4+vXicfJrEd98raPDpEzFO1IGroBA1kw==
X-Received: by 2002:ae9:dc43:: with SMTP id
	q64-v6mr13071675qkf.62.1531156129701; 
	Mon, 09 Jul 2018 10:08:49 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	q83-v6sm9183254qki.67.2018.07.09.10.08.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 10:08:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:08:42 -0400
Message-Id: <1531156122-14173-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-py: update to version 1.5.4
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
X-List-Received-Date: Mon, 09 Jul 2018 17:08:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-py.inc                     | 4 ++--
 .../python/{python-py_1.5.2.bb => python-py_1.5.4.bb}                 | 0
 .../python/{python3-py_1.5.2.bb => python3-py_1.5.4.bb}               | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-py_1.5.2.bb => python-py_1.5.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-py_1.5.2.bb => python3-py_1.5.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-py.inc b/meta-python/recipes-devtools/python/python-py.inc
index c7d6727..495becf 100644
--- a/meta-python/recipes-devtools/python/python-py.inc
+++ b/meta-python/recipes-devtools/python/python-py.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[md5sum] = "279ca69c632069e1b71e11b14641ca28"
-SRC_URI[sha256sum] = "ca18943e28235417756316bfada6cd96b23ce60dd532642690dcfdaba988a76d"
+SRC_URI[md5sum] = "7502d66fa68ea4ae5b61c511cd177d6a"
+SRC_URI[sha256sum] = "3fd59af7435864e1a243790d322d763925431213b6b8529c6ca71081ace3bbf7"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-py_1.5.2.bb b/meta-python/recipes-devtools/python/python-py_1.5.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-py_1.5.2.bb
rename to meta-python/recipes-devtools/python/python-py_1.5.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-py_1.5.2.bb b/meta-python/recipes-devtools/python/python3-py_1.5.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-py_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-py_1.5.4.bb
-- 
2.7.4


