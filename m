Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00A2CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:10 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7588.1790849222896844051
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n/F0HMJs;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so28339145ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849222; x=1791454022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0pp8+AyFRk3cabOZB2vLbVP65H1KQm/nS9r3yLpezM=;
        b=n/F0HMJsXXNKjXbYS0jiSUjr2HvbUp1JnBIcYq/hQnw9cYYAGAHoqmSYLgfHNL5N2j
         Wvvj3qa8WdyQRfPpLHYsanNcZCvtvx88hOQBimht4FPPPpfUaitA3vm5AcLKWGqg5bb4
         R5n2SqJP6rG7xNllgx1ov9/kW6l8qpf/bMRK2GuS7vwOtCmpAWXLYEtd4suZIJFcoSZs
         riK3eEkbSdd6QMPVujKZRVBXmgicZmUw479zZs9J+yEp1g780Oqt7Hyh1t7GiVSU6TV9
         /6U+sCowhYA5IUO4nYO2MHitABZ6Zg/Nwp+ebZErZIsbmg8iy2tSvkF2tdoqpJdwWncr
         LNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849222; x=1791454022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0pp8+AyFRk3cabOZB2vLbVP65H1KQm/nS9r3yLpezM=;
        b=Sm6xFQUT2f0ueIUpnu+isepFSbjmH0QbvVZr8+1Z4JB2yJb98RLl0EJx5XDDpbmO3Z
         KQouljPC1syRH4+m+Ydi8iwPkj5o3EINjVwsQSuM3hpzwn0utqlaRj/ErF1vlaQlb9Dh
         vpz7kGxBZ4LyBEf7B53aAdHuEWjl61+McfO2K8EQYhO0jrU91B5o1renZkFUh/kNou3d
         rOgi+8F0PL626RJ+FVwSTs4+wXo1eTxi+SBhu8O6MO1Oy9/zmuMgkz+hboi3/MPeVWDQ
         cv5+KdlIUCKPn9QyPwkHY4gAYFReWSgENYkWJV2I9nNIir/Y0smtuAStznlGPC/WsFFI
         vSAQ==
X-Gm-Message-State: AFq9FYKgLRH2y1+82QTk5hfWf0ucLrv9NLiabsqp5u8v4CNNGqBqfrZ0
	NC/PPZBRiwhMbvBPFaz07GywpegEvVUzxFpBOYUfYGjh7tA16N+yZ4Rcch3Drw==
X-Gm-Gg: AYBFou0ifEnFgFreleEY8flHRZWWSzvBN89KgZpRdjnXO9QzhGvRtBNyFMgfN5E9zdN
	UgAflwe1ND23C4w24cjNf3Bq+/jZGR4P1cya+PAWw19TrrpdVdkQ4SUY44thZOp4AikDQ2eIRqQ
	G4hV6+xCbf3XbjsmxsFSEaSaQzHxEwrmXAapDnh0Rs98t1o6aaHvwZefYbbq93mGPbPWkENU7R8
	xtUA9bwmtDWsjpknSJFrQBf9Rv6GTthnsrwk0g8pILmBMgmfEMlhwa6qqOzp+fXJs/7pppJDuil
	HtsAt8/jUEhnoI8D308RA5grvbV4pdpYKrBEqwq43/1x9FTnpQ2hAAcnQUfkeCh+t3G4af7GQX0
	a1w7kVwKpMDrZwe1Wt7hj05eoPWye457MQH7E6n0B04D+0bA+Dds3TaBJlMyRwUtFPTh7cTUehd
	e+1Bn4juu3RTjMOXS86WtBGfvoPSJv0V8+xtrk54YYoQTCsT8l4IhNTECDC3OuMAEm4K9qmdAgU
	UUEM9j59P8yFj7/zHWSXF4=
X-Received: by 2002:a17:902:cccb:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2e2e499e1f3mr36477335ad.15.1790849222272;
        Thu, 01 Oct 2026 03:07:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:07:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/11] ccid: upgrade 1.8.2 -> 1.8.4
Date: Thu,  1 Oct 2026 23:06:33 +1300
Message-ID: <20261001100634.1992725-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130576

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

1.8.4:
* Add support of
 - THALES PKI Transaction Pad
* fix some minor issues found by an AI tool

1.8.3:
* Add support of
 - Broadcom Corp 58200 0x5884
 - Broadcom Corp 58200 0x5885
 - Broadcom Corp 58200 0x5886
 - Broadcom Corp 58200 0x5887
 - Circle CIR135 ICC
 - DigiFlow LLP. KAZTOKEN
 - HID Global Crescendo NFC Reader
 - HID Global OMNIKEY Plug
 - HID Global OMNIKEY SE Plug
 - Neowave LinkeoC-PRO
 - Swissbit iShield Key 2 Pro
* macOS: provide a sample script to build the driver with meson
* fix some minor issues found by an AI tool

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/ccid/{ccid_1.8.2.bb => ccid_1.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.8.2.bb => ccid_1.8.4.bb} (83%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.8.2.bb b/meta-oe/recipes-support/ccid/ccid_1.8.4.bb
similarity index 83%
rename from meta-oe/recipes-support/ccid/ccid_1.8.2.bb
rename to meta-oe/recipes-support/ccid/ccid_1.8.4.bb
index 49b572f2cc..31f138e086 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.8.2.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.8.4.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "pcsc-lite"
 
 SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d74294e23d436546c3e719c95a4da180b17f5e7ffdd36efca53f75351cb0de75"
+SRC_URI[sha256sum] = "4ff98151a7feb828a711e2f9d68c6b6065a97c597a81c2cbbd11d7f7edcfe743"
 
 inherit meson pkgconfig
 

