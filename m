Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id A2855607A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 14:01:11 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so1075238lbi.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7ELyFi3HrcNhQmEq5/XByS/0aTC/eUUe0VR3Yso8YdQ=;
	b=dt9fwFcCpL1XuFR+AT7P7+gcPusRVi3kYaWesfJ3v/eMgRdGvptrxGeYAzqbWn5Wxv
	bjElor6ioyERz8on8lkedJRpeL/h9efgQaxo5y5rDL0zjclGcprSNpg2lSnNfWv2PVqw
	r/DtLSxxcfoi9gGa1LphUBxZQLkKAhumhKPDXCHdDxI/ewm43rpGbi5UULV80fC/uurx
	duxy6daYWUfVHF3bYQdOtBStRWXg8QWIFAJDgwQVNHOnMvs+VWZ3rcIM2pJmtAQ+02yl
	3sb8naDi+2mn0iR/AK22PcA/N7vBkDTRjjn3WFabnlk3Yfd1qzaN31w9X/DtvN/Wd8vQ
	oKfA==
X-Received: by 10.112.140.74 with SMTP id re10mr34935242lbb.40.1413900071967; 
	Tue, 21 Oct 2014 07:01:11 -0700 (PDT)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id n10sm3818659laf.38.2014.10.21.07.01.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Oct 2014 07:01:11 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Oct 2014 14:01:03 +0000
Message-Id: <1413900063-1999-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1413900063-1999-1-git-send-email-paul@paulbarker.me.uk>
References: <1413900063-1999-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe][PATCH 2/2] toybox: Upgrade to v0.5.0
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
X-List-Received-Date: Tue, 21 Oct 2014 14:01:16 -0000

