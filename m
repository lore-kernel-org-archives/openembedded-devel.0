Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBC970A97
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:07 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so6866887wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MpJc7gUyAuZHtGMal8rLyVWzWPhXHKzjD5PmDf3TSGU=;
	b=ZjN2KzZrIpp1cc4ODvZnXyXHZMwuKPfFFvxGkUeJoCKNi35Ex4VSiU0Rc4tKmIhSti
	uJA6Qd41pgPmx8zYDxoi2wiqIa4CNiGrdE6DX6jJ1WVktcm62lbU1UslCngUU+nVCX5M
	4hkt8YovrajU2btDYoACW8mijuMWFgmNeAG/7tpnw/I93fYs/4J4zzsG0ZwX5IknVbff
	wXsgTY4jDAvG7c3blO+040dlhdpBXMhLFjpay0/H/40jnI1mwLcHVsuvwcIKzZ4s+fWe
	KlFfB8+cRIEGXFUG1pmc3zTLd5A7UMaDhO3LNPTPQxqSKfvAVI2BGZyd+sF4tpsW4g7i
	ATvA==
X-Received: by 10.180.99.34 with SMTP id en2mr7566927wib.34.1407600549132;
	Sat, 09 Aug 2014 09:09:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft17sm25541930wjc.14.2014.08.09.09.09.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:55 +0200
Message-Id: <1407600537-10857-34-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 34/36] gd: add dependency on tiff
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:08 -0000

* fixes floating dependency:
  gd/gd/latest lost dependency on  liblzma tiff

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gd/gd_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
index ec2a09d..4bc9867 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://libgd.bitbucket.org/"
 SECTION = "libs"
 LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
-DEPENDS = "freetype libpng jpeg zlib"
+DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}.tar.bz2 \
            file://fix-the-subdir-objects-error.patch \
-- 
2.0.4


