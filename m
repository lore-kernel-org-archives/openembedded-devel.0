Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cazzeml@gmail.com>) id 1PK8Tj-0004HU-GT
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 12:53:21 +0100
Received: by eya28 with SMTP id 28so3390691eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 03:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/fjO3oxLAa/PoNem9m8MP5LyptV2X3/lTctV9ocIuG0=;
	b=gCWvfkRg9jPZZkCjbfrWmOgKr63t9TVBKD+jIbgPRviQpSUltGFLSF5CK1pZdSzM3k
	sy+u6FCYAyMAtiLBp9TYf329X37dHvXEG4Zp1Yluz3cfY9gkbdjKl7ltuaz6BtpKS5D+
	5zNeZiTLBDQn+smr+LXbVRiQ3/ZCoUk4yXTjc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kIhpfPK6BCYgrW0H+tiZiBVp40IwKLDIhZQXyQTyhIlwtdDNsYKUWEsTDYVRSxklOH
	sETx0kISxLYN/mZ3EoejXD9fFeXC2q5FcItjZDyLWVLPKS0ODX7vC+LnsA0n9/MSf37i
	kgpTaXHPJ9IsAALEK9S9B9EmDnSfD1gK6X3MA=
Received: by 10.213.108.196 with SMTP id g4mr3448545ebp.31.1290340318737;
	Sun, 21 Nov 2010 03:51:58 -0800 (PST)
Received: from localhost.localdomain (d54C04D68.access.telenet.be
	[84.192.77.104])
	by mx.google.com with ESMTPS id q58sm3506441eeh.9.2010.11.21.03.51.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 21 Nov 2010 03:51:58 -0800 (PST)
From: Cazze <cazzeml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Nov 2010 12:51:36 +0100
Message-Id: <1290340296-18252-1-git-send-email-cazzeml@gmail.com>
X-Mailer: git-send-email 1.7.2.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: cazzeml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Added udev-compat wrapper for h2200 Signed-off-by: Cazze <cazzeml@gmail.com>
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
X-List-Received-Date: Sun, 21 Nov 2010 11:53:22 -0000

---
 conf/machine/h2200.conf  |    2 ++
 recipes/udev/udev.inc    |    6 +++++-
 recipes/udev/udev_151.bb |    6 +++++-
 recipes/udev/udev_154.bb |    6 +++++-
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index abc1772..4bcdf7c 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -25,6 +25,8 @@ PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 
+# udev-141 is the latest version that works with linux-2.6.21
+PREFERRED_PROVIDER_udev-compat_h2200 = "udev-compat141"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS = " h2200-bootloader "
 MACHINE_EXTRA_RDEPENDS = " udev-hostap-cs-vcc-workaround "
 MACHINE_EXTRA_RRECOMMENDS = "\
diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
index 0c8a662..5634635 100644
--- a/recipes/udev/udev.inc
+++ b/recipes/udev/udev.inc
@@ -14,7 +14,7 @@ SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://init \
 	   file://udev-compat-wrapper-patch"
 
-INC_PR = "r30"
+INC_PR = "r31"
 
 inherit update-rc.d autotools pkgconfig
 
@@ -60,6 +60,10 @@ RDEPENDS_udev_poodle += "udev-compat"
 do_unpack_append_poodle() {
 	bb.build.exec_func('do_apply_compat_wrapper', d)
 }
+RDEPENDS_udev_h2200 += "udev-compat"
+do_unpack_append_h2200() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
 
 # Modify init script on platforms that need to boot old kernels:
 do_apply_compat_wrapper() {
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index ac14b56..7a6c31d 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r21"
+PR = "r22"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -99,6 +99,10 @@ RDEPENDS_udev_append_poodle = " udev-compat"
 do_unpack_append_poodle() {
 	bb.build.exec_func('do_apply_compat_wrapper', d)
 }
+RDEPENDS_udev_append_h2200 = " udev-compat"
+do_unpack_append_h2200() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
 
 # Modify init script on platforms that need to boot old kernels:
 do_apply_compat_wrapper() {
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index d7740a6..c9348f8 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r6"
+PR = "r7"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -93,6 +93,10 @@ RDEPENDS_udev_append_poodle = " udev-compat"
 do_unpack_append_poodle() {
 	bb.build.exec_func('do_apply_compat_wrapper', d)
 }
+RDEPENDS_udev_append_h2200 = " udev-compat"
+do_unpack_append_h2200() {
+	bb.build.exec_func('do_apply_compat_wrapper', d)
+}
 
 # Modify init script on platforms that need to boot old kernels:
 do_apply_compat_wrapper() {
-- 
1.5.6.4



