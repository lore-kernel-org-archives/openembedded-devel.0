Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BBD517391A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:32:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v77so632972wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=67SCd2cImexr1yMvaVQdBclBR2SLYngREQlPVnuOoVw=;
	b=I7DQw74j90LEJZqHVWgMpYRlt6nbJqGq57tXMxyljou57puN+rijydiGu72wIl4uSX
	KmaYyHqUUgYZBzBHhOG788CX3yzYsBJrutcoXSYtAmTZ1IMpzxZEjbxvBjI1hFXgdQme
	bpVNhGzsliBZ1ed0/jjhYVeqF3rvQwzka2s8MiThqDYDiKnXqOBTlAAE7nqqn/II35iJ
	2/KbcqOVsqL3M6XwLfd+vRZzpAhoPqduOwyLq3n9mmhCChRV5/qPDgAJRazzQPF/tNw9
	DCzgQInir6qHmObA1bghVns0NvnFjM9SLYOlDK1XETLmBYCRbqcQ8WugTxsjM5r/A7mI
	Iftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=67SCd2cImexr1yMvaVQdBclBR2SLYngREQlPVnuOoVw=;
	b=b2dno9/WjqnbwOTSduIYKl6cUxTIVMZOpJ5reouZGsoholoIiEjZGAkc6HQv3GQyAZ
	2LBf5DabXncYFQPJdZDE0W2JLrLoqkG7wisYvNLQuOPfURZ3WxqTAsaoB2AI9467GwQS
	EO1RHXoehNCpPg/oftV9iOturfaLhT0L+K0fVYHe+qD05TcVccwhYBLgbx8vmUv2OZ4F
	TOaLlY2bseAlehK04d9+5LrjyLBLs1uY9aGOgOIrUZG+2JP1/0EedrnLmzK/SKwyBpRL
	ycFiOKMtwKh/QdvUcDD1Y/m52JaYpehmmpzFgLHCdRbd96JyZEGj4TyFT7udKf5b4YrM
	N0+Q==
X-Gm-Message-State: AMke39lZ4UwUW0MZmZRdb+JsIOF94Trn3tPJHyjGtdZXCAINH9H3GvKTBccvCob2tt7E1w==
X-Received: by 10.28.230.194 with SMTP id e63mr459216wmi.25.1487025176197;
	Mon, 13 Feb 2017 14:32:56 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:32:55 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:36 +0100
Message-Id: <1487025163-21628-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/9] klcc-cross: disable packaging using appropriate
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
X-List-Received-Date: Mon, 13 Feb 2017 22:32:57 -0000

Instead of deleting the packaging tasks we simply inherit
nopackages.bbclass.
Done that we do set PACKAGES to empty.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
index 15d860a..9126975 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
@@ -3,6 +3,10 @@ SUMMARY = "The klcc crosscompiler for klibc"
 require klibc.inc
 DEPENDS = "klibc"
 
+# no packaging for this crossscript
+PACKAGES = ""
+inherit nopackages
+
 FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 
 SRC_URI += "file://use-env-for-perl.patch"
@@ -32,11 +36,4 @@ klcc_sysroot_preprocess () {
        sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
 
-deltask do_package
-deltask do_packagedata
-deltask do_package_write_ipk
-deltask do_package_write_rpm
-deltask do_package_write_deb
-deltask do_package_write_tar
-
 SSTATE_SCAN_FILES = "*"
-- 
2.7.4


