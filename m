Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CCDF96B50B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 07:49:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44jyDv6KKjz44
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 09:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555400960;
	bh=LIWCLu0xc4cqPQm66FAeFVwylS6PbXaDQ7oeI3LZElg=;
	h=From:To:Subject:Date:From;
	b=FaxBLeJA+egaQ2+Ylyatj2tcx0f5jQIyUh70ZhkhBN8qNWVwslye9jCdnvqVS/kI1
	6WSOW9+PkMOHhP965KKxveKjLKXo+iwghJ06Mga8LSsNPXl70KIRFiS05xSvoRl52c
	ArLhF/+f0gQInvlase4oJLMA/7irVdLsVMY6isJWY74oACsMqp+hKUKiSHFu12Spwu
	BxuhXN5OfrHirh/CfO+HWPoYlmiQqU0P8ExLofqAYRzGS0/cwBF5/Upq6IJgqkAAgS
	CZDy07ieu5z53AmWaDwmqotA3JnC6HT1a5y4bBEUEwqk3rb66Tj+a5d536uduCQIZq
	YKcIzf1Yb0xwhXuJe/6ovzcpX8bekNBh3XIp/KQ+Id5PIlC38eyq/WUU8bTNWIQXye
	klOJcpZxqK5XmTTiQlcJy8euvyO7fWflBCouIhPs0VH3o8CGd3o3Pfi7YcM2GjIQiW
	zRpx6fV5RoX3eEvJl5z1p3+ND0Uc3IDvE3kpldlmmc+L/6xcghqXRRP0R2cgXF4g6p
	1mwGltPhZKEYiv+Ui6LsFiWZg2lDWdPdYlTF9Gwo927LQDMgYoqifTNS2iMaG8DCHU
	89ToSbOyKAUX67U9o2+yseKHZp12jj9Hz+wuoOH1/+GiqUBvJPmsDbwVpdOuucqmz3
	4sBCZBN2gpcGGejICimcUHVo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2019 10:49:18 +0300
Message-Id: <20190416074918.28537-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] linux-atm: Replace bogus on_exit removal with musl-specific hack
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
X-List-Received-Date: Tue, 16 Apr 2019 07:49:20 -0000

Functions registered by atexit and on_exit have different signatures,
if registered with atexit no parameters are passed.

The function only prints a trace on nonzero exit(),
so can safely be disabled in musl builds.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...sigd-Replace-on_exit-API-with-atexit.patch | 30 ---------------
 .../linux-atm/linux-atm/musl-no-on_exit.patch | 37 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  3 +-
 3 files changed, 39 insertions(+), 31 deletions(-)
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch
deleted file mode 100644
index ce061231c..000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 27fa80dc8045e71c30dd2abea835206d5c8f6c71 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jun 2017 16:18:56 -0700
-Subject: [PATCH 2/3] sigd: Replace on_exit() API with atexit()
-
-on_exit is not universally available
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sigd/atmsigd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sigd/atmsigd.c b/src/sigd/atmsigd.c
-index 52e41c7..b766606 100644
---- a/src/sigd/atmsigd.c
-+++ b/src/sigd/atmsigd.c
-@@ -517,7 +517,7 @@ int main(int argc,char **argv)
- 	    exit(0);
- 	}
-     }
--    (void) on_exit(trace_on_exit,NULL);
-+    atexit(trace_on_exit);
-     poll_loop();
-     close_all();
-     for (sig = entities; sig; sig = sig->next) stop_saal(&sig->saal);
--- 
-2.13.1
-
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch b/meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch
new file mode 100644
index 000000000..25211d7c1
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch
@@ -0,0 +1,37 @@
+Description: musl lacks on_exit
+Author: Adrian Bunk <bunk@stusta.de>
+
+Only prints a trace on nonzero exit(),
+so can safely be disabled in musl builds.
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Inappropriate [musl specific]
+
+--- linux-atm-2.5.1.orig/src/sigd/atmsigd.c
++++ linux-atm-2.5.1/src/sigd/atmsigd.c
+@@ -283,6 +283,7 @@ static void setup_signals(void)
+ /* ------------------------------- main ...  ------------------------------- */
+ 
+ 
++#if 0
+ static void trace_on_exit(int status,void *dummy)
+ {
+     char path[PATH_MAX+1];
+@@ -300,6 +301,7 @@ static void trace_on_exit(int status,voi
+     dump_trace(file,"Message trace (after error exit)");
+     if (file != stderr) (void) fclose(file);
+ }
++#endif
+ 
+ 
+ static void manual_override(void)
+@@ -517,7 +519,9 @@ int main(int argc,char **argv)
+ 	    exit(0);
+ 	}
+     }
++#if 0
+     (void) on_exit(trace_on_exit,NULL);
++#endif
+     poll_loop();
+     close_all();
+     for (sig = entities; sig; sig = sig->next) stop_saal(&sig->saal);
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index d34dc842f..9ed7ca613 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -10,11 +10,12 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://install-from-buildir.patch \
            file://0001-fix-compile-error-with-linux-kernel-v4.8.patch \
            file://0001-ttcp-Add-printf-format-string.patch \
-           file://0002-sigd-Replace-on_exit-API-with-atexit.patch \
            file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
            file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
 "
 
+SRC_URI_append_libc-musl = " file://musl-no-on_exit.patch"
+
 SRC_URI[md5sum] = "d49499368c3cf15f73a05d9bce8824a8"
 SRC_URI[sha256sum] = "9645481a2b16476b59220aa2d6bc5bc41043f291326c9b37581018fbd16dd53a"
 
-- 
2.17.1


