Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 58DB9795F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:35:58 +0000 (UTC)
Received: from heron.blarg.de (p3EE2FF12.dip0.t-ipconnect.de [62.226.255.18])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 2C7D722089F;
	Tue, 18 Sep 2018 10:26:15 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 10:26:06 +0200
Message-Id: <20180918082608.1088-7-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180918082608.1088-1-max+openembedded@blarg.de>
References: <20180918082608.1088-1-max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 7/8] [meta-oe] libmicrohttpd: add PACKAGECONFIG[https]
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
X-List-Received-Date: Tue, 18 Sep 2018 08:35:58 -0000

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 .../recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
index adbf831dd..b44c66af7 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
 SECTION = "net"
-DEPENDS = "libgcrypt gnutls file"
+DEPENDS = "file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "8ab5123535549195aff19e91b4e49f48"
@@ -15,12 +15,13 @@ CFLAGS += "-pthread -D_REENTRANT"
 
 EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../"
 
-PACKAGECONFIG ?= "curl"
+PACKAGECONFIG ?= "curl https"
 PACKAGECONFIG_append_class-target = "\
         ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
 "
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
+PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
 
 do_compile_append() {
     sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
-- 
2.18.0


