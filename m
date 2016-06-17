Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E5BF5766A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 19:40:14 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j2so13323508qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 12:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=donikdDRInxsocSifADN2GWhY6JvP+zJnI/38m1PTOo=;
	b=P/MwJPfXjJ8PywXQV5XgR9dw0oIDu3kYByC8xmfL2nI9mWpQf3w1IDWSzLk84460uU
	L6a6jVsDqAvg5vtKmPOnTWh4xoJGBsxVqT5H9Fjl6uLBJwGuNZTBJTiOgI4grqdUJGkS
	7IPk8Sh3kHDNLQfgSU/67sQozq0SEH8cXbOBDCNZOUL/QN7qUWxikVRphCMdwiTQD1Fg
	sqi0lcCNdxTyA0qDfgrGufaevo4GhKf6DKM6Gz4aAG2toC27FIPe+9HdoscZf4XVB/bg
	qv6kDK4C71wLD4kbTRLSgMCyzhOBV0Bt9Q4LnHPjcfCAKPpTYCiT6Fdw4hi30UDGvtuH
	Z1wA==
X-Gm-Message-State: ALyK8tJeMkGnzmKnpZyQ+X4y/OcQFHghW46WG9SK+pVYu+ZomM4k/0EmwVBlEEj0QQxfoA==
X-Received: by 10.55.10.147 with SMTP id 141mr4632841qkk.91.1466192414886;
	Fri, 17 Jun 2016 12:40:14 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	h60sm11614824qtd.28.2016.06.17.12.40.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 12:40:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:40:08 -0400
Message-Id: <1466192409-3297-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH 1/2] poppler: fix ambiguity on math functions related to gcc-6
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
X-List-Received-Date: Fri, 17 Jun 2016 19:40:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../poppler/0002-fix-gcc-6-math-ambiguous-errors.patch        | 11 +++++++++++
 meta-oe/recipes-support/poppler/poppler_0.43.0.bb             |  4 +---
 2 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch b/meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch
new file mode 100644
index 0000000..406009f
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch
@@ -0,0 +1,11 @@
+--- poppler-0.45.0/poppler/CairoOutputDev.cc.orig	2016-06-17 14:23:35.399083929 -0400
++++ poppler-0.45.0/poppler/CairoOutputDev.cc	2016-06-17 14:36:53.351097825 -0400
+@@ -42,7 +42,7 @@
+ #endif
+ 
+ #include <string.h>
+-#include <math.h>
++#include <cmath>
+ #include <assert.h>
+ #include <cairo.h>
+ 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.43.0.bb b/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
index 743e0aa..9abcd2c 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
+    file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
 SRC_URI[md5sum] = "1d2b001663119855cdfbc0713dbfb9c6"
 SRC_URI[sha256sum] = "c720e26a26ee10b7ebc9e256d2ee7adcdb536cf85f9f1c4777a38f7f81fb2456"
@@ -53,6 +54,3 @@ FILES_libpoppler = "${libdir}/libpoppler.so.*"
 FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
 
 RDEPENDS_libpoppler = "poppler-data"
-
-# http://errors.yoctoproject.org/Errors/Details/68605/
-PNBLACKLIST[poppler] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1


