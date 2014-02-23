Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id C12336E877
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 01:40:53 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so2335457eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 17:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yfKNBhfc8gRD0i+N5elgonE5aQgw1KeRgV8YwQAefQM=;
	b=HBIJ+aB+Ff27NAHDWLEcH69AU+BbXp6b0S8mw9gXoP3//za52WbYsZOOACBQK1LMy/
	UfsbPDEVxkqndgUVVlxhWhEPmcHjCWlUBWDNGZxz5V4Co3TixBidd15KO+TpyMr/AIC+
	bTpF8vkNK8HIIn1jOMBzDaWLkuCp6sXE32tB1T1hMzAnQs4H0agncs0pTsrECCDyCtiS
	k72RvysrguG4AILE3wAGNfIEbzrgXuoks6StZryWUa0T827+OnMpGjqxmKl/oso96fBa
	c3n/jsG3QCn916+8FBASVOTMpsJSjmnc64mWXEEwnUPhJbPmUeEvBHKxE+UghUcuKt9Z
	crUA==
X-Received: by 10.15.86.11 with SMTP id h11mr16114989eez.8.1393119653821;
	Sat, 22 Feb 2014 17:40:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	46sm45253755ees.4.2014.02.22.17.40.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 17:40:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 02:41:08 +0100
Message-Id: <1393119668-22896-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1393119668-22896-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393119668-22896-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-multimedia][PATCH 2/2] vlc: Fix build with flac-1.3.0
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
X-List-Received-Date: Sun, 23 Feb 2014 01:40:54 -0000

* vlc was broken again since flac was upgraded in oe-core:
  commit 85ac4d82c77e3cab6a5867e4ec110ba07023838b
  Author: Cristian Iorga <cristian.iorga@intel.com>
  Date:   Wed Feb 12 18:42:32 2014 +0200
  Subject: flac: upgrade to 1.3.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vlc/0003-fix-build-with-newer-flac-1.3.0.patch  | 21 +++++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_1.1.11.bb            |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-build-with-newer-flac-1.3.0.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-build-with-newer-flac-1.3.0.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-build-with-newer-flac-1.3.0.patch
new file mode 100644
index 0000000..8278a3e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-build-with-newer-flac-1.3.0.patch
@@ -0,0 +1,21 @@
+flac-1.3.0 removed FLAC from pkg-config's includedir, so the user of flac.pc is supposed to
+include the headers with FLAC/ prefix now.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr vlc-1.1.11.orig/modules/codec/flac.c vlc-1.1.11/modules/codec/flac.c
+--- vlc-1.1.11.orig/modules/codec/flac.c	2014-02-23 01:29:56.337515018 +0000
++++ vlc-1.1.11/modules/codec/flac.c	2014-02-23 01:29:04.477514993 +0000
+@@ -38,8 +38,8 @@
+ #include <vlc_codec.h>
+ #include <vlc_aout.h>
+ 
+-#include <stream_decoder.h>
+-#include <stream_encoder.h>
++#include <FLAC/stream_decoder.h>
++#include <FLAC/stream_encoder.h>
+ 
+ #include <vlc_block_helper.h>
+ #include <vlc_bits.h>
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
index b381e46..368db59 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
@@ -7,6 +7,7 @@ require vlc.inc
 
 SRC_URI += "file://0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch"
 SRC_URI += "file://0002-fix-build-with-newer-freetype.patch"
+SRC_URI += "file://0003-fix-build-with-newer-flac-1.3.0.patch"
 
 PR = "r4"
 
-- 
1.8.5.3


