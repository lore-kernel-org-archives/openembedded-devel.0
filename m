Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F339BCEE34D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 19:20:20 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5190.1763493618730135274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 11:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d79fI15t;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso6702593b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763493618; x=1764098418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoWCHsJDlE0yKG0tmoggfEkg7JcX1bkY0mnX7JwFRGA=;
        b=d79fI15tDk+Q2i33P0hDXVwSYH2KrcaTNYf2M6Q+OIWw1W3kDtoA59FyMb+Z9U1y/U
         3w3Hz2KLyxlEbJgaWKK6PG43aRvG7KKl5fwnXqvb3v0CoAOluGs5ayQqoAwQoFNXMTHB
         z9vZWabIB2eTwLoT0CmcPYawKzNzwI5OED/3u1TnQmfTMl3/0s6TvcJBrOx42LOQ2wrZ
         NJ0H/KIS557OHrWmwYypoB4pIoHu2JcZ4c2cmaSEanl8p8AVvXLhrvp/XvalrP+TZp03
         5reGcG9QKB7OzvoY6FLqz5Z7n26R2d+DD6+I4b2XjH39l3D+mwGsoFuJ3j0QxwLOK4qp
         qc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493618; x=1764098418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoWCHsJDlE0yKG0tmoggfEkg7JcX1bkY0mnX7JwFRGA=;
        b=YgzvghOQOaFZ1KobdCMy+i/VXZbZm5QMdYHhl5mff4NrXtBi+6Jn5wpFoZKKnsfDek
         qozX8U2NsTImYUKy1pHpYWjtlI7JYep8zmCiKxa1WYmX++63PhqJa97gDLbDyzcImuLc
         ZZuRTMdNI4Dgl94TAt9ZOUSKnrvMREPObPrg/ka0Aci1lMI+qwxNPcmyy23ynxdEUjWO
         ziP/O5XhdxyPHcHqR9/oe/w2u1EHip7h9J2ZJDJ34VnagGPHV0J9oVNoc2Pgh0cGOC1S
         fQdk/nJgSzkJa8mU7M0Q+Kn0on7JAQTiBZjgXxfMWzy+TXb1QJxZjnSE4XIX+qhU9DGR
         COQQ==
X-Gm-Message-State: AOJu0YylX/1FJcL35nI6iXb6KBPodNntHtAWekYElhqvHSsmYIMlCKY4
	3KzGwW7TEv6TxUZZRmQgVTLHe/BetbpUpfz7WQCXNTSHxEcN/uAWK01ZQNth3Q==
X-Gm-Gg: ASbGncvYrUsn9+Bykbeu1FbaT737k8Wvv0EXmMK3rWsZJovS0PXglq09h3LX1wyA+Cw
	je+YWfraz/yQ3Rr+GlDVKyBA0c0RDdqHOULLoMeRPQ2ffnUYpSuhk0PItWupfLaW8zel3jFagRP
	G5pEM/j/F0MiN1asXSMcEm4TNQeH0kJZA3DKM9JCn38E3d20/QBJI7bS1U6G3JK8r+/YOhiw8C0
	nIzPY8Is2koeJ6t0M1hMR4uGsdc0r1doEo/uhgeHgwmi4Uzs08CaJc3d0g48qii5RyLzEG4W6Yf
	G8MoR/ON/xWX73uOsW0aN5bFZmIex28Peg9pGYhJIEx0izJD02S9Ckkfsx8L1lOUsrsYReeleU1
	KU8iNoLMtX80shhuR7ixoNOgM94lBG434dJNzrb8T99AMt6jDYIEPAAQdosBH3ELDKB0PvhkXDA
	LbGwjTMYHMRSDoIEYEpC8+w6/J
X-Google-Smtp-Source: AGHT+IFvTBimEyvL19Yt85YvzANTEwkhwKXg3BEZ9k4AOqBmCzk/mtApQD6bYL9Ku716fldTcoTavw==
X-Received: by 2002:a05:6a00:2443:b0:7aa:9ca5:da9c with SMTP id d2e1a72fcca58-7ba3c4755d7mr18048386b3a.22.1763493618030;
        Tue, 18 Nov 2025 11:20:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22b1bsm17041601b3a.66.2025.11.18.11.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:20:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v3 2/2] smarty: upgrade 5.4.5 -> 5.6.0
Date: Wed, 19 Nov 2025 08:20:09 +1300
Message-ID: <20251118192009.2018290-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118192009.2018290-1-ankur.tyagi85@gmail.com>
References: <20251118192009.2018290-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 19:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121870

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
chnages in v3:
- corrected recipe version
changes in v2:
- CVE_PRODUCT change in a separate patch
---
 .../recipes-support/smarty/{smarty_5.4.5.bb => smarty_5.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb => smarty_5.6.0.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
rename to meta-oe/recipes-support/smarty/smarty_5.6.0.bb
index 7f99b9b5d7..88afc55c15 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
+SRCREV = "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

