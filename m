Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B926B6AF13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 15:17:26 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so1929678pdj.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KqjWpFSQkqzTCUId0LsvcYRZUAqeFhRlEsAKeLBiFFQ=;
	b=jRmpUy1m2PBkgrhTAD2P7LpVbjqLYWYmPqBsdSsW6tHckgwv1myVqm2qicMj8FKsys
	FD1rEeViBlmoit5IAlmjc8JlCy8bYuQho4+gD3e3IoY3V+E7UMWRlc0Nr43aQgrkLh1T
	vk4x1+TT/7yRbPetQIIP3bYLrq5JAuSfwkGqKNHkLYkaPbzzvHJbwz7Hv2aj1adgAXaB
	mMd+iS8Aq9yTiQcd0CnwJ4TdDvks5Djzy32vwnLh/m1yo3wQwE7MqJuBU+g1WBvs6ugD
	ZrlCJ4rRnfdp4NwySyqnKkp5bLbdolXLyqOvuXOFODPoDXjSdKaE3/Ilne3K94enyctB
	AKWA==
X-Received: by 10.66.144.104 with SMTP id sl8mr8570646pab.9.1374074247096;
	Wed, 17 Jul 2013 08:17:27 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	zv11sm11102120pab.3.2013.07.17.08.17.25 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 08:17:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jul 2013 08:17:15 -0700
Message-Id: <1374074235-3571-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] proxy-libintl: Put .a in -dev package and allow empty main package
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
X-List-Received-Date: Wed, 17 Jul 2013 15:17:27 -0000

This helps in staging the library when it is asked for
via dependencies otherwise its missing in staging sysroot
even though its built its stashed into -staticdev package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../proxy-libintl/proxy-libintl_20100902.bb        |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 451a3c6..e1531dd 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -14,8 +14,10 @@ SRC_URI[md5sum] = "aef407c2b97ee829383aadd867c61d1e"
 SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
 
 S = "${WORKDIR}"
+PACKAGES = "${PN} ${PN}-dev"
 FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
-
+INSANE_SKIP_${PN}-dev = "staticdev"
+ALLOW_EMPTY_${PN} = "1"
 CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][d.getVar('USE_NLS', 1) != 'no']}"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
1.7.9.5


