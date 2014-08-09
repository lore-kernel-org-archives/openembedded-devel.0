Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8D45C70A80
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:41 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so6817779wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EJOJI7Fa5S/PJUHAH56/iKx8MEK269Ikasxt84aqdI0=;
	b=m30ad3c6Y/nkJKDEIy0QOEBnC7ImMh7a9rSF4UNOaK6/WmQDl9wcw8zsBHBuMF6gmz
	UxqAQAQOxlIuTIiyfvt0+4MaF6X4CrNsdvbgwHYMKe+nSdSkgMv8z2OCIWN7FfNf2Jl5
	b9A2PvAHXV0SY4LcnXZhPloLHqhgKXutzXT0v2Ea2EO9J9RlvslvaivZx0ELkjOtHQgf
	gwxqLJFa10Urh3Y0tNjLXtQBobnCFsa9A0Z+4++iCzvGfJbxQo7WTQOOk0ZnKJX6YT9j
	Oe0P9PmDl24mSX9TGAlBZ5bJvsrsfaepA9SRoF607/ZDBAjEsDPBczM86kYO8xDKE32u
	mdRA==
X-Received: by 10.180.184.99 with SMTP id et3mr6143792wic.31.1407600522192;
	Sat, 09 Aug 2014 09:08:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft17sm25539432wjc.14.2014.08.09.09.08.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:33 +0200
Message-Id: <1407600537-10857-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/36] cairomm: don't include cairo.inc
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:42 -0000

* we were overriding most variables from cairo.inc

* fixes following QA warnings:
  cairomm-1.10.0: cairomm: configure was passed unrecognised options:
    --disable-egl --enable-tee --with-x --disable-glesv2
    --disable-valgrind --disable-some-floating-point
    [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
index 86ba552..12cd5e7 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
@@ -1,5 +1,3 @@
-require recipes-graphics/cairo/cairo.inc
-
 SUMMARY = "C++ bindings for Cairo graphics library"
 
 LICENSE = "LGPLv2"
-- 
2.0.4


