Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 52ED770034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:26:13 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n189so7258801qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uK/1JuUZROvFVWjAVR5RGU6tYa+ky6oKiGCtmH08f0k=;
	b=H7JPJfvEKmi6otN9hZBaLu5GYAkikT362CjVdCuO8zwwqYEGwx2nKp1yD9Hix+QVf5
	s5g/7d6HsPYjvI4TgOvKwStsCgn/mKi3KX0qOM/lFsNCrutYZ6IE23dYZOX8sDWswZQN
	uCH+8rR+sMAslFGtyznRJrMyot7DJDsUUyKG3ICY4rCzNG+QnVIO98pt1EUgXKnQ8D2C
	bTYE5QtZgwutvWSNcYjQDDMuYSADaxh/V/t1kKpVSZd7lEAmSdD3DizVqcWP86PdxfUJ
	3UOmC9+hMb+jvOdfwbqFkPy1aBFJiogthOi+S73PCQEvqO2vzrqeELSRDnrPEeaxevF/
	f1kg==
X-Gm-Message-State: AA6/9RlAIXY3dFQVlMh43gOuNM+qBYQH92YdUdQnlvH3r7VHNvPCjEmGSd0NvxSSUFTilg==
X-Received: by 10.55.188.193 with SMTP id m184mr8563245qkf.129.1476397574711; 
	Thu, 13 Oct 2016 15:26:14 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	y33sm5938207qtc.34.2016.10.13.15.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:26:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:26:07 -0400
Message-Id: <1476397567-3970-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyopenssl: update to version 16.1.0
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
X-List-Received-Date: Thu, 13 Oct 2016 22:26:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc              | 4 ++--
 .../python/{python-pyopenssl_16.0.0.bb => python-pyopenssl_16.1.0.bb} | 0
 .../{python3-pyopenssl_16.0.0.bb => python3-pyopenssl_16.1.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_16.0.0.bb => python-pyopenssl_16.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_16.0.0.bb => python3-pyopenssl_16.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 75cb867..0ddad12 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
-SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
+SRC_URI[md5sum] = "d8100b0c333f0eeadaf05914da8792a6"
+SRC_URI[sha256sum] = "88f7ada2a71daf2c78a4f139b19d57551b4c8be01f53a1cb5c86c2f3bf01355f"
 
 PYPI_PACKAGE = "pyOpenSSL"
 
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_16.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_16.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_16.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_16.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_16.1.0.bb
-- 
2.7.4


