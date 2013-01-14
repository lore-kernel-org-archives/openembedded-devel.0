Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1TusTX-0005u6-Fw
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 23:26:46 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so2420061pbc.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 14:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=w4qe6SzCDme8VJfZy6U4UN8/HWiug6LobxisIreClRU=;
	b=xZ/SPNKWzGk2f83BbHeqT1j+mfm8wg85wRKnC9OyzlGs/Gt/UPC/vk17x6oO1ndZ0y
	Z0TbxIAVYT2UHBU+EnNYR6sDavzFxKDhP5BEY7beVfO0k9ln7zEa+ElKeo8BZcfhJrdv
	eV/TL1n9G6Gvgq04OhOC+U0+i+SIRGZMLaP7kQmutshuACmZkE94UiRxUXwwr8iBjnXu
	2t48zOrB9d5StKCPktI3LMV3iFOHmqVSbiJObs2OeVhZDMwrFHljohw+CV1Q0ljrWkUe
	Zy7FanvECRy91kqokqblpv9hd1BTA5ftMQo4pbqkZ159cpC3cOfSId2z7KnlVBvvn9Nj
	H+xw==
X-Received: by 10.68.217.104 with SMTP id ox8mr1286305pbc.105.1358201430911;
	Mon, 14 Jan 2013 14:10:30 -0800 (PST)
Received: from widex200.islocal (ZC025230.ppp.dion.ne.jp. [221.119.25.230])
	by mx.google.com with ESMTPS id s5sm9441049pay.31.2013.01.14.14.10.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 14:10:28 -0800 (PST)
Sender: Takeshi Hamasaki <takeshi.ken.hamasaki@gmail.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jan 2013 07:10:03 +0900
Message-Id: <1358201403-22227-2-git-send-email-hmatrjp@users.sourceforge.jp>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-initramfs][PATCH] symbolic link to resource.h is also necessary to build with linux kernel 3.2.
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
X-List-Received-Date: Mon, 14 Jan 2013 22:26:53 -0000

---
 meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
index ae43753..8e096d9 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
@@ -1,4 +1,4 @@
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 export INST = "${D}"
 
@@ -11,6 +11,7 @@ do_compile_prepend() {
         ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/errno.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/errno.h
         ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/ioctl.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/ioctl.h
         ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/poll.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/poll.h
+        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/resource.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/resource.h
     fi
 
 }
-- 
1.7.10.4



