Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F1C6D77040
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:12:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e127so334233pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rpAOJ1AtODXuSiP1I0zRKUwDvqoRR9dJwatq9QKQopo=;
	b=aLCQK4QZjnk5D3nvxert2AIDuSpREoyHf2qpBskfm3HNuVGTjaxG3+PcgkywnCYgal
	x+iiU3LaYUNfaehapZAdDn7t3v93GnJ1cAQD5PvR0QAp1cJXJkQfletuuM/4TERKuMmO
	fNMFEzoMDNuS3tD4P7zBEkjs9S1RRbEo7+aszvJZyQdFHL62Et6kOQb4f2MEuK4cAeZ8
	IKy6jk9buPBexJj21MVLMO4y09KjndW1NS5fiDdlsHT8Bwx1J5OTyZJ4+eE0TtzfWs7F
	GmSaBui+5dhN6CLjjgOg8T4HGeoUqMppeY61IDVW1L8QohcG5zNEbPq6YrHkGWJESWNA
	AC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rpAOJ1AtODXuSiP1I0zRKUwDvqoRR9dJwatq9QKQopo=;
	b=B549ylKUeV/8KHO9IseUjGddPkSdul7ObfDw+wOyMqtiSsE7DSh8nJesL1wMNHFfPV
	BnLFxibRjubQNn3KbmnFEuztpG/knKxQX9ESYIw+ZuHVVnzjGQkHJF4+F75ZLf6vtEev
	0E/F+DLS3C7qbScePJEDV0nBxXc7jXisbKS6h3RszU7+YJM9fex1LiUpe0eC2qeoMtU8
	rM9BAiheNjnoIUywfY9Mcg7xF8QbXnb9A++WWjNybbVGohkwtqIZg+X610L8ixNQeWEA
	IKxe0af90FYd/OA2X/Aahh6Fuek+kHlkZKpvCVl/L42h9DBSYPAuksQl0DPp+VxXwgFl
	cjLA==
X-Gm-Message-State: AG10YOSaHKxi8YVeT4x2Ib2n1DQ6vD6NmYXHffghOf45gvr+bTls5cF/k0kVl6JwI+1YEA==
X-Received: by 10.98.40.5 with SMTP id o5mr37743980pfo.76.1454879540047;
	Sun, 07 Feb 2016 13:12:20 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g81sm38382783pfj.1.2016.02.07.13.12.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:12:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:11:58 -0800
Message-Id: <8207e090a51141f0fcf30a76c984bb67b5d97127.1454879225.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
Subject: [PATCH 6/7] php: Security fix CVE-2016-1903
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
X-List-Received-Date: Sun, 07 Feb 2016 21:12:19 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-1903 php: Out-of-bounds memory read via gdImageRotateInterpolated

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/php/php/CVE-2016-1903.patch   | 28 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.5.21.bb         |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2016-1903.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2016-1903.patch b/meta-oe/recipes-devtools/php/php/CVE-2016-1903.patch
new file mode 100644
index 0000000..46c9a24
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2016-1903.patch
@@ -0,0 +1,28 @@
+From aa8d3a8cc612ba87c0497275f58a2317a90fb1c4 Mon Sep 17 00:00:00 2001
+From: Remi Collet <remi@php.net>
+Date: Tue, 12 Jan 2016 13:52:27 +0100
+Subject: [PATCH] fix the fix for bug #70976 (imagerotate)
+
+Upstream-Status: Backport
+https://github.com/php/php-src/commit/aa8d3a8cc612ba87c0497275f58a2317a90fb1c4
+
+CVE: CVE-2016-1903
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ext/gd/libgd/gd_interpolation.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+Index: php-5.5.21/ext/gd/libgd/gd_interpolation.c
+===================================================================
+--- php-5.5.21.orig/ext/gd/libgd/gd_interpolation.c
++++ php-5.5.21/ext/gd/libgd/gd_interpolation.c
+@@ -2162,7 +2162,7 @@ gdImagePtr gdImageRotateInterpolated(con
+ 	   images can be done at a later point.
+ 	*/
+ 	if (src->trueColor == 0) {
+-		if (bgcolor >= 0) {
++		if (bgcolor < gdMaxColors) {
+ 			bgcolor =  gdTrueColorAlpha(src->red[bgcolor], src->green[bgcolor], src->blue[bgcolor], src->alpha[bgcolor]);
+ 		}
+ 		gdImagePaletteToTrueColor(src);
diff --git a/meta-oe/recipes-devtools/php/php_5.5.21.bb b/meta-oe/recipes-devtools/php/php_5.5.21.bb
index ed286d6..6bdd1c5 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.21.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.21.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
            file://CVE-2015-7803.patch \
            file://CVE-2015-7804.patch \
+           file://CVE-2016-1903.patch \
           "
 
 SRC_URI_append_class-target += " \
-- 
2.3.5


