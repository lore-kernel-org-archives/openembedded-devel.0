Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNya4-0000tw-9q
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 03:07:33 +0100
Received: by pvd12 with SMTP id 12so1224874pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 18:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=vwOI1A6dQPowXVn+M+sx59ozxyayWLftsuPY4NyBdp8=;
	b=WNH0Ova/QXxPW/gm2Oo7FL6WdtYl0Vjn27Td8itOfeXiCF4FyeC0SgcbmM2ILckGNK
	2Qsss6+tiwCjdFnHKwsIJf54YQDHWalqq0Zi4AbehtnMp+HY9Zngb/qJUMWJht4DarJ+
	hbnqPMR/eBDYo7ck3HFnVWnlBk1ZbTZnMQFUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=TukMb4GLmOkBtFPkpXvG/RJsPjjjgRJ6/qLXPchF2ln6gsWWQAVg3Ut5m2rd7nN0zR
	ke3hSxZDwF1iHXpL197KIVyK2Xro15glHhKvr3KhlXh7JoDpfyL1fkEuih6FKNef1Xu7
	1gKOztdw+pxq/+sXv/ovrKMZObe524kd9OCP4=
Received: by 10.142.164.4 with SMTP id m4mr9780847wfe.184.1291255569081;
	Wed, 01 Dec 2010 18:06:09 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id x35sm44135wfd.1.2010.12.01.18.06.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 18:06:08 -0800 (PST)
Message-ID: <4CF6FF0A.6090505@gmail.com>
Date: Thu, 02 Dec 2010 12:36:02 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] util-linux-ng.inc, e2fsprogs.inc: Use update-alternatives for uuidd.
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
X-List-Received-Date: Thu, 02 Dec 2010 02:07:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Util-linux-ng put uuidd in ${sbindir}, e2fsprogs put it in ${base_sbindir}.
This change puts both in ${base_sbindir}.

Fixes a conflict when DISTRO=micro.

| Collected errors:
|  * check_data_file_clashes: Package util-linux-ng wants to install file /mnt/oe/tmp/rootfs/native-sdk-image/sbin/uuidd
|       But that file is already provided by package  * e2fsprogs

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/e2fsprogs/e2fsprogs.inc         |    5 ++++-
 recipes/util-linux-ng/util-linux-ng.inc |    7 ++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index 7697440..1366ce7 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz"
 
 S = "${WORKDIR}/e2fsprogs-${PV}"
 
-INC_PR = "r24"
+INC_PR = "r25"
 
 inherit autotools
 
@@ -39,6 +39,7 @@ do_install_append () {
 	rm ${D}${base_sbindir}/mkfs.ext2
 	rm ${D}${base_sbindir}/mkfs.ext3
 	rm ${D}${base_sbindir}/mkfs.ext4*
+	mv ${D}${base_sbindir}/uuidd ${D}${base_sbindir}/uuidd.${PN}
 
 	cd ${D}/${base_sbindir}
 	ln -sf ./e2fsck.${PN} fsck.ext2.${PN}
@@ -58,10 +59,12 @@ do_install_append () {
 
 pkg_postinst_e2fsprogs () {
 	update-alternatives --install ${base_bindir}/chattr chattr chattr.${PN} 100
+	update-alternatives --install ${base_sbindir}/uuidd uuidd uuidd.${PN} 10
 }
 
 pkg_prerm_e2fsprogs () {
 	update-alternatives --remove chattr chattr.${PN}
+	update-alternatives --remove uuidd uuidd.${PN}
 }
 
 
diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 7455098..fbc92e4 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -6,7 +6,7 @@ DEPENDS_virtclass-native = "zlib-native ncurses-native lzo-native gettext-native
 
 inherit autotools gettext
 
-INC_PR = "r33"
+INC_PR = "r34"
 
 # allows for a release candidate
 RC ?= ""
@@ -124,7 +124,7 @@ do_install () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty blockdev ctrlaltdel cfdisk"
-        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid vigr vipw"
+        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk fsck blkid vigr vipw uuidd"
         usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice wall setsid chrt reset cal script flock"
         usrsbinprogs_a="readprofile"
         binprogs_a="dmesg kill more umount mount login"
@@ -219,6 +219,7 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 100
 	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
 	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
+	update-alternatives --install ${base_sbindir}/uuidd uuidd uuidd.${PN} 100
 	
 	# There seems to be problem, atleast on nslu2, with these, until they are
 	# fixed the busybox ones have higher priority
@@ -232,7 +233,7 @@ pkg_prerm_${PN} () {
 	test -x ${base_sbindir}/pivot_root.${PN} && \
 	update-alternatives --remove pivot_root pivot_root.${PN}
 
-	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login cal script flock; do
+	for i in dmesg kill more halt hwclock mkswap reboot shutdown sln mkfs.minix fsck.minix hexdump setsid chrt last logger mesg renice wall vipw vigr chfn newgrp chsh login cal script flock uuidd; do
 		update-alternatives --remove $i $i.${PN}
 	done
 }
-- 
1.7.1



