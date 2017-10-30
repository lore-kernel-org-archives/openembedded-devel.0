Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF4071B2A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 22:04:06 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p75so18731522wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 15:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=g6HlW37H/aLX6sa4ViVeQviOTFmPiZ8XEgVouHj8vsk=;
	b=D2/Jhak/wuUbR3VjEx9wOLowYKRZCP3HvSPViK6F3Ws9rj7hwTpPh3HShij2Iake7u
	bNDN68UAiW9ockBP7RAdnyUNGe//Xeh0/9wQ34iQ0h5Y9QbtFvJJraxcyInDjDHcBxGJ
	rzzHMcpn8Wpm2li9ohKyjqezQnEu2XMJvldETQshFA6nkAoYAoMc+mcq6mdu2669VYLA
	E1c08qHxtbIGqDh01ku7xuDWZCKXpZo08+WKBXi0qcGn4Q5wigeh8vSf/kizTRuU9lio
	67d2BlK6tQj2Kkp4i+KnnNBglsiLEF5uzqcPYmYD02lLdPIPhyC1a/ohcRScGTA80zI+
	c8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g6HlW37H/aLX6sa4ViVeQviOTFmPiZ8XEgVouHj8vsk=;
	b=ipw/CwQqleLO8pycBqRQexdr+o+inXPf0NVUrVUtsZRZ1LIMpjGOkJaDYe1kXWtFTw
	zDXZkPzBym4j9zzj+PpRVyQ66+4hRoDfjOgdRspSEXmCTel24aDZHWLlFm2wZaa6THlF
	j6eDBHIEIpGs8bHm1mGEXc/kktCbGMw1QgrxYQwiG5Hgl5wXWpvAJ+lvdKNouaWW+lXv
	4WZk8dmFjmXplE+05ceMwhtiKcWkpEvDirWhAimiLXC94/nKEAktDtoOeQbmoO3w4CtZ
	S8vOYeQhpeYQ5NHgerNhCKbpFPucOIquMm7xaI8o2/S8Dt60owkTvWtW/9Q15c82mibm
	eVtw==
X-Gm-Message-State: AMCzsaWDXUK9jvG0seGQrCar34yIN8rUh6e2wzfzk/1XcdPHv+tIvFLV
	hVw3so6dO46XT1FVUA1wQ/SJjw==
X-Google-Smtp-Source: ABhQp+RGxemOagFpIEvkCI5SugOg4zGjpIrw9R/8Bt0hOKlGVf0xMh1fPuqJwWHeFlQDqwa2psDEDQ==
X-Received: by 10.28.31.21 with SMTP id f21mr133480wmf.18.1509401047311;
	Mon, 30 Oct 2017 15:04:07 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	z35sm27162088wrc.9.2017.10.30.15.04.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 15:04:06 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 23:03:48 +0100
Message-Id: <20171030220348.5236-1-gizero@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH] can-isotp: add recipe
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
X-List-Received-Date: Mon, 30 Oct 2017 22:04:07 -0000

Linux Kernel Module for ISO 15765-2:2016 CAN transport protocol.

CAN Transport Protocol offers support for segmented Point-to-Point
communication between CAN nodes via two defined CAN Identifiers. This protocol
driver implements data transfers according to ISO 15765-2.

This recipe provides can-isotp.ko kernel module.

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-isotp_git.bb

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
new file mode 100644
index 000000000..3c019eb7c
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -0,0 +1,12 @@
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
+SRCREV = "d1248b0f22ea8dc3b9d84a61bd35a83309bdb4b4"
+PV = "1.0+git${SRCPV}"
+
+SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit module
+
+EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
-- 
2.14.2


