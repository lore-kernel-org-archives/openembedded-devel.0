Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92035C83F27
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web11.75861.1752492417871191399
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=P7CaOY2n;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492419; x=1784028419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xzyo8eqOleBygJugnkporhCiqqGpBkHz5nt1aV+zzqU=;
  b=P7CaOY2ngRsT4ZaZMwQpjF55eI0zXK5o5jUmBk/HMEQWCgIElOPRgrKx
   CaH9/ng1MgGbdp5PQ87L4WuC0MvQaMF5rt2ld6FnGhtIsChCZ0fXZwbR/
   0Gq78Kzo92OGs1e6R7D8iqkHkZZs9AFyPRCIJnrUpUh7T5sJgrY0k2ZkW
   w=;
X-CSE-ConnectionGUID: eSQumiq5Qp6sN64FPQnEAQ==
X-CSE-MsgGUID: fZySf2Q6TReMU6M38ERYhg==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
 14 Jul 2025 13:26:56 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:56 +0200
X-CSE-ConnectionGUID: 5eDmA9A2S8KwsjhjzvsxiA==
X-CSE-MsgGUID: zJfWjDI8S3agF2AhkB8Oww==
X-CSE-ConnectionGUID: LexNmxnzT/iovGwwhlJDPA==
X-CSE-MsgGUID: YhLyNQFzTB6kQqcg4/SJJQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 09/10] gattlib: upgrade 0.2.0 -> 0.7.2
Date: Mon, 14 Jul 2025 13:26:34 +0200
Message-ID: <20250714112642.121146-9-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714112642.121146-1-Moritz.Haase@bmw.de>
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118526

New version includes support to build against CMake 4+.

Release notes are available at [0].

[0]: https://github.com/labapart/gattlib/releases

License-Update: Copyright year changed
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../files/0001-Add-missing-include.patch      | 24 +++++++++++++++++++
 .../{gattlib_git.bb => gattlib_0.7.2.bb}      |  9 ++++---
 2 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/gattlib/files/0001-Add-missing-include.patch
 rename meta-oe/recipes-connectivity/gattlib/{gattlib_git.bb => gattlib_0.7.2.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/gattlib/files/0001-Add-missing-include.patch b/meta-oe/recipes-connectivity/gattlib/files/0001-Add-missing-include.patch
new file mode 100644
index 0000000000..15fbb61ed3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gattlib/files/0001-Add-missing-include.patch
@@ -0,0 +1,24 @@
+From a074af0d6a21665d3dfbd785ffd788146afeacef Mon Sep 17 00:00:00 2001
+From: Davide Cavalca <dcavalca@fedoraproject.org>
+Date: Thu, 25 Apr 2024 21:39:23 -0700
+Subject: [PATCH] Add missing include
+
+Upstream-Status: Backport [a074af0d6a21665d3dfbd785ffd788146afeacef]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ common/gattlib_common_adapter.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/common/gattlib_common_adapter.c b/common/gattlib_common_adapter.c
+index d56ed5b..d4274c8 100644
+--- a/common/gattlib_common_adapter.c
++++ b/common/gattlib_common_adapter.c
+@@ -4,6 +4,8 @@
+  * Copyright (c) 2021-2024, Olivier Martin <olivier@labapart.org>
+  */
+ 
++#include <ctype.h>
++
+ #include "gattlib_internal.h"
+ 
+ // Keep track of the allocated adapters to avoid an adapter to be freed twice.
diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
rename to meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
index 06f0b5bf0a..1ebb8350b2 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
@@ -2,18 +2,17 @@ DESCRIPTION = "Bluetooth library with attribute support"
 SECTION = "libs/network"
 
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=a87ee154f005a6f035b8b34ac2191f3b"
+LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=f44a9a14d37330e7cd454e694e714ab8"
 
 DEPENDS = "bluez5 glib-2.0 glib-2.0-native python3-packaging-native"
 
-PV = "0.2+git"
-
-SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https;tag=${PV} \
            file://dbus-avoid-strange-chars-from-the-build-dir.patch \
+           file://0001-Add-missing-include.patch \
            "
 
 SRCBRANCH = "master"
-SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
+SRCREV = "f99558d9b8e3dbba2a952a0b292d3497aec8ee69"
 
 
 CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"

