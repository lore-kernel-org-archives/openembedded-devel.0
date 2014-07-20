Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 62128705E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 14:23:28 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id z11so4115675lbi.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=yYB0il2yNVwUjFsFVVJk+CvM4hhG+jjcVcibe6CEZyE=;
	b=y4dLByMTLsTdbd1et7stlx9h5hOSTjhcR7puyF7ig4odJf37u3kQRlfxHDs/mpeOjC
	lUhs7KeiJBT+KKokDjsN5nlXAWETtm+9dwHGE65DHDvN0dgzat1C33GA3kUr6feTkbbd
	Kte8LVPX/5lqNAsN8Om8hVojWzFc+RTLCPwgEdXiTf4RHgWuTfcs/CB0Az6SPsm0+uDU
	/ycmhUZ/wvkSH+JKNs5nFbb3eP5UCG32453uxFMjDzAgpoBcVqwOFEaFWhAQGIrf+q9g
	c4ts8A8N4dLIJSh7f+EcofhfW+Vsk2T73gNfRZIPva87MjSUALUJJ7d4Gl9VV42Cdj97
	F1oQ==
X-Received: by 10.152.37.99 with SMTP id x3mr19152844laj.55.1405866208106;
	Sun, 20 Jul 2014 07:23:28 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id oy1sm20071060lbb.4.2014.07.20.07.23.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 07:23:27 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 16:21:57 +0200
Message-Id: <1405866118-21641-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH 1/2] liboauth: Add missing OpenSSL build dependency
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
X-List-Received-Date: Sun, 20 Jul 2014 14:23:29 -0000

Fixes:

| liboauth-1.0.3/src/hash.c:363:26: fatal error: openssl/hmac.h:
|  No such file or directory

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index 2535b8e..3311da5 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT|GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=6266718a5241c045c8099d9be48817df \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SECTION = "libs"
-DEPENDS = "curl"
+DEPENDS = "curl openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "689b46c2b3ab1a39735ac33f714c4f7f"
-- 
1.9.3


