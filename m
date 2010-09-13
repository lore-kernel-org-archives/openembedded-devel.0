Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Ov739-0004wQ-LU
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 13:18:16 +0200
Received: (qmail 9628 invoked by uid 503); 13 Sep 2010 11:29:35 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 13 Sep 2010 11:29:35 -0000
Received: (qmail 29469 invoked by uid 503); 13 Sep 2010 11:01:07 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 13 Sep 2010 11:01:07 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Sep 2010 13:17:30 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Sep 2010 13:17:29 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 13:17:25 +0200
Message-Id: <1284376645-11610-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1284376645-11610-1-git-send-email-eric@eukrea.com>
References: <4C8E07CD.2000809@eukrea.com>
	<1284376645-11610-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 597008427652918602
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
Subject: [PATCH] util-linux-ng: remove reset
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
X-List-Received-Date: Mon, 13 Sep 2010 11:18:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* reset is a script using tput so it rdepends on ncurses-tools
  which also provided reset
* prefer using the original and remove util-linux-ng's reset

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/util-linux-ng/util-linux-ng.inc |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index a829b08..b9dbd7c 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -8,7 +8,7 @@ inherit autotools gettext
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r29"
+INC_PR = "r30"
 
 # allows for a release candidate
 RC ?= ""
@@ -69,7 +69,7 @@ EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown \
 --enable-kill --enable-last --enable-mesg --enable-raw --enable-login-utils \
 --enable-arch --enable-init --enable-partx --enable-schedutils \
 --with-fsprobe=builtin --enable-libuuid --enable-libblkid \
---enable-fsck --enable-reset"
+--enable-fsck"
 
 LDFLAGS_append_libc-uclibc = "${@['',' -lintl'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
 LDFLAGS_virtclass-native = "${BUILD_LDFLAGS}"
@@ -125,7 +125,7 @@ do_install () {
 
         sbinprogs="agetty blockdev ctrlaltdel cfdisk"
         sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid vigr vipw"
-        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt reset"
+        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt"
         usrsbinprogs_a="readprofile"
         binprogs_a="dmesg kill more umount mount login"
 
@@ -214,7 +214,6 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_bindir}/login login login.${PN} 100
 	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 100
 	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 100
-	update-alternatives --install ${bindir}/reset reset reset.${PN} 100
 	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
 	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
 	
@@ -230,7 +229,7 @@ pkg_prerm_${PN} () {
 	test -x ${base_sbindir}/pivot_root.${PN} && \
 	update-alternatives --remove pivot_root pivot_root.${PN}
 
-	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login reset; do
+	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login; do
 		update-alternatives --remove $i $i.${PN}
 	done
 }
-- 
1.6.3.3



