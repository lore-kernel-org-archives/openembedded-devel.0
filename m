Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A3D0C7C7F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 10:47:16 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gvgSD-0001NP-D6; Mon, 18 Feb 2019 11:47:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pAhA8kU5DIsHAXGdyp2ryA+NfGNCRpF470O4kYhXKlg=;
	b=NwRAfe5uMdXaZmq2R7V3gFxK/s
	khDJKePpYF3PIJGa/9X3S0NXamU127I3rgiGKp83vD7IbsqnZD5+j4nwwwyKY0o9t/JXaHYuK3nka
	CyaRsOocV5A0EazGImdYrkKcAxPC2bz70TbtpfGC2pZgo5eP8QuxAT1i1CfHIzu01HPuc5atDuEMo
	kWxbyH6M9lPiRHLuEsbppPznF1IvsgZ6s/sYqVe0Htyto8QJeWfJKJbYL3MrrZg/un/Z79y36mmrL
	89fzfgZkxRO7iXbzasCuvqo8VxjrOM6+E2MxeX7kXnRvlB1XpIgrK76uH6IVURi6ks0rufPe0auCC
	EfFJD5OQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gvgS9-0004KZ-Mf; Mon, 18 Feb 2019 11:47:15 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Feb 2019 11:47:00 +0100
Message-Id: <20190218104704.14623-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190218104704.14623-1-zboszor@pr.hu>
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 00247148ec76130c8a78f769f9282e76
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190218104715Z
Subject: [meta-initramfs][PATCH 2/6 v2] dracut: Allow native build
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
X-List-Received-Date: Mon, 18 Feb 2019 10:47:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For useful modules to be successfully included into the initramfs,
the dependencies must be extended.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: Only RDEPEND on systemd if DISTRO_FEATURES has it.

 .../recipes-devtools/dracut/dracut_git.bb           | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index dd2e8bbb3..aad3c68bf 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -59,11 +59,20 @@ FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
 
 CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
 
-RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
+RDEPENDS_${PN}_class-target = " \
+                     findutils cpio util-linux-blkid util-linux-getopt util-linux-losetup util-linux-umount util-linux \
+                     bash ldd xz plymouth-initrd kbd-consolefonts kbd-consoletrans kbd-keymaps kbd-unimaps gzip tar sed \
+                     openssh-scp openssh-ssh linux-firmware \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
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


