Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JTQXa-0006rU-RF
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2008 00:45:56 +0100
Received: by wx-out-0506.google.com with SMTP id h27so1296167wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2008 15:45:29 -0800 (PST)
Received: by 10.65.150.18 with SMTP id c18mr4913988qbo.74.1203896728146;
	Sun, 24 Feb 2008 15:45:28 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id h6sm919035nfh.30.2008.02.24.15.45.26
	(version=SSLv3 cipher=OTHER); Sun, 24 Feb 2008 15:45:27 -0800 (PST)
Date: Mon, 25 Feb 2008 01:48:25 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>,
	angstrom-distro-devel@linuxtogo.org <angstrom-distro-devel@linuxtogo.org>
Message-ID: <20080225014825.36e60782@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.82.239
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] initramfs support for linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2008 23:45:57 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

Failing to add generic and fully automated kernel-with-initramfs build,
I have patch to add external initramfs to kernel for linux-hh. I'd
still like to establish conventions for other kernel recipes to follow,
so here're the patch for suggestion. The idea is simple:

1. KERNEL_INITRAMFS_PATH is set to the full path of cpio.gz image to
use as initramfs. Empty value (default) means don't use initramfs. If
file doesn't exist, build fails with an error message (content is left
to specific recipe - there unfortunately doesn't seem to be a way to
sensibly provide detailed one in generic case).

2. KERNEL_INITRAMFS_PATH is considered a distro realm, like for example
kernel PREFERRED_VERSION. Below, angstrom distro config sets it.


--- conf/distro/angstrom-2007.1.conf	bb906c2c783007b1d23eedbf01ff13a271da4595
+++ conf/distro/angstrom-2007.1.conf	a8220fb1f7f5fa4674d43722b241d7aec2dd790a
@@ -60,6 +60,7 @@ PREFERRED_VERSION_linux-handhelds-2.6   
 
 #Preferred version for the kernel on various machines
 PREFERRED_VERSION_linux-handhelds-2.6               ?= "2.6.21-hh20"
+KERNEL_INITRAMFS_PATH = "${TMPDIR}/deploy/uclibc/images/${MACHINE}/initramfs-bootmenu-image-${MACHINE}.cpio.gz"
 PREFERRED_VERSION_linux-ixp4xx                      ?= "2.6.21.6+svnr${SRCREV}"
 RDEPENDS_kernel-base_hx4700 = ""
 RDEPENDS_kernel-base_htcuniversal = ""
============================================================
--- packages/linux/linux-handhelds-2.6.inc	a212a1e08710b140bd482d9538939be6fed39bab
+++ packages/linux/linux-handhelds-2.6.inc	b761bc283eb28d9f018764f3ca504f8e1ea6972d
@@ -54,6 +54,16 @@ do_configure() {
 
 }
 
+do_compile_prepend() {
+	if [ -n "${KERNEL_INITRAMFS_PATH}" -a "${ANGSTROM_MODE}" == "glibc" ]; then
+	    if [ ! -f ${KERNEL_INITRAMFS_PATH} ]; then
+		echo "${KERNEL_INITRAMFS_PATH} does not exist, you may need to bitbake it separately"
+		exit 1
+	    fi
+	    cp ${KERNEL_INITRAMFS_PATH} usr/initramfs_data.cpio.gz
+	fi
+}
+
 do_deploy() {
 	install -d ${DEPLOY_DIR_IMAGE}
 	install -m 0644 arch/${ARCH}/boot/${KERNEL_IMAGETYPE} ${DEPLOY_DIR_IMAGE}/${KERNEL_FILENAME}



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


