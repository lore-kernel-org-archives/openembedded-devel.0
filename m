Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUhFH-0001OE-Lf for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 14:57:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUhDA-00064o-IQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 14:55:08 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 14:55:08 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 14:55:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 12 Jan 2010 14:54:48 +0100
Message-ID: <hihuv8$b6u$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100104 Shredder/3.0.1pre
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC][PATCH] Move udev cache creation after checkroot
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
X-List-Received-Date: Tue, 12 Jan 2010 13:57:22 -0000
X-Groupsio-MsgNum: 15592
Content-Type: multipart/mixed; boundary="------------080308070508000400010804"

--------------080308070508000400010804
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

What's your opinion on attached (untested) patch? If there's some
consensus that this is a step in the right direction I'll create a
working & tested patch to commit.

Nota bene: I'm not going to discuss the merits of udev caching, only the
impact of this patch to the current situation.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTH8oMkyGM64RGpERAqk0AJ4/5rUWj/Ciyfy0lfcDnM1SgqUN9gCeOr9f
QDA6nnADhKgOt6LEQZK+AUA=
=EtI0
-----END PGP SIGNATURE-----

--------------080308070508000400010804
Content-Type: text/x-patch;
 name="0001-udev-141-move-creation-of-etc-dev.tar-to-after-check.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-udev-141-move-creation-of-etc-dev.tar-to-after-check.pa";
 filename*1="tch"

From 1a77c8e64b2ba25e8f08b6b577c59312ed87a9e6 Mon Sep 17 00:00:00 2001
From: Koen Kooi <koen@openembedded.org>
Date: Tue, 12 Jan 2010 14:48:59 +0100
Subject: [PATCH] udev 141: move creation of /etc/dev.tar to after checkroot

* / isn't always mounted rw when udev runs, so lets create /etc/dev.tar after checkroot has run
---
 recipes/udev/udev-141/cache |   18 ++++++++++++++++++
 recipes/udev/udev-141/init  |    8 --------
 recipes/udev/udev_141.bb    |   10 ++++++++--
 3 files changed, 26 insertions(+), 10 deletions(-)
 create mode 100644 recipes/udev/udev-141/cache

diff --git a/recipes/udev/udev-141/cache b/recipes/udev/udev-141/cache
new file mode 100644
index 0000000..4db1466
--- /dev/null
+++ b/recipes/udev/udev-141/cache
@@ -0,0 +1,18 @@
+#!/bin/sh -e
+
+export TZ=/etc/localtime
+
+[ -f /etc/default/udev ] && . /etc/default/udev
+
+echo "Caching udev devnodes"
+
+			if [ "$DEVCACHE" != "" ]; then
+				echo -n "Populating dev cache"
+				(cd /; tar cf $DEVCACHE dev)
+				mv /tmp/uname /etc/udev/saved.uname
+				mv /tmp/cmdline /etc/udev/saved.cmdline
+				mv /tmp/atags /etc/udev/saved.atags
+				echo
+			fi
+
+exit 0
diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
index a0bdf40..24ca9d8 100644
--- a/recipes/udev/udev-141/init
+++ b/recipes/udev/udev-141/init
@@ -68,14 +68,6 @@ kill_udevd > "/dev/null" 2>&1
 		else
 			/sbin/udevadm trigger
 			/sbin/udevadm settle
-			if [ "$DEVCACHE" != "" ]; then
-				echo -n "Populating dev cache"
-				(cd /; tar cf $DEVCACHE dev)
-				mv /tmp/uname /etc/udev/saved.uname
-				mv /tmp/cmdline /etc/udev/saved.cmdline
-				mv /tmp/atags /etc/udev/saved.atags
-				echo
-			fi
 		fi
 
 exit 0
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 00ba971..df5e346 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r19"
+PR = "r20"
 
 # needed for init.d script
 RDEPENDS_${PN} += "udev-utils"
@@ -24,7 +24,9 @@ SRC_URI += " \
        file://network.sh \
        file://local.rules \
        file://default \
-       file://init"
+       file://init \
+       file://cache \
+"
 
 SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
 PACKAGE_ARCH_h2200 = "h2200"
@@ -70,6 +72,7 @@ do_install () {
 	oe_runmake 'DESTDIR=${D}' INSTALL=install install
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
+	install -m 0755 ${WORKDIR}/cache ${D}${sysconfdir}/init.d/udev-cache
 
 	install -d ${D}${sysconfdir}/default
 	install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/udev
@@ -112,7 +115,10 @@ do_install_append_bug() {
 	install -m 0644 ${WORKDIR}/bmi_eventpipe.sh ${D}${sysconfdir}/udev/scripts/bmi_eventpipe.sh
 }
 
+# Create the cache after checkroot has run
 pkg_postinst_${PN}_append() {
+update-rc.d $OPT udev-cache start 12 S .
+
 if [ -d $D/lib/udev/rules.d ] ; then
 	echo "$D/lib/udev/rules.d is not a symlink, fixing that"
 	mv $D/lib/udev/rules.d/* $D${sysconfdir}/udev/rules.d/
-- 
1.6.5


--------------080308070508000400010804--
