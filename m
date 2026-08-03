Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4169C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:12 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41012.1785756070791885736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fcE1NGTm;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cee9b74ee1so24715005ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 04:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756070; x=1786360870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrUyy1YEdCB/iaAATj+DyPWh8xPzoaQqkt50AThvw1Q=;
        b=fcE1NGTmcCQzA90XnPlOtuk7uJQ543B4F93muRiHSvqNNmRfhV9SdobfipgV4hQ7uB
         nQNL0e4yN0ooNj7w/v/G42BnQ6uC3YSSy7wZETE7T5hvYYid0m1WHaByRf/y9I3ETSfz
         NioXNL2Yb32P0ZTQFbIg+lNkIoPU0uh4HO1xhL99PyJQguPZnbMx12T4s6BASiMhuxPt
         CrlFUZrjjf1sPs6KpuGqa2PM5BmARFBG+ITGJY1Fs4n9lMMoF0Gpga1PSsozP9xHZaKF
         dfLxhNzbyIQ96GVpEbA+5N5XJJaMCMO/iMMZ5wCkIHsCN3+8TqvJSv7tubD9R6mahZ4u
         /ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756070; x=1786360870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrUyy1YEdCB/iaAATj+DyPWh8xPzoaQqkt50AThvw1Q=;
        b=IKbk4I7IHbsZR1sSJNenckowBkv3KTrClenC2PKaw87legHcHHWHN55VEk35OSuiN+
         wkz1qz7aXnaCaTZFcCIrEtQlrWkaZ2T+qWg41ZfVzOm3nBs+VU3OTh6ipoFLLUlzz/4C
         K0VXH1P8TngHHUEvqcouolTxE09SYSrJYXJ/n2kogxRtrVYoCBAxUlqCgX5uv26o5I5U
         ngiSrSYn70Gnx5x29FPwUysFLTQ13DdnR1ZYk5YW8UQFcml0WruE3Z5EkqzYm9NVl0Yn
         eOHr0uA4emM6oeNQPVBov4K5QrXbCL0ypUCGfZyFYoIhStz0NYsTvAoEwjHZfARIqf3B
         k7rw==
X-Gm-Message-State: AOJu0YwC/RvMQzhwnLM41eFO6lURUWRbM8oa4gAuvB8sgATiK80mgu0x
	DeT5BXompYVIocLPJKM8hsjWuShSkxy8lKnbzxlHTX0491z9dCD1TvbbK+Z4RuXp
X-Gm-Gg: AR+sD134lWwmYCpoMn0weOt0OFnfrZiy4re67uMvvbJGvz0F1LVlwBUzHWYTgAlfZR7
	+zEfWL2stV7WqKOgEnKownyvaLzfUFtd1kaJBRq3jPdZsV/QuB55mnqBe5ivBxVSqj0Nt+/Bda/
	nhOeW65I92vw+doCUF6oggSiONnDP2ud2osuOvTNLThHMHkc0XDKmRv6dhOGxHZ7vN3JQQFsEnL
	YNR8lffDFkHbGsBYia7PaAtb2PGakTFlhxSMmU4TBs1jP2+4HPNPzSWXb1PTGrfg4I36Eky7bkG
	TNZIfvEitPECiUaqtzXuqfODauKi9wAf7U4aFP7BInVnw+PnyZgAb3MdinZ6DXDCvkdKrEpIgvV
	2UWsManMZxGjSfbZituta/UeqGJ426lAhU/BbTQpuRlICB+IdSnS3uGwkcqcRNc1vOfmde3yd+9
	cpo3f65vEjVnWbCJz9ypD6kbKQIz+b3W7rVd2pKYt4YZ0VBELpFKg9ZSO8Zx70mJuIU/CS4mcgg
	Q==
X-Received: by 2002:a17:902:e890:b0:2c9:e69f:edce with SMTP id d9443c01a7336-2d0527fa6f4mr82795495ad.44.1785756070062;
        Mon, 03 Aug 2026 04:21:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddcba2bsm42463843eec.11.2026.08.03.04.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/6] cjose: upgrade 0.6.2.4 -> 0.6.2.7
Date: Mon,  3 Aug 2026 23:20:53 +1200
Message-ID: <20260803112055.3926085-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
References: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 11:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128679

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.5
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.6
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cjose/{cjose_0.6.2.4.bb => cjose_0.6.2.7.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cjose/{cjose_0.6.2.4.bb => cjose_0.6.2.7.bb} (88%)

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
similarity index 88%
rename from meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
rename to meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
index eb1db40705..b35cf349f1 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"
 
 SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
 
-SRCREV = "8d94c3ad3237ab6a83d2e92fa541542b1b92c023"
+SRCREV = "10af8915a666b50caa5500cdc3f2523b916be720"
 
 DEPENDS = "openssl libcheck jansson"
 

