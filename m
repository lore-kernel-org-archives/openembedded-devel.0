Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1vL-00074e-6l
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:03 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so2102403wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Le8L1Vx1UUK1MieHNYu6MVyU//HKWFpdo2uQIy9apTs=;
	b=Z4SrfT3i0axQ2pKFjKpXcjO7wDXhFLutwhpZ5hcAk4dCLiOsdqq3skuGydmtipwWgy
	vYkEPCMruVE1HgSUx0KGQ4n7fdTNtemet+STHXHCU/dXKUOk8uSdN/yUmPjRXVh6nCaF
	a4+KHH6O8/swPkmZUOGagR5vfUM3nNwTlPQwIF5dHWVvOv/Ayd47qX7ZmHhnKFmowvQz
	CrLb6lt9Vo0m4eOiovMVNzVEn+Vy1BCpsbX9e/8ldYuY71DDPtiwSZFXx0NKVAOM2VsN
	WO+RADbytoXqhsDMFUnVEU6tQeadMwj/FRFyYB7GwYrpJqqPS9s3+94wCdserREHxBhr
	hdBA==
Received: by 10.216.236.38 with SMTP id v38mr7081075weq.222.1343699968950;
	Mon, 30 Jul 2012 18:59:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm26305607wid.0.2012.07.30.18.59.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:59:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:35 +0200
Message-Id: <038f3264060fcb6d09a7b20b401772f671139cb9.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/24] gpsd: add chrpath-native to DEPENDS otherwise it could autodetect host chrpath
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
X-List-Received-Date: Tue, 31 Jul 2012 02:11:03 -0000

* which doesn't work sometimes:
  chrpath -d "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.5-r7/image/usr/sbin/gpsd"
  `/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gpsd-3.5-r7/image/usr/sbin/gpsd'
  probably isn't a 64-bit LSB-first ELF file.
  elf_open: Exec format error

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb |    4 ++--
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index 568d492..1e3ac0c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1"
+DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
index 8404ba1..380f3ba 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1"
+DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r3"
+PR = "r4"
 
 SRCREV = "f8744f4af8cef211de698df5d8e6caddfe33f29d"
 
-- 
1.7.8.6



