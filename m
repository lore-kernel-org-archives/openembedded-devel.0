Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id DB20B71AEB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 20:21:44 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k20so4005243wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 13:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lEGvRR3sjfvQgLZnMtOloUEji9C/13LrGlq9dciiGdA=;
	b=VRZOrlLbMOnr3LTO/r8BIua2pKT2Zh5MN8uf0wN5//1lPN00RnXlI9pr4vEDcrFUVf
	EEgu1j7RCioiCtLnDNsHmdirTss0y+cgFg+T3y7NIE8mfWRdvFFUk5qpf51p2GGxRVLD
	xkf/IejAohuBiIP19Ib4+QY7Q+Nl7RysRE8Oi5iP7kdolwiN+BS6/V9gQfvheMTIxob2
	vlZbksLPpFYafAOLVXMkXrz3X+uUTjbzSY+CqYVuh3JKYJEmYoE8Z+8dUXeLeRbOu2DG
	qF8/3GGAuenLqIaFV05jCoFfxQ3RU1n73H91VLAxv4Npq6xXpY52I0upsPDU4Keh21cY
	O9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lEGvRR3sjfvQgLZnMtOloUEji9C/13LrGlq9dciiGdA=;
	b=CKI97ovN7rAFWPNM1DwIkppNx40Yhr1ZR0/SCa5kWEU0XS9G0ds0EBYvIFNKpgkjhA
	WQUP8ziMQU2sLDODsouOhF9rtmAHVPX9/68d/XhS0T4CZDUvBzROrUjzpL/5z24/02zt
	eI8jK1Veg8y9+pt1mhJtfkbVxrsmz/KFy4Xy1adoycypOlzvrAel6eBaMgODwhsFw2Pr
	RA7gTGt/io3eKHlqg15e40f4I9jIeky4ss5umk1sxW5/7cTP+MDwivPiGDhY+R58z5PU
	zRUTPreNhSImnUCWNWzulK25BezUgkk7wNPRS4gmV8rtFrG+3CDSsD4uZaA8ZuJaWU3F
	oPxA==
X-Gm-Message-State: AHPjjUhDFxw9sQyQ3bjTfQ7Vns0YF4KULr5pZpd6HxgixeBKqWTIrOd3
	6BwH+hXTHn30+B+k
X-Google-Smtp-Source: ADKCNb6V6v3dLj3o4TW4TpEMqtMlyWLXikoOpSvDhFmG6FrJvzWhMss3eibIpmAZyviGzKF40DvUuA==
X-Received: by 10.223.154.120 with SMTP id z111mr25903057wrb.260.1505679705975;
	Sun, 17 Sep 2017 13:21:45 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	q19sm5833025wrb.17.2017.09.17.13.21.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 13:21:45 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Sep 2017 22:21:31 +0200
Message-Id: <1505679691-3610-5-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
References: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 5/5] zaurus.inc: use gcc6 until gcc7 produces bootable kernels
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
X-List-Received-Date: Sun, 17 Sep 2017 20:21:45 -0000

As signaled upstream the kernels built with gcc7 fail to decompress.

See https://www.spinics.net/lists/arm-kernel/msg594654.html
ARM: pxa/corgi: armv5te kernel 4.12 fails to decompress compiled with gcc7

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index c6e9e98..c6244b9 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -33,6 +33,8 @@ XZ_COMPRESSION_LEVEL = "-2e"
 # machine tuning
 ################
 
+GCCVERSION = "6.%"
+
 ARM_INSTRUCTION_SET = "thumb"
 ARM_INSTRUCTION_SET_collie = "arm"
 
-- 
2.7.4


