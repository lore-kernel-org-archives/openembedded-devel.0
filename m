Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0343C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:56:18 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.15659.1747885086803218302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 20:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h73ycaiJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5504326a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 20:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747885086; x=1748489886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bj3989JE/nA2FRTtf4NocDbuWyCSO0rUPDk6a+5McHE=;
        b=h73ycaiJuPsEhQ75d7nJs7vuzeCRKC2yfaZ+ahwKTiip1hTmIVGJHC9UIKS8WFHiei
         NaZkR/CRY6A6LLVhIAuV1x4T61piOF8GHwO1/ADKdZHvjD4nLiH/U476e72cpDll1UZe
         TIs1TXIl7rrYZfH/tfEqMYwLnbVRf/70vP1eFfMKUQk8vrbcuNhyolHNYboRtulOd3rT
         qMe6di6G4Jlyb3CK+purEySv5Fo9WsXbT+G9/4kZCUPx5IkwGBkbCpSEJdxTMw+TPEb4
         Lg3UH3/CCOkEJ4YVW64fmC8scyjepCb+b8dfXLSZSSYDTa9VyYpCKUclYMue+jrmMrPu
         /L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747885086; x=1748489886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bj3989JE/nA2FRTtf4NocDbuWyCSO0rUPDk6a+5McHE=;
        b=OabtXZj8R29ab5czjdVpY5DLn1okL57z/t5a2z4LIdMssqI42F/wujAMorYnyYOvhj
         XZGdS0Myj0Drq7Dhcv2Vqqq640JF6HaWfYoZm4/yPbYMWy0HViA78QxM0jCIFlIAUL72
         h6H874dCnncI5xXckHNRG45gW9nmQ3wJKtFXpC/xMeHnLrxl/i61/+WaMlrmzMh29/MO
         K5Zfz5+MN0gPqyvMHHYwMhzA2EJF/+fDMz1E9/HyWYVxucTMnzjskF7JLr1zx43mYbDN
         RTfMJH5sCcHpU7GdF8iLC96MYISBM0sIGqNP29otN4rCejDDgFtMpWdoRb3nvz0GHcaA
         d/lQ==
X-Gm-Message-State: AOJu0YylI7DLmMFSX3hDe8e67rFjj1KhPkHayr4NPtUBGWDo/xLGUp6O
	us7dXLZxdwkELwKBAR5DfnjfXuSDeQZE6TZy1DFyYELN8Y0pg6IPOGTLSCBCVg==
X-Gm-Gg: ASbGncu4nBdZWFa3PFU8R4Y9TTPRPx8Qtz7+fBiZmHoCXmz7unCmJ3Ayb2oZfZa8rZ1
	7IWekjZF5lY7YfRIknYGtZ19r55Ew6TVFp/v6TtvacTwhx9gO0GUaQvOPFvBEnKkQzKItZy08Yk
	4yqDCrwnjcAm1eeYnw+drgZUS6xM0QmaQbhtXJYP9BziUGHLtdj4BT0Qzsv0nLjsE35hKS1GhJU
	6ts/mTLr1ByT8xk1OuzbnS/NSEZ+AMZANxzOWClJLrWGP4jc45RYZc0ivKtgF8LSI1PiZYt1jrY
	+Vf/t6rYTrmWlMdtgFXE/Pd5xER7MVlutLyrlAlVU61adrs/Si93/E3skE08m9YEK9hgOZbgqn9
	aFAcT
X-Google-Smtp-Source: AGHT+IGAHA+H8cx9WK44/71jSLz2zPoSgZuD3Q6Yi8NbxRSbdi1rzImrp86Ql4T3D0HvtnWLHFoMiA==
X-Received: by 2002:a17:903:32ce:b0:223:f928:4553 with SMTP id d9443c01a7336-231de3bb1a1mr325577705ad.44.1747885085541;
        Wed, 21 May 2025 20:38:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:9111:1040:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebabe5sm99790005ad.164.2025.05.21.20.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:38:05 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libserialmodule: v1.0.3 -> v1.0.7
Date: Thu, 22 May 2025 10:37:50 +0700
Message-ID: <20250522033750.30213-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 09:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117581

1. Fix/check "DSR" is connected before writing.
2. Add "spsr_err_txt" to get text of error code.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../{libserialmodule_1.0.3.bb => libserialmodule_1.0.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libserialmodule/{libserialmodule_1.0.3.bb => libserialmodule_1.0.7.bb} (89%)

diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
similarity index 89%
rename from meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
rename to meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
index 02125730d1..ac5a3eaf09 100644
--- a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.3.bb
+++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 DEPENDS = "libsimplelog"
 SRC_URI = "git://git@github.com/thuanalg/libserialmodule.git;branch=main;protocol=https;tag=v${PV}"
-SRCREV = "9cf920aa1d3ef1d4a4de9a19e695717a6f097894"
+SRCREV = "b5a5a436900d0bd69f990ca062de916c65f7e2e0"
 S = "${WORKDIR}/git"
 inherit cmake
 EXTRA_OECMAKE = "-DUNIX_LINUX=1 -DMETA_OPENEMBEDDED=1"
-- 
2.47.1


