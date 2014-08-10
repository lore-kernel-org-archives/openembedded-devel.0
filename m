Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF9160144
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 08:52:26 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so7361070wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VDUFAo2e+A6aRx0nozaca/5h+lsvdCormwyZKRy4QFw=;
	b=v28JlHG8v0+W3oJYY49rD92q51sLn5IKSaI/d5MY7AzEhwAb+l/tWRTYbQcBROIy2+
	jikBzyEl4H+VB2pI0jdAqwRZmQhWIOvaD4XtuyZr/B0vaczfE2LKAwFP4LCO+AuQfjAO
	BCbszVqqd2ioR2mdzucRl5Pdry6TqyyjsMxwOAbSpGr5un9YJBBMEcYtXoBwvhkOz85Y
	KcIV1JSTYv3ijhb+xpM7vC+P4n3iKhHd5PlEbTCJHtbJJp3Jht2Kl8RStYG0Z61r/yhB
	up0aRsBjTcYjlYnkxdk+LuaE1wWVqyT3utoHZ5xNH4gxKX25pCQdFUJgUuL6cXWmsYgz
	XdGA==
X-Received: by 10.194.237.135 with SMTP id vc7mr45998091wjc.86.1407660747554; 
	Sun, 10 Aug 2014 01:52:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w14sm11622586wij.2.2014.08.10.01.52.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 01:52:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 10:52:59 +0200
Message-Id: <1407660779-3490-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-12-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-12-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv 12/36] cairomm: don't include cairo.inc
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
X-List-Received-Date: Sun, 10 Aug 2014 08:52:29 -0000

* we were overriding most variables from cairo.inc

* fixes following QA warnings:
  cairomm-1.10.0: cairomm: configure was passed unrecognised options:
    --disable-egl --enable-tee --with-x --disable-glesv2
    --disable-valgrind --disable-some-floating-point
    [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
index 86ba552..a5e383a 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
@@ -1,5 +1,3 @@
-require recipes-graphics/cairo/cairo.inc
-
 SUMMARY = "C++ bindings for Cairo graphics library"
 
 LICENSE = "LGPLv2"
@@ -7,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
 
 PR = "r1"
 
+inherit autotools pkgconfig
+
 DEPENDS = "cairo libsigc++-2.0"
 
 SRC_URI = "http://cairographics.org/releases/cairomm-${PV}.tar.gz;name=archive"
-- 
2.0.4


