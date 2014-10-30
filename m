Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7390F6AC01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 07:29:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9U7T83G013240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 00:29:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 00:29:07 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 15:25:48 +0800
Message-ID: <1414653948-23213-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] polarssl: set LIB_INSTALL_DIR to baselib
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
X-List-Received-Date: Thu, 30 Oct 2014 07:29:18 -0000
Content-Type: text/plain

This solves the following warning:

polarssl-1.3.8: polarssl: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/libpolarssl.so.1.3.8
  /usr/lib/libpolarssl.so.7
  /usr/lib/libpolarssl.so
  /usr/lib/libpolarssl.a
  /usr/lib/.debug
  /usr/lib/.debug/libpolarssl.so.1.3.8 [installed-vs-shipped]
polarssl-1.3.8: polarssl requires libpolarssl.so.7()(64bit), but no providers
in its RDEPENDS [file-rdeps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 recipes-connectivity/polarssl/polarssl_1.3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
index 3f9ba18..fa89631 100644
--- a/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
+++ b/meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb
@@ -18,6 +18,6 @@ SRC_URI[sha256sum] = "318171db41335cacbb5b0047c94f1faf91442ab70a223b5223436703c9
 
 DEPENDS = "openssl"
 RDEPENDS_${PN} += "libcrypto"
-EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on"
+EXTRA_OECMAKE = "-DUSE_SHARED_POLARSSL_LIBRARY=on -DLIB_INSTALL_DIR=${baselib}"
 
 inherit cmake
-- 
1.9.1


