Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB9A78488
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:02:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l64so13943519pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 22:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sNEP4txLBbzOqxUSadlT4C6mJcW9MjVA73hlSYaNfuo=;
	b=RGio8uvdljovEQPw/RpXRzABgyYkVytDBMavbu7vyqNZL9VAldJ6hzoV6G7XGDSYsC
	iTpU8KWzl+B4LtkNo8o7yIKTaH7BHDkAudi1MnH/mxEl7fGaUAPeE6CpLwMUg9arAlNB
	p4xmFw24TV+gpCT9tjMrfJm7HeeBYfh0/xXta8dFZbxaMLMyadN1Di1N2c4hFbqUi4Nw
	+hWQEqWmeRSkQsmuJny+qyFwPTYLXt7JFHlCKzo9kRb6wjU3pNyEjyspBd6HTVrMKe3F
	hCl//eCsYkrLHAZmdgiDpRBVh26AwslKDU6MFLUTmqbEMm/qqU2+zdZIM7Xq+11urOL5
	MSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sNEP4txLBbzOqxUSadlT4C6mJcW9MjVA73hlSYaNfuo=;
	b=CwbovnF3Do0WXLFtMLTm3Ow7Lw8ilKYvwG2AT1HqmfoK6jsbDl81tNqv6VTIoWXkRk
	lkepGRhRJPKRVusjlftlu9PMM50RpvJHYHqhzTj5GzukQktPDg6vFQJ/ucs7CB3IrWdk
	9B541eKABUd+DnOKCoNW2lAuxvh60BMN9BcREjBt/vs1yGYpev89VjGMaYO8NQVSg/3R
	+QCjgQrMHKUM5mIk0KqLGNklIKDcxUxR9V5POH8c5gYIThoT/aGcLjIN28GX6JtNyOsH
	hgYNR2Lpe1H0vDFIg6OYT50b9H/R/keh96rwQQzKW04s1cUYVOQQINyX+fNgxDIFnxiE
	08oA==
X-Gm-Message-State: AHYfb5hKyXvt4XfWs0GVWwCowlcyEq+QfKOZnlNrwh/2lwnr/Ap2NQBJ
	/vl9uk5HpE8FZBfB
X-Received: by 10.98.23.69 with SMTP id 66mr27861349pfx.305.1502773353525;
	Mon, 14 Aug 2017 22:02:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	j63sm14640904pge.88.2017.08.14.22.02.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Aug 2017 22:02:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 22:02:21 -0700
Message-Id: <20170815050221.16408-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170815050221.16408-1-raj.khem@gmail.com>
References: <20170815050221.16408-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python-m2crypto: Upgrade to 0.26.0
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
X-List-Received-Date: Tue, 15 Aug 2017 05:02:32 -0000

Use proper LICENCE file for LIC_FILES_CHKSUM

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
index 72523bd7f..446f4d80a 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
@@ -2,12 +2,11 @@ SUMMARY = "A Python crypto and SSL toolkit"
 HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a60"
-
-SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
-SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d87844d9866ee823b4fdbc52f7e79187c2d9acef"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
+SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
+SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f0e05d3611b09ea185f68e1630530ec09ae8"
 
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi setuptools siteinfo
@@ -18,10 +17,8 @@ RDEPENDS_${PN} += "python-typing"
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
 
-inherit setuptools
-
-SWIG_FEATURES_x86-64 = "-D__x86_64__"
-SWIG_FEATURES ?= ""
+SWIG_FEATURES_append_x86-64 = " -D__x86_64__"
+SWIG_FEATURES = "-ignoremissing"
 export SWIG_FEATURES
 
 # Get around a problem with swig, but only if the
-- 
2.14.1


