Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 244016612D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 16:54:45 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id z14so6235588qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 09:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=W2FX1kzRig7Tx3G5b1bEzHpwdu/aBjcL7RYrqfvpfzA=;
	b=f8nFNsNpG7UgNTiUXW7M3iFvsaBJf5DSXNMcIMbIbwqCBrrFOmx1YtoMsRWvF/Zbn8
	v0kTNljlbyL/LdehFVf7f5W7uo/KD43yq6B0Jxri8YOFofObK+2xJqS5HMMaY7hTCote
	8X2kcUL1nd7QOoA+tXkiSf87YJX/cF7pxzWzPC7eOZC68d62vy+4Z3QT4CPOI24yW14z
	oSvqnh8j+g0NKXTwOm9p/rpTOWdoeBTMcd5geac6Wztzbfgid11cOd6iIayKfu5KVCJs
	+Ct8fM7V4bWlsjZfHGc09I0ES76jZmPX7ruKzrm08lknCjxRmOJAcUU4Mp9iQURJG1qI
	J88Q==
X-Gm-Message-State: AMCzsaXzjGccENOkwJ4VL08zljjRM5lZtiZdWuB51Y4TnmBJX5zFhAOD
	aLN/EHHJulDSquUmi/+jIHMwy4H0
X-Google-Smtp-Source: AOwi7QCvyXRXZkjeps1U5VHw3s/CrVK33sDg1HN+L9UoNlqjcQ6KDFzxAo6ZC+eLhVy8dkddvOCdWQ==
X-Received: by 10.55.201.149 with SMTP id m21mr12241687qkl.330.1507049686704; 
	Tue, 03 Oct 2017 09:54:46 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	m203sm8505984qke.21.2017.10.03.09.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 09:54:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 12:54:38 -0400
Message-Id: <1507049678-17377-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.27.1
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
X-List-Received-Date: Tue, 03 Oct 2017 16:54:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.27.bb => python-cython_0.27.1.bb}         | 0
 .../python/{python3-cython_0.27.bb => python3-cython_0.27.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.27.bb => python-cython_0.27.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.27.bb => python3-cython_0.27.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 38ee51f..572cb96 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "3a26a5940da1e9f95d8776eabd888b07"
-SRC_URI[sha256sum] = "b932b5194e87a8b853d493dc1b46e38632d6846a86f55b8346eb9c6ec3bdc00b"
+SRC_URI[md5sum] = "b93750b34382b025d678bea819b7491b"
+SRC_URI[sha256sum] = "e6840a2ba2704f4ffb40e454c36f73aeb440a4005453ee8d7ff6a00d812ba176"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.27.bb b/meta-python/recipes-devtools/python/python-cython_0.27.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.27.bb
rename to meta-python/recipes-devtools/python/python-cython_0.27.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.27.bb b/meta-python/recipes-devtools/python/python3-cython_0.27.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.27.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.27.1.bb
-- 
2.7.4


