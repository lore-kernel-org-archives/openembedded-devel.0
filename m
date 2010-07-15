Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1OZXhN-0001aB-Qz
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 01:18:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 14EAB1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:23:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4+i72Bqd139
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:23:31 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 0297C1416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 01:23:30 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jul 2010 01:18:33 +0200
Message-ID: <1279235913.6792.17.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] udev: fix multiple mounting of /dev, increment PR
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
X-List-Received-Date: Thu, 15 Jul 2010 23:18:39 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Attached patch fixes multiple mounting of udev if udev init script is
started more than once.

And finally, it increments PR where appropriate.

Well, and now, after installation of udev-compat141 my spitz boots again.

    udev: Fix possible multiple mounting of /dev, increment PR.

diff --git a/recipes/udev/udev-124/init b/recipes/udev/udev-124/init
index efe4470..1009381 100644
--- a/recipes/udev/udev-124/init
+++ b/recipes/udev/udev-124/init
@@ -29,7 +29,7 @@ export ACTION=add
 echo -n "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
-LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
+LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
         mount -n -o mode=0755 -t tmpfs none "/dev"
         mkdir -m 0755 /dev/pts
         mkdir -m 0755 /dev/shm
diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
index 66705e6..efd9c23 100644
--- a/recipes/udev/udev-141/init
+++ b/recipes/udev/udev-141/init
@@ -29,7 +29,7 @@ export ACTION=add
 echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
-LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
+LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
         mount -n -o mode=0755 -t tmpfs none "/dev"
         mkdir -m 0755 /dev/pts
         mkdir -m 1777 /dev/shm
diff --git a/recipes/udev/udev-151/init b/recipes/udev/udev-151/init
index f4dc5de..fea2ca6 100644
--- a/recipes/udev/udev-151/init
+++ b/recipes/udev/udev-151/init
@@ -29,7 +29,7 @@ export ACTION=add
 echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
-LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
+LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
         mount -n -o mode=0755 -t tmpfs none "/dev"
         mkdir -m 0755 /dev/pts
         mkdir -m 1777 /dev/shm
diff --git a/recipes/udev/udev-154/init b/recipes/udev/udev-154/init
index f4dc5de..fea2ca6 100644
--- a/recipes/udev/udev-154/init
+++ b/recipes/udev/udev-154/init
@@ -29,7 +29,7 @@ export ACTION=add
 echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
-LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
+LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
         mount -n -o mode=0755 -t tmpfs none "/dev"
         mkdir -m 0755 /dev/pts
         mkdir -m 1777 /dev/shm
diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
index f4f1c40..2edc10b 100644
--- a/recipes/udev/udev.inc
+++ b/recipes/udev/udev.inc
@@ -14,7 +14,7 @@ SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://init \
 	   file://udev-compat-wrapper-patch"
 
-INC_PR = "r27"
+INC_PR = "r28"
 
 inherit update-rc.d autotools pkgconfig
 
diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
index 30b0499..d0d5420 100644
--- a/recipes/udev/udev_124.bb
+++ b/recipes/udev/udev_124.bb
@@ -5,7 +5,7 @@ RPROVIDES_${PN} = "hotplug"
 
 require udev.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LD = "${CC}"
 
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index 3ef9f7d..798590c 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -7,7 +7,7 @@ DEFAULT_PREFERENCE = "-1"
 
 require udev.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://mount.blacklist \
 	    file://run.rules \
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index ce97a7b..eb0d6a9 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r12"
+PR = "r13"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
index 6032215..3cf6358 100644
--- a/recipes/udev/udev_154.bb
+++ b/recipes/udev/udev_154.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r0"
+PR = "r1"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




