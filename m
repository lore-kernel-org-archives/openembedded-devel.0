Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2548108B90B
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 12:04:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10983.1774008239552771385
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 05:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IbgN5Qsp;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so2525232f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774008238; x=1774613038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmQW4Ig6OqhnHrIcZcd2DsIUjud5oBXckEmNaj/x/V8=;
        b=IbgN5Qsp7Q7Y2fWozxa49sPsQPDTPlcjyjmGI+lG2Vvp2UJC2WvDZtCQzUrokrVKR8
         A9hKwvOENaCqRkKdnSm8GmkaNNkiFQFdwPqqGcWyFIDqPytDd7IXZwQ8Sz8tbqWyOgDr
         9yRhes2gsbr8BymD1pc5M9EVAajDDkrpYT99kaYBQnMrjbJuB2N9ofOwXPhSzepYNGab
         +lmUobitJD9hH2ZwujjXb32s4YDTCOHv8RMUygfBH67S9ETE8Irc1E9AMBYSI+rnD0lu
         NfWfj5PuQBpD+BVAkwvjEZ6lafmH7Bo/ytdWOkADYhixcEFPaw+GlyCBKrbayPl9vO5O
         NZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774008238; x=1774613038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmQW4Ig6OqhnHrIcZcd2DsIUjud5oBXckEmNaj/x/V8=;
        b=h+NZmdP51qUapIIA7TyR7ZK3oB21nBj7U8JJibYLOEEWrMwTUhYtm39Z+wj8BRFXSe
         CCXnDU77Ymt1Rk+KuFRa1tGSnRaLQ7CU8mH0LG0P5hKg3Vozuo2oAyiPx/4YlrY32aeM
         toR0DajzlFyfLusRZ09fOf04dATJ2WET6v66idyqmCsR3EXMlSJgYdQtTIaZF8zvGHH/
         526VNVATQlFrMorN9/TwJLmbqvFmK9wpkRZxO3zslccq3kmXtvu1xPuowp5t6Lyxd0Dn
         XhehJg+cgIXXfCxQuKr8GxUgA6MbtWtPZPJ0zZ+Uujg0CovzfSiNDU3IkVOqpvpIEt/7
         lokw==
X-Gm-Message-State: AOJu0YyByePvrLCww8kgOnt20v6XKoF8nNHXdxJZrfNelaXp4unngBS1
	/zXT6ZXmk5r8MHPRH/EJ5OMrpPCt7xh7Oh/ExKLiuti44+jhZfCJw4V4YkbQXg==
X-Gm-Gg: ATEYQzwEtHokpeUe/YLkjABlQUZJjk5DZp3SEMjQGNSbF1upigoA50E1JKw6RXh1vEN
	S2Z/qfmFEyRJM0OJlYfqu49j6z2OVDGqQu5jq+5CTVwRpM91LOxHMQlY/XxP1J16p//2OZgmKeo
	oADolwbzwhbxivKb/8+U/99/T010LzuU8S6NNolANsYl+EuiKlETLDyj405+goK1YrK7YTrcdXU
	qIXDwhHKccy8ngpsR3t8Dk+GGddFEHZD9/Mvwy8j2iTw2ASHRnPYKzHXMIUnT9BuCXgjyO7UWBz
	50+btKPaRKazwYvYSdDBNmvWQUzoPDnjW48xzwh0gG+PaLewp+DNFQzvtFSadOcSdUtjraWdjwU
	GiNY/rG5tPsqF5svJCdNib+MihmM9GPVQkHHRJ5IDBiMd8JXX33TiLF8010xjNlYrV0PcITnk4F
	mpHz2q7QY7cyhxCb1sDvk0
X-Received: by 2002:a05:6000:40ce:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-43b6426b6a4mr5289258f8f.31.1774008237262;
        Fri, 20 Mar 2026 05:03:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm6258558f8f.3.2026.03.20.05.03.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:03:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/3] python3-pyjwt: drop obsolete CVE_STATUS
Date: Fri, 20 Mar 2026 13:03:53 +0100
Message-ID: <20260320120355.2973635-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 12:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125436

This CVE is now tracked with the correct version info by NVD.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
index 28eceece97..96f060aa4e 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
@@ -10,7 +10,6 @@ SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b
 PYPI_PACKAGE = "pyjwt"
 CVE_PRODUCT = "pyjwt"
 CVE_STATUS[CVE-2025-45768] = "disputed: vulnerability can be avoided if the library is used correctly"
-CVE_STATUS[CVE-2026-32597] = "fixed-version: fixed in 2.12.0"
 
 inherit pypi python_setuptools_build_meta
 

