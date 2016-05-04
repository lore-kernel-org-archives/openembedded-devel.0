Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE9547017B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 07:23:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r12so8665780wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Kz6/Mpaiu8Dx1rjgaLtIjRwtoeJHyB0JL+dFNVLOBs=;
	b=gadEMEwMVzuxi1zg11L7sqFRoN25asLBpyFlsO4d1KNYiTuYQQ4q2bzZ1iHbX5flQ5
	ZiUWOSuNaDYWbKAd7yZVwJ6cMZKmjmCqLLx1zmO1D5jczDhUqk/VhVpLlgFejVx5M/mr
	pJfEip2Z49BomRB4loE6kVl0DXjJG9S5ZZ6qY8SjBSYmIj+ZLsSg7J70rYWXY1FSAC2x
	eB9Gwz6UeG2snoH1wAy23mr+tBvamE5PrRl+3xKNKEgF7KTXevlHMS53lLu1L9fNTa+B
	F+FcpaiygtZXFk99ZkTRDtWKU+RGG8CdlWe0w6Kjl2EHZqQl+Dhw+ytD4G+Eg0jv5nDg
	x5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=0Kz6/Mpaiu8Dx1rjgaLtIjRwtoeJHyB0JL+dFNVLOBs=;
	b=Q0zIl5ZthadL34hUeTkvagVEJUPq25ngFoHdDnAhh3xQAb3kgRmd+gq03eo2Ynsiz7
	Fw+E1dJa6deb/zdMwIeXiYdoP2vAk2p5RZhjKwZS9D+pAOFCWh/3NB/2wybVL6cD0P3O
	2zTGFins4gmz4Jg0jMkoPmPnGk5v+m9mQYEejf4BZc1N+krD8OVORFFkoCsx7uyQqb3z
	7R14+dCC0Pa7Dzabr6frzG3C2HZlkw9lJhbcOL1htt7LHX2OktpN0jLmMe8fCWqO+70o
	ZKEzurqlNTkYAcg1JngJBLiDe/153YglbHpypeGpSPMBWmfzEhgBWKuYZaX6sxqHSyuy
	ming==
X-Gm-Message-State: AOPr4FWiqO5hgxhGPve4GQWBY0IsTrnCqXT6iO1rS3pfJjuAfJ9F8DHltQbfsmNxxtzilA==
X-Received: by 10.28.9.135 with SMTP id 129mr27578781wmj.31.1462346593158;
	Wed, 04 May 2016 00:23:13 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	k133sm3279641wmg.7.2016.05.04.00.23.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 May 2016 00:23:12 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2016 08:23:32 +0100
Message-Id: <1462346612-13017-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1462346612-13017-1-git-send-email-paul@paulbarker.me.uk>
References: <1462346612-13017-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe][PATCH 2/2] toybox: Upgrade to 0.7.0
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
X-List-Received-Date: Wed, 04 May 2016 07:23:14 -0000

