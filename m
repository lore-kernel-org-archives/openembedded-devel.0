Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id D75C1731A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 21:58:20 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q11so4367762qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vU+b769mL8GIv9UDd+1/y1ObzExGo4dcwyCkHoyxtY0=;
	b=VMI32L8Ld8ez9ltNTl1TwrQMdGnyQLJ1TcEk02+HeSUHpDVDJ6bqsOKfP3aop1hmsN
	9UIIcb96zP94Y+K6HXqxx3SWKsiPG7kqGTQ90ZXeumJ9wg1e9h4C0R212Y3O1aHwZN5f
	6602P8S/+2qHgi+gxXOKaBdCwWk/6IxND9k5AuxhVD+7Pqj8T5IIYQdggnFloQcY0aFK
	k1j7Iprp97Eh14G+j9faZrXJuvFD0UmCLkX4dcb1HREBYgG5uCpzilnGFfGeYNnHXxye
	zPWEmdn5QQAU8z7N2A2SW6IGz53gMgBnNMzRX5LRwgLcQScNXF25kVqzl3v+uRB5bwCk
	BMKw==
X-Gm-Message-State: ALyK8tIM0sUfxp+jvu84OtQwFZ+JBvX0xLmRpwSGoFpFmMWOh84Voqg0z0ipKmwE1YFm2g==
X-Received: by 10.200.53.237 with SMTP id l42mr33540491qtb.84.1468619901144;
	Fri, 15 Jul 2016 14:58:21 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 1sm2148100qtv.13.2016.07.15.14.58.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jul 2016 14:58:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 17:58:12 -0400
Message-Id: <1468619892-10562-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-flufl-enum: remove deprecated package
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
X-List-Received-Date: Fri, 15 Jul 2016 21:58:21 -0000

The maintainer of the package has marked it deprecated and users should move to the standard library third party package (enum34)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-flufl-enum_4.1.bb                | 24 ----------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
deleted file mode 100644
index ef10848..0000000
--- a/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY  = "A Python enumeration package."
-DESCRIPTION = "The flufl.enum library is a Python enumeration package. Its goal is to provide simple, \
-specific, concise semantics in an easy to read and write syntax. flufl.enum has just enough of the \
-features needed to make enumerations useful, but without a lot of extra baggage to weigh them down. "
-
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=250adb4c74c359b7049abcd9d6b115e7"
-
-SRC_URI[md5sum] = "461779384c07ed2b5f554a5d51a000c4"
-SRC_URI[sha256sum] = "94da1413ba085473652f81565847913ea1543d1739972ecbd6afe57d7b1b68b4"
-
-PYPI_PACKAGE = "flufl.enum"
-inherit pypi setuptools
-
-PACKAGES =+ "\  
-    ${PN}-test \
-"
-
-FILES_${PN}-doc += "\
-    ${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/*.rst \
-    ${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/docs \
-"
-
-FILES_${PN}-test += "${libdir}/${PYTHON_DIR}/site-packages/flufl/enum/tests"
-- 
1.9.1


