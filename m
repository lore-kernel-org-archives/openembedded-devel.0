Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0C970632
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 22:46:45 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so396169wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 15:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t7NxxLWObMaJnMG8uG6pNzxN6s5EJz7xLkdR4uH/Hhk=;
	b=Jh2UQrD1plni98+coPRq7P6u6YYBdYpdOqers8RrHbcX1oxX3G+/epxwAfvL/6HBqg
	MUuaWsJBTjL0Wopv2nBwCNlUeWH4sP+1c469aeoyD1ifSUgRK/5RKhPOX73gOe/gKvYh
	7CkbDK+Fg4A3b8YKse80+1neIMHlxEIdJrg2EXOUVEif9xudOMLlDgacquYbGdJ/Ms0H
	XLGQ6Yz6hpnvvtFEy9kKHR55mXebGzSLAHWR9rk4WFKdCY7kj3HqAyizfqTw0IlQql53
	S04fjxkph8pnDilriGm/M5ZEGhn7UyFj6ZFqNiiG8dPdqhP7KvciFdB8fyeHKlXx6k6U
	N25g==
X-Received: by 10.180.20.15 with SMTP id j15mr1053375wie.60.1406846806509;
	Thu, 31 Jul 2014 15:46:46 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host115-254-dynamic.11-79-r.retail.telecomitalia.it.
	[79.11.254.115])
	by mx.google.com with ESMTPSA id r1sm2275732wia.21.2014.07.31.15.46.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Jul 2014 15:46:45 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 00:46:42 +0200
Message-Id: <1406846802-1311-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexecboot: remove trailing slash in do_install
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
X-List-Received-Date: Thu, 31 Jul 2014 22:46:52 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index d0176c5..1fb5f0d 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -48,7 +48,7 @@ EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
 
 do_install () {
     install -d ${D}${bindir}
-    install -m 0755 kexecboot ${D}${bindir}/
+    install -m 0755 kexecboot ${D}${bindir}
     install -d ${D}/proc
     install -d ${D}/mnt
     install -d ${D}/dev
-- 
1.9.1


