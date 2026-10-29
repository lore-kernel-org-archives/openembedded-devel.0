Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7604.1793265450068169854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ShAj31PI;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67583c777abso585437d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793265449; x=1793870249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFZkzHf/HFIvMnHS/Bj0ZJgmNP1LZ4ApdJIp2t94f+o=;
        b=ShAj31PIS9kldWyZ1EYcZiB3Kpn+tnSQDs+2W9zk0egcx06VTGvM3nOVtmA4Xk/Wxo
         OwYroEQWLVKF6SfOVIY2iwX4NGEGqLb0ZvXgBzV1B1tfCgoSZhE7CR/zVhQPVOILkxxt
         Tce3v43nKpXGHOeuwWaR3DdUMPVvCvZDdWFgw3Dut/bLrm7x8W3Qsy2QVxIOmq6NcNNb
         zHDu0DTEg5O7/A0prcRY/DLtXukbzuzI76NixAwNQnROa/i0YW/JXoMHWAaRL9uahlra
         hcl51KWXKo3z0NK3GmHsmJqvC4xdcmD11SpbKQZavFDDAbGjbvefKC+Y+RBnH9BsZFHA
         jTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265449; x=1793870249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFZkzHf/HFIvMnHS/Bj0ZJgmNP1LZ4ApdJIp2t94f+o=;
        b=nxm6oV1mbqyfljxuyvyipTn6XX1yiRuMv1B4bNHnCzaiCqEWLBFgqzPVwTMrR/KAre
         CUt0UhKks1UCbhNVyVYeRb2gdWQJGy6oPhLS0K/WGNxKNumSBL7ilBpXSv7xdCmfGmMX
         Cy4R2NnO+MkHRcWbdyX/9gXELNYJRB+2VdJikHs5sywen1u5buKz/am3bhEx0HFF4uX0
         l4XrMWMxbTMmyAEIyl+7XN1tWJOHNHOk8Zo8seyw3WfEDxtJ/oYFMvXZc/LHI/bLKXMs
         FPsk4yF0qYem86mAH09eWkmXWbpLcpmQZDTPxshntmksVpA93DV0Cj/A0a+Ort/SdYzd
         jJnw==
X-Gm-Message-State: AFq9FYIKfMBL+/u1TefQYuoVwUFCFv7tdqyfRq5Jbg8pAEQ9vPD7+Z34
	eihDln977ZkATmLUhGybXMPMgOIA1RRHeAuQ1vV7LY3SEtoB8jXNuMhv4arsft64
X-Gm-Gg: AYBFou3V5eTbkpwE8Ei+n280SpnTklOYx4PrCZUM0ISzfFBDCGNzNhNEqptFD6PBssi
	siSGOFJ++rTfYPlgPgGhWQMcWbB1KGsp0rWK7Yb4i5+kU1fXebZhIHQ3V/cHF2T58KWwg188nml
	y4oWht4Ub6kllfLlNzW3jzJGTY1nRd6rB49ZG2WoufTFB082FooFg/hRS1uPdjWf860VUrAbfFO
	DaYUqvJAdbwLho/CHk8ijrN6NsGhOrJe1W4+h06+afmMsZk27AYbHsbuWJs9/CA9LSYt4B9foM3
	ULq9PRT1NF64PDBQePR45gmolfRzKEP2y6v9iEJOr/XwPxan9LyihfGqyoa9bp0v4AygXZiF9z1
	QC65i5D9t/YABTIKHLOCJgqueBmQcH5Kth1yzx8J0U0eWg+J2V07uFtyXXciGckpKBAyd/6ycev
	05r0K2jpwuP0ovgj82i3hvNHMLBiJg9Dp3SzAumCouTOPJ+hq5l/9Qfb2PON9Wrlz4bQUQX5Rv9
	J9hbXtn+ptQxZzmH98lfqPiB9p3RxugwOPyPSVAb66PNzKJK/Z+4vEJLzLkgGR/SN+dhwRO8uPf
	uJdGU/G1MmPpw2d4Hc2F35jy5CRIcPvEAF96negPIvsEZvrok7MItDjNvQ+UBrk0NtESAs+Z9rd
	pgYY7/mMfcL36j/cSpSFNOkKP7E+cbO/pB0Br9Yxvoc80tMbAyQqC
X-Received: by 2002:a05:690e:d8c:b0:677:edf1:80b7 with SMTP id 956f58d0204a3-67a8d06d64fmr1636395d50.12.1793265448936;
        Thu, 29 Oct 2026 02:17:28 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a0c7da1sm3041065d50.12.2026.10.29.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:17:27 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.22.1 -> 24.22.2
Date: Thu, 29 Oct 2026 05:17:05 -0400
Message-ID: <20261029091705.1718506-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131644
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/nodejs/node/releases/tag/v24.22.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_24.22.1.bb => nodejs_24.22.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.22.1.bb => nodejs_24.22.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
index 4912136f76..22355ab85c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "4f5379796280cdaeb0c2f358fd04b6a16cc4fb7dfa83b5a8c91a9d963b435231"
+SRC_URI[sha256sum] = "8fe2ec1723bb9f8d0b683907c82708debbeda64af21cb2aa214c4241eed0a061"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0

