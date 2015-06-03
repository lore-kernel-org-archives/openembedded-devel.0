Return-Path: <prvs=5890d9976=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id E4E5E756BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 06:58:40 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AKBQASpW5V/0oKEKxbhEIGgxjFIwEBAQEBAYELhExLCikNAgUWCwILAwIBAgE1Fg0GAgKILrY9pCSBIYl0hVGCUoFFBYZrmHODc4JeFo8vgQRmAYIybYFGgQEBAQE
X-IPAS-Result: A2AKBQASpW5V/0oKEKxbhEIGgxjFIwEBAQEBAYELhExLCikNAgUWCwILAwIBAgE1Fg0GAgKILrY9pCSBIYl0hVGCUoFFBYZrmHODc4JeFo8vgQRmAYIybYFGgQEBAQE
Message-ID: <556EA59A.8010007@skidata.com>
Date: Wed, 3 Jun 2015 08:58:34 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-Originating-IP: [172.16.60.30]
Subject: [meta-java][PATCH] openjdk-7: 75b13-2.5.4: fix xawt build
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
X-List-Received-Date: Wed, 03 Jun 2015 06:58:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The icedtea-jdk-nio-use-host-cc.patch disabled the build of xawt.
Therefore all awt based java application which were run on X11 failed
starting the GUI with an java.awt.HeadlessException.

This patch enables xawt again by adapting
icedtea-jdk-nio-use-host-cc.patch.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
This patch was only tested with yocto-1.6.3 (daisy) on an armv7a
cortexa9 with vfpv3d16. Please test it on further platforms!

This is my first patch to this mailinglist so hopefully I got everything
right. If not please give me some feedback on what to improve for the
next one ;-)
---
 .../icedtea-jdk-nio-use-host-cc.patch              | 22
----------------------
 1 file changed, 22 deletions(-)

diff --git
a/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
b/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
index f966093..db2fc87 100644
--- a/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
+++ b/recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
@@ -49,26 +49,4 @@ Index: openjdk/jdk/make/java/nio/Makefile
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
--  XAWT_SUBDIR     = xawt gtk
-+  XAWT_SUBDIR     =
- endif

- ifeq ($(PLATFORM), macosx)
-@@ -87,7 +87,7 @@
- endif
- SUBDIRS_desktop    = audio $(RENDER_SUBDIR) image \
-                      $(LWAWT_PRE_SUBDIR) $(DISPLAY_LIBS) $(DGA_SUBDIR)
$(LWAWT_SUBDIR) \
--                     jawt font jpeg cmm $(DISPLAY_TOOLS) beans
-+                     font jpeg cmm $(DISPLAY_TOOLS) beans
- SUBDIRS_management = management
- SUBDIRS_misc       = $(ORG_SUBDIR) rmi $(JDBC_SUBDIR) tracing
- SUBDIRS_tools      = native2ascii serialver tools jconsole
-
\ No newline at end of file
-- 
2.1.4


