Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oto4o-0002ug-T3
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 22:50:38 +0200
Received: (qmail 22130 invoked by uid 503); 9 Sep 2010 21:01:24 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 9 Sep 2010 21:01:24 -0000
Received: (qmail 960 invoked by uid 503); 9 Sep 2010 20:33:52 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 9 Sep 2010 20:33:52 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Sep 2010 22:49:53 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Sep 2010 22:49:52 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Sep 2010 22:48:27 +0200
Message-Id: <1284065307-5766-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5219671969043361097
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] util-linux-ng: fix readprofile update-alternatives vs busybox
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
X-List-Received-Date: Thu, 09 Sep 2010 20:50:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* util-linux-ng installs readprofile in /sbin, busybox installs
it in /usr/sbin which tiggers the following log when configuring
the package :
Configuring util-linux-ng-readprofile.
update-alternatives: Error: cannot register alternative readprofile to
/sbin/readprofile since it is already registered to /usr/sbin/readprofile
Collected errors:
 * pkg_run_script: postinst script returned status 1.
 * opkg_configure: util-linux-ng-readprofile.postinst returned 1.

* the fix is to have util-linux-ng install readprofile in /usr/sbin

* this patch fix http://bugs.openembedded.org/show_bug.cgi?id=5474 as
suggested by Tom Rini

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/util-linux-ng/util-linux-ng.inc |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index cbdf68d..ca0790e 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -8,7 +8,7 @@ inherit autotools gettext
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r27"
+INC_PR = "r28"
 
 # allows for a release candidate
 RC ?= ""
@@ -51,7 +51,7 @@ FILES_util-linux-ng-losetup = "${base_sbindir}/losetup.${PN}"
 FILES_util-linux-ng-mount = "${base_bindir}/mount.${PN} ${sysconfdir}/default/mountall"
 FILES_util-linux-ng-umount = "${base_bindir}/umount.${PN}"
 # Moved to ${base_sbindir} by do_install:
-FILES_util-linux-ng-readprofile = "${base_sbindir}/readprofile.${PN}"
+FILES_util-linux-ng-readprofile = "${sbindir}/readprofile.${PN}"
 FILES_util-linux-ng-fsck = "${base_sbindir}/fsck.${PN}"
 FILES_util-linux-ng-blkid = "${base_sbindir}/blkid.${PN}"
 FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
@@ -124,8 +124,9 @@ do_install () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty blockdev ctrlaltdel cfdisk"
-        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck blkid vigr vipw"
+        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid vigr vipw"
         usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt"
+        usrsbinprogs_a="readprofile"
         binprogs_a="dmesg kill more umount mount login reset"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
@@ -152,6 +153,12 @@ do_install () {
                 fi
         done
 
+        for p in $usrsbinprogs_a; do
+                if [ -f "${D}${sbindir}/$p" ]; then
+                        mv "${D}${sbindir}/$p" "${D}${sbindir}/$p.${PN}"
+                fi
+        done
+
         for p in $binprogs_a; do
                 if [ -f "${D}${base_bindir}/$p" ]; then
                         mv "${D}${base_bindir}/$p" "${D}${base_bindir}/$p.${PN}"
@@ -271,7 +278,7 @@ pkg_prerm_util-linux-ng-swaponoff () {
 }
 
 pkg_postinst_util-linux-ng-readprofile() {
-    update-alternatives --install ${base_sbindir}/readprofile readprofile readprofile.${PN} 100
+    update-alternatives --install ${sbindir}/readprofile readprofile readprofile.${PN} 100
 }
 
 pkg_prerm_util-linux-ng-readprofile () {
-- 
1.6.3.3