Add additional patches to fix issues seen during testing on qemux86.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../toybox/toybox/0001-Fix-segfault-in-login.patch | 33 +++++++++
 .../0002-Add-b-and-F-arguments-to-hostname.patch   | 84 ++++++++++++++++++++++
 .../toybox/{toybox_0.6.0.bb => toybox_0.7.0.bb}    | 12 ++--
 3 files changed, 125 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.6.0.bb => toybox_0.7.0.bb} (84%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch b/meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch
new file mode 100644
index 0000000..939885b
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0001-Fix-segfault-in-login.patch
@@ -0,0 +1,33 @@
+From 863b129441c12eb75d63e4f4fe9a8f7df81607fd Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sun, 1 May 2016 14:50:59 +0100
+Subject: [PATCH] Fix segfault in login
+
+Fix a bug in readfileat where *plen would be corrupted if you didn't supply
+your own buffer (because ibuf is 0 in that case, not a pointer to the start
+of the allocated space). This caused a segfault in the 'login' program.
+
+Partial backport of upstream commit 81f31e463bd982a8344ea8681938eb43c9114652
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Backport
+---
+ lib/lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/lib.c b/lib/lib.c
+index 6559030..e5bb605 100644
+--- a/lib/lib.c
++++ b/lib/lib.c
+@@ -475,7 +475,7 @@ char *readfileat(int dirfd, char *name, char *ibuf, off_t *plen)
+     rbuf = buf+rlen;
+     len -= rlen;
+   }
+-  *plen = len = rlen+(buf-ibuf);
++  *plen = len = rlen+(rbuf-buf);
+   close(fd);
+ 
+   if (rlen<0) {
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch b/meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch
new file mode 100644
index 0000000..e300494
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0002-Add-b-and-F-arguments-to-hostname.patch
@@ -0,0 +1,84 @@
+From 151f576ab1fba44137beaeb95620b7942662b4d3 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Sun, 1 May 2016 15:42:57 +0100
+Subject: [PATCH] Add -b and -F arguments to hostname
+
+These arguments are required to correctly set the hostname at boot time.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Submitted
+---
+ toys/lsb/hostname.c | 42 ++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/toys/lsb/hostname.c b/toys/lsb/hostname.c
+index 23467fb..ebfc803 100644
+--- a/toys/lsb/hostname.c
++++ b/toys/lsb/hostname.c
+@@ -4,23 +4,61 @@
+  *
+  * http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/hostname.html
+ 
+-USE_HOSTNAME(NEWTOY(hostname, NULL, TOYFLAG_BIN))
++USE_HOSTNAME(NEWTOY(hostname, "bF:", TOYFLAG_BIN))
+ 
+ config HOSTNAME
+   bool "hostname"
+   default y
+   help
+-    usage: hostname [newname]
++    usage: hostname [-b] [-F FILENAME] [newname]
+ 
+     Get/Set the current hostname
++
++    -b  Set hostname to 'localhost' if otherwise unset
++    -F  Set hostname to contents of FILENAME
+ */
+ 
+ #define FOR_hostname
+ #include "toys.h"
+ 
++GLOBALS(
++  char *fname;
++)
++
+ void hostname_main(void)
+ {
+   const char *hostname = toys.optargs[0];
++
++  if (toys.optflags & FLAG_F) {
++    char *buf;
++    if ((hostname = buf = readfile(TT.fname, 0, 0))) {
++      size_t len = strlen(hostname);
++      char *end = buf + len - 1;
++
++      /* Trim trailing whitespace. */
++      while (len && isspace(*end)) {
++        *end-- = '\0';
++        len--;
++      }
++      if (!len) {
++        free(buf);
++        hostname = NULL;
++        if (!(toys.optflags & FLAG_b))
++          error_exit("empty file '%s'", TT.fname);
++      }
++    } else if (!(toys.optflags & FLAG_b))
++      error_exit("failed to read '%s'", TT.fname);
++  }
++
++  if (!hostname && toys.optflags & FLAG_b) {
++    /* Do nothing if hostname already set. */
++    if (gethostname(toybuf, sizeof(toybuf))) perror_exit("get failed");
++    if (strnlen(toybuf, sizeof(toybuf))) exit(0);
++
++    /* Else set hostname to localhost. */
++    hostname = "localhost";
++  }
++
+   if (hostname) {
+     if (sethostname(hostname, strlen(hostname)))
+       perror_exit("set failed '%s'", hostname);
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-core/toybox/toybox_0.6.0.bb b/meta-oe/recipes-core/toybox/toybox_0.7.0.bb
similarity index 84%
rename from meta-oe/recipes-core/toybox/toybox_0.6.0.bb
rename to meta-oe/recipes-core/toybox/toybox_0.7.0.bb
index da03200..d7b469a 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.6.0.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.0.bb
@@ -1,11 +1,15 @@
 SUMMARY = "Toybox combines common utilities together into a single executable."
 HOMEPAGE = "http://www.landley.net/toybox/"
+DEPENDS = "attr"
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "7f4a6c89e56c48e3350e611f5b36c2cf"
-SRC_URI[sha256sum] = "b6e2694d19ac08f1c3416d5b2a02a31d445db2ed98dec89761430cdff2c9710d"
+SRC_URI = " \
+    http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+    file://0001-Fix-segfault-in-login.patch \
+    file://0002-Add-b-and-F-arguments-to-hostname.patch \
+"
 
+SRC_URI[md5sum] = "d86c78624b47625c2f0fc64eda599443"
+SRC_URI[sha256sum] = "65428816f88ad3fe92b67df86dc05427c8078fe03843b8b9715fdfa6d29c0f97"
 
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
-- 
2.1.4


