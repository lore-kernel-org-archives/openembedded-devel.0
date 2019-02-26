Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2877CC87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:55:15 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSG-0000Wu-De; Tue, 26 Feb 2019 10:55:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bRDTi4eiWRX7m8knC8gSMRHx4Z87FvjAbo1AkoOHYBA=;
	b=mdah+SLE+iil5KQc02f65D3fcU
	3XRxORJg8LLLZu3ium/4kI+2/Rtm09/qylf/loVcwU+tYWZFL7AwYcWvr49CWDXYtRKo9qGyNw9uL
	f3/0C7k8MCZwu4KxYkXYF85qUm59WtKwG6DwFUhtlaZwIMvlUv6xrU339KlMt8RCs9MGkUk73U5u5
	e1SMa/bvI2vbUwxExZNIgAkK8MbCNL7VQun9olmuUWnBMNLGMinJZgn2ktciag6o9n6G2jfCVp6Cr
	Jtl7ulIBPMkSQNzZwXlkVs8KOpxNlLu6GMc1S8+1emb7KAE/rE72X9nB1iw/2m/hFrKQKBlOvUMZg
	FB0fb0sw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSC-0005Cn-DS; Tue, 26 Feb 2019 10:55:14 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:54:57 +0100
Message-Id: <20190226095502.5499-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190226095502.5499-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190226095502.5499-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: e60d8c77b9093fb5a9e5e1cf29f3793d
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190226095514Z
Subject: [meta-initramfs][PATCH 2/7 v3] dracut: Allow native build
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
X-List-Received-Date: Tue, 26 Feb 2019 09:55:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For useful modules to be successfully included into the initramfs,
the dependencies must be extended.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: Only RDEPEND on systemd if DISTRO_FEATURES has it.

v3: Use plymouth_initrd DISTRO_FEATURE to depend on plymouth-initrd.

 .../recipes-devtools/dracut/dracut_git.bb        | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index dd2e8bbb3..a1d7cb119 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -59,11 +59,23 @@ FILES_${PN}-dbg += "${prefix}/lib/dracut/.debug"
 
 CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
 
-RDEPENDS_${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
+RDEPENDS_${PN}_class-target = " \
+                     findutils cpio util-linux-blkid util-linux-getopt util-linux-losetup util-linux-umount util-linux \
+                     bash ldd xz kbd-consolefonts kbd-consoletrans kbd-keymaps kbd-unimaps gzip tar sed \
+                     openssh-scp openssh-ssh linux-firmware \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd', 'plymouth-initrd', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+                    "
+RDEPENDS_${PN}_class-native = "coreutils-native findutils-native cpio-native util-linux-native bash-native cross-compiler-ldd"
 
 # This could be optimized a bit, but let's avoid non-booting systems :)
-RRECOMMENDS_${PN} = " \
+RRECOMMENDS_${PN}_class-target = " \
                      kernel-modules \
                      busybox \
                      coreutils \
                     "
+
+RRECOMMENDS_${PN}_append_x86_class-target = " intel-microcode "
+RRECOMMENDS_${PN}_append_x86-64_class-target = " intel-microcode "
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


