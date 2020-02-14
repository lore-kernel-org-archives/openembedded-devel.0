Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 67DDC610EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:35:37 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id a142so10947353oii.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lkw5wC/bv7WAZVdx9zm0spJIHtutdwp98oDRWpjRehs=;
	b=h9RKRAgnyydCzYZv1vmagXbOogtniiZicgQUoTElOTldy0dpjgptEHjkQuer4VlVJg
	R+iNtbS6h3Wp6XAp+s7Wgr9du6QsE5oKNbsEdyCP3BQg8Vk5c2Q/FYtZazWE8S4nvO0W
	D5CgmxsNaPOXEliHrFLSlxDFc1AtWmSQnkE+PEgWIR6pRD0ihwgGqRyoxiW+pPWc5ggh
	6adFMW0NyOmOV437VAdn69UKtrwCT2bsWvF/PAZvyk2yxdh1/kZSNvGysxC91/F1wi7U
	rQEFEq7fZJsQdw+dTRY16uoReUu0iBSLM+j9+HXxKtPUO0mxqDT6oSNp9nM8v0lhLWqW
	PJFg==
X-Gm-Message-State: APjAAAWu9HqnMSLBOirJKsN5OuUrHkSvMTdStyWVpuZ/O65dSOuIO32v
	YemSosq7RXZS08hZXIIoExZKDRDYUmA=
X-Google-Smtp-Source: APXvYqwXIs5Pm6i0AxMC8CDR1uIlnL/Tuze/yn2uYAEg/28rVRByM9iNSIIVOs3jPTQsa+6j343taA==
X-Received: by 2002:aca:fd94:: with SMTP id b142mr3323448oii.11.1581719737961; 
	Fri, 14 Feb 2020 14:35:37 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	s83sm2196184oif.33.2020.02.14.14.35.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:35:37 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:35:27 -0500
Message-Id: <20200214223527.14658-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-certifi: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 22:35:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-certifi.inc    | 13 -------------
 .../python/python3-certifi_2019.11.28.bb          | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-certifi.inc

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
deleted file mode 100644
index 98fa1f2889..0000000000
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Python package for providing Mozilla's CA Bundle."
-DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
-Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
-which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = " http://certifi.io/"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
-
-SRC_URI[md5sum] = "4d5229c4d9f0a4a79106f9e2c2cfd381"
-SRC_URI[sha256sum] = "25b64c7da4cd7479594d035c08c2d809eb4aab3a26e5a990ea98cc450c320f1f"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb b/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
index 70f674b22c..c9e945f271 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
@@ -1,2 +1,15 @@
+SUMMARY = "Python package for providing Mozilla's CA Bundle."
+DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
+Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
+which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
+HOMEPAGE = " http://certifi.io/"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
+
+SRC_URI[md5sum] = "4d5229c4d9f0a4a79106f9e2c2cfd381"
+SRC_URI[sha256sum] = "25b64c7da4cd7479594d035c08c2d809eb4aab3a26e5a990ea98cc450c320f1f"
+
 inherit pypi setuptools3
-require python-certifi.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


