Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 40A1E71A03
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:17:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id y38so3154515qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aKtjhsqfytuNdceFTIUUoYda40Qcw5AFZ9ovavgjojQ=;
	b=eZvVJs53iXuqdEhu2WsmuwgjCL5hwEleSwY74K17mEFpqWHqdZ8a6gEOHtVZ8OT3D5
	F6HixmaahUqXDiiOGAqoZ1NIlxrk86HR14w9doNOpNTDifEQyRQtf0h/esvQNl60z7RW
	Ls7bl7LnPDVqz4TEoXrXGrB20uJxXtkxn/uGX9i4P2LPkusZxyCmRJY2/djghZoG8BXv
	AGjh483b+yXcgL2S4w7tWhrCv3eHBXUq3uZZl3OScM7a/OcjcqKFi4sJVUe/zZwWmIXi
	jWbRHqczBU5cXFq3Ykx03MdhOjfO7jI9VpZxZhDcr7yoi0yAP1hvw/u5jhsl0ghdwNgE
	eRWw==
X-Gm-Message-State: AA6/9Rmd7QUcUrosn9eUitnnRPIdVRt3p0CQTLmbeCAmgtEJJxz2dp0yCN9QSL0k4r5d7A==
X-Received: by 10.200.44.75 with SMTP id e11mr9418349qta.9.1476397034530;
	Thu, 13 Oct 2016 15:17:14 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	b83sm3642585qkc.42.2016.10.13.15.17.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:17:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:16:52 -0400
Message-Id: <1476397012-14940-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-prompt-toolkit: update to version 1.0.7
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
X-List-Received-Date: Thu, 13 Oct 2016 22:17:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc         | 4 ++--
 ...{python-prompt-toolkit_1.0.6.bb => python-prompt-toolkit_1.0.7.bb} | 0
 ...ython3-prompt-toolkit_1.0.6.bb => python3-prompt-toolkit_1.0.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-prompt-toolkit_1.0.6.bb => python-prompt-toolkit_1.0.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_1.0.6.bb => python3-prompt-toolkit_1.0.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index ac860b7..8554aea 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -2,8 +2,8 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "9e0be24993b13b204e04ffd20b2873d2"
-SRC_URI[sha256sum] = "fa8f0c3668afbc85abbb4601ebc8db1db9d5009c8a833feea107fc63f1e7ef22"
+SRC_URI[md5sum] = "f74cd8ac84176fac1cdb136843ccb0d6"
+SRC_URI[sha256sum] = "ef0b8188179fe7d052161ed274b43e18f5a680ff84d01462293b327e1668d2ef"
 
 PYPI_PACKAGE = "prompt_toolkit"
 
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.6.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.6.bb
rename to meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.6.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.7.bb
-- 
2.7.4


