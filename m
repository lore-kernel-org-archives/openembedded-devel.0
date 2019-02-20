Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3167C64B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:37:50 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJdn-0006YF-BD; Wed, 20 Feb 2019 05:37:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Td1DvOBqZSaMFXmZta3SUYHpmK3PetEspHb/0XiJ3uU=;
	b=LvSkYWYgN/jrzgd903WWTW5D6k
	qwJ9+CaLBfoJnRXlWW+wuwz5jdg6Ia+QG/wfqWmvDm4WjWNqw28o8rHpLm8LPiWhRlYYQ3SdfwOEs
	XEuTWsoCbmITXhhznOqBmwdhiHxNm7FPKsAiUypd6F9H4YAqKCGcWL3gif7GcFM3WatL16YyLLPuB
	ec1wYvRmHxnHIm7CkI/vP/WK6crt4Hjcj4QZjHS9hgPJnMj3Uq01CKfK5tNDYWPsYbR2sXaRhgSQO
	sa4216cur+nJgOOxijF4Ten2D3RfQsYHWLhQs9xI+dbuNC77aGdPv+cIcg90Gp9hGaqu5pcyDv3rL
	/t4NxSRg==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJdj-0003gE-Hg; Wed, 20 Feb 2019 05:37:49 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 05:37:39 +0100
Message-Id: <20190220043740.27952-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220043740.27952-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 590f427944e86919b339bef1bc8dcd47
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190220043749Z
Subject: [meta-initramfs][PATCH 2/3] dracut: Use "plymouth_initrd" DISTRO_FEATURE for dependency on plymouth-initrd
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
X-List-Received-Date: Wed, 20 Feb 2019 04:37:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index a148dc83f..4efdf39f6 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -68,8 +68,9 @@ CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
 
 RDEPENDS_${PN}_class-target = " \
                      findutils cpio util-linux-blkid util-linux-getopt util-linux-losetup util-linux-umount util-linux \
-                     bash ldd xz plymouth-initrd kbd-consolefonts kbd-consoletrans kbd-keymaps kbd-unimaps gzip tar sed \
+                     bash ldd xz kbd-consolefonts kbd-consoletrans kbd-keymaps kbd-unimaps gzip tar sed \
                      openssh-scp openssh-ssh linux-firmware \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd', 'plymouth-initrd', '', d)} \
                      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                     "
 RDEPENDS_${PN}_class-native = "coreutils-native findutils-native cpio-native util-linux-native bash-native cross-compiler-ldd"
-- 
2.20.1


