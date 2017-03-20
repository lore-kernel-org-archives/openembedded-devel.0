Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A17F71D7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 81so9909647pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XHNxVBdDEs0/6Z96V20yeVjqorKjvgTqXUfSyE9i2uc=;
	b=Nl0cqIadi0vaANAtZat5wnCfb0yKwT3DTLfFFai+CyGfVfYVGKDuV5zBwUmuc+A+Xj
	ozo7pMYziPss0qaPk7DIX1DByiHwg1htir+OBX3/zFXjSDSh2KjtrCnS8ePX+zJll60q
	pIG/Zcdib9jtxlXCArIU8NHxXcN4xsVq+lV6zb5FtvHNXn24yUjCCFbYTFFAL4rWEcCs
	BovFZc8OTaQ0iF6WDx0N7HkELFi7DLykevZ8edMY02QhGIzk/WgJhCFE0f9Pg/jFTpPt
	amRmJoULiKSL3f2obLjOGwUSIhnmeaii1Dn1lEsCawDxWQbZKx/sBNJt1pubw4NJgzka
	LZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XHNxVBdDEs0/6Z96V20yeVjqorKjvgTqXUfSyE9i2uc=;
	b=NNYH7kaDkNN1/8i7Tn58nKJdY5gBVh4aFOCKmtNJz1ceTm8zwrKCz6D4tY7/cmwgFs
	w5MRmuaAAT4leD9cJX3+w8bAm23IancYJfAAJoqvobLn3HQupQ7CdkGghFN5E9wAIy17
	XcUnpiPPLOsbDZGn+HplfhJiWpx3Zg71bw2sN0CJQ9lp3hfRXFTYuGj2nElGBWVcdSk4
	CGTcUs88kd4Or1lXLKazH94g1RqGmBU0xLjJ8FpzUZP880HZ6gLmbdHH+BpNCKrMpnS3
	+YZ7V5UTtXOG5ByzFa1DuG6MLB2SDAMM2hRaP5TEl7jAVlZKl/wToiMkipd/RAiC53F0
	roKQ==
X-Gm-Message-State: AFeK/H0Q+KhmJ/t1Xdcf43jDWCZ1VciYkmE+e3qIIpTbnIilm3s039pUqrB1LO3Jt9aM4g==
X-Received: by 10.99.101.67 with SMTP id z64mr29942292pgb.78.1489987932097;
	Sun, 19 Mar 2017 22:32:12 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:41 -0700
Message-Id: <20170320053152.29352-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/16] sgio: Fix missing GNU_HASH errors
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-makefile-Add-LDFLAGS-to-linking-rule.patch | 29 ++++++++++++++++++++++
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb   |  8 +++---
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch

diff --git a/meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch b/meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch
new file mode 100644
index 000000000..87fdd6058
--- /dev/null
+++ b/meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch
@@ -0,0 +1,29 @@
+From 92bf2f24d4762efd1dbcc4add457e2b600aa50cf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Mar 2017 08:02:17 -0700
+Subject: [PATCH] makefile: Add LDFLAGS to linking rule
+
+This make it use correct link flags and fixes errors like
+No GNU_HASH in the elf binary
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c2b0bc7..cdfb58f 100755
+--- a/Makefile
++++ b/Makefile
+@@ -34,7 +34,7 @@ sgpio.o: sgpio.c
+ 	${CC} $(CFLAGS) -c sgpio.c
+ 
+ sgpio: sgpio.o
+-	${CC} -g sgpio.o -o sgpio
++	${CC} $(LDFLAGS) -g sgpio.o -o sgpio
+ 
+ clean:
+ 	rm -f sgpio.o sgpio
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
index ed7c413fd..ee7bcdabb 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -1,10 +1,10 @@
 SUMMARY = "SGPIO captive backplane tool"
 DESCRIPTION = "Intel SGPIO enclosure management utility"
 
-SRC_URI = " \
-    http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.tar.gz/a417bf68da4e9bd79a4664c11d7debd1/${BPN}-1.2-0.10-src.tar.gz \
-    file://Makefile-error-fix.patch \
-"
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.tar.gz/a417bf68da4e9bd79a4664c11d7debd1/${BPN}-1.2-0.10-src.tar.gz \
+           file://Makefile-error-fix.patch \
+           file://0001-makefile-Add-LDFLAGS-to-linking-rule.patch \
+           "
 SRC_URI[md5sum] = "a417bf68da4e9bd79a4664c11d7debd1"
 SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"
 
-- 
2.12.0


