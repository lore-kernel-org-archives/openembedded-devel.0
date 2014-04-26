Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC7B65DE1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:54 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id g10so4291081pdj.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uAvIH7mdwxWJ//+uYjqE0gCwM81MSyt0NGF2zMB6/AE=;
	b=THqOHwmEjW/qLKY5YP3MiajQlzuOA/Xu1lUnRfZJzQ44D1gefsplGtIWIj3ezTdNLh
	yNs8T27XamFeM9FH8cWU3+wLk9HXtQiZxp7Kf3l7A5j6obwzWAMLeJmpJKC7w1rPXJlg
	GwZ1MCnM1uVhxquI0BpPJpytop/ZchnLK/dWy/5mwHs2hIscv95jim7oZXi6IpOz0Sjo
	/i09hieZrcSKx7d1it7RUt3WWQhw9KY3eLPoNiDHdY4Z3AuHqN/yM91r8iUO1Ju7InF3
	iO8NqfQtLt07mlYMDY5tFTe8DR5zqvo6ugk+dgsGYQYu+7LiO7nZqN7d51QJldztQEKQ
	jk7Q==
X-Received: by 10.66.189.226 with SMTP id gl2mr16077017pac.65.1398544376332;
	Sat, 26 Apr 2014 13:32:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:40 -0700
Message-Id: <1398544484-27299-17-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 17/21] t1lib: Fix build when S != B
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
index d687ddb..61927ec 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
+++ b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.orig.tar.gz \
 SRC_URI[md5sum] = "a5629b56b93134377718009df1435f3c"
 SRC_URI[sha256sum] = "821328b5054f7890a0d0cd2f52825270705df3641dbd476d58d17e56ed957b59"
 
-inherit autotools
+inherit autotools-brokensep
 
 # Fix GNU_HASH problem
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -21,10 +21,10 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 EXTRA_OECONF = "--with-x --without-athena"
 EXTRA_OEMAKE = "without_doc"
 
-do_configure() {
-    rm -f ${S}/ac-tools/aclocal.m4
-    autotools_do_configure
-}
+#do_configure() {
+#    rm -f ${S}/ac-tools/aclocal.m4
+#    autotools_do_configure
+#}
 
 FILES_${PN} += " ${datadir}/t1lib/t1lib.config"
 FILES_${PN}-doc = "${datadir}/t1lib/doc/t1lib_doc.pdf"
-- 
1.7.10.4


