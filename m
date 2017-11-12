Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id C3212780BD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 15:23:52 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 31so16892722qtz.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 07:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JOVXpJUwmr8oK2pBKKDdkHl3k73GLMx+aadM2+ryQ4k=;
	b=aFO11JpSK0G1bry+DUQkQdiEbGwS81pmBUgDx+JUwmFe+GDKmW2NK4Sw8IuBPEk1/L
	i2Q/3JHvJtmhmKdc3hwsfZvJk6TCqyWkgJdjTPoQBnHpihmDQWJq8VmfrotLcvK4EeTL
	ZcpwoKG3Vy7+e6k/43QyF86yVJIERu117XP8lXWfI3TFHEem2ewsdBGtlbMr40JHWooV
	PVD0/45If7oUZLz1c0osD3NAHjtzsYpgrK8IawfF2HfJJGO+4K1XAxQ0aTSke+yOdp8T
	/OFZeszDP3SFZGp6m9Ol48n+rGNWK3y0EXH2MSmjbwvzjNmQsa9mNyoZaWJaI4ztSR1L
	1Oww==
X-Gm-Message-State: AJaThX69cCfc0Y1m+hSSfX9A1jzbqXnGVJRlCOtI7lR193j2XzE6xbbs
	Kz5iHJ9CmQpGddRp1aSkZm/vKeEt
X-Google-Smtp-Source: AGs4zMYtXlv1m9dM02N7oQrewilMfeVXkXfTOT9+lmzds8P490efzzLi0nOu/SUw2NvefautYstW5Q==
X-Received: by 10.200.9.43 with SMTP id t40mr10305904qth.257.1510500233416;
	Sun, 12 Nov 2017 07:23:53 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	a66sm9238864qkf.49.2017.11.12.07.23.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 07:23:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 10:23:45 -0500
Message-Id: <1510500225-20843-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.27.3
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
X-List-Received-Date: Sun, 12 Nov 2017 15:23:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.27.2.bb => python-cython_0.27.3.bb}       | 0
 .../python/{python3-cython_0.27.2.bb => python3-cython_0.27.3.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.27.2.bb => python-cython_0.27.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.27.2.bb => python3-cython_0.27.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index f830557..8d8f27c 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "64abe5847736eb413a525b70b48afd7f"
-SRC_URI[sha256sum] = "265dacf64ed8c0819f4be9355c39beaa13dc2ad2f85237a2c4e478f5ce644b48"
+SRC_URI[md5sum] = "6149238287d662bd5d5e572482252493"
+SRC_URI[sha256sum] = "6a00512de1f2e3ce66ba35c5420babaef1fe2d9c43a8faab4080b0dbcc26bc64"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.27.2.bb b/meta-python/recipes-devtools/python/python-cython_0.27.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.27.2.bb
rename to meta-python/recipes-devtools/python/python-cython_0.27.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.27.2.bb b/meta-python/recipes-devtools/python/python3-cython_0.27.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.27.2.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.27.3.bb
-- 
2.7.4


