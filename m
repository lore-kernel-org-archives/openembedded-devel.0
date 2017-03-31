Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B89B777EEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:57 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 79so18588913pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZeBAXG9qD04zMp2+fojcOohQWqpTO3g/aTtAs4w5fYs=;
	b=HpLpWP/dz2ljbVSyoVK75WTmW4q6P3aq1BzZpoRJ4kDc18cfuF8W9AY/MhY9+Lxnmc
	4teO62y5x3i62/GjaTieg+uOB0I3DtFkerxKeC9j4Csm7F+mBJdxIe9kEPl33gSKwVqT
	FfgehH6dWw42FK4Dk8hP67x6oMy31gXJz0iTz8qAvK7ZoLEgM2wJclmccPRt6enuik8p
	j1wa9IoRGJesElylfw+suyJO3fsxQQUJt6TpXVcttapk3w/Xp104qTVFbWdL17DFS+G5
	XqbcIW3Ra9czCfJqtFDEa5kYN8pCOc32VMPnVsXAqxOG77NzeT8GCKouC9im4OCbFqa6
	celA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZeBAXG9qD04zMp2+fojcOohQWqpTO3g/aTtAs4w5fYs=;
	b=dlL8oHGxSFIRBcptgjbATe5zoo248t6TR1yMS+aOjz4MIfUKHYSA0Ozur1/Z4fn4Pr
	1WmZhzoZ2CPPleCNNh8ZnkCx07cMSG3ZPBE6kGguv84ub/wFrprS/wRkddZh8NFlnNgz
	0KZfkq8cnJLPLdy873QuiY/LyeSCE2ic2U+XHjEX9MyE9Lfj496w0g+Gn2icf8rNiwtW
	SMHHsLSW/kgLkPoFcPcDmIb1FwzIANPIoB5kmbkA7p0jZq7ZiFQRoKhDzkjpXLmuI/0n
	J7jbmu0uhmqcvOOF6Bse+1hbue8+7QwbNGhapjBUkHrvjL/5AS/HGo5+mIna/+I5r11u
	ZlFA==
X-Gm-Message-State: AFeK/H2wo6d4Yxbsj9oMb365jgyPLrvS+U62CpBI5eypVYFf0zn+ZrM4+SqEDqF2yrg5Cw==
X-Received: by 10.99.52.202 with SMTP id b193mr4101162pga.131.1490978639044;
	Fri, 31 Mar 2017 09:43:59 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:47 -0700
Message-Id: <20170331164247.5052-43-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 43/43] snort: Fix build with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index c62a8d360..57a04f2e7 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -5,6 +5,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
 DEPENDS = "xz libpcap libpcre daq libdnet util-linux"
+DEPENDS_append_libc-musl = " libtirpc"
 
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
     file://snort.init \
@@ -46,6 +47,9 @@ PACKAGECONFIG ?= "openssl lzma"
 PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
 PACKAGECONFIG[lzma] = "--with-lzma-includes=${STAGING_INCDIR} --with-lzma-libraries=${STAGING_LIBDIR}, --without-lzma-includes --without-lzma-libraries, xz,"
 
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append_libc-musl = " -ltirpc"
+
 do_install_append() {
     install -d ${D}${sysconfdir}/snort/rules
     install -d ${D}${sysconfdir}/snort/preproc_rules
-- 
2.12.1


