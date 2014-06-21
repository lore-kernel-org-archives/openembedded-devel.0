Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0658C6FD6F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:24:31 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id b13so4573966wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lN6qkQXmckUm4qAq93N8Hx9iqszCSOWFrzTFwIopT0U=;
	b=YqBe7N4A5cBq7SnXMBMR1v8us87+xqV9fSISWAWOh8/4N9e1kYQIWFZOKNI8X9Lwfu
	NyQvIigDksbuS/CQMxfh8vyI89V4rMDZ+n4l1wIcoWi7IuySRw/b/8K80xanKaFMsUEV
	iXQ6JHTxBl9+uldxJ2hYuTqmxbC2LmUjI6ntppc45yJPocwi0QVmXxrKpE2/ixxIjFtr
	kaS5ovrcbcYkqQvX5gxoVjiJEXP24gdWJWfRqJyvpodH/IcZpnECKlQiYsaOK2TBRWqi
	Cl0zCWZ3vh5l+jpu0yuGxMLMuWB+Fw4JeRU6RQV/EPjEvjpulgk6CeCkuUVQ4OZNGIfv
	OILQ==
X-Received: by 10.180.73.169 with SMTP id m9mr10138896wiv.53.1403342667149;
	Sat, 21 Jun 2014 02:24:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l9sm12453113wic.21.2014.06.21.02.24.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:24:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:24:25 +0200
Message-Id: <1403342666-15430-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH 1/2] sethdlc: Set MACHINE_ARCH, because of virtual/kernel dependency
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
X-List-Received-Date: Sat, 21 Jun 2014 09:24:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
index 3a9692f..cf74827 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -12,7 +12,8 @@ SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6a
 
 S = "${WORKDIR}/${BPN}-1.18"
 
-DEPENDS="virtual/kernel"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+DEPENDS = "virtual/kernel"
 
 EXTRA_OEMAKE="CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}' \
               KERNEL_DIR=${STAGING_KERNEL_DIR} "
-- 
2.0.0


