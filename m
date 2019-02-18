Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3CE7C876
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 10:47:23 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gvgSK-0001OK-Dn; Mon, 18 Feb 2019 11:47:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Aa5ghh4UXMoih0SVq0/AvyfVj0zzlzCFM8U9DJcfdiE=;
	b=LcwBEZnSspp0VU7FRZ5t1HYJ3s
	rnDWODTi9o6eFhgnm5A7bOw29yeoQTbT4ii+Xg+1w1Bg1iLhcsS8aPHofB8o0IRFmHkkIX4mpA/6L
	167VrXx5mIeYyy0elSK2XT2P5+rrlZRnZ7G6/5t1TghvlefTXgIC9sNFoZNOdQPk01cqvCgp9CxcO
	hjNRK8x7o/ln38KVzW0kuuzdJdqEf5XJKpzo9KNsZ3YWb4J9S1hjN+X8GOmeRRDn53IGFvtF/Mook
	U6IG07sRnMwF4lQ4S3Md7Ihs+y4K4DjTyl5k5tALd1MJOo6/cRFP1jwV8Vv2oX081Z6zerQv6C76H
	3AIZMWiw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gvgSG-0004KZ-IJ; Mon, 18 Feb 2019 11:47:22 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Feb 2019 11:47:04 +0100
Message-Id: <20190218104704.14623-7-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190218104704.14623-1-zboszor@pr.hu>
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 7d97fb862ade3e1c8ed9e3ffb5917c48
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190218104722Z
Subject: [meta-initramfs][PATCH 6/6] dracut: use the code that allows running under do_rootfs
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
X-List-Received-Date: Mon, 18 Feb 2019 10:47:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index dd94ac598..a148dc83f 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -6,11 +6,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
-PV = "049"
+PV = "050"
+PR = "r0.alpha.rootfs"
 
-# v048 tag
-SRCREV = "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
-SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http \
+# v049 tag plus run from a rootfs
+SRCBRANCH = "allow-separate-rootfs"
+SRCREV = "6fe40f64f923e61e17c9d3db06cf9bfe6e83a68a"
+SRC_URI = "git://github.com/zboszor/dracut.git;protocol=https;branch=${SRCBRANCH} \
            file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
            file://execute_dracut \
            "
-- 
2.20.1


