Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 95DD372BE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 20:47:56 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id l18so17230703wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 12:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ddSf790dvo8aOwJtyZpCSczRKVWCBBKyLP2UgpvlUDo=;
	b=Pgy03M0g8eWWwK375neussz4A/589t5D5DbMpI+ft+xyx156DfSEQQoKUclkV0JwIT
	iSaX02WGGJRJnkmAe3j25GcxCf3icsamL9QxQp1AGHV7SaX2/x7+jTS3wWWm/gAZSAxQ
	FmbuskNpzASt81v/q9Umu/tcTHABKmheaXsgI0yksnglUig+tK+UB0+mmFpCdzXNXMa6
	rAyC52ClK7O3Xht7F/dWZg65TqfMbg1uJJXDTKciUTWXVi8WLBti1/l/ArlNow/QUtYn
	LWtIBz+yK+tdV3vrZGepeKd3fsYKcls1ocZBB/DSNRCueq7qeEkFtd9m2OhWDbH1logn
	s6jQ==
X-Received: by 10.194.83.98 with SMTP id p2mr22018462wjy.125.1421354877153;
	Thu, 15 Jan 2015 12:47:57 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id gz7sm392409wib.22.2015.01.15.12.47.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 12:47:56 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 21:47:02 +0100
Message-Id: <1421354822-21485-4-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1421354822-21485-1-git-send-email-max.oss.09@gmail.com>
References: <1421354822-21485-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][RFC 3/3] openjdk-7: enable xawt
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
X-List-Received-Date: Thu, 15 Jan 2015 20:47:58 -0000

The build of xawt has been disabled as its build seemed to fail during a qemu
call to generate a file with information on variable sizes.

This patch reenables xawt in the hope that changes to the qemu calls fixed the issues.

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


