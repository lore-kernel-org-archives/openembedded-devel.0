Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFADAC83F2A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web11.75861.1752492417871191399
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=C9IlgWzS;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492419; x=1784028419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PHA6UZ0E3H69NBP/HjXvcl+OfcGS4VgZFgx43zVBEVU=;
  b=C9IlgWzSnb9YqWmS2BkBuPoEmrnPN//v+GVTmOd3es0yrzGCXTIyv5KP
   DBSRSBB68sQhca5pJaGjgtYGFUEUwk3nRRA0qJCnubCRq1Mp2DtcA/smx
   Yu7nAKRtgZKZkc6LiIXNYqP2JotdiyM3FQU9cBPpp7+tQtYmGoEJuprRI
   Q=;
X-CSE-ConnectionGUID: eSQumiq5Qp6sN64FPQnEAQ==
X-CSE-MsgGUID: wfPep4U5QmqIL/iVXkui1A==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw4.muc with ESMTP/TLS;
 14 Jul 2025 13:26:56 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:56 +0200
X-CSE-ConnectionGUID: exn6so6KTHiy5qESLuPkKw==
X-CSE-MsgGUID: BUXgE3gPTryKcXxvv0gacw==
X-CSE-ConnectionGUID: p+fILqgVRG6fAcezJkKGfA==
X-CSE-MsgGUID: rh0/U+amT+mMn4HZQbMRsg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 05/10] libvncserver: upgrade 0.9.14 -> 0.9.15
Date: Mon, 14 Jul 2025 13:26:30 +0200
Message-ID: <20250714112642.121146-5-Moritz.Haase@bmw.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118523

Also pull in a patch to support builds with CMake 4+ that hasn't made it into a
release yet.

Release notes are available at [0].

[0]: https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.15

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...001-CMake-require-at-least-CMake-3.5.patch | 25 +++++++++++++++++++
 ...erver_0.9.14.bb => libvncserver_0.9.15.bb} |  6 +++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
 rename meta-oe/recipes-graphics/libvncserver/{libvncserver_0.9.14.bb => libvncserver_0.9.15.bb} (92%)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
new file mode 100644
index 0000000000..68e3a08acb
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
@@ -0,0 +1,25 @@
+From e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@jolla.com>
+Date: Tue, 13 May 2025 08:37:07 +0300
+Subject: [PATCH] CMake: require at least CMake 3.5
+
+CMake 4 dropped support for version requirements < 3.5.
+
+Fixes building with CMake >= 4.
+
+Upstream-Status: Backport [e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 205f3928..9b8118c8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ set(PROJECT_LANGUAGES C)
+ 
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
similarity index 92%
rename from meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index ff5df428e8..9d2d0a5743 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -44,8 +44,10 @@ FILES:libvncclient = "${libdir}/libvncclient.*"
 
 inherit cmake
 
-SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https"
-SRCREV = "10e9eb75f73e973725dc75c373de5d89807af028"
+SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag=LibVNCServer-${PV} \
+           file://0001-CMake-require-at-least-CMake-3.5.patch \
+"
+SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 
 
 EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"

