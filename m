Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id D08C160589
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:32:36 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u62so18187861ywe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MRm4K9RaONcdzqJ30qS3VAhP6Z0XWOLaRqzwLkfHM+k=;
	b=IGg/OmaBcKPzt5evFdx8w21gHel0EC50HjZinyGi7bycYA+hMTpjRzS1se6e9PZKPH
	R0GMha2GM+ij/mw+srPiKYVs35TCzWZR0Qu7ybC/rJkuOBV5Jw73KCZqdjKDDS2jy9jg
	u3J1NcR2hHdhOzjzjlRTrSY53fvi8cvzs24IxatJ84i2hWueJWu6xv9DJpEMHNAZJGIV
	rylPZW0r68rRVwQiyARtxgOprjnRMJDikStvXJyubI0kg+nV3mgL3wRWg+MYW0bdULUt
	qgaI6XeVhUSOHFnj+++dmGNUmgGQ7UDc12Kcdoc8J++iaNnLmsFdcGYVRLfYX8o5kl6S
	vLRg==
X-Gm-Message-State: AOPr4FUu7Fs0iGEJvZmz68LOYIaZtzDyOD2W+dSRPlRUWFXl7+LltaSfze2HvbjeT2Djuw==
X-Received: by 10.129.115.138 with SMTP id o132mr4665847ywc.48.1463837557325; 
	Sat, 21 May 2016 06:32:37 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.71])
	by smtp.gmail.com with ESMTPSA id
	i187sm13993533ywb.51.2016.05.21.06.32.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:32:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:32:30 -0400
Message-Id: <1463837550-16551-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyopenssl: update to version 16.0.0
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
X-List-Received-Date: Sat, 21 May 2016 13:32:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-pyopenssl_0.15.1.bb => python-pyopenssl_16.0.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_0.15.1.bb => python-pyopenssl_16.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
index 5027c6d..d1d8f63 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
@@ -3,10 +3,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl python-cryptography"
-PE = "1"
 
-SRC_URI[md5sum] = "f447644afcbd5f0a1f47350fec63a4c6"
-SRC_URI[sha256sum] = "f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672"
+SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
+SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
+PYPI_PACKAGE_HASH = "77f2bccec75ca4280a9fa762a90a1b8b152a22eac5d9c726d7da1fcbfe0a20e6"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools
-- 
1.9.1


