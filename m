Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E81226011A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 13:44:16 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id y31-v6so4723993qty.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 06:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=STmCBQAUgYySCrcONaqXpNFbKSVse1z6ceUFrgedat0=;
	b=jcPKlnHBNL9edNo3YvKAqj6UxFOzYbbXnXEVIqMcUCRS7Hmq48uSuBcVi6xb0qJWpB
	2VSDxNoGqW6BAdv82TdtgVTScQx7Q10uhrJsbykVgyLHV9n8f1LrRAZakYO6CcX9XCZV
	bdg9oSoDc+xQGBnSQv3ce8LCVOcECd+hQKrXxhPEK8zhjt0USBvYofPSu5/iM0sYTFi8
	2iWLkx1T8x41bV1ZejkjRaUW6gM9AQLIgauXWYWRYtInE6/dXpdQtWRbwura/nTjBIUz
	npOMlyb1sbjCEg9T21v0phL1LSgh6Xe0GgGCGcb7AesJemQKjF2mLtbWPeXz51kvfaAb
	fRcQ==
X-Gm-Message-State: APt69E0JEZgfktWraGrUzCooj+1w+yLV0uUq6MoF/VWPVIrHl22z8/Wh
	NkY+2c0sRAKwSISptkEvgwclA6MC
X-Google-Smtp-Source: AAOMgpdN5HiLVHbBO1ewRk/IJo2YHMOVCOhhfDJCmmLZ0jsASGfAwCq7jTb5CsZkofW1U3ixn0Lwww==
X-Received: by 2002:a0c:de13:: with SMTP id
	t19-v6mr9285817qvk.93.1530193457553; 
	Thu, 28 Jun 2018 06:44:17 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	k2-v6sm2791160qth.23.2018.06.28.06.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jun 2018 06:44:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2018 09:44:10 -0400
Message-Id: <1530193450-17737-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ptyprocess: update to version 0.6.0
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
X-List-Received-Date: Thu, 28 Jun 2018 13:44:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ptyprocess.inc             | 4 ++--
 .../python/{python-ptyprocess_0.5.2.bb => python-ptyprocess_0.6.0.bb} | 0
 .../{python3-ptyprocess_0.5.2.bb => python3-ptyprocess_0.6.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ptyprocess_0.5.2.bb => python-ptyprocess_0.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-ptyprocess_0.5.2.bb => python3-ptyprocess_0.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-ptyprocess.inc b/meta-python/recipes-devtools/python/python-ptyprocess.inc
index 43f2d09..49cc5a4 100644
--- a/meta-python/recipes-devtools/python/python-ptyprocess.inc
+++ b/meta-python/recipes-devtools/python/python-ptyprocess.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
 
 SRCNAME = "ptyprocess"
 
-SRC_URI[md5sum] = "d3b8febae1b8c53b054bd818d0bb8665"
-SRC_URI[sha256sum] = "e64193f0047ad603b71f202332ab5527c5e52aa7c8b609704fc28c0dc20c4365"
+SRC_URI[md5sum] = "37402d69f3b50913d4d483587bffad8f"
+SRC_URI[sha256sum] = "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
 
diff --git a/meta-python/recipes-devtools/python/python-ptyprocess_0.5.2.bb b/meta-python/recipes-devtools/python/python-ptyprocess_0.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-ptyprocess_0.5.2.bb
rename to meta-python/recipes-devtools/python/python-ptyprocess_0.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.5.2.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-ptyprocess_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-ptyprocess_0.6.0.bb
-- 
2.7.4


