Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAoJO-0006BN-70
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 21:08:42 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so2162877wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=BlTRXZPfqtUYBCDT73JfvBekvLFhQpPRNcMPMNxOe2c=;
	b=EE9KgYo06paayFR6lt7wAtYoyehbDsnbOtS/sLlocHpS4MxsX+otZP5j9R5AZntSIu
	zxHjGutyLi6QSdr3y5q5fwJgoSzW9aSW2BKK/XfTyGnDWkPhaXSj8GItC32QoGjnzkfg
	+wQvrMZ6QA0Fd30Nfl0Z2Ib2p2tX07GKbNqtDL2cq3qIBJrbWc6wAC9OsSkiZ1w+e8X2
	tM+P/3B5eFoe594o6VNyYIgXeEi9QQ07rUKc4k+rZKACL7ejStI7FXwv5/DdqSUsgzUv
	jKnX6DsTDHe/FCVMA0+P9Z45myW8pkFvVMEFzJBJkvSmZirV3AtI/mLXQfzJV0lz3oMh
	ivxA==
Received: by 10.216.134.205 with SMTP id s55mr5302177wei.100.1332446389216;
	Thu, 22 Mar 2012 12:59:49 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id l5sm7657734wia.11.2012.03.22.12.59.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:59:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:59:38 +0100
Message-Id: <1332446382-24958-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332446382-24958-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 4/8] systemd_git: replace ${base_libdir}/systemd by ${systemd_unitdir} set in oe-core
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
X-List-Received-Date: Thu, 22 Mar 2012 20:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index a320299..e3aec31 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -56,10 +56,10 @@ do_configure_prepend() {
 do_install() {
 	autotools_do_install
 	# provided by a seperate recipe
-	rm ${D}${base_libdir}/systemd/system/serial-getty* -f
+	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
 	# provide support for initramfs
-	ln -s ${base_libdir}/systemd/systemd ${D}/init
+	ln -s ${systemd_unitdir}/systemd ${D}/init
 
 	# create dir for journal
 	install -d ${D}${localstatedir}/log/journal
@@ -84,9 +84,9 @@ RDEPENDS_${PN}-initramfs = "${PN}"
 
 FILES_${PN}-gui = "${bindir}/systemadm"
 
-FILES_${PN}-vconsole-setup = "${base_libdir}/systemd/systemd-vconsole-setup \
-                              ${base_libdir}/systemd/system/systemd-vconsole-setup.service \
-                              ${base_libdir}/systemd/system/sysinit.target.wants/systemd-vconsole-setup.service"
+FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
+                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
 
 RRECOMMENDS_$PN}-vconsole-setup = "kbd kbd-consolefonts"
 
@@ -96,8 +96,8 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/polkit-1 \
                 ${datadir}/${PN} \
                 ${sysconfdir} \
-                ${base_libdir}/systemd/* \
-                ${base_libdir}/systemd/system/* \
+                ${systemd_unitdir}/* \
+                ${systemd_unitdir}/system/* \
                 ${base_libdir}/udev/rules.d \
                 ${base_libdir}/security/*.so \
                 /cgroup \
@@ -111,7 +111,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${libexecdir} \
                "
 
-FILES_${PN}-dbg += "${base_libdir}/systemd/.debug ${base_libdir}/systemd/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/"
 
 RDEPENDS_${PN} += "dbus-systemd udev-systemd"
@@ -135,7 +135,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
 # u-a for runlevel and telinit
 
 pkg_postinst_systemd () {
-update-alternatives --install ${base_sbindir}/init init ${base_libdir}/systemd/systemd 300
+update-alternatives --install ${base_sbindir}/init init ${systemd_unitdir}/systemd 300
 update-alternatives --install ${base_sbindir}/halt halt ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/reboot reboot ${base_bindir}/systemctl 300
 update-alternatives --install ${base_sbindir}/shutdown shutdown ${base_bindir}/systemctl 300
@@ -143,7 +143,7 @@ update-alternatives --install ${base_sbindir}/poweroff poweroff ${base_bindir}/s
 }
 
 pkg_prerm_systemd () {
-update-alternatives --remove init ${base_libdir}/systemd/systemd
+update-alternatives --remove init ${systemd_unitdir}/systemd
 update-alternatives --remove halt ${base_bindir}/systemctl
 update-alternatives --remove reboot ${base_bindir}/systemctl
 update-alternatives --remove shutdown ${base_bindir}/systemctl
-- 
1.7.6.5



