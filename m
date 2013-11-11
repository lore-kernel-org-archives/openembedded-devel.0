Return-Path: <linus.walleij@linaro.org>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 49B206D12A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:03:05 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id ez12so2127341wid.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 05:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P5LybRzaCi6Np8vGWV67RIwtc/bG+KVwQZ6zyjCpdx0=;
	b=NCrMEZhyj9U7Dylgu+jCHMC52rCSHF5K3y4oWFsTphFPK3m1PZ7dP9fpFy9QIDhaYC
	W8/K+pCSYYFzb43XLnceNpObDG24WgMKdpnOHuOQa21akK1KYjE02c2F6y2cUSMJlzNT
	KuRtkJZgWde3inkalj8blhtlCOBIcp/IUUIaU9HI7dshrg1juTqh9DCaSnAIj3d7JZh4
	3tbzEG3bLpSUdJqs3df6D4/r5wnrUVe+w9QC/7FeQAtQmrSNR81hy25ueffxGQOf9JdF
	sfD5PTP3YLKNpgiMpMwpYf//rvvCDE25ZVPlFAaGzIPGivPNzaBTRYSP8bgqcuIZZ1lq
	146g==
X-Gm-Message-State: ALoCoQny5PfF0kWWcE4nVe4NHZpvSNTacfTXVC9eu0Hm9XSRugPhO8TUk5flzqvzxJX774qiV9Zr
X-Received: by 10.180.24.6 with SMTP id q6mr1488180wif.0.1384174986535;
	Mon, 11 Nov 2013 05:03:06 -0800 (PST)
Received: from localhost.localdomain ([85.235.11.236])
	by mx.google.com with ESMTPSA id y11sm34012240wie.7.2013.11.11.05.03.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 05:03:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2013 14:03:03 +0100
Message-Id: <1384174983-5077-1-git-send-email-linus.walleij@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-handheld] [PATCH 3/3] h3600: build .tar.gz images too
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2013 13:03:05 -0000

This enables us to output a tar.gz image during the h3600
build process.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 conf/machine/h3600.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index 6e9941bec1a5..7670c9c0e170 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -24,7 +24,7 @@ INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 
 IMAGE_DEVICE_TABLES = ""
 
-IMAGE_FSTYPES = "jffs2"
+IMAGE_FSTYPES += "tar.gz jffs2"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "kernel ipaq-boot-params"
 MACHINE_EXTRA_RDEPENDS = "mtd-utils mtd-utils-jffs2"
 
-- 
1.8.3.1


