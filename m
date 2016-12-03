Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7524671C34
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:32 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so9590321pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f1w/BMlcRyeyrA/+DGVlBBJg5g5oQmFr/hii7Jek4yM=;
	b=ACGoB7HMeELmOAcB7rJLiqpnmnFLJn0PzitPzRGVH5dupCB0youX0/QMCf4XSZXBAR
	zpW56NUsZWd6dc9+gyOF/aCwzq26Oaxosrrd8T57u8R8Bbk9FMRC5x+5xG1McZScaolc
	PRdp01GUqFGbwFpgrUmarhEEhbesPhs1sLJ9axOWAcAKThiXJMGu40qJTAV2oS5QuS+3
	I12QOR9i2YuHPtalA/64m79yB/jxqX+F2lg9Qckexlra+F99CGp/HDgEWNqM9TE2CMBu
	PRZUbl8ovEa/SIP0svvRVikARMTV+egUi2PKeFdlWozJ1gx65excBxZFg7PSmS/Tx8y9
	KmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f1w/BMlcRyeyrA/+DGVlBBJg5g5oQmFr/hii7Jek4yM=;
	b=efZw0CMTLpzHf01mjlMoXSOHDuG81kMGkxdZgQPS5QIiAuI7MWrYGxB/PjviB/OFiL
	9Zb/hAgc0fwPN4ULF/+tzD2xEXy0+v/9P9WV5MkUT2BHdeA2yieqBizS3YWy+2Sm3Rti
	Ucn0DcrzMFtEl/sOVW+Gub5psPNwj4MUUzjS5exv39mkePe1RFBejWV+mWGhtwjTVZQ7
	54FGhRGmLpkecAdwkWzzXKXjMgGeXg8O9SOrVFU7nqOCYosdojFs9Talb04+axuupFOH
	nZRFMlY+FVqvo01jc7gLtkj2XkWUfwiNO8qUX1S4hZ8Rg/IzZtZeE0eOGKtQk5MZemDR
	otfw==
X-Gm-Message-State: AKaTC01RazUNTBGUwJSjDLvCQwzVA6NqfNigK8pWAaC5/3r1ODA4ydZ0996AJ5q9WhKkzQ==
X-Received: by 10.99.251.5 with SMTP id o5mr84716377pgh.152.1480734273844;
	Fri, 02 Dec 2016 19:04:33 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:22 -0800
Message-Id: <20161203030422.17285-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203030422.17285-1-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] loop-aes: Add recipe
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
X-List-Received-Date: Sat, 03 Dec 2016 03:04:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb

diff --git a/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb b/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb
new file mode 100644
index 0000000..fa60c7b
--- /dev/null
+++ b/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Loop-aes - replacement for loop driver that can do aes encryption"
+DESCRIPTION = "Fast and transparent file system and swap encryption package for \
+               linux. No source code changes to linux kernel. Works with 3.x,\
+               2.6, 2.4, 2.2 and 2.0 kernels."
+HOMEPAGE = "http://sourceforge.net/projects/loop-aes/"
+LICENSE = "GPL-2.0"
+
+LIC_FILES_CHKSUM = "file://aes-GPL.diff;md5=bf349af3486306c2e4d85de5b6fa3bb4"
+
+SRC_URI = "http://loop-aes.sourceforge.net/loop-AES/loop-AES-${PV}.tar.bz2"
+SRC_URI[md5sum] = "335238a7cfd45f157935c59156533a05"
+SRC_URI[sha256sum] = "67ede839d4cac657359c39b05eac46f6991054768a7e1096bef5b92edb3b8aba"
+
+inherit module
+
+S = "${WORKDIR}/loop-AES-${PV}"
+
+EXTRA_OEMAKE += "LINUX_SOURCE=${STAGING_KERNEL_DIR} INSTALL_MOD_PATH=${D} MODINST=n"
+
+do_install () {
+     install -D -m 0655 loop.ko ${D}${base_libdir}/modules/${KERNEL_VERSION}/misc/loop.ko
+}
-- 
2.10.2


