Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id DC80A7897B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 21:00:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id d10so6581856wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=adTLLuHPcAMsuic2V6Sr0Z8ukasN7t34CEV/9M6W4vM=;
	b=Rwk6nTIR5yvkccqI4zTFKQsqXaxVcmhyTDeLoTu12yktX/7ZdGnCod9kfPZvtxbHLq
	wIrl4MHLBrIPqQZIAHcMrowYNgj681uwqo9gIOtPTmU8qQDvc3iLxPdyjoZ2EtB45Abv
	Em3vQFnrugrXIuxdZTTm2LAyv2KPM0Nb/w4cnsNQSwqcOrThvwNvkOB6umY2DZATd2XY
	XcXanvJX2rXzt95jLXlYNlF/516AbHX8BO6GDC5zRI2x8hCUu2swT6ZZzxA5d0lJ7ZMh
	zYgWdeR8bebe6Tj3YCRAaKFNzHtzkwiX+39JRMIYog+Dy8H86cIa5YfbkS5WzWacuCiK
	AHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=adTLLuHPcAMsuic2V6Sr0Z8ukasN7t34CEV/9M6W4vM=;
	b=gpHXQU6wKdzsZnNwPOTMgSuCmO69KkhNqGZ7F52+MDK2+FGSdUwT84NZRPpbGvE0rC
	0LdnzqEtHeFe6cSZaVEMesscwDKlaLDvIPOoEFwKiKYlz2AT6tNKcZzPN436rrb/Utqg
	x58n3fhAchLOBtY55aiawxwTdUpqenqV7yegqs57CJZjHeY+AvnIjtebaQwIWrE6hZtN
	ZbL+DKNztz+qeyMR4nxFvgA15ecby+k94y+E292Bl4j5tgY2ZffPUpJxH3BJBqTwVprr
	ZZJzUgDzyTRCSSmw5cyqLkH7Q4AEmnWsKOECbepF0XMiZXGFuSs0bBXRjrwlS/Jp+HEZ
	6ULA==
X-Gm-Message-State: AElRT7GtVlEqTqkKeetqcY2HYYb/lNkL726hoEW8ll+RdN7SeAV53SP0
	cf6ViyKJZM1tSmxqlO2R8ruvvQ==
X-Google-Smtp-Source: AG47ELvkGRrPNX/RbMXepwCpZpucGLQYDzFacd8kM7Z9hnjzy5V4Ki7Ju+9gxF7Z2SkMnSdKw7F9yA==
X-Received: by 10.223.153.167 with SMTP id y36mr17484988wrb.136.1521666034397; 
	Wed, 21 Mar 2018 14:00:34 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC111801E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:1180:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	q21sm5916339wmd.12.2018.03.21.14.00.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 14:00:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 22:00:19 +0100
Message-Id: <20180321210022.4682-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180321210022.4682-1-schnitzeltony@gmail.com>
References: <20180321210022.4682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] glibmm: refresh remove-examples.patch
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
 .../glib-2.0/glibmm/remove-examples.patch          | 29 ++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
index a5944c288..214f1e338 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
+++ b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
@@ -1,7 +1,16 @@
-Index: glibmm-2.22.1/Makefile.am
-===================================================================
---- glibmm-2.22.1.orig/Makefile.am
-+++ glibmm-2.22.1/Makefile.am
+From 874fe8ef8f159cff17b199b9575fbfcf00fe2a1c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 12 Jul 2011 11:46:37 +0200
+
+---
+ Makefile.am  | 7 +------
+ configure.ac | 1 -
+ 2 files changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a0df8af..c3d5e06 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -23,12 +23,7 @@ src_subdirs = glib/src gio/src
  else
  src_subdirs =
@@ -16,15 +25,15 @@ Index: glibmm-2.22.1/Makefile.am
  
  glibmm_includedir = $(includedir)/$(GLIBMM_MODULE_NAME)
  glibmm_include_HEADERS = glib/glibmm.h
-Index: glibmm-2.22.1/configure.ac
-===================================================================
---- glibmm-2.22.1.orig/configure.ac
-+++ glibmm-2.22.1/configure.ac
-@@ -136,7 +136,6 @@ AC_CONFIG_FILES([Makefile
+diff --git a/configure.ac b/configure.ac
+index c20e778..74203be 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,7 +166,6 @@ AC_CONFIG_FILES([Makefile
                   gio/src/Makefile
                   gio/giomm/Makefile
                   tests/Makefile
 -                 examples/Makefile
                   docs/Makefile
                   docs/reference/Doxyfile
-                  MSVC_Net2005/glibmm/glibmm.rc
+                  MSVC_Net2013/glibmm/glibmm.rc
-- 
2.14.3


