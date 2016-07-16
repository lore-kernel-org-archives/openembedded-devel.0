Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 79FD46067C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 15:57:05 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j37so5114804qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 08:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P7PiemnGfjzV/aCWn/vR+EQ2hahKYqwi3jujQD5Kw54=;
	b=PN07XxlS16svKTtlUB7lusNf6369D3uDHWaz2554stCUt5DACmSjIMOccqjioH8s3g
	A0ZEjHjV8pHS3/XpZ4RRXkRpOayxoB7a/xJ6UxFEXxsfydTO6pppQeFVDmmHHtQrxpub
	S/fftIrlJyNG2BijcDDjxD/FTfUPfAY5cR1/bsM0lqzN/wVh4X4SCTkWs93b91nkxqXH
	ErumytoJ1gfChS7ZXmKTiGgEmAfUXJyzeHUn9y+VrBQpYl/iOUZkzy1F/hZ7V3IFGQ3Z
	Hh0W3qiL5KBnGnh+r0B7xol5VsZ0xMZdEwYDibxkoh9AOmOyHO7gQpLo/tJ+5H0GohxH
	Sv+A==
X-Gm-Message-State: ALyK8tLwjd/rb5a3X8GArjC/PqNsxZpVNBr+ejswi8yIxPMIOxgyi2vk9CPVC8MQ6M+ynw==
X-Received: by 10.200.54.28 with SMTP id m28mr38170379qtb.87.1468684625503;
	Sat, 16 Jul 2016 08:57:05 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	t15sm2514417qtc.26.2016.07.16.08.57.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 08:57:04 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Jul 2016 11:56:48 -0400
Message-Id: <1468684608-5113-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-dominate: update to version 2.2.1 and fix RDEPENDS
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
X-List-Received-Date: Sat, 16 Jul 2016 15:57:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-dominate_2.2.0.bb => python-dominate_2.2.1.bb}       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dominate_2.2.0.bb => python-dominate_2.2.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-dominate_2.2.0.bb b/meta-python/recipes-devtools/python/python-dominate_2.2.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-dominate_2.2.0.bb
rename to meta-python/recipes-devtools/python/python-dominate_2.2.1.bb
index 1feaa7e..dc6e41c 100644
--- a/meta-python/recipes-devtools/python/python-dominate_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-dominate_2.2.1.bb
@@ -2,9 +2,14 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a30b9a8d0a5585c482c6c5a6d54aaebc"
 
-SRC_URI[md5sum] = "14ee0361db7fbaed982220c09ef8e0b9"
-SRC_URI[sha256sum] = "5032559e0f0835419763b3d1d88ad31ea4fe40935712db86014f2a341c89fa3d"
+SRC_URI[md5sum] = "cd156b5b290f49f2bb5814ea8acc12a3"
+SRC_URI[sha256sum] = "4aa6a2f458461541f9ceeb58b49da9b42320f80aa2a6f692baea2817431d9953"
 
 PYPI_PACKAGE_EXT = "zip"
 
 inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+    "
-- 
1.9.1


