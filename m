Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Ov739-0004wR-Mh
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 13:18:19 +0200
Received: (qmail 9631 invoked by uid 503); 13 Sep 2010 11:29:35 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 13 Sep 2010 11:29:35 -0000
Received: (qmail 29473 invoked by uid 503); 13 Sep 2010 11:01:07 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 13 Sep 2010 11:01:07 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Sep 2010 13:17:30 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Sep 2010 13:17:29 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 13:17:24 +0200
Message-Id: <1284376645-11610-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <4C8E07CD.2000809@eukrea.com>
References: <4C8E07CD.2000809@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 597008427652918601
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
Subject: [PATCH] util-linux-ng: reset rdepends on ncurses-tools
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
X-List-Received-Date: Mon, 13 Sep 2010 11:18:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* reset is a script which is using tput provided by ncurses-tools
  (which also provides reset) so util-linux-ng's reset command fails
  if ncurses-tools is not installed on the target
* this patch creates a utils-linux-ng-reset package with
  RDEPENDS="ncurses-tools"

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/util-linux-ng/util-linux-ng.inc |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index a829b08..b5dd25b 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -8,7 +8,7 @@ inherit autotools gettext
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r29"
+INC_PR = "r30"
 
 # allows for a release candidate
 RC ?= ""
@@ -19,7 +19,7 @@ SRC_URI_append_chinook-compat = " file://chinook_libtool.patch "
 
 PACKAGES =+ "${PN}-fdisk ${PN}-cfdisk ${PN}-sfdisk ${PN}-swaponoff \
 	     ${PN}-losetup ${PN}-umount ${PN}-mount ${PN}-readprofile \
-	     ${PN}-fsck ${PN}-blkid ${PN}-mountall"
+	     ${PN}-fsck ${PN}-blkid ${PN}-mountall ${PN}-reset"
 
 PACKAGES_virtclass-native = ""	     
 
@@ -55,12 +55,14 @@ FILES_util-linux-ng-readprofile = "${sbindir}/readprofile.${PN}"
 FILES_util-linux-ng-fsck = "${base_sbindir}/fsck.${PN}"
 FILES_util-linux-ng-blkid = "${base_sbindir}/blkid.${PN}"
 FILES_${PN}-mountall = "${sysconfdir}/default/mountall.${PN}"
+FILES_${PN}-reset = "${bindir}/reset.${PN}"
 
 RREPLACES_util-linux-ng-blkid = "e2fsprogs-blkid"
 RREPLACES_${PN}-mountall = "busybox-mountall"
 
 RRECOMMENDS_${PN} = "${PN}-fdisk ${PN}-cfdisk ${PN}-sfdisk ${PN}-mount ${PN}-readprofile"
 RDEPENDS_${PN} = "${PN}-mountall ${PN}-umount ${PN}-swaponoff ${PN}-losetup ${PN}-fsck ${PN}-blkid"
+RDEPENDS_${PN}-reset = "ncurses-tools"
 
 RRECOMMENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN}_virtclass-native = ""
@@ -214,7 +216,6 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_bindir}/login login login.${PN} 100
 	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 100
 	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 100
-	update-alternatives --install ${bindir}/reset reset reset.${PN} 100
 	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
 	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
 	
@@ -230,11 +231,19 @@ pkg_prerm_${PN} () {
 	test -x ${base_sbindir}/pivot_root.${PN} && \
 	update-alternatives --remove pivot_root pivot_root.${PN}
 
-	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login reset; do
+	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login; do
 		update-alternatives --remove $i $i.${PN}
 	done
 }
 
+pkg_postinst_util-linux-ng-reset() {
+	update-alternatives --install ${bindir}/reset reset reset.${PN} 100
+}
+
+pkg_prerm_util-linux-ng-reset () {
+	update-alternatives --remove reset reset.${PN}
+}
+
 pkg_postinst_util-linux-ng-fdisk () {
 	update-alternatives --install ${base_sbindir}/fdisk fdisk fdisk.${PN} 100
 }
-- 
1.6.3.3



