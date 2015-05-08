Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 823616AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 07:43:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t487hev1002299
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 May 2015 00:43:40 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 8 May 2015 00:43:39 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:42:35 +0800
Message-ID: <1431070955-7100-20-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 20/20] sylpheed: remove do_install_append
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
X-List-Received-Date: Fri, 08 May 2015 07:43:38 -0000
Content-Type: text/plain

The .desktop and .png files alreay install by make install.
So remove the do_install_append

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index 1b010a5..304b654 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
 
 PR = "r2"
 
-PNBLACKLIST[sylpheed] ?= "BROKEN: Doesn't work with B!=S"
-
 SRC_URI = "http://sylpheed.sraoss.jp/sylpheed/v2.7/sylpheed-${PV}.tar.bz2 \
     file://glib-2.32.patch \
 "
@@ -18,7 +16,7 @@ SRC_URI[sha256sum] = "8bb6457db4e2eea1877b487d9ac8513546372db9a6a2e4271d11229f4a
 FILES_${PN} += "${datadir}/pixmaps ${datadir}/applications"
 FILES_${PN}-doc += "${datadir}"
 
-EXTRA_OECONF = "--disable-ssl --enable-gnutls"
+EXTRA_OECONF = "--disable-ssl"
 
 CFLAGS += "-D_GNU_SOURCE"
 
@@ -31,9 +29,3 @@ do_configure_prepend() {
 
 inherit autotools pkgconfig
 
-do_install_append() {
-    install -d ${D}${datadir}/applications
-    install -m 0644 sylpheed.desktop ${D}${datadir}/applications/
-    install -d ${D}${datadir}/pixmaps
-    install -m 0644 sylpheed.png ${D}${datadir}/pixmaps/
-}
-- 
1.7.9.5


