Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65FCE7718E
	for <webhook@archiver.kernel.org>; Sat, 21 Dec 2024 22:58:02 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.15944.1734821879878904301
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Dec 2024 14:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S6QhCTRp;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso577136366b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 14:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734821878; x=1735426678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIzqK1JojIlikwr5osXxIOfl1jKB7a/7tkx7xvWxvqg=;
        b=S6QhCTRp3L95Kr0//UFXCcOuI6eTIhzQFe73+a6ZvGPXscRNDozinD7BZlDMi3fVZR
         2Kxd/p2KHMQupTPCl6BSz/UkTxLXVP0R6J/08BteR/7APZCDw3XZRsP3V/WmtaILVMTk
         qi0wgmWRT/S/zjLFQWvHr4zo99lCIytPcp3R9h0zUqAFtPZhpI9s9+7mKf1S+KINvAU9
         qUYZBH5pWxO7sIb9YNHQazlgmWpbZgsrjjw8N3+dGeCccl1mT536JMASKNZZKyKte8oI
         5+/KTgQ6KpFR4jmxJ6+P5LaNd0pOYlHMftIBzm7HO9UIvDFeaIRQ6DYv3HN0J1BvWf68
         cDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734821878; x=1735426678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIzqK1JojIlikwr5osXxIOfl1jKB7a/7tkx7xvWxvqg=;
        b=sUiUlx3frFdSz2r0C7sA/56zJz2envjj0ea9WkQ0i2h/mgGX2mplSwXV4Y4On6kVsM
         d33FtoetKDcBr+SiHOqos9zppS6rAz/yZupIWi74zkmNYkxAXj4L+4izBZ9ijQqgebld
         SiqIgIsVmF6JPoOv7EZdGMNfcV6pVnHC1JAP/vhDpU1oQRfquwrBRbpUAu2wapjHDemO
         vi/OlGkHkCyDum539kvYlhLOlkruZ5fxmU59Gm2W9xWo10qUu+k08uDr6++YSLwYu6id
         eYYNHz7nGevvJ4Qirc8DAFStlny6/HasrUH8V6L64oPDc8i+VfV+OBZ2tl5SX89K83OE
         mfFg==
X-Gm-Message-State: AOJu0YxQqjLe4jNTiZB5DX9wsAnEcIUs5k1mBs5Np7OnIglqZsG/dnAM
	GpkLhjkJu84bOjUqwGcMfHZJHnQEAUtoCqlKz9+jDv+5yeVqzWfndU6UCP2d
X-Gm-Gg: ASbGnctFWItrLSqE7GcUlf8hK2O8lM1rknQgEfvIHOYWP3k7+5HjsAMeywPGKb8C1cA
	W4cLmyei/jnws79ybx2yFwpo1NB7ZS2lOzNlYUea6OiZK9hOYN1FneKdg3frXkCf2HYQCgQ/pIY
	h7lIrnVNS8/lrbFS5C0ZnVvAYwMmzJhFN9gs+uaWfsFRiW/Vm2IpPH0G4pRuc2Qawnuxko8UXAT
	/h9GHBE4nQZz7uOaVKaXP6lWK/DmvBySr2IF74m24tiVBdu159xCi9OrjRMHeujYlYMo3UEAm3v
	g22gjCb0zNJey6H6/jch3s6V2qXPUDQfB+o=
X-Google-Smtp-Source: AGHT+IEIZVazv6YUzomh+GpV0vRxuIwRXnfka4Sf7NLAUgW5RgeAc6OL26/soIxQrtm15dcuxE37bA==
X-Received: by 2002:a17:907:8689:b0:aa6:8600:24f3 with SMTP id a640c23a62f3a-aac2ba3f4dbmr756544866b.25.1734821877519;
        Sat, 21 Dec 2024 14:57:57 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f858sm330717666b.21.2024.12.21.14.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:57:57 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/7] python3-pyjwt: upgrade 2.9.0 -> 2.10.1
Date: Sat, 21 Dec 2024 22:57:04 +0000
Message-ID: <20241221225704.2712991-7-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
References: <20241221225704.2712991-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Dec 2024 22:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114454

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/{python3-pyjwt_2.9.0.bb => python3-pyjwt_2.10.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.9.0.bb => python3-pyjwt_2.10.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.9.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
index 7bc3cffdd3..12b76ec3c1 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "7e1e5b56cc735432a7369cbfa0efe50fa113ebecdc04ae6922deba8b84582d0c"
+SRC_URI[sha256sum] = "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953"
 
 PYPI_PACKAGE = "pyjwt"
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


