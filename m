Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 51CDB7C82E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 17:32:20 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3No-0005dX-19; Sat, 16 Feb 2019 18:04:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oUYh5At1VL582zGRXqznjqIhdOF1h/uZhnBU2KedRD0=;
	b=blNrtCiHE64khR47uT1Fr1WV6N
	XeC2NK2LQ52Xg69eU+BOooNSSPfiHie7shQpwelzVLRhl0bQgPUgMQp82BiZM2awAgxWqdvCt1SKT
	4P+5jk3i6i5y2dMAhLymmty6NTE0AiI6CdRzUgCNLJaekqzhkNGMbBXXJlsWVexdBhf5bM7NVtcmB
	FmZg6csSUWxHquhV5+a+wFfxtssMz9n82ZyXVIn6uhpuT2rb5kN/dieYdUGDKhlE+ZByOFO16/YcB
	IzyOvUwL1H1uvmSmLS1Um3BVIkC9Dt3KLAo2Y4FAA030yl3bS8rs9tyywGSCmJRLQThp+qEus8QPN
	KvWNJp/Q==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3Nk-0006ng-B8; Sat, 16 Feb 2019 18:04:05 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Feb 2019 18:03:50 +0100
Message-Id: <20190216170354.10645-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216170354.10645-1-zboszor@pr.hu>
References: <20190216170354.10645-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Scan-Signature: 520b7d319569d55d657de1c7ae64b270
X-Spam-Tracer: backend.mail.pr.hu -1.7 20190216170405Z
Subject: [meta-initramfs][PATCH 2/6] dracut: Allow native build
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
X-List-Received-Date: Sat, 16 Feb 2019 17:32:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For useful modules to be successfully included into the initramfs,
the dependencies must be extended.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index dd2e8bbb3..71926c3b8 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -59,11 +59,19 @@ FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
 
 CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
 
-RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
+RDEPENDS_${PN}_class-target = " \
+                     findutils cpio util-linux-blkid util-linux-getopt util-linux-losetup util-linux-umount util-linux \
+                     bash ldd xz plymouth-initrd kbd-consolefonts kbd-consoletrans kbd-keymaps kbd-unimaps gzip tar sed \
+                     openssh-scp openssh-ssh systemd udev linux-firmware \
+                    "
+RDEPENDS_${PN}_class-native = "coreutils-native findutils-native cpio-native util-linux-native bash-native cross-compiler-ldd"
 
 # This could be optimized a bit, but let's avoid non-booting systems :)
-RRECOMMENDS_${PN} = " \
+RRECOMMENDS_${PN}_class-target = " \
                      kernel-modules \
                      busybox \
                      coreutils \
+                     intel-microcode \
                     "
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


