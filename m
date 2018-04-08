Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5142F75573
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:11 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id v5-v6so3198795plo.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DQpdPpjn+sXtcO+OMm+RcqOOADnGKfSMgCXKA+6/SoQ=;
	b=m4G/VkykDNRnBgiFyLQpQ6gaqcoOh99aLFesqoliAEGokrhZdR/R/XQJERU09pmZRU
	n7yJRQS5XG08SX9l8NBcoIS5yvpw2972eci7sBwtL40l+t/lWZv2x5m0TV4M8aaTwe+a
	soCodhpdPt53otDpnKTdmk3KAg93ht4Djp27UshLBNOLWrnPMCg3zzKELHl8jWG4RGPn
	+ZAg5YIoYYCMPe58HaBtpw76EtC6NRPhfBusGqzfrND/nPy636KXO6o83RYauw4NWRHd
	H6/x8w4si94h/5mZRa+utx8on4/B/crJAWsiblrC0O3qW0yvsloyTEdbafrWnrHDCErl
	gdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DQpdPpjn+sXtcO+OMm+RcqOOADnGKfSMgCXKA+6/SoQ=;
	b=qNf5YAg147k/yIleLjtkcMxmK4nbgoEvIkAI/Kar2WsE/yW7Gu7cE1/YMF39vh1s+Q
	Gt16YPjWhDNU/QKpcbatKQ9dNw0KU+wynvSpcpy9g7GwJ67sZDLw9pnAxUwDGmN/tW2+
	DJekpLN/8cjx02GJ27CflNTsqs4eXwGWy9Y/ykB7pxZp38QFqMykJ3gLG0jE4gUzhjfh
	Gx4XZHWbccYgOIHpHqI6IJRxvWBqX8tIq6rtNcFg8xlK1PkEU2CQ6SCwK6Qk1JuNa1GA
	GNZ8bdmfx7sDz1powRfZfpu8OnakKG2dNK+n6l0kVDeL/TLWNpwUzWOgX8L0qhpJY13H
	WT7w==
X-Gm-Message-State: AElRT7FP+3lMt84jwGClScRp7PJase0dXI/YIKXV7+KuIl7v/W1pSomf
	Z4dhRJTcWuy9swXxA18ETwVqTw==
X-Google-Smtp-Source: AIpwx4+w35RvQ/J62SGe69IKQW85XJrrhiY2hC9ow/hQVmSZ/Tytnct8EH3Plz+iK/U3At0QStOMnA==
X-Received: by 2002:a17:902:2943:: with SMTP id
	g61-v6mr34378186plb.238.1523170752447; 
	Sat, 07 Apr 2018 23:59:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:32 -0700
Message-Id: <1523170729-26321-20-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 20/37] libdbus-c++: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file include/dbus-c++/eventloop-integration.h
Hunk #1 succeeded at 26 with fuzz 2 (offset -1 lines).

and others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-pipe.c-Use-a-string-instead-of-char.patch |  6 ++----
 ...op.cpp-use-portable-method-for-initializi.patch | 10 +--------
 ...ate_proxy.cpp-avoid-possibly-undefined-ui.patch | 10 +--------
 ...efined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch | 10 +--------
 ...04-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 16 +++++++-------
 .../fix-missing-unistd.h-include.patch             | 20 ++++++++---------
 .../remove-CXX_FOR_BUILD-stuff.patch               | 25 +++++++++++++++-------
 7 files changed, 39 insertions(+), 58 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
index 6883f9a..b98e6ec 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
@@ -1,4 +1,4 @@
-From 6bcb58bd69c38b9200e8ec6c382247167571189d Mon Sep 17 00:00:00 2001
+From 1a37e254562cd1c254ccd1dd25d44578588dd039 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 1 Jul 2017 16:44:15 -0700
 Subject: [PATCH] pipe.c: Use a string instead of char
