Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0B17899B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 21:00:34 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o1so6573662wro.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ziv5J5oPiOKJtn80xfHrIigjZyKH+A6zKYbiEzc2zQk=;
	b=SFX6kE4+kQLjWd++QoM6LR8dgPBywbX2AnAAk/IfwqY+dV+RBLo7SSEJAxFpnpscUi
	5SNpz2QdKxFOhBGcxeo5JJ5jWeTC0ljKxpbsVMB3dXvUXDqQqu703t7imbevFNMaBK3P
	C1A1FDUmcjg44Qqnx4PAPQBzsBkguRWdm4J75FpG2KnOq0JNmEKxsuJ+cnKT87nRVqcM
	cg8FxzyCPlwDBYbjQCsoo74fSJwLLZ4o5wu1bJsRy/+MTVfkV95p2cBWg5DAtSlmWlqm
	qqulHRAdxLJ24TiyCRVy/qBMJzJwLEU3adIDftAuNcNa1bOInITWNIe2q/16GBK+tAFF
	FQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ziv5J5oPiOKJtn80xfHrIigjZyKH+A6zKYbiEzc2zQk=;
	b=ZOb9AFxZG9hbbnSovg5dZq7t/T03c38rPywSYU1Kqz8S2lwaCXryA+K8SoGTKycz2F
	XT7K2R1C5Bjbr3hbivI+pMgdUVuH0hv/CyodRKeCIZ0cMxl/RlyvW++/ZnLROxQD5XPc
	18OgQL9l3tuZ43uKm/+xSBPBsX7TKwn/L0AZOIQXUPfykx+j678eJsvjNhNF5AqLXUkX
	gLGbbM4dEHCDfyX/ajda0etOprwkuII1qwVgfN4+vCARuESnwiuXnjM3NJHvIvVfiU5r
	OBmi2y0Q01rBJ6k25Fh7TIJ+bmDhIwU6nG7ZckiDtVsmi1OtzhiFOXn29xt/CkwSkxly
	jQLw==
X-Gm-Message-State: AElRT7FKn7B65lVaWLeDkrfouqax0VKoyDDmBBJPSbAsNcMLnU/Zoxf/
	YLEvPC8nhnuQY7v5yZkw0KH1/A==
X-Google-Smtp-Source: AG47ELv0BDF3xe1QRH4M16NWOump/cbwNZ0bQumPyUDQAn9jQxUpNmYBuB2YIIhaXcya2wy+0oT7dg==
X-Received: by 10.223.196.132 with SMTP id m4mr19150357wrf.9.1521666035273;
	Wed, 21 Mar 2018 14:00:35 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111801E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1180:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	q21sm5916339wmd.12.2018.03.21.14.00.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 14:00:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 22:00:20 +0100
Message-Id: <20180321210022.4682-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180321210022.4682-1-schnitzeltony@gmail.com>
References: <20180321210022.4682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] exo: refresh patches
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
X-List-Received-Date: Wed, 21 Mar 2018 21:00:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/exo/configure.patch      | 20 +++++++++++++++++---
 .../recipes-xfce/exo/exo/exo-no-tests-0.8.patch     | 21 ++++++++++-----------
 .../exo/exo/reduce-build-to-exo-csource-only.patch  |  3 ++-
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/recipes-xfce/exo/exo/configure.patch
index ef27e423b..89cc1f387 100644
--- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/configure.patch
@@ -1,6 +1,20 @@
---- a/configure.ac	2007-12-02 10:37:06.000000000 -0200
-+++ b/configure.ac	2008-06-05 17:21:42.000000000 -0300
-@@ -127,22 +127,24 @@
+From 13a74582ffd7f81dbd66a7296fc76007718e9d4d Mon Sep 17 00:00:00 2001
+From: Andreas Mueller <schnitzeltony@gmx.de>
+Date: Mon, 1 Aug 2011 17:16:29 +0200
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+---
+ configure.ac | 34 ++++++++++++++++++----------------
+ 1 file changed, 18 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0de5ceb..3f92d1b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -143,22 +143,24 @@ AC_FUNC_MMAP()
  dnl ***************************************
  dnl *** Check for strftime() extensions ***
  dnl ***************************************
diff --git a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
index ac8bca5f3..348e147cf 100644
--- a/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
@@ -1,22 +1,24 @@
-From 5f1e19860d89647488bdd32a02fb332f69434405 Mon Sep 17 00:00:00 2001
+From 9231a2d5b9c5406f33aef3ab4de2dbec9b08ed13 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 18 May 2012 21:13:00 +0200
 Subject: [PATCH] Do not run tests at build time
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream-Status: Not-Applicable
+
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
 ---
- Makefile.am |    3 +--
- 1 files changed, 1 insertions(+), 2 deletions(-)
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0ab3853..3e72391 100644
+index 226e79d..62ad18d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -8,8 +8,7 @@ SUBDIRS =								\
+@@ -9,8 +9,7 @@ SUBDIRS =								\
  	docs								\
  	icons								\
  	pixmaps								\
@@ -24,8 +26,5 @@ index 0ab3853..3e72391 100644
 -	tests
 +	po
  
- AUTOMAKE_OPTIONS =							\
- 	1.9								\
--- 
-1.7.4.4
-
+ distclean-local:
+ 	rm -rf *.cache *~
diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
index f5c5e8dac..076477581 100644
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -10,9 +10,10 @@ exo-csource creates c-header files from glade resource output files. When
 building xfce-packages from git instead of tarball this exo-csource-native is
 required.
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
 ---
  Makefile.am  | 10 +---------
  configure.ac | 22 ----------------------
-- 
2.14.3


