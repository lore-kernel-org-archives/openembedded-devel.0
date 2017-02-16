Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1926C772B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 22:10:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w20so3931195qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BUYkZ0FJWBo0Vdk1DGwoLLGKBXNW9W+GXGPgyw7SMBk=;
	b=RzZHUfIQi9WJmhFOsVrgDbOyEJ1pzY2pOYVSsJZeK2DOwB/mtch8YLXiRLWl6OJy8E
	R2DvwGJYCnfL8VAmOGfDbTFWyVdVsEpT4Bsht6Lnh1tSevrZtDqbiXPpJNJ4pRlTvKxK
	TGHk98GaurU4JgWmaBzgLv1bN8ILNJd/7YYGs+7RSpJ2UnTes4Ttaa/T4qXI16BDb1f2
	RtKD6lD7eN5809lpt2Gvvu9fG4QY+6ha/PPSRoQSJ6Spi1+AmESORE2YMPiA0GT2owa/
	QlosGToTa1wPA2qbiStoocADvieBgwxo2XpK27RrGYVntID8sg3UkhTc5l6ReZY+8we4
	R7Mg==
X-Gm-Message-State: AMke39m5m6/L4N/GLFO0LZSgGxWKldTbiSmKZcG1zlC7+4Ve7V/Usb7RfMc1jSJQbMHQ4Q==
X-Received: by 10.200.34.77 with SMTP id p13mr4668056qtp.35.1487283022808;
	Thu, 16 Feb 2017 14:10:22 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	u54sm5246045qtu.35.2017.02.16.14.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 14:10:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:10:15 -0500
Message-Id: <1487283015-7156-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-passlib: update to version 1.7.1
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
X-List-Received-Date: Thu, 16 Feb 2017 22:10:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-passlib.inc              | 6 +++---
 .../python/{python-passlib_1.7.0.bb => python-passlib_1.7.1.bb}     | 0
 .../python/{python3-passlib_1.7.0.bb => python3-passlib_1.7.1.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-passlib_1.7.0.bb => python-passlib_1.7.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-passlib_1.7.0.bb => python3-passlib_1.7.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
index b1e214a..f289c0e 100644
--- a/meta-python/recipes-devtools/python/python-passlib.inc
+++ b/meta-python/recipes-devtools/python/python-passlib.inc
@@ -7,7 +7,7 @@ tasks, from verifying a hash found in /etc/shadow, to providing full-strength pa
 hashing for multi-user applications."
 HOMEPAGE = "https://bitbucket.org/ecollins/passlib"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7ed8269648e55f7d37532503de04d3fe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=73eed1a5470b969951dac411086c7036"
 
-SRC_URI[md5sum] = "3c3c5733f2ada427060c33b5ece0560f"
-SRC_URI[sha256sum] = "0be4f6053357c4ebba5578a065fbdad75a844501d4c6d91d4a3a0c1594c6abed"
+SRC_URI[md5sum] = "254869dae3fd9f09f0746a3cb29a0b15"
+SRC_URI[sha256sum] = "3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0"
diff --git a/meta-python/recipes-devtools/python/python-passlib_1.7.0.bb b/meta-python/recipes-devtools/python/python-passlib_1.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-passlib_1.7.0.bb
rename to meta-python/recipes-devtools/python/python-passlib_1.7.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.0.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-passlib_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-passlib_1.7.1.bb
-- 
2.7.4