@@ -7,6 +7,7 @@ Fixes
 error: invalid conversion from 'char' to 'const void*' [-fpermissive]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/pipe.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -22,6 +23,3 @@ index 45c2ba6..1303c2d 100644
 -  ::write(_fd_write, '\0', 1);
 +  ::write(_fd_write, "", 1);
  }
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
index eed84e4..d97249a 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
@@ -1,15 +1,10 @@
-From 93fd4868d71aa7a26cdfd382d1e4c85112f069f9 Mon Sep 17 00:00:00 2001
+From 6443d4a5d2a636a9c76a0ed21b31b1465c6950d6 Mon Sep 17 00:00:00 2001
 From: Peter Williams <peter@newton.cx>
 Date: Sat, 19 Dec 2015 21:07:37 -0500
 Subject: [PATCH] src/eventloop.cpp: use portable method for initializing
  recursive mutex
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 ---
-Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/cdaeaa825db191bd65aad3aaaeb3178738727f05]
-Signed-off-by: André Draszik <adraszik@tycoint.com>
  src/eventloop.cpp | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
 
@@ -31,6 +26,3 @@ index 7fb06a3..f622812 100644
    }
    else
    {
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
index 65cd939..8725be9 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
@@ -1,15 +1,10 @@
-From c673a76857cbe0ca82fa11aea9b70f94c3e5b041 Mon Sep 17 00:00:00 2001
+From c9fdcd2d93acdc68062aa408b0e949ebaa3d71cf Mon Sep 17 00:00:00 2001
 From: Peter Williams <peter@newton.cx>
 Date: Sat, 19 Dec 2015 21:08:46 -0500
 Subject: [PATCH] tools/generate_proxy.cpp: avoid possibly undefined 'uint'
  type
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 ---
-Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/43f119a2b3fe951c0f1d88cc61170d4c81a88880]
-Signed-off-by: André Draszik <adraszik@tycoint.com>
  tools/generate_proxy.cpp | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
@@ -53,6 +48,3 @@ index bf1094a..ebb75fa 100644
          }
  
          if (arg_object.length())
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
index f69cefd..a6767a4 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
@@ -1,14 +1,9 @@
-From 465d98dbcdcb72375c198010a50b80b953e7d5a6 Mon Sep 17 00:00:00 2001
+From c792eec913e76c98badde5760eb8d598c940490a Mon Sep 17 00:00:00 2001
 From: Yuri <yuri@tsoft.com>
 Date: Sat, 28 May 2016 13:20:10 -0700
 Subject: [PATCH] Fixed undefined ssize_t for clang-3.8.0 on FreeBSD.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 ---
-Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/463f5a4400d494b831c3b3348c0a21f0faf14f39]
-Signed-off-by: André Draszik <adraszik@tycoint.com>
  include/dbus-c++/pipe.h | 2 ++
  1 file changed, 2 insertions(+)
 
