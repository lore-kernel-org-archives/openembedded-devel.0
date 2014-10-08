Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2148660167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 08:01:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9881KNk026066
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Oct 2014 01:01:20 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 01:01:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Oct 2014 01:01:18 -0700
Message-ID: <1412755279-22850-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 1/2] krb5: use BP for the tarball
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
X-List-Received-Date: Wed, 08 Oct 2014 08:01:29 -0000
Content-Type: text/plain

Otherwise do_unpack failed when multilib:

tar (child): /path/to/lib32-krb5-1.12.2.tar.gz: Cannot open: No such file or directory

And do_patch error:
ERROR: Command Error: exit status: 1  Output:
Applying patch 0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
can't find file to patch at input line 15

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
index 0b14d3c..d3c643c 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
 SRC_URI[md5sum] = "357f1312b7720a0a591e22db0f7829fe"
 SRC_URI[sha256sum] = "09bd180107b5c2b3b7378c57c023fb02a103d4cac39d6f2dd600275d7a4f3744"
 
-S = "${WORKDIR}/${P}/src/"
+S = "${WORKDIR}/${BP}/src/"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
@@ -55,7 +55,7 @@ FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
 
 krb5_do_unpack() {
     # ${P}-signed.tar contains ${P}.tar.gz.asc and ${P}.tar.gz
-    tar xzf ${WORKDIR}/${P}.tar.gz -C ${WORKDIR}/
+    tar xzf ${WORKDIR}/${BP}.tar.gz -C ${WORKDIR}/
 }
 
 python do_unpack() {
-- 
1.7.9.5


