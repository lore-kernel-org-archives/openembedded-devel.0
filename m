Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SUGMi-0001et-6x
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 13:56:32 +0200
Received: by bkcjm2 with SMTP id jm2so4991469bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=BzZ5uh4zqCetiW8jo2X8+Dc7HECtQPh6/PC1XydVXI8=;
	b=zIkGAYLIIPS/Gk5ZuwbUIhwac3JwBAfispcb8+l6ivisGeEH+Qu8CtjJnnZaRXQv7f
	5wAp5vMpN/mERu0ibosPfm9YAT/XUCaKQQ6t2VAUr5WfdpV9B0hfXGihq4/Ca9Cxduaw
	aWZyozXmJ99v9JQ7dyX2hzSclQ1vx4eyE1hR1g9gi/S7YYViwAKKbOJvH03AmyQ7RpNg
	lm4CyqTbqBYHw4zYAcEbpPZ4k0mI2QhMptO+4UbjvilwvMLhRc9km3Q6viXrnIBIGCNT
	QycYe14PzWLu9hUXc+8GLVBDvpBuT6mOwBnsLNsTOAzrg+F5O4HQ26SDq8Ar5P7G5LUU
	5XPw==
Received: by 10.204.10.70 with SMTP id o6mr4605290bko.70.1337082391968;
	Tue, 15 May 2012 04:46:31 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id h18sm41066671bkh.8.2012.05.15.04.46.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 04:46:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 13:46:26 +0200
Message-Id: <1337082386-18780-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] florence: make it build by aligning includes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 11:56:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../florence/files/0001-Fix-glib-includes.patch    |   33 ++++++++++++++++++++
 meta-oe/recipes-support/florence/florence_0.5.1.bb |    5 ++-
 2 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch

diff --git a/meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch b/meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch
new file mode 100644
index 0000000..06f10bd
--- /dev/null
+++ b/meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch
@@ -0,0 +1,33 @@
+From c8419ef05ff92ffa3de2e626eb6acd5d2df3baa1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 15 May 2012 13:40:05 +0200
+Subject: [PATCH] Fix glib includes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstream status: unknown
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/trace.c |    5 +----
+ 1 files changed, 1 insertions(+), 4 deletions(-)
+
+diff --git a/src/trace.c b/src/trace.c
+index 5ea5c13..774c56d 100644
+--- a/src/trace.c
++++ b/src/trace.c
+@@ -21,10 +21,7 @@
+ 
+ #include "trace.h"
+ #include "system.h"
+-#include <glib/gprintf.h>
+-#include <glib/gutils.h>
+-#include <glib/gslist.h>
+-#include <glib/gstrfuncs.h>
++#include <glib.h>
+ #include <stdio.h>
+ #include <stdarg.h>
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-support/florence/florence_0.5.1.bb b/meta-oe/recipes-support/florence/florence_0.5.1.bb
index dbffac7..dcbcefa 100644
--- a/meta-oe/recipes-support/florence/florence_0.5.1.bb
+++ b/meta-oe/recipes-support/florence/florence_0.5.1.bb
@@ -6,9 +6,12 @@ HOMEPAGE = "http://florence.sourceforge.net/english.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
+PR = "r1"
+
 DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native"
 
-SRC_URI = "http://switch.dl.sourceforge.net/project/florence/florence/0.5.1/florence-0.5.1.tar.bz2"
+SRC_URI = "http://switch.dl.sourceforge.net/project/florence/florence/0.5.1/florence-0.5.1.tar.bz2 \
+           file://0001-Fix-glib-includes.patch"
 SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
 SRC_URI[sha256sum] = "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8719a68b192d5bc62"
 
-- 
1.7.6.5



