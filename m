Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78FBB601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 02:24:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB22OmLR000282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Dec 2015 18:24:49 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 1 Dec 2015 18:24:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Dec 2015 10:13:12 +0800
Message-ID: <1449022392-17978-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libssh2: make crypto library selectable
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
X-List-Received-Date: Wed, 02 Dec 2015 02:24:49 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add PACKAGECONFs 'openssl' and 'gcrypt' to make crypto library
selectable. Only one of them could be set. If they are both set,
'gcrypt' is invalide.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
index 4f03b99..c43164e 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A client-side C library implementing the SSH2 protocol"
 HOMEPAGE = "http://www.libssh2.org/"
 SECTION = "libs"
 
-DEPENDS = "zlib openssl"
+DEPENDS = "zlib"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
@@ -13,8 +13,12 @@ SRC_URI[sha256sum] = "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF += "--with-openssl \
+EXTRA_OECONF += "\
                  --with-libz \
-                 --with-libssl-prefix=${STAGING_LIBDIR} \
                  --with-libz-prefix=${STAGING_LIBDIR} \
                 "
+
+# only one of openssl and gcrypt could be set
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-openssl --with-libssl-prefix=${STAGING_LIBDIR},--without-openssl,openssl"
+PACKAGECONFIG[gcrypt] = "--with-libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR},--without-libgcrypt,libgcrypt"
-- 
2.6.1


