Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94E6C73180
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 23:01:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c200so13235441wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=r9pgF7Exn0lfDMjPUG7IK3nCbnkQPo5YZa8oBgvMHRo=;
	b=Erd+s5PiMlNa9naOmuw5SGz9C7Lj3eZ40dm9e6X9yNvy3348cFb3R0V5dsys4r4BXk
	55RZR5SQzIhtc+bOf8M5o5PV86yum2044BpIwnFS7oJJOZEZd8NRdWnf0LDqFcxcoHQf
	XxfSZkyTfVwu1PgRHMqpf4Ihgb6/K2im9dwv/2C7rTkJ74sToJCMsivSkx0v0Km3ORMU
	8AuetPKLWyF/pmsCWZ6mmqHb7dlwHFJk6iP1LcNigi7GkMlbI86gcT/lI7ETJUjwg4UR
	P0gMH+VkqC8LzTVlz+nGkoHL6WZRTVb3I9COrJBYZaKFk6G/URJlHJQxctqzXVHRdBy/
	zk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=r9pgF7Exn0lfDMjPUG7IK3nCbnkQPo5YZa8oBgvMHRo=;
	b=bO+Yz4xp2IhKzym3BrZAZbZjp6I1uTWwQGuwW7ouUndwPryamKDoRbMWaBTYAD0QQr
	h0MQ8pEv6f6rGFMaIYjQiBj0pBKiaPjaWahWf59kwG36/1kaO1TBtWFWyc6GIOmZ6buT
	O2/cZkStwARj1MIAGyD0ztUFhYa1glldq3rN/EhekoP0xb3lnzmc9Fgitr8fjX8FE7Ui
	clW1a5ee+T8JDTItYtCNfS9S6M6Zu7mnEoj1XbohbLM+zwVvIB5POi5+ycEok1NCy71c
	isjjjA8XsEwk6ojPTI4TEplTgTAUL6GBXXCavi4yurLg8i+Cfsxr/iDhso5/aplG64x1
	zrEA==
X-Gm-Message-State: AG10YOQpW0duK+h6SzwYJda6RssgbnfUZzgcd04nzBIX3t8mLM9G0niQHJ0DYMM3+reNAA==
X-Received: by 10.194.60.145 with SMTP id h17mr40015002wjr.47.1455231687240;
	Thu, 11 Feb 2016 15:01:27 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host180-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.180])
	by smtp.gmail.com with ESMTPSA id
	yz5sm9520324wjc.36.2016.02.11.15.01.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 15:01:26 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2016 00:01:08 +0100
Message-Id: <a4ea2a7d7f4e08eaba84ff3d9b17be148d6b1d45.1455230414.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455230414.git.andrea.adami@gmail.com>
References: <cover.1455230414.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1455230414.git.andrea.adami@gmail.com>
References: <cover.1455230414.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/3] klibc_2.0.4: update to 4d1997d - Fix build for qemux86
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
X-List-Received-Date: Thu, 11 Feb 2016 23:01:26 -0000

Minimally rebase staging.patch and follow upstream commits.

Fixes:
| usr/klibc/socketcalls/socket.o: In function `socket':
| .../usr/klibc/socketcalls/socket.S:8: multiple definition of `socket'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch | 2 +-
 meta-initramfs/recipes-devtools/klibc/klibc.inc                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
index 400864b..c01c712 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
@@ -27,7 +27,7 @@ Index: klibc-1.5.24/scripts/Kbuild.install
 @@ -103,7 +100,6 @@
  	done
  	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
- 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)chmod -R a+rX,go-w $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
 -	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
  	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
  
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index a707ed5..903424b 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 DEPENDS = "linux-libc-headers perl-native"
-SRCREV = "7763dd33e5b8eed4b9e3c583c02c10176fd550d3"
+SRCREV = "4d19974d7020488f63651244e1f9f51727c3f66c"
 
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
-- 
1.9.1


