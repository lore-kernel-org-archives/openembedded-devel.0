Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0FF74598
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 21:16:54 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 27-v6so14472902qkv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=plZMOsxO9mYBRHyxfvDgXsSISDzPgXDUo9dpK1gYE5U=;
	b=TLMtDAS3WCVY6PgrPwASt8ORD/qnnFo3mOtHmomgHZbPjiLtYQanJEfdec7MYOlFHH
	uDeP/awZkACNLU7JojPFULOHSuYl1rcLkr2+s9DXYj1Ax4BfqASxF38kChw3rhPgndrx
	tUpnW/Wn46inWh4QUBeldp+vgLI8xBr4OEoRnjFBlSoWII/YYc0sm3i/pQrl5BbCYWWN
	It7hgQbLPHx1t8naSDc+QNrCayYklKMWFeTzWAUj9oPXolvGABWRn74l4sx3k8HnE8qy
	4c8PmTs+sWMmiF2c6NuyOQLRHZ/fvlJLF1G297Whs+icPCQeO4FNBzO3HUx3k6SncxZm
	cCxw==
X-Gm-Message-State: AOUpUlG5l3iTCwogh9YVAQzToWnIyc1DhRb6daaRnFOH6mlig5+Evnxu
	hGi7l+ov+PIH+rKLOEVWEE8E1+BAOKw=
X-Google-Smtp-Source: AA+uWPyOTftmxaltYO+g7mZ2qAgOPkKaSL53gnjmmqb1gy8/v8Qj5RLoHz+8CUImKbd2lSvw7DJ1Xw==
X-Received: by 2002:a37:d60f:: with SMTP id
	t15-v6mr22092374qki.316.1534281414704; 
	Tue, 14 Aug 2018 14:16:54 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	c138-v6sm11715350qkg.79.2018.08.14.14.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 14:16:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 17:16:43 -0400
Message-Id: <1534281403-21391-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.28.5
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
X-List-Received-Date: Tue, 14 Aug 2018 21:16:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.28.4.bb => python-cython_0.28.5.bb}       | 0
 .../python/{python3-cython_0.28.4.bb => python3-cython_0.28.5.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.28.4.bb => python-cython_0.28.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.28.4.bb => python3-cython_0.28.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 713fd2f..0939cad 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "fa01ba71b1e3136b0f12e3ed8958ea02"
-SRC_URI[sha256sum] = "76ac2b08d3d956d77b574bb43cbf1d37bd58b9d50c04ba281303e695854ebc46"
+SRC_URI[md5sum] = "0cb620e1259818e4ecc1a056e8c3a8be"
+SRC_URI[sha256sum] = "b64575241f64f6ec005a4d4137339fb0ba5e156e826db2fdb5f458060d9979e0"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.28.4.bb b/meta-python/recipes-devtools/python/python-cython_0.28.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.28.4.bb
rename to meta-python/recipes-devtools/python/python-cython_0.28.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.28.4.bb b/meta-python/recipes-devtools/python/python3-cython_0.28.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.28.4.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.28.5.bb
-- 
2.7.4


