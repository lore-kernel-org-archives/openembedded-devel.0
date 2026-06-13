Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959EFCD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87547.1781338754481912965
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QGZnGthS;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so12450935ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338754; x=1781943554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRpbelyP/gWzDE8/hB2W1c5TPWGYTYzvLXkyPTiwwYU=;
        b=QGZnGthSBUrnV7EGgAID0VGxuHsQgh4LmDD5TOvx60zCTAZNy2aGAcTDT9gJlM1oiA
         XLU44NOH1ZJuoPy7U5cwAeDa4aIfVRCCpqYp8+X551A5vbSwDlOdzU8cgDHR0CfIBZMz
         /LKS0Cy1uSNCNL4nSSg2jpfKBKF1SwuJ9+0QQoElfm/GWhGkSxHHfYjvwtGn9ZNmlvRP
         xzX1MlmkRfqGDHS1X3hB1SsW/aympgJDVnrMBMctPxTCI09HY3nqMvNWDQu66aeBV1RG
         Gk0vE5djNhdm/1bm7sHD4CyDWeWWPlFZWKzdqNoS+lgIH6H+h5ZM3smy1YqjTfVyDU36
         +Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338754; x=1781943554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QRpbelyP/gWzDE8/hB2W1c5TPWGYTYzvLXkyPTiwwYU=;
        b=rNkC3/dH38FzmJpYDfKF8WBjFrMtCtr/YPpOL/K1UkmXftPFTe9vGP2EkHOzs8qeEx
         LZEuxQ2h8qX3JnxcBQEE1Wp7rHr5Qa+fSJIoZDmqXUVtapFdb6dqI2NRVQWmf+LU0C1T
         XmufwXmWwYh6GtxpqWKAQdta6AL38pE/qgQEywwHkMW/6+a7r1q4wbDWTyjqcspo6TJF
         VtMaJpNDH1YOuPVlzQDRsK5lNgIle650XdAZpw2kEHUePw7qHSe9Uf5+KT7owUV2WiTt
         WchVIruSR3iGpnI8IvJ1W+owinXPQfle3eWuJadIIiEsDYDcPyRGCTHKIy3si3Pi9VOc
         XW1A==
X-Gm-Message-State: AOJu0YxvERaF72IoE5lOnANkeIUlRBiFCyDPUrquSLJilfT0VAvA4QeZ
	S0o3Jm0nStsWQsb3GKSbOmQOnR5HVj9tYMD55wQM69ipsvQrJiRVFHu+s3xGgX3q
X-Gm-Gg: Acq92OFw2ZkudSabDL5PX+H/U87zcvEECfbVI0SIAKHG3hMaWmMaSgnUF72sF+rEkB2
	zeCsHyHJqc/HzWjQkRvmUH4T14Yl6Cz7OAuVIdlHTX/Izm4QhZkf4TP2zzlhN95xwayBq2WeY2p
	I3PSKZlXt0/xJW2kRwhaahVsEOLzMxLayIkyA81xeEAbvMIbZn1GXkky7z3/vJGVlPr/BnLa1gs
	y5G8ou33dLBrK9jW6LC8tbn8wWmeAl6pyaJpuKCdIZjJN1X5aPE1EMY0ih+mi6SVbX6NEgLLe1C
	/ydjiftur6nZy+N+MhHSEIy1DdBkW6KSS5nM3gTiA7AQb/gvskaogxs8mqa9vjB8iyGAtwuzZ2Z
	eehkOMUbwLbdsfz/XK9VPhADsykgboYOFPYstI/NWM0accUH7HukfRdnKpRvJgm1Gb+mdVhy8H7
	GrkMy9pafsZeETSZ17f8qFlcWgC27jXFRbcOuV
X-Received: by 2002:a17:902:f552:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2c66420954cmr30324365ad.25.1781338753837;
        Sat, 13 Jun 2026 01:19:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:19:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 14/16] python3-soupsieve: upgrade 2.8.3 -> 2.8.4
Date: Sat, 13 Jun 2026 20:18:22 +1200
Message-ID: <20260613081824.1223609-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- FIX: Fix another inefficient attribute pattern
- FIX: Limit total number of selectors processed in a pattern to prevent massive selector requests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b25cc6b7a901e72447016eababff2604741cf311)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-soupsieve_2.8.3.bb => python3-soupsieve_2.8.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.3.bb => python3-soupsieve_2.8.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
index 11a2b5e103..ec58d0985e 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349"
+SRC_URI[sha256sum] = "e121fd02e975c695e4e9e8774a5ee35d74714b59307868dcc5319ad2d9e3328e"
 
 inherit pypi python_hatchling ptest-python-pytest
 