The patch applied to toybox is rebased onto the new release and updated.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../toybox/0001-Match-paths-with-busybox.patch     | 44 +++++++++++++++-------
 .../toybox/{toybox_0.4.9.bb => toybox_0.5.0.bb}    |  6 +--
 2 files changed, 34 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.4.9.bb => toybox_0.5.0.bb} (89%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
index 2213559..e071f22 100644
--- a/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
+++ b/meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
@@ -1,4 +1,4 @@
-From cbd9ac1d0769338411297d2cb97f1608c17c8ae9 Mon Sep 17 00:00:00 2001
+From 27f5ca9f1e212e5ab00cde0bfc91282fc7ff5e16 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@paulbarker.me.uk>
 Date: Mon, 18 Aug 2014 12:18:16 +0000
 Subject: [PATCH] Match paths with busybox
@@ -8,11 +8,16 @@ update-alternatives, the paths of the links installed by toybox should match
 those installed by busybox. This is accomplished by changing the flags of a few
 tools within toybox.
 
+v2:
+    - Forward ported from v0.4.9 to v0.5.0
+    - Move new 'mount' command
+
 Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
 
 Upstream-status: Inappropriate
     (specific to update-alternatives use in OpenEmbedded)
 ---
+ toys/lsb/mount.c        | 2 +-
  toys/lsb/pidof.c        | 2 +-
  toys/other/chvt.c       | 2 +-
  toys/other/ifconfig.c   | 2 +-
@@ -37,8 +42,21 @@ Upstream-status: Inappropriate
  toys/posix/tee.c        | 2 +-
  toys/posix/uniq.c       | 2 +-
  toys/posix/who.c        | 2 +-
- 24 files changed, 28 insertions(+), 28 deletions(-)
+ 25 files changed, 29 insertions(+), 29 deletions(-)
 
+diff --git a/toys/lsb/mount.c b/toys/lsb/mount.c
+index 01f5c32..65a5aa2 100644
+--- a/toys/lsb/mount.c
++++ b/toys/lsb/mount.c
+@@ -6,7 +6,7 @@
+  * Note: -hV is bad spec, haven't implemented -FsLU yet
+  * no mtab (/proc/mounts does it) so -n is NOP.
+ 
+-USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
++USE_MOUNT(NEWTOY(mount, "?O:afnrvwt:o*[-rw]", TOYFLAG_BIN|TOYFLAG_STAYROOT))
+ USE_NFSMOUNT(NEWTOY(nfsmount, "?<2>2", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
+ 
+ config MOUNT
 diff --git a/toys/lsb/pidof.c b/toys/lsb/pidof.c
 index 51b742f..a8fc8ef 100644
 --- a/toys/lsb/pidof.c
@@ -66,7 +84,7 @@ index 6544265..a93327f 100644
  config CHVT
    bool "chvt"
 diff --git a/toys/other/ifconfig.c b/toys/other/ifconfig.c
-index a84e26a..66c7179 100644
+index f5d4215..5e7c54c 100644
 --- a/toys/other/ifconfig.c
 +++ b/toys/other/ifconfig.c
 @@ -6,7 +6,7 @@
@@ -226,10 +244,10 @@ index 8e57ca1..0c6c640 100644
  config SYSCTL
    bool "sysctl"
 diff --git a/toys/posix/cut.c b/toys/posix/cut.c
-index 38f136e..87a1f0d 100644
+index 7f10c5e..1ab3ce8 100644
 --- a/toys/posix/cut.c
 +++ b/toys/posix/cut.c
-@@ -4,7 +4,7 @@
+@@ -5,7 +5,7 @@
   *
   * http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cut.html 
  
@@ -265,7 +283,7 @@ index e8517d4..3ac4373 100644
  config HEAD
    bool "head"
 diff --git a/toys/posix/id.c b/toys/posix/id.c
-index a03a097..cfe0b59 100644
+index b4d9c00..df79419 100644
 --- a/toys/posix/id.c
 +++ b/toys/posix/id.c
 @@ -6,10 +6,10 @@
@@ -274,11 +292,11 @@ index a03a097..cfe0b59 100644
  
 -USE_ID(NEWTOY(id, ">1nGgru[!Ggu]", TOYFLAG_BIN))
 +USE_ID(NEWTOY(id, ">1nGgru[!Ggu]", TOYFLAG_USR|TOYFLAG_BIN))
- USE_ID_GROUPS(OLDTOY(groups, id, NULL, TOYFLAG_USR|TOYFLAG_BIN))
--USE_ID_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_BIN))
--USE_ID_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_BIN))
-+USE_ID_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_ID_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
+ USE_GROUPS(OLDTOY(groups, id, NULL, TOYFLAG_USR|TOYFLAG_BIN))
+-USE_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_BIN))
+-USE_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_BIN))
++USE_LOGNAME(OLDTOY(logname, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
++USE_LOGNAME(OLDTOY(whoami, id, ">0", TOYFLAG_USR|TOYFLAG_BIN))
  
  config ID
    bool "id"
@@ -335,7 +353,7 @@ index 0388510..5574088 100644
  config TEE
    bool "tee"
 diff --git a/toys/posix/uniq.c b/toys/posix/uniq.c
-index bd41d4a..374ceab 100644
+index 3cfdb94..c127cfe 100644
 --- a/toys/posix/uniq.c
 +++ b/toys/posix/uniq.c
 @@ -4,7 +4,7 @@
@@ -361,5 +379,5 @@ index 2c8a2e6..d5cd001 100644
  config WHO
    bool "who"
 -- 
-2.0.4
+2.1.2
 
diff --git a/meta-oe/recipes-core/toybox/toybox_0.4.9.bb b/meta-oe/recipes-core/toybox/toybox_0.5.0.bb
similarity index 89%
rename from meta-oe/recipes-core/toybox/toybox_0.4.9.bb
rename to meta-oe/recipes-core/toybox/toybox_0.5.0.bb
index ec76bd6..9bdba4d 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.4.9.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.5.0.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "http://www.landley.net/toybox/"
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.bz2 \
     file://0001-Match-paths-with-busybox.patch"
-SRC_URI[md5sum] = "a8f1022175689defec51cf5a71c41326"
-SRC_URI[sha256sum] = "e6dc9052826a3bdae1923e3301c9e3542e890af5ed66534052943f8412255bff"
+SRC_URI[md5sum] = "2cb6e8b34134038d86048e117f77765f"
+SRC_URI[sha256sum] = "2718b42154be041435df48d5b5140f4e307767c36b1017e0c8d0da7f75b327a7"
 
 LICENSE = "BSD-0-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=57cc240a6204b2ea8c68450d42f9d33f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
 
 SECTION = "base"
 
-- 
2.1.2


