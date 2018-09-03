Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5286C7914C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 00:36:01 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id l5so10159555edw.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Sep 2018 17:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=e0MQrqUjIzT3HVUvWlv2qmbuYyntVGYQ5b1E9/hOHqU=;
	b=xWQxqu3+y0FoCk3xxOcrNBTFDuxmbgxf3Fuvu0ZEvGbUJKUFR3Vgigewh8zhlc1AVw
	qcvZ7OvHdI8H42J9r5EU33CHxzoz+fw+dSDWmkbyLwWvbPDedT/M46r76UNOE/dAKy7W
	/V8VCynXzFj25Vg30C/aqVG37o7NNHioGzWf+HazltQ7PlyYvKv5eYYlQe6D3t8nCJv1
	vmQY0DQSJD987P7mFrAN43dUbyLKE5oPZvU1UoG7K9i7PEHc9bCAP/IncDn6uwphdkvA
	8eN4PV1fU4tU3bLbjME1Cm0XI+zLmUH+m7WCiO2LLhBh6nj8pPozKZXs9wo+Olcbgm9B
	jo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e0MQrqUjIzT3HVUvWlv2qmbuYyntVGYQ5b1E9/hOHqU=;
	b=VtmqeF3A5W2Ld0Y6Qd1iVXc+1TYCF0YwdvP6i3Cc4OjvpTbrHkDUFpxe+65t0EQmAc
	dE5DTBwc6U06w6x4eUwTS1/Sq13mktnb+cZRJPVJWkY//BX1nR3u4A7fgqkVfh0DYGAQ
	0w03GAkcOsNIYLZgdAvgstqON+aPfu4A3TtAfZjI5KbR/m33MqKShIrRjuipjFBqxnlY
	37uiPFNR034QOoz1KRreFV3aqIiW+iyVSCVjO8Ir9ScaUQLaat9ilG4N/U3ZmUoLcrah
	VJnVNGsErw4OhqY0VqXIVlsaB9t3QM3MX7o5cSoBX6tPwbz30FynvapE6OqIFIG14T0M
	0HUQ==
X-Gm-Message-State: APzg51CHYIqhUh/+UjjrExUsoBbO9K2wlPPLL/cWXQiX9dQNAiHzx8ES
	i13n00PAiPCpm+1LORtp3TAbe+5+hMhOjw==
X-Google-Smtp-Source: ANB0Vda1pU/1jf16prM1C2p6ZYF1fe1UHy4dPZ0krXp9Lxxj4UJpSHhHmoMSaQ6yWU6ybEu/6/M3ag==
X-Received: by 2002:a50:ee03:: with SMTP id
	g3-v6mr29704416eds.66.1535934961811; 
	Sun, 02 Sep 2018 17:36:01 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	d2-v6sm7070792edd.55.2018.09.02.17.36.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Sep 2018 17:36:01 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2018 02:35:53 +0200
Message-Id: <1535934953-30653-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Subject: [openembedded-core][PATCH] kernel-fitimage.bbclass: Wrong binary was deployed for kernel-only FIT image.
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
X-List-Received-Date: Mon, 03 Sep 2018 00:36:01 -0000

The kernel-fitimage.bbclass always outputs one FIT image without initramfs.
This variant did deploy the kernel image itself rather than the FIT image.

(The FIT with initramfs was correctly deployed.)

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e1..16499c8 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -463,7 +463,7 @@ kernel_do_deploy_append() {
 		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
 		linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
 		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
-		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
+		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${linux_bin_base_name}.bin
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-- 
2.7.4


