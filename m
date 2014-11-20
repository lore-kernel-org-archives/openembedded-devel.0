Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C7C4865C91
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2014 08:44:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43715544"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2014 16:40:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAK8hrLw025174;
	Thu, 20 Nov 2014 16:43:53 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 20 Nov 2014 16:44:13 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <yocto@yoctoproject.org>
Date: Thu, 20 Nov 2014 16:43:56 +0800
Message-ID: <1416473037-23326-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-selinux][PATCH 1/2] ustr: Get source from official upstream instead of Fedora Project
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
X-List-Received-Date: Thu, 20 Nov 2014 08:44:17 -0000
Content-Type: text/plain

Official upstream is still OK, so we use it first

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 recipes-extended/ustr/ustr_1.0.4.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-extended/ustr/ustr_1.0.4.bb b/recipes-extended/ustr/ustr_1.0.4.bb
index 6651a73..d1f3d93 100644
--- a/recipes-extended/ustr/ustr_1.0.4.bb
+++ b/recipes-extended/ustr/ustr_1.0.4.bb
@@ -11,11 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c79c6e2ae13418d16d7dc82df960a1e7 \
 		    file://LICENSE_LGPL;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 		    file://LICENSE_MIT;md5=c61e779b782608472bd87593c3c3916f"
 
-# Official upstream seems to be offline.. replace w/ a Fedora Project mirror.
-# http://www.and.org/ustr/1.0.4/ustr-1.0.4.tar.bz2 
-
 SRC_URI = "\
-    http://pkgs.fedoraproject.org/repo/pkgs/ustr/ustr-1.0.4.tar.bz2/93147d9f0c9765d4cd0f04f7e44bdfce/ustr-1.0.4.tar.bz2 \
+    http://www.and.org/ustr/${PV}/${PN}-${PV}.tar.bz2 \
     file://ustr-makefile-fix.patch;patch=1 \
     file://ustr-fix__va_copy-not-defined.patch;patch=2"
 SRC_URI[md5sum] = "93147d9f0c9765d4cd0f04f7e44bdfce"
-- 
1.8.3.1


