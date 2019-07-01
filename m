Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id B1E707D3B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 17:43:42 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 205so14101219ljj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2019 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sHTu6VWkv/Jzhoec7Quj63W2B49wXsXXHeANTlQZkiA=;
	b=zIHpqsfhEvs3no6B4G/7SmnAppJwK4mWjpZe6kyJIY9vYhrchiCNG1oYEpDa9Cvq5z
	FrvSsG/c5gGVmYUcY4OfqdxfgrfKET0c15ZzIcJAZfd5zXrt2OZNE2PJmuc1peLqMCGo
	sdyv5E6Oab17A7ehtF6+L/8FJvOBDO5R2ijwH0MZyKGHAlmHcIN69ErdxAaONumApGAX
	6w5Vz5l4hl+sTYIMGhp0FuE9MbfKDS1Q0ir3tRLj3m4ACh7wwGm37LvwMDmdD+884h3Q
	YjB4Tnk11So08ixv5gVHqugyCKT4gFuYsx9ZxpJGl0Xrgg1QcYCRXz67omEKRFvYytA3
	lLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sHTu6VWkv/Jzhoec7Quj63W2B49wXsXXHeANTlQZkiA=;
	b=Qol9E19X8jO/bO1p0vxKSTgw2vw09VYtZoE+0OaMB8ogglcLHqFLEQ5AlpBfdTzlSF
	hjauzCZaPkALeP1B5aszjN1dBxMMMkwLo/p5qOBWeAQiAnIomiqIAGm3vbToYo3pPw8J
	q5cYpkw3DaAOfkYA/hjpbAh7c60UUm9tvIW9ESBNGVUtYEYvw9CT1XFHlPUwnr03vblm
	wSIpSimhLVnvtO4sV6/O2nWi1uO1YvKMbPkJbxecz/JKqrHTfiRTZhKm39VB/MNLEzMa
	Cb7m80BdAlhoHu7MPtT7ixv5BvvYgF9CXS2ZoV27zbXRau9qfaAfrxAhoVP3hgTXFM57
	0gJg==
X-Gm-Message-State: APjAAAWdAs8/qnw+qwxNzn9eiTDx85w3YlNdmEuBMs205MO/xTfwjYcE
	O6HL3N0eT1vLZy6sh1tghyqTeO5wHRo=
X-Google-Smtp-Source: APXvYqwraYSq3NWS3dEy56M+3ZdI6gfEqZy6tqJlAfuSySzxzIWOT0NWO5O1qvCPOD0MHNqvWZaufw==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr15088874lja.230.1562003022800;
	Mon, 01 Jul 2019 10:43:42 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y10sm2534642lfb.28.2019.07.01.10.43.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 10:43:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 19:43:40 +0200
Message-Id: <20190701174340.14512-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] sethdlc: set PV in filename
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
X-List-Received-Date: Mon, 01 Jul 2019 17:43:43 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../sethdlc/{sethdlc.bb => sethdlc_1.18.bb}                   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/sethdlc/{sethdlc.bb => sethdlc_1.18.bb} (88%)

diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
similarity index 88%
rename from meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
rename to meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
index fc304fae7..5c7180b6a 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
@@ -5,15 +5,13 @@ LICENSE = "GPLv2 & GPLv2+ "
 LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
 
 
-SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \
+SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BP}.tar.gz \
            file://sethdlc-fix-host-contamination.patch \
 "
 SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
 SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
 
 
-S = "${WORKDIR}/${BPN}-1.18"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
 
-- 
2.17.1


