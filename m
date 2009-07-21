Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MTB1Y-0007hN-VB
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 10:48:45 +0200
Received: from [10.175.196.247] (213.66.88.59) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE0007CCE5 for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 10:34:34 +0200
Message-ID: <4A657D58.4070404@atmel.com>
Date: Tue, 21 Jul 2009 10:33:28 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] hal-0.5.12 requires blkid >= 1.43
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
X-List-Received-Date: Tue, 21 Jul 2009 08:49:31 -0000
Content-Type: multipart/mixed; boundary="------------000300020207000604000605"

--------------000300020207000604000605
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

hal does not build when bitbaking gpe-image,since
blkid is 1.41.8 and hal requires >= 1.43.
1.41.8 seems to be the latest!
The attached patch fixes configure and configure.in in the hal

First the patch to the recipe.

diff --git a/recipes/hal/hal_0.5.12.bb b/recipes/hal/hal_0.5.12.bb
index b6531e8..155c2e3 100644
--- a/recipes/hal/hal_0.5.12.bb
+++ b/recipes/hal/hal_0.5.12.bb
@@ -2,6 +2,10 @@ require hal.inc
 
 DEFAULT_PREFERENCE = "-1"
 
+PR = "r1"
+
+SRC_URI += " file://hal-0.5.12-blkid-1.41.patch;patch=1"
+
 # The following code finds the right linux/input.h,
 # which also works with external-toolchain/SDK
 do_configure() {


---
Then the patch which should reside in the
"recipe/hal/hal-0.5.12/hal-0.5.12-blkid-1.41.patch"


diff -urN a/configure b/configure
--- a/configure    2009-07-21 10:02:37.000000000 +0200
+++ b/configure    2009-07-21 10:06:27.000000000 +0200
@@ -2791,7 +2791,7 @@
 
 glib_module="glib-2.0 >= 2.10.0 gobject-2.0 > 2.10.0 dbus-glib-1 >= 0.61"
 dbus_module="dbus-1 >= 0.61"
-blkid_module="blkid >= 1.43"
+blkid_module="blkid >= 1.41"
 polkit_module="polkit >= 0.5"
 
 # libtool versioning - this applies to libhal and libhal-storage
diff -urN a/configure.in b/configure.in
--- a/configure.in    2009-05-10 21:43:52.000000000 +0200
+++ b/configure.in    2009-07-21 10:06:51.000000000 +0200
@@ -13,7 +13,7 @@
 
 glib_module="glib-2.0 >= 2.10.0 gobject-2.0 > 2.10.0 dbus-glib-1 >= 0.61"
 dbus_module="dbus-1 >= 0.61"
-blkid_module="blkid >= 1.43"
+blkid_module="blkid >= 1.41"
 polkit_module="polkit >= 0.5"
 
 # libtool versioning - this applies to libhal and libhal-storage


Comments?

Best Regards
Ulf Samuelsson


--------------000300020207000604000605
Content-Type: text/x-patch;
 name="hal-0.5.12-blkid-1.41.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="hal-0.5.12-blkid-1.41.patch"

diff -urN a/configure b/configure
--- a/configure	2009-07-21 10:02:37.000000000 +0200
+++ b/configure	2009-07-21 10:06:27.000000000 +0200
@@ -2791,7 +2791,7 @@
 
 glib_module="glib-2.0 >= 2.10.0 gobject-2.0 > 2.10.0 dbus-glib-1 >= 0.61"
 dbus_module="dbus-1 >= 0.61"
-blkid_module="blkid >= 1.43"
+blkid_module="blkid >= 1.41"
 polkit_module="polkit >= 0.5"
 
 # libtool versioning - this applies to libhal and libhal-storage
diff -urN a/configure.in b/configure.in
--- a/configure.in	2009-05-10 21:43:52.000000000 +0200
+++ b/configure.in	2009-07-21 10:06:51.000000000 +0200
@@ -13,7 +13,7 @@
 
 glib_module="glib-2.0 >= 2.10.0 gobject-2.0 > 2.10.0 dbus-glib-1 >= 0.61"
 dbus_module="dbus-1 >= 0.61"
-blkid_module="blkid >= 1.43"
+blkid_module="blkid >= 1.41"
 polkit_module="polkit >= 0.5"
 
 # libtool versioning - this applies to libhal and libhal-storage

--------------000300020207000604000605--
