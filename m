Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id D976A65D68
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 13:38:24 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id t59so333147yho.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=GY/N4y71ieBrMeex1SGK3qNhbGmBswVqdMO8mBwwSA8=;
	b=PhdTT6meFk2YFEnOSKx4XN6OFk4DroS0CdddQBhePaNdrhNS21RwYfhIO68tegm4YQ
	DbbwjyB30UPTvXZLeRS8JEIACwTdRO9bLjJkakc/Ptx2vWq0Ia3g+9F9+enpy/dq+VCS
	4zgmrnj9Dg4s6FewGRtAKpmg3b+UCnRcHZfclAhWLciJvzyg6uaoF4DMy68r9KMk0E3y
	HNCvGgMWMxQK1mOV5ZA5m5cDJbblM5J8m4dwsNDVgHKg8yjUDK2nglLSfcY6LA0Bq9Rp
	6ex0HovkFbc25xRHAnwpI2oIpTAT+yt3SW681XLF/fwrIVh7VzJhlTd5A89dHPXjWZiY
	7kkw==
X-Received: by 10.236.97.102 with SMTP id s66mr37315595yhf.45.1397914704870;
	Sat, 19 Apr 2014 06:38:24 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	d68sm59005115yhc.37.2014.04.19.06.38.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 06:38:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id B80921A52A486; Sat, 19 Apr 2014 10:38:20 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 19 Apr 2014 10:38:16 -0300
Message-Id: <1397914696-12292-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3] glcompbench: Create 2012.08 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Apr 2014 13:38:25 -0000

From: Lauren Post <lauren.post@freescale.com>

glcompbench is a benchmark tool for GL(ES)2 based
compositing operations

Signed-off-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v3:
- Drop duplicated depends (Khem)

 .../glcompbench/glbench-compile-fix.patch          | 35 ++++++++++++++++++++++
 .../glcompbench/glcompbench_2012.08.bb             | 14 +++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
 create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb

diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
new file mode 100644
index 0000000..374a6cf
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
@@ -0,0 +1,35 @@
+From c4bc44c3abf69f26e4c2b7684f4da4670a51f993 Mon Sep 17 00:00:00 2001
+From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
+Date: Tue, 5 Nov 2013 11:03:04 -0600
+Subject: [PATCH] to make compilable
+
+Upstream Status: Inappropriate [workaround]
+
+Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
+---
+ src/composite-test-simple-blur.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/composite-test-simple-blur.cc b/src/composite-test-simple-blur.cc
+index 170ad64..d7f77cf 100644
+--- a/src/composite-test-simple-blur.cc
++++ b/src/composite-test-simple-blur.cc
+@@ -347,6 +347,7 @@ CompositeTestSimpleBlur::CompositeTestSimpleBlur() :
+ 
+ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
+ {
++#if 0
+     for (BlurWindowMapType::iterator winIt = priv_->windowMap.begin();
+          winIt != priv_->windowMap.end();
+          winIt++)
+@@ -354,6 +355,7 @@ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
+         RenderWindowBlur* ro = winIt->second;
+         delete ro;
+     }
++#endif
+     delete priv_;
+ }
+ 
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
new file mode 100644
index 0000000..51f57b9
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A benchmark for GL(ES)2 based compositing operations"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+DEPENDS = "virtual/libgl virtual/egl virtual/libgles1 virtual/libgles2 \
+           virtual/libx11 libxcomposite pixman libxrender libpng12"
+
+SRC_URI = "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.tar.gz \
+           file://glbench-compile-fix.patch"
+
+SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
+SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
+
+inherit pkgconfig waf
-- 
1.9.2