@@ -25,6 +20,3 @@ index 999f042..682646c 100644
  namespace DBus
  {
  
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
index 0c2c487..08e0d1f 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
@@ -1,4 +1,4 @@
-From 12de53b0f24c478ea4ff6b4e2c55366dbd2f02b1 Mon Sep 17 00:00:00 2001
+From 68907973adf98087aa27f01a38235402b16073b2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
 Date: Fri, 25 Nov 2016 09:33:20 +0000
 Subject: [PATCH] use POSIX poll.h instead of sys/poll.h
@@ -6,6 +6,10 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 POSIX specifies that <poll.h> is the correct header to
 include for poll()
   http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
@@ -25,16 +29,15 @@ compiling against the musl C-library such as:
 |   ^~~~~~~
 
 Signed-off-by: André Draszik <git@andred.net>
+
 ---
-Upstream-Status: Submitted [https://github.com/andreas-volz/dbus-cplusplus/pull/3]
-Signed-off-by: André Draszik <adraszik@tycoint.com>
  src/eventloop-integration.cpp | 2 +-
  src/eventloop.cpp             | 2 +-
  src/pipe.cpp                  | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/eventloop-integration.cpp b/src/eventloop-integration.cpp
-index 5776971..271b503 100644
+index 0cc65c3..1c57cd8 100644
 --- a/src/eventloop-integration.cpp
 +++ b/src/eventloop-integration.cpp
 @@ -36,7 +36,7 @@
@@ -44,8 +47,8 @@ index 5776971..271b503 100644
 -#include <sys/poll.h>
 +#include <poll.h>
  #include <fcntl.h>
- #include <unistd.h>
  
+ using namespace DBus;
 diff --git a/src/eventloop.cpp b/src/eventloop.cpp
 index f622812..7790e1e 100644
 --- a/src/eventloop.cpp
@@ -72,6 +75,3 @@ index 01211b3..45c2ba6 100644
  #include <fcntl.h>
  #include <errno.h>
  #include <cassert>
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
index 903a720..3e9ad75 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
@@ -1,13 +1,12 @@
+From 5abd60e2ef701dde2b75272cf89b93123ff54323 Mon Sep 17 00:00:00 2001
+From: Han Shen <shenhan@google.com>
+Date: Thu, 31 May 2012 16:49:35 -0700
+Subject: [PATCH] Fixed dbus-c++ gcc 4.7 building problem.
 
 sniped from ChromiumOS
 
 https://bugs.gentoo.org/424707
 
-From 154f7861d19a2bd5c79c488f9989610971db451b Mon Sep 17 00:00:00 2001
-From: Han Shen <shenhan@google.com>
-Date: Thu, 31 May 2012 16:49:35 -0700
-Subject: [PATCH] Fixed dbus-c++ gcc 4.7 building problem.
-
 Just add "unistd.h" inclusion to eventloop-integration.h.
 
 BUG=None
@@ -20,21 +19,20 @@ Reviewed-by: Yunlian Jiang <yunlian@chromium.org>
 Commit-Ready: Han Shen <shenhan@chromium.org>
 Upstream-Status: Inappropriate [ not author, no upstream ]
 Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
+
 ---
- include/dbus-c++/eventloop-integration.h |    1 +
+ include/dbus-c++/eventloop-integration.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
-index 5108340..1b56ab5 100644
+index 1b0302e..3e44304 100644
 --- a/include/dbus-c++/eventloop-integration.h
 +++ b/include/dbus-c++/eventloop-integration.h
-@@ -27,6 +27,7 @@
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
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
index fa29d3c..c2bbe91 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
@@ -1,16 +1,24 @@
+From 43dff44cbb30799dbd3291c3560b30446605aed9 Mon Sep 17 00:00:00 2001
 From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
 Date: Fri, 18 Nov 2016 10:23:07 +0100
-Subject: Build libdbus-c++ tools for target platform rather than enforced for
+Subject: [PATCH] Build libdbus-c++ tools for target platform rather than
+ enforced for
+
 host platform.
 
 Upstream-Status: Inappropriate [no upstream]
 Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
+
 ---
+ configure.ac      | 3 ---
+ tools/Makefile.am | 2 --
+ 2 files changed, 5 deletions(-)
 
-diff -Naur libdbus-c++-0.9.0.ori/configure.ac libdbus-c++-0.9.0/configure.ac
---- libdbus-c++-0.9.0.ori/configure.ac	2016-11-15 14:25:36.085882774 +0100
-+++ libdbus-c++-0.9.0/configure.ac	2016-11-15 14:27:08.814568717 +0100
-@@ -64,9 +64,6 @@
+diff --git a/configure.ac b/configure.ac
+index f487786..8e05fb1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,9 +64,6 @@ AC_LANG_CPLUSPLUS
  AC_PROG_CC
  AC_PROG_CXX
  
@@ -20,9 +28,10 @@ diff -Naur libdbus-c++-0.9.0.ori/configure.ac libdbus-c++-0.9.0/configure.ac
  AM_PROG_LIBTOOL
  
  PKG_PROG_PKG_CONFIG
-diff -Naur libdbus-c++-0.9.0.ori/tools/Makefile.am libdbus-c++-0.9.0/tools/Makefile.am
---- libdbus-c++-0.9.0.ori/tools/Makefile.am	2016-11-15 14:25:36.089882803 +0100
-+++ libdbus-c++-0.9.0/tools/Makefile.am	2016-11-15 14:26:19.454203583 +0100
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index c025cd1..85df1f5 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
 @@ -1,7 +1,5 @@
  # hacky, but ...
  
-- 
2.7.4


