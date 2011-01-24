Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhSp8-0000Fh-PR
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:15:39 +0100
Received: by vws6 with SMTP id 6so2001751vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 12:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=ufKuX4bXWCvFiSgd+yihHGBIvlD1nrMCgLOboyoqcug=;
	b=MNUumZhR0exJepeIte64pdI0pEXBP42yt/HrJm7OXeCrHYgTHdo64dNlUo4qTLagkg
	nW0xj7j+yz5QLdnPJaakMDi/DBQ4CBHtQDg11lTtsLieSGT6BcMFSpOFHeqAliTbLF9b
	Fn0jU/VOqcKaTmGVgqabkcrMNKP+YXUYBpBsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EdJoJEoeQpISpun+7Z2qv3hxUunkvOqOhbXv2bRcdQjsnLQf8LHTGOiekL10JhTY7c
	EEDp7vXGlBWiO1FymcsX3J9aX/CZfOyRPi6uwsww1slEFd0YgFuDaCfxtrzLR/yETNtc
	z/BPz7/rmuAolqLEV8fik6F2hQDBV0izsOrv0=
Received: by 10.220.191.194 with SMTP id dn2mr1248422vcb.268.1295900092604;
	Mon, 24 Jan 2011 12:14:52 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm4256314vci.24.2011.01.24.12.14.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 12:14:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 12:14:52 -0800
Message-Id: <1295900092-1518-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] udev: Remove duplicate udev firmware loading rule
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
X-List-Received-Date: Mon, 24 Jan 2011 20:15:39 -0000

A duplicate udev rule calling firmware.sh exists in
50-udev-default.rules and
udev.rules

This causes the kernel to sometimes get the wrong the firmware due to a
race between the two calls.

This is with udev124 from the stable2009 openembedded branch however a
quick
glance suggests that the same problem exists on the dev branch.

50-udev-default.rules comes from the upstream tarball
udev.rules is in the openembedded recipe.

This causes the infamous "Error number -110" while uploading firmware,
i.e:

[ 4171.357272] firmware: requesting zd1211/zd1211b_ub
[ 4171.375779] firmware: requesting zd1211/zd1211b_uphr
[ 4193.981056] firmware: requesting zd1211/zd1211b_ub
[ 4193.986433] firmware: requesting zd1211/zd1211b_uphr
[ 4195.033695] usb 8-3: USB control request for firmware upload failed.  Error number -110

* Fixes Bugzilla/5334

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/udev/udev-097/udev.rules |    3 ---
 recipes/udev/udev-100/udev.rules |    3 ---
 recipes/udev/udev-124/udev.rules |    3 ---
 recipes/udev/udev-141/udev.rules |    3 ---
 recipes/udev/udev-151/udev.rules |    3 ---
 recipes/udev/udev-154/udev.rules |    3 ---
 recipes/udev/udev-162/udev.rules |    3 ---
 recipes/udev/udev-165/udev.rules |    3 ---
 recipes/udev/udev_097.bb         |    2 +-
 recipes/udev/udev_100.bb         |    2 +-
 recipes/udev/udev_124.bb         |    2 +-
 recipes/udev/udev_141.bb         |    2 +-
 recipes/udev/udev_151.bb         |    2 +-
 recipes/udev/udev_154.bb         |    2 +-
 recipes/udev/udev_162.bb         |    2 +-
 recipes/udev/udev_165.bb         |    2 +-
 16 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/recipes/udev/udev-097/udev.rules b/recipes/udev/udev-097/udev.rules
index 27c4cb8..1fcf0cd 100644
--- a/recipes/udev/udev-097/udev.rules
+++ b/recipes/udev/udev-097/udev.rules
@@ -94,9 +94,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev-100/udev.rules b/recipes/udev/udev-100/udev.rules
index 27c4cb8..1fcf0cd 100644
--- a/recipes/udev/udev-100/udev.rules
+++ b/recipes/udev/udev-100/udev.rules
@@ -94,9 +94,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev-124/udev.rules b/recipes/udev/udev-124/udev.rules
index a19d4a0..6117b94 100644
--- a/recipes/udev/udev-124/udev.rules
+++ b/recipes/udev/udev-124/udev.rules
@@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev-141/udev.rules b/recipes/udev/udev-141/udev.rules
index a19d4a0..6117b94 100644
--- a/recipes/udev/udev-141/udev.rules
+++ b/recipes/udev/udev-141/udev.rules
@@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", NAME="%k", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev-151/udev.rules b/recipes/udev/udev-151/udev.rules
index 60288c0..c20cdcc 100644
--- a/recipes/udev/udev-151/udev.rules
+++ b/recipes/udev/udev-151/udev.rules
@@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev-154/udev.rules b/recipes/udev/udev-154/udev.rules
index 60288c0..c20cdcc 100644
--- a/recipes/udev/udev-154/udev.rules
+++ b/recipes/udev/udev-154/udev.rules
@@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev-162/udev.rules b/recipes/udev/udev-162/udev.rules
index 60288c0..c20cdcc 100644
--- a/recipes/udev/udev-162/udev.rules
+++ b/recipes/udev/udev-162/udev.rules
@@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev-165/udev.rules b/recipes/udev/udev-165/udev.rules
index 60288c0..c20cdcc 100644
--- a/recipes/udev/udev-165/udev.rules
+++ b/recipes/udev/udev-165/udev.rules
@@ -105,9 +105,6 @@ KERNEL=="device-mapper",	NAME="mapper/control"
 
 KERNEL=="rfcomm[0-9]*", GROUP="users", MODE="0660"
 
-# Firmware Helper
-ACTION=="add", SUBSYSTEM=="firmware", RUN+="/lib/udev/firmware.sh"
-
 # Samsung UARTS
 KERNEL=="s3c2410_serial[0-9]",   NAME="ttySAC%n"
 
diff --git a/recipes/udev/udev_097.bb b/recipes/udev/udev_097.bb
index 84d4b61..2a20005 100644
--- a/recipes/udev/udev_097.bb
+++ b/recipes/udev/udev_097.bb
@@ -10,7 +10,7 @@ needed to link programs with libvolume_id."
 
 require udev.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LD = "${CC}"
 
diff --git a/recipes/udev/udev_100.bb b/recipes/udev/udev_100.bb
index a6692cf..c55a6a2 100644
--- a/recipes/udev/udev_100.bb
+++ b/recipes/udev/udev_100.bb
@@ -11,7 +11,7 @@ needed to link programs with libvolume_id."
 
 require udev.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LD = "${CC}"
 
diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
index a6c0e18..1585d8c 100644
--- a/recipes/udev/udev_124.bb
+++ b/recipes/udev/udev_124.bb
@@ -5,7 +5,7 @@ RPROVIDES_${PN} = "hotplug"
 
 require udev.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 LD = "${CC}"
 
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 7a34ada..1c6a148 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -7,7 +7,7 @@ DEFAULT_PREFERENCE = "-1"
 
 require udev.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += "file://mount.blacklist \
 	    file://run.rules \
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index c903f0e..32ab909 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r22"
+PR = "r23"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index d7740a6..4a358d3 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r6"
+PR = "r7"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
index dc9d313..90d66ce 100644
--- a/recipes/udev/udev_162.bb
+++ b/recipes/udev/udev_162.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r8"
+PR = "r9"
 
 # Untested
 #DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index c9e5096..55eccb0 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r0"
+PR = "r1"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.0.4



