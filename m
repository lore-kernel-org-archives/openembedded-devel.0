Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F75DCA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:22:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.44058.1757589761946893038
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WTXZ2yDH;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0472bd218bso100865966b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757589760; x=1758194560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/PVBxF+qzWcbXKFkF21J/DjbwvuP3w2CIop/fWAjwgs=;
        b=WTXZ2yDH5XWQuOUWX6DlAdLKjCIZXRque0vRvdE0OMxJoOg53pz0KasIcoG/ZZYWA/
         3Tj3IbuMBAD1No6ej1jRdgMh3ZaUQOU2zFt6I996sbMSZz1CxgdfMtoFkBcQmu/GmUgW
         Rs+9/2i29LfLn89Zi+/zA3RhMCojjqv4Lx6Y2LSri1iPnHwCNd2Gpf8ZTRmNH5fmcsfg
         H15Ge910w9kUNoZJHPx5WrKCt6rEQF3vSMRZkbRWR2GS/OuaOAWSOPpDrHw7+gaI52km
         tWarLVV5G42nXn33rOVtJAzVeMR5hXkEvfrB5Ac6Kjrq4Y9nZnC43TLidnRjS4CamzT6
         Ku0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589760; x=1758194560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/PVBxF+qzWcbXKFkF21J/DjbwvuP3w2CIop/fWAjwgs=;
        b=SkPzDQ5btIjP1h3j8OexxRGPZYmBDJpRqTIf5kliu+3EfmSeuak7jlpmVy827dLPXq
         tnozTEZ1yc8gFmuza+jxgNyEFzSU0MfFx/O3/niJCpPtFkYkTuYxmp4mErFokmEax/t1
         PvoPK+CfWOkey/VO1+wb/kMJtDab+AP1jqWCTnLizDKZBlc0ZqUBwCRunEbHTNoyzlBn
         kBlTAwJJGzQ4RUFKTv6pY33c8JZdsDj511dhJ/TmM1crln/SGD8IjnRlDRC8Id+gv7Tx
         wxvA1YBdGEdPJUmKlwvjnUd8ftDZYb+ENsoFz376DjeywgK8jH3xCTEyEnAxiNgg6g1v
         w7Zg==
X-Gm-Message-State: AOJu0YyCnAJezlrVj9/rFRSpZLty3jTALZayTwdwcY4kPz//nF55nEJZ
	UOEyC8v/DDEeOdR9BJyvEz0XCm+j9R0I/1Vxv+0sxYGeQREfgN4IbZQrAbaoqg==
X-Gm-Gg: ASbGncu7zrEfo4cKE6cuqkOpalBHs0urd/BhBiRSv+kk2fj0EdYSOiH+x8zCvfvmHPX
	X2oBmurXlHSIfy7er3PkY41kpmg8uVf1qm3aRiZzpHstuENtEP27l/7ARYSwswzayaTApShheZC
	vJpFtA14QzytyyUC3rclDCDap0j2YnGmBZ85VNKnpeSY1P5Td7WxxuQfUdpV6bJw7hBEkcetoUd
	XeCSf29Pn8HrB2gwAPCwBs1z19Q9mrQfSneoHnGurkXQlgbmKlT3Q70FGKK2jeg6zHAupJiXzTz
	RXSZXPHCLvaLmvr5eIRJOUOWvgdCfOP1r4iOq9LIm1iwWmaYb6rXxvibWfB6rpkHb63EQ1Sm8qn
	NrshLrpMU6v4aad5ElYU50yDKmaMch4s=
X-Google-Smtp-Source: AGHT+IFaEnu0e/IpbsSU0ljpx+TQZ3wzoTrJbZfvPirG3/u58OjP8vmSdjBjhXmiEY8l/mBXVUgkDg==
X-Received: by 2002:a17:907:890d:b0:b04:9ad9:5b2c with SMTP id a640c23a62f3a-b04b140d270mr1842267966b.25.1757589760130;
        Thu, 11 Sep 2025 04:22:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31295c9sm114824166b.43.2025.09.11.04.22.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:22:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH 1/4] pgpool2: upgrade 4.5.1 -> 4.5.2
Date: Thu, 11 Sep 2025 13:22:35 +0200
Message-ID: <20250911112238.3277434-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119363

From: Jason Schonberg <schonm@gmail.com>

Fixes for memory leaks, uninitialized memory, segmentation faults and other fixes.

Changelog: https://www.pgpool.net/docs/latest/en/html/release-4-5-2.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../pgpool2/{pgpool2_4.5.1.bb => pgpool2_4.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.1.bb => pgpool2_4.5.2.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
index ddcad46beb..0bf45c17ce 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "8e14b0558a15dae8767c8e1acee3f2f6c7c08ebfffda66a359367eaaa56c3936"
+SRC_URI[sha256sum] = "480ac23f01cd7d6c856b29386bf17a848712fb4b4057d4c8abd5c8bf819bdf06"
 
 S = "${WORKDIR}/pgpool-II-${PV}"
 

