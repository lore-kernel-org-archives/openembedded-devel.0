Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE32E6BF3C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 07:30:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47848.1770017410084857075
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 23:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSMYPShp;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so20010615e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 23:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770017408; x=1770622208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGcHefaAeJxW5hPhmXacXlbBheV/HP727nw2BsaZWO8=;
        b=PSMYPShpGMTT1YLf7TUJaS63RucnNR9TvUYVYFahvFohePmyyftFvlZlKbfNuLuyiZ
         tETgxX/AdWnjpTyDeNbRXap2tFgBEfSxs52mTSmsyUYcmcaE+KluHItG8NS7p8J0hzWR
         MCHdpd30Y37PEpxHgDrXr66NcBaxXzQMJRxp5tSDiPXPZyctAeS586kuL3ZFI8krmVr7
         S9+S4EVZbcoPAP+HvurX5pIL/EUQOTT7XvKDYVdr8iWRw7GxFW9ENCK5c33xARK7eh7l
         ketAOsxNUOHucKQIiBXzvyBa+9nuaL+ITU48sJMesZoLmOKpTTEdEjJfNL2sw2UhKIX1
         ofeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770017408; x=1770622208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGcHefaAeJxW5hPhmXacXlbBheV/HP727nw2BsaZWO8=;
        b=XSd4Uy5eSehUMVLCKKljJoCcM6ue01I8z6EnQXCIhCDHQW4vpcJCHOBb7pICM4Piem
         Ng3yXfGcPFlP9B/UU6KW0TDh7Tryp4ZF3IVhmA1iE22bxlG6U88PYPhQL3K7HlLHYrFD
         3suex5JFChklufue1aqIUpTDYBkSessk0NbBrFHlDabviNZBmv+6gQliERmcUa/Zy1K1
         ESTClAcNCEd7FbjjqAdac9MxovTy85TbANcLK1yySL95IDaws6c1/aCqSnxot/jBzC4a
         wxmY/HkeJv4dLEu+STvTJRoPlvjku6jNdwTTMofaKoEKOo3kDYZyFGe2lPwFFo9RG8Rd
         2UHQ==
X-Gm-Message-State: AOJu0YweIp7MqFrSgfsK/wuzqaWaXiHcCDeMBxWWKET33GvGqcMH+qsL
	0uWHNLlbCnpKd1S7uFKdzB9yoz45JtAvYKFiv+c9ZebkYKSeyGEYoJA+HnzpLQ==
X-Gm-Gg: AZuq6aL24/u5qeX/wg83A/zzLeAUD3IFSuzE5ygmtP//k5z+tvvOBjHrJQBw1KriyJR
	S6QicVBmlqggDeomvx8fSxqjjxOiVPlxrPlPQ4u3ttyaUHMNtm2RuD9A6bzggFTzDfzXEzRAECP
	1Vj4tS5GX+KHC9axoLwVXfXuqbkCddAhC+CP/L6ts5oE9ODHDldJX5CvaRSCAF5bbPdJk91+/Kg
	9y4KHNaMSJdilzk27Uz6fB6/Jae/zhuPyqc1PkcBuluXf9QtF/iuI3oCz1V7hJDSadgRkxD2EMM
	5igy/4RgghAkykLKZ28f8W0+KMIZkDmoEADQZDsa94KLGpIPAkbHaZiDTvBv2plUAustrfOvjx0
	0EmWD+u1CKWLQJQRpmH6eNMQX9g3Ufpywgc/LUG9/V4FFhlrq4GmKCQw79bTN/VipAj2gvd7YiY
	XgRLDPO4Cr
X-Received: by 2002:a05:600c:1d8c:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-482db4970e2mr132720435e9.33.1770017408240;
        Sun, 01 Feb 2026 23:30:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da6a042csm118784935e9.0.2026.02.01.23.30.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:30:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH v2] unicode-ucd: adjust to correct checksum values.
Date: Mon,  2 Feb 2026 08:30:07 +0100
Message-ID: <20260202073007.1332495-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 07:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124051

From: Tom Geelen <t.f.g.geelen@gmail.com>

The checksums are wrong and thus this fails to build.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc5132edf7c7464371122ea9af871406fa66635a)

Also rename the license file to avoid clashing with the previous
version in DL_DIR.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 890568d727..02908b905a 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v3.txt;md5=ea17640caddb659394df50e5db6efd69"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v4.txt;md5=3049f4ad14be1ebf8c80a93d9d32b2d6"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
+    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v4.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"
+SRC_URI[ucd-license.sha256sum] = "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96"
 
 inherit allarch
 

