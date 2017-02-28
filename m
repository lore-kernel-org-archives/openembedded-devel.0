Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A4BB57016E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 22:26:11 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u188so6328146qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fuHVtEmtLZ8iPUzNfr9r1eHPYpBbi87dngHLT25XU2k=;
	b=aF0gfOxrr6EMsv3N3W4NqcqGO41fGvfPYvK2L9NKJsniZBxE9E/vRN6lPqS1BVjPk3
	GhpSTVnj0Ro1KKoqiPNjunZjao3yCsSjt74IN5cXjjosCFkcySGYvBYeXblQT6CHXwpa
	yeqawYX9UP+61751r5hY+9sGfcNFZDYI9CxKRNZinvnfGMtOh7YbIbvWqSpAZnZd89Z8
	oPaOJetpGQRHbpBZj9L/8nIgUuMzjBRjkSW8XpnQr0hlTKf5n8W1xVZ2v5u+WDoHuhbU
	w+QH7ZBjs9S/UbgzYSxOs7QSTdmsh6Zg2OHhGAT4YBS0TjBzgajrf9Og+fb57DIqUx1u
	6jRA==
X-Gm-Message-State: AMke39ndgI4dRfmVyjHYIYJyfxDKGMnllF6JBMmQWserJLDzu6bXiYvjW/RGnuyKlISllg==
X-Received: by 10.55.42.159 with SMTP id q31mr6021851qkq.257.1488320773410;
	Tue, 28 Feb 2017 14:26:13 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j125sm1870584qkd.51.2017.02.28.14.26.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 14:26:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 17:26:07 -0500
Message-Id: <1488320767-11302-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyalsaaudio: update to version 0.8.4
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
X-List-Received-Date: Tue, 28 Feb 2017 22:26:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-pyalsaaudio_0.8.3.bb => python-pyalsaaudio_0.8.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyalsaaudio_0.8.3.bb => python-pyalsaaudio_0.8.4.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.3.bb b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.3.bb
rename to meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
index 7dfb136..b443570 100644
--- a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.3.bb
+++ b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
@@ -3,11 +3,11 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
-SRC_URI[md5sum] = "fd87fdd34fb0aaf7e48bfe036ec8e2f7"
-SRC_URI[sha256sum] = "74d9f04e0aeb71b0b5d36c0f02b0dd69b227ae7324cb5ae70d1e22a61459573e"
+SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
+SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
 
 DEPENDS += "alsa-lib"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "alsa-lib"
+RDEPENDS_${PN} += "libasound"
-- 
2.7.4


