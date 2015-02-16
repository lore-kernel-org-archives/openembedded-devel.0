Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2098865C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 22:28:30 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id m14so25822113wev.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 14:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Nb6rRktXsXdt/eXsSecnwQ/q2iZoifU+EQ3KEewREhk=;
	b=AgAitfLmy5CPylERP2RgDJYvk0DC98w2of7kBikivFnk+x8ax/N8fQpCnKlTGesvdk
	eEzKlXbBP7nw6bZFSMr+8zkG98kemyQBix2VLMxtgbJ8er2j4sNXZPTW9qN911rx8eVt
	xR098BZ8F8JLU6hB+V9nKc2KphmpFncOFJYKKMdft+MpjILjoAsZahVHJi5dS58Fw2Bh
	t2YLipTWFiIaouieGYpHLLpnEIu/PBSjbagBMDqb7SNLcyeDvU9wHzScTHVTmz14fXhR
	umLtip9UDKQxM06YhA6gFDzaeAD1SdmLId46m383EA5CjPea/56DOkgkwt7ycBEb6AOf
	1Qqw==
X-Received: by 10.181.13.148 with SMTP id ey20mr50142080wid.79.1424125711912; 
	Mon, 16 Feb 2015 14:28:31 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id
	fo15sm21520200wic.19.2015.02.16.14.28.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 14:28:31 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 23:27:38 +0100
Message-Id: <1424125658-20285-2-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424125658-20285-1-git-send-email-max.oss.09@gmail.com>
References: <1424125658-20285-1-git-send-email-max.oss.09@gmail.com>
Cc: koen@dominion.thruhere.net
Subject: [OE-core][RFC] openjdk-7: enable xawt
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
X-List-Received-Date: Mon, 16 Feb 2015 22:28:31 -0000

The build of xawt has been disabled as its build seemed to fail during a qemu
call to generate a file with information on variable sizes.

qemu is now called with the relevant path into sysroot and thus works.

This patch enables xawt again.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 .../icedtea-jdk-nio-use-host-cc.patch              | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch
index 94416bb..8e5da82 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch
@@ -49,25 +49,3 @@ Index: openjdk/jdk/make/java/nio/Makefile
 -endif
  
  .PHONY: sources 
-Index: openjdk/jdk/make/sun/Makefile
-===================================================================
---- openjdk/jdk/make/sun/Makefile	2013-07-25 09:10:09.000000000 -0700
-+++ openjdk/jdk/make/sun/Makefile	2013-10-01 21:32:01.625839149 -0700
-@@ -55,7 +55,7 @@
-     endif
-   endif
-   HEADLESS_SUBDIR = headless
--  XAWT_SUBDIR     = xawt
-+  XAWT_SUBDIR     =
- endif
- 
- ifeq ($(PLATFORM), macosx)
-@@ -87,7 +87,7 @@
- endif
- SUBDIRS_desktop    = audio $(RENDER_SUBDIR) image \
-                      $(LWAWT_PRE_SUBDIR) $(DISPLAY_LIBS) $(DGA_SUBDIR) $(LWAWT_SUBDIR) \
--                     jawt font jpeg cmm $(DISPLAY_TOOLS) beans
-+                     font jpeg cmm $(DISPLAY_TOOLS) beans
- SUBDIRS_management = management
- SUBDIRS_misc       = $(ORG_SUBDIR) rmi $(JDBC_SUBDIR) tracing
- SUBDIRS_tools      = native2ascii serialver tools jconsole
-- 
1.9.3


