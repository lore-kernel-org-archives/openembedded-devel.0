Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7461B6C0E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 17:32:17 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3Nr-0005dr-EA; Sat, 16 Feb 2019 18:04:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9ecyAACIovJRZk5b1Yr2Kx1KM/JD/p8nO4UTtjl2Rb4=;
	b=lLOqyM5XJQzsKUsX10z3nOI0wA
	5fWx7Iv34+iln4XSn6ggro/BUJuM3yFTBwrQt2xSHQnVs/uwqLw+3fXY09k9Or0x2TKtAQRDBcQ9S
	g/CF7ip7d1lJkcVNhLOC69OscJ5hRTLRdkBB+2fFssDniIZAbZHmnYxsG32ZVqo930a22PBITHVMJ
	qL56sk1mgFq2LZgI2HChc9ZLukgV4P42ymkAJHwFm4mV6Qov9gE+LqxUaxXCrPtqf+/ccofpe29xd
	Dum8CJtJ55+yTXqzlBzNkC2bFiVp+VnnJjzakCblddwSWLXwIxNMKdBlUs81L3piBLLghkVftdZAN
	Tm24jCvw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gv3Nn-0006ng-Mx; Sat, 16 Feb 2019 18:04:09 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Feb 2019 18:03:52 +0100
Message-Id: <20190216170354.10645-5-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216170354.10645-1-zboszor@pr.hu>
References: <20190216170354.10645-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Scan-Signature: f0c4dd17e446f11bd1554530b2f50cce
X-Spam-Tracer: backend.mail.pr.hu -1.7 20190216170409Z
Subject: [meta-initramfs][PATCH 4/6] meta-initramfs: Add postinst-intercepts/execute_dracut script
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
X-List-Received-Date: Sat, 16 Feb 2019 17:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

So dracut can be triggered to run during do_rootfs.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 .../postinst-intercepts/execute_dracut          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 meta-initramfs/postinst-intercepts/execute_dracut

diff --git a/meta-initramfs/postinst-intercepts/execute_dracut b/meta-initramfs/postinst-intercepts/execute_dracut
new file mode 100755
index 000000000..78d81a902
--- /dev/null
+++ b/meta-initramfs/postinst-intercepts/execute_dracut
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+set -e
+
+export \
+	prefix dracutsysrootdir \
+	systemdutildir systemdsystemunitdir systemdsystemconfdir udevdir \
+	DRACUT_ARCH DRACUT_TESTBIN DRACUT_LDD DRACUT_LDCONFIG \
+	DRACUT_COMPRESS_LZMA DRACUT_INSTALL DRACUT_INSTALL_PATH
+
+[[ -d $DRACUT_TMPDIR ]] || mkdir -p $DRACUT_TMPDIR
+
+echo RUNNING: depmod $DEPMODOPT -a $MY_KERNEL_VERSION
+depmod $DEPMODOPT -a $MY_KERNEL_VERSION
+echo "dracut: $(dracut --help | grep 'Version:')"
+echo RUNNING: dracut -f --tmpdir $DRACUT_TMPDIR $DRACUT_OPTS $DEBUGOPTS $EXTRAOPTS $D/boot/initramfs.img $MY_KERNEL_VERSION
+dracut -f --tmpdir $DRACUT_TMPDIR $DRACUT_OPTS $DEBUGOPTS $EXTRAOPTS $D/boot/initramfs.img $MY_KERNEL_VERSION
-- 
2.20.1


