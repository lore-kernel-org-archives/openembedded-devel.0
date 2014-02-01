Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E40176EA4F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:37:02 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so2622545eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GW699OuhTL5K177TwWbG+zAjFrx0PSiKJK1RkB7tJX4=;
	b=vNgPXwatuOX2AgHNIkp7AMagMCKl1KPrcJk15J9GU0P1VRESLV6H1s6pQ4qzWJlIGz
	6BkB1Q6WnqcLc4DuFLys5oVaHmd1aAXK0D5y08DNPomQrFrusPvv454LajxSDD4ss4Ef
	+VSKqbZyhutkwHsQEqm8rDuPeAHeLoDYP5oD8CO9kFzEPSZ8mYMRRCcLos/D56INWgvt
	XQuqzdOXq9d4y02xC7u0IKoIPEGOV0oAMo1F58cL296AsJSaBOVI9AFvEGnPK0CkOw9q
	eDRjVO6tkMC1xzuliSwa2q1M4mSHLhaWD+X36LSQR/KILXhIocsyN0k2j73VmCz98EYm
	5Rkg==
X-Received: by 10.14.216.3 with SMTP id f3mr274098eep.66.1391240223664;
	Fri, 31 Jan 2014 23:37:03 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm46147106eey.0.2014.01.31.23.37.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:37:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:37:02 +0100
Message-Id: <1391240222-2020-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1391240222-2020-1-git-send-email-Martin.Jansa@gmail.com>
References: <1391240222-2020-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-multimedia 2/2] vlc: fix build with newer freetype from oe-core
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
X-List-Received-Date: Sat, 01 Feb 2014 07:37:03 -0000

* ftsynth.h header was moved to freetype2 and vlc is broken since:
  commit 7cbf6060ac14b0f4d2f038f821ca980be0d46cb0
  Author: Ross Burton <ross.burton@intel.com>
  Date:   Mon Nov 11 17:25:22 2013 +0000
  Subject: freetype: upgrade to 2.5.0.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vlc/vlc/0002-fix-build-with-newer-freetype.patch     | 16 ++++++++++++++++
 meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb     |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0002-fix-build-with-newer-freetype.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-fix-build-with-newer-freetype.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-fix-build-with-newer-freetype.patch
new file mode 100644
index 0000000..100ba97
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-fix-build-with-newer-freetype.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr vlc-1.1.11.orig/modules/misc/freetype.c vlc-1.1.11/modules/misc/freetype.c
+--- vlc-1.1.11.orig/modules/misc/freetype.c	2011-07-09 17:18:51.000000000 +0200
++++ vlc-1.1.11/modules/misc/freetype.c	2014-02-01 07:45:32.078131862 +0100
+@@ -60,7 +60,7 @@
+ #endif
+ 
+ /* Freetype */
+-#include <freetype/ftsynth.h>
++#include <freetype2/ftsynth.h>
+ #include FT_FREETYPE_H
+ #include FT_GLYPH_H
+ #define FT_FLOOR(X)     ((X & -64) >> 6)
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
index e88e964..b381e46 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
 require vlc.inc
 
 SRC_URI += "file://0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch"
+SRC_URI += "file://0002-fix-build-with-newer-freetype.patch"
 
 PR = "r4"
 
-- 
1.8.5.3


