Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2208578252
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 19:24:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7FJOOxl017220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 12:24:24 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 12:24:24 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Aug 2017 12:24:24 -0700
Message-ID: <20170815192424.129143-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mailx: Force mailx to build with openssl10
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
X-List-Received-Date: Tue, 15 Aug 2017 19:24:24 -0000
Content-Type: text/plain

The latest changes in oe-core switch to using openssl 1.1.  The
SSLv3_client_method and RAND_egd functions are removed in the openssl
1.1. This causes mailx to fail to compile.

For now we can use openssl10 in the same manner that openssh is doing.
At the point in time that openssl10 goes away the code for openssl in
mailx will have to be altered.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-oe/recipes-extended/mailx/mailx_12.5-5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb b/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
index 9dd710a71..0a191a00c 100644
--- a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
+++ b/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
@@ -9,7 +9,7 @@ SECTION = "console/network"
 LICENSE = "BSD & MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl10"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5.orig.tar.gz;name=archive \
            file://0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch \
-- 
2.11.0


