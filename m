Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA0F70A8F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:38 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so6848495wev.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZHofFoHNZXtsESMOVpY1lW2A8aj1OWXDmIVWszKLlTo=;
	b=KucPUAXMhGM+FstfM5H/nzexlMfIeNwO0hDbwQRuwPJjjuLcv+46sx0AKmWfii2JmI
	3fsRsUQrPFzvJ/OyJfmjBuk1W2Z7n4LNywaQMqN/U3yNWz/bEEMFynLrve+xoGIhaym0
	+IQtpf5DMGGv9wBupkRA0RkTgN0dAReHcU1Ita7YqYxQCUE9fPZNrin7VEIOySaeUFAa
	++/weKQh/dS1MRyP1ky9+YwY3Iw6EdAk7G+YJx0p5efN8hoLDc51C06BmMJevS6r23lB
	FDfLeSGCHKRqF4Wm9YgcxY48sLgNM6DwazE/k07CQhSxsajRTHLLQgREoyyBmDVyli2b
	GJ7w==
X-Received: by 10.180.7.163 with SMTP id k3mr6015141wia.0.1407600519831;
	Sat, 09 Aug 2014 09:08:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wi9sm25528600wjc.23.2014.08.09.09.08.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:31 +0200
Message-Id: <1407600537-10857-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/36] libmicrohttpd: add dependency on file and disable spdy
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:40 -0000

* fixes following floating dependencies:
  libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
  WARN: libmicrohttpd rdepends on libssl but it isn't a build dependency? [build-deps]

* and unknown-configure-option qa warning:
  libmicrohttpd-0.9.34: libmicrohttpd: configure was passed
    unrecognised options: --enable-gnutls [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
index 5de9390..e3c833b 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
 SECTION = "net"
-DEPENDS = "libgcrypt gnutls"
+DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
@@ -11,7 +11,8 @@ SRC_URI[sha256sum] = "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1
 
 inherit autotools lib_package
 
-EXTRA_OECONF += "-disable-static --enable-gnutls"
+# disable spdy, because it depends on openssl
+EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../ --disable-spdy"
 
 PACKAGECONFIG ?= "curl"
 PACKAGECONFIG_append_class-target = "\
-- 
2.0.4


