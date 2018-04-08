Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD35D7495D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 15:57:58 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id z8-v6so5384322oix.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 08:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ttHK1cdmturo6H8dz9aWZ6TfRva8hiZF8p3nTSmYppA=;
	b=qi3FT/jUdBzbvagZqQc2gE/ncQNnkgM95ET6jdp4zI0wVn7d1l874YcAb7owGCLw73
	Hp+u2PjzYGlaANRvoD1bkB3/4tBzkw5C4tEOPwzxYS8cONEcc9AwKdwqY80CrGBVIerH
	MtcHem7UaJuR3aJquGqkKU0iMlZ5hxGIWrNCrHivfZ5ar/dOXsbXscXr/Dwa7hgfRlkU
	gZ+CVTnuFXSqnIq5AD5Cm+qXDcPqJuDp3LGnDmy74zgklMCrzNhrsKuuNTy+UxKAl0Ig
	UXLJuCde9Z6Qg41pr0zAIsHf5krk03fteOrnWk78f/wvNEFavGiCbQNVd7GJt8R+vUcu
	1RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ttHK1cdmturo6H8dz9aWZ6TfRva8hiZF8p3nTSmYppA=;
	b=OccUSEjjYVZKQu1Z9XR1rfNrWSr3UnwZTwTS/gzooE4dUIn1Dxrkpei9LDNq3roWVC
	1nkEcI/yA5ylJ/Lw5bUAdgIvqcEg0ef8gCHRMbtatwuSegJxZUbPwNmrYxduHDkrYyeB
	wScLiu3ZiqErsJbDHyotYZUme6E76Y29/nt3pJuDAvPt2g5O/RsgG6I/OmRckfDmetYH
	f26j1hHQ3xtaFIUJTwaXo3a0r3vcvlmU6PN9QxdzbRDCdbJiYbfzl0bENp+UsjkRUj9O
	QEY29T2IzwN/XlFbk3piNbKdngE7gj2w7m13fsKeiG/Nsy4G6np+mkUj3WY6rAnaOTPQ
	AgWw==
X-Gm-Message-State: ALQs6tABGep7M/iUUxOdrV6W3h5fHQiHhCGDgwKwdpiZltmfcR8oJuWe
	F1o1x9DyB3AIWbmtZEaIGEruZw==
X-Google-Smtp-Source: AIpwx4/MrngAcYj36KiubJ1TR/H1hLsbvWCO6SYdk6gr8iDsoEDeXEC1hxtnbsFRkl6ZnrXF0ODRfg==
X-Received: by 2002:aca:384:: with SMTP id 126-v6mr16365642oid.8.1523203079314;
	Sun, 08 Apr 2018 08:57:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm1937449oti.76.2018.04.08.08.57.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Apr 2018 08:57:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  8 Apr 2018 08:57:55 -0700
Message-Id: <1523203076-7314-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][v2][PATCH 1/2] libdbus-c++: Refresh patches v2
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
X-List-Received-Date: Sun, 08 Apr 2018 15:57:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v2]

refresh via quilt push/refresh rather than devtool

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...04-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 29 ++++++++++------------
 .../fix-missing-unistd.h-include.patch             | 14 +++++------
 2 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
index 0c2c487..b108a4c 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
@@ -33,10 +33,10 @@ Signed-off-by: André Draszik <adraszik@tycoint.com>
  src/pipe.cpp                  | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/src/eventloop-integration.cpp b/src/eventloop-integration.cpp
-index 5776971..271b503 100644
---- a/src/eventloop-integration.cpp
-+++ b/src/eventloop-integration.cpp
+Index: libdbus-c++-0.9.0/src/eventloop-integration.cpp
+===================================================================
+--- libdbus-c++-0.9.0.orig/src/eventloop-integration.cpp
++++ libdbus-c++-0.9.0/src/eventloop-integration.cpp
 @@ -36,7 +36,7 @@
  /* STD */
  #include <string.h>
@@ -44,12 +44,12 @@ index 5776971..271b503 100644
 -#include <sys/poll.h>
 +#include <poll.h>
  #include <fcntl.h>
- #include <unistd.h>
  
-diff --git a/src/eventloop.cpp b/src/eventloop.cpp
-index f622812..7790e1e 100644
---- a/src/eventloop.cpp
-+++ b/src/eventloop.cpp
+ using namespace DBus;
+Index: libdbus-c++-0.9.0/src/eventloop.cpp
+===================================================================
+--- libdbus-c++-0.9.0.orig/src/eventloop.cpp
++++ libdbus-c++-0.9.0/src/eventloop.cpp
 @@ -28,7 +28,7 @@
  #include <dbus-c++/eventloop.h>
  #include <dbus-c++/debug.h>
@@ -59,10 +59,10 @@ index f622812..7790e1e 100644
  #include <sys/time.h>
  
  #include <dbus/dbus.h>
-diff --git a/src/pipe.cpp b/src/pipe.cpp
-index 01211b3..45c2ba6 100644
---- a/src/pipe.cpp
-+++ b/src/pipe.cpp
+Index: libdbus-c++-0.9.0/src/pipe.cpp
+===================================================================
+--- libdbus-c++-0.9.0.orig/src/pipe.cpp
++++ libdbus-c++-0.9.0/src/pipe.cpp
 @@ -32,7 +32,7 @@
  
  /* STD */
@@ -72,6 +72,3 @@ index 01211b3..45c2ba6 100644
  #include <fcntl.h>
  #include <errno.h>
  #include <cassert>
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
index 903a720..bf6870e 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
@@ -24,17 +24,15 @@ Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
  include/dbus-c++/eventloop-integration.h |    1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
-index 5108340..1b56ab5 100644
---- a/include/dbus-c++/eventloop-integration.h
-+++ b/include/dbus-c++/eventloop-integration.h
-@@ -27,6 +27,7 @@
+Index: libdbus-c++-0.9.0/include/dbus-c++/eventloop-integration.h
+===================================================================
+--- libdbus-c++-0.9.0.orig/include/dbus-c++/eventloop-integration.h
++++ libdbus-c++-0.9.0/include/dbus-c++/eventloop-integration.h
+@@ -26,6 +26,7 @@
+ #define __DBUSXX_EVENTLOOP_INTEGRATION_H
  
- #include <cstring>
  #include <errno.h>
 +#include <unistd.h>
  #include "api.h"
  #include "dispatcher.h"
  #include "util.h"
--- 
-1.7.9.7
-- 
2.7.4


