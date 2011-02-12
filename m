Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PoDPw-00043p-7W
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 12:13:32 +0100
Received: by bwz10 with SMTP id 10so3801735bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 03:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=YbtXAhvjoL2LWDTDdwADKISE+cWV56PtCvNj/Y0927E=;
	b=TwkiDz/oMeih/KK2Sc68hGSdttzv0aYT5/QkaQZNOCtb9e0ln2ZGq2JGhpiijpuIch
	Ch7lTe9hKFUvZcZjc/JQeS4uuDSs4raeHPYVfAS6MPRd2LQ6cTKVCsQe4KzlezOVKjHU
	7svBc5iLjs+k510mbj7n4ukqBwZ7pjHH9iB+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=M/UAzHZ8hIDRg6AZ1Lavklapbeu6g8wwCjScOcdwFzAry6xG0pXhQpPhSaw95b30CD
	2yTXS68+pMU5GgOppeC/6Km6Ccr7UJiOL9ogMh4JjXfSEtcBAQGTzYBBa6+ugt5O8IkH
	Qmbbrh3mu1urtbdbafpfm6pCc6M9E+wIL50kg=
Received: by 10.204.81.72 with SMTP id w8mr11816271bkk.205.1297509141613;
	Sat, 12 Feb 2011 03:12:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm225837bkb.22.2011.02.12.03.12.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Feb 2011 03:12:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Feb 2011 12:12:13 +0100
Message-Id: <1297509134-31435-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4
Subject: [PATCH 1/2] util-linux-ng: use u-a for /sbin/blockdev
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
X-List-Received-Date: Sat, 12 Feb 2011 11:13:32 -0000

* resolves conflict with latest busybox

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/util-linux-ng/util-linux-ng.inc |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 579c8dc..51f25b2 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -6,7 +6,7 @@ DEPENDS_virtclass-native = "zlib-native lzo-native gettext-native"
 
 inherit autotools gettext
 
-INC_PR = "r35"
+INC_PR = "r36"
 
 # allows for a release candidate
 RC ?= ""
@@ -126,8 +126,8 @@ do_install () {
 		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
 	mkdir -p ${D}${base_bindir}
 
-        sbinprogs="agetty blockdev ctrlaltdel cfdisk"
-        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid vigr vipw uuidd"
+        sbinprogs="agetty ctrlaltdel cfdisk"
+        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid blockdev vigr vipw uuidd"
         usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt reset cal script flock"
         usrsbinprogs_a="readprofile"
         binprogs_a="dmesg kill more umount mount login"
@@ -220,6 +220,7 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_bindir}/login login login.${PN} 100
 	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 100
 	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 100
+	update-alternatives --install ${base_sbindir}/blockdev blockdev blockdev.${PN} 100
 	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
 	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
 	update-alternatives --install ${base_sbindir}/uuidd uuidd uuidd.${PN} 100
@@ -236,7 +237,7 @@ pkg_prerm_${PN} () {
 	test -x ${base_sbindir}/pivot_root.${PN} && \
 	update-alternatives --remove pivot_root pivot_root.${PN}
 
-	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login cal script flock uuidd; do
+	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr blockdev chfn newgrp chsh login cal script flock uuidd; do
 		update-alternatives --remove $i $i.${PN}
 	done
 }
-- 
1.7.4



