Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4EE60762
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Mar 2017 13:16:14 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j127so10793195qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Mar 2017 05:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kEpJxFU2KLRDsVMTjns8jOkGK+XS4iaa8UjfkvisxTA=;
	b=splSdiAs/0DBmadO1ov/Ix8CRxXGrjb/D3vxhU8LXyXLQjWiM2R07eROFhNiXzKrAH
	wu+jLRHYr4ZmwaIJbTaCPbjgV3Ol3xI+wcs3CrEOxKwxoU9S9JYs1sS8mAnSerTbqagv
	AGmsBg7dhHVcoFCvf+nHn3s18POU+e4Mom6iArEXg7Z2ChlIT+HyTKBwwxhX8ov8hKNR
	Sl94mYuDBonF9QnSqdxDrTYUUnGfu0soH3geFaf2XmK2xakrydSeyQx8pch7v+6sXfJS
	MiVSfgpF8y0DvbVbudcFYI8VEp6M+i9EBi4DEYq/LJjfeapivs6S6TXj7d0mK3+cgwQY
	p1ig==
X-Gm-Message-State: AMke39llS64WM8rZEIJqF/yc2ZqSWH83XMaNoqoP+NhDcYXJPBrnOJskQT2PSkSAqAi1sg==
X-Received: by 10.55.214.21 with SMTP id t21mr7056462qki.41.1488978975610;
	Wed, 08 Mar 2017 05:16:15 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	a26sm2074974qtb.28.2017.03.08.05.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 05:16:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Mar 2017 08:16:04 -0500
Message-Id: <1488978964-31526-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488978964-31526-1-git-send-email-derek@asterius.io>
References: <1488978964-31526-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-serpent: update to version 1.19
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
X-List-Received-Date: Wed, 08 Mar 2017 13:16:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent.inc              | 6 +++---
 .../python/{python-serpent_1.18.1.bb => python-serpent_1.19.bb}     | 0
 .../python/{python3-serpent_1.18.1.bb => python3-serpent_1.19.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-serpent_1.18.1.bb => python-serpent_1.19.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.18.1.bb => python3-serpent_1.19.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
index a1520db..0b1aa91 100644
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2669deccb79531c74a5ddd71b45f5095"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3773e39c491bb1f9ccc98389d57169d7"
 
-SRC_URI[md5sum] = "e2cd7b751274c59b420d4f54db9a49cf"
-SRC_URI[sha256sum] = "9afebb58ac8b827050e1969324388349dc9738b0a03b0d91567b328834a27732"
+SRC_URI[md5sum] = "cdef596f727cb6b4176c89769d2d41ee"
+SRC_URI[sha256sum] = "946b2c837f889971df3575af9dadd8f09bfe48549ebc1b9f6434263b653707ce"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.18.1.bb b/meta-python/recipes-devtools/python/python-serpent_1.19.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-serpent_1.18.1.bb
rename to meta-python/recipes-devtools/python/python-serpent_1.19.bb
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.18.1.bb b/meta-python/recipes-devtools/python/python3-serpent_1.19.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-serpent_1.18.1.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.19.bb
-- 
2.7.4


