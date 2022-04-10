Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2F9C47085
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web09.21609.1649623252266893058
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=uhzbvnUn;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id q189so1239210ljb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dXOQPPV7b/MxkrV1C8O9vQgsUdWf7YW6KpDVmlBOcyo=;
        b=uhzbvnUnHbezEPXll+uo8XKeiRwmggAoiwL/+IiKdGvxpVRb1kbJhxJxxE86XG4tSQ
         uoivKJ+mHEIqBidzkMF3KJkUA4inBjLzxSXx5pYyNMqMLS2soXJbDcMHwfo+XEGwNR23
         6qk58/Uf37HnAKWQbHGIz2+lIgoTz+rYnRGVwN0gyj35ZDlVrchCtfJ0D31dPm9h90Wb
         QcesZct3gf0QziUIe7zbVqTiuJwfxJ67rc0Pwwv7hRAKy9XPrRCclq0Gtby1v/JT1ZKQ
         IVECjLNqzAVEataSfvjuk/7+eT6MN9sPKJqYzERbqw/1/6aZHeyjwF9gmsqM4VOyus8S
         ClQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dXOQPPV7b/MxkrV1C8O9vQgsUdWf7YW6KpDVmlBOcyo=;
        b=1flo73G6juVrS8z2WoDe98usTtVQlRHVyJLJhlG0JCtVYXcnN/FOI0oZTnkevmg9/l
         vGfwAZBQSiR9FnAJp/TD1DSl74PKbT/stfJHSumJWmRCjhM0/EPO6Hpc03pU29S/FNbt
         VdbqtDY+yCuZRbJNeTOPu6Z4c7AMBvlWJneO2uhzATt+/4XB/xGdE3wPlHUFXUrc/w/P
         EJWbODrvua2SdklrtkE56VAU3mgXc5PN2FC99wl1NQtENPyd33S53EyIdX4dfQbpdoFz
         osmJFYFKkGavyLgDES6B9wu+KPJj0bX/I/pfmqzXDrsSAeDv/mDICCp8r1Kf6KE7Ox2+
         JHKQ==
X-Gm-Message-State: AOAM531bA1r3RdYkjLx2Sjxb5H9xLasVBQZzLFRXQreYHT7CtYRfrZN3
	46/bP8qaDBkR0n6Tg/cdCQuYFB+Xw2Luahg+
X-Google-Smtp-Source: 
 ABdhPJw74AjTsa7GOcM7UkamnQmERo+1UDPj2nMCnN/VSFZBRunBBh0Of7U3iaPUIUg0zui6NH3SXg==
X-Received: by 2002:a2e:a362:0:b0:24b:5c8d:3a71 with SMTP id
 i2-20020a2ea362000000b0024b5c8d3a71mr4009379ljn.305.1649623250091;
        Sun, 10 Apr 2022 13:40:50 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 b17-20020a196451000000b0046ba56b58d4sm195204lfj.279.2022.04.10.13.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:40:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-tqdm: update to 4.64.1
Date: Sun, 10 Apr 2022 22:40:48 +0200
Message-Id: <20220410204048.4043827-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96512

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-tqdm_4.63.1.bb => python3-tqdm_4.64.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.63.1.bb => python3-tqdm_4.64.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.63.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.63.1.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
index 0fcd4d457..3cb45f1a6 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.63.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.64.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=1672e2674934fd93a31c09cf17f34100"
 
-SRC_URI[sha256sum] = "4230a49119a416c88cc47d0d2d32d5d90f1a282d5e497d49801950704e49863d"
+SRC_URI[sha256sum] = "40be55d30e200777a307a7585aee69e4eabb46b4ec6a4b4a5f2d9f11e7d5408d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


