Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 1651 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 16 Feb 2019 17:31:34 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D4C5C6C0E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 17:31:34 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3Np-0005de-Nx; Sat, 16 Feb 2019 18:04:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vZcsR5uuvz4wNTjRWV/AoZ9/C0u04fRf6fZmx7pLyBw=;
	b=IkRM4XUQF9G9n72/eG6MjYGGEN
	4KL1ZZ2yIGUFa/gJkwL6UCMVy/qUcAkQ25NjNVLfqGOWW4J4CzkUIW2IAUEoLWrB+JKi9tyXzHUaY
	FWlutajMzy4b4rwcLGLHkzl8urLoZzDj/YXCxBnu7qcE2BwudEXUgeNY5omYBRZY5AJV6CSaIyEJP
	a1pEhn/hLcrkRSe3x7qLSS2DeH030ledOygVvBfW+ZNgseRwqnLlkqOTJbGdcidmQ+TxjLqlTRqC1
	iFvnqnKNJEd4HdF8mbVfGjx6QKpmo3JcZpKvlnKz/BfHHIVItsLnWdjlia46QaQ0Os9v5quMjEdi1
	dmqRxdPQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3Nm-0006ng-09; Sat, 16 Feb 2019 18:04:07 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Feb 2019 18:03:51 +0100
Message-Id: <20190216170354.10645-4-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216170354.10645-1-zboszor@pr.hu>
References: <20190216170354.10645-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Scan-Signature: 3da8dd007c9bc004c124c5756b0fc9e5
X-Spam-Tracer: backend.mail.pr.hu -1.7 20190216170407Z
Subject: [meta-initramfs][PATCH 3/6] dracut: Add execute-dracut opkg intercept script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2019 17:31:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 .../dracut/dracut/execute-dracut              | 21 +++++++++++++++++++
 .../recipes-devtools/dracut/dracut_git.bb     |  5 +++++
 2 files changed, 26 insertions(+)
 create mode 100755 meta-initramfs/recipes-devtools/dracut/dracut/execute-dracut

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/execute-dracut b/meta-initramfs/recipes-devtools/dracut/dracut/execute-dracut
new file mode 100755
index 000000000..96bcc92ed
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/execute-dracut
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+if [ ! -f $OPKG_INTERCEPT_DIR/execute-dracut ]; then
+	KERNEL_VERSION=$1
+	shift
+	MY_KERNEL_VERSION=$(readlink /boot/bzimage | sed 's,^.*bzImage-,,')
+	if [[ -z "$MY_KERNEL_VERSION" ]]; then
+		if [[ -d /lib/modules/$KERNEL_VERSION ]]; then
+			MY_KERNEL_VERSION="${KERNEL_VERSION}"
+		fi
+	fi
+	[[ -z "$MY_KERNEL_VERSION" ]] && echo COULD NOT DETERMINE KERNEL VERSION TO RUN DEPMOD AND DRACUT && echo PLEASE DO IT MANUALLY && exit 0
+	cat <<EOF > $OPKG_INTERCEPT_DIR/execute-dracut
+echo RUNNING: depmod -a $MY_KERNEL_VERSION
+depmod -a $MY_KERNEL_VERSION
+echo RUNNING: dracut -f $@ /boot/initramfs.img $MY_KERNEL_VERSION
+echo "dracut: $(dracut --help | grep 'Version:')"
+dracut -f $@ /boot/initramfs.img $MY_KERNEL_VERSION
+EOF
+	chmod +x $OPKG_INTERCEPT_DIR/execute-dracut
+fi
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 71926c3b8..c3a0383ff 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -12,6 +12,7 @@ PV = "049"
 SRCREV = "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
+           file://execute-dracut \
            "
 
 DEPENDS += "kmod"
@@ -49,11 +50,15 @@ do_install() {
     # Its Makefile uses cp -arx to install modules.d, so fix the owner
     # to root:root
     chown -R root:root ${D}/${prefix}/lib/dracut/modules.d
+
+    install -d -m0755 ${D}${datadir}/opkg/intercept
+    install -m0755 ${WORKDIR}/execute-dracut ${D}${datadir}/opkg/intercept
 }
 
 FILES_${PN} += "${prefix}/lib/kernel \
                 ${prefix}/lib/dracut \
                 ${systemd_unitdir} \
+                ${datadir}/opkg/intercept \
                "
 FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
 
-- 
2.20.1


