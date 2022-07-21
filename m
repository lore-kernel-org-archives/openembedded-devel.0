Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ACBC43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 14:50:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.7372.1658415036256960290
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 07:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nbA86alP;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 l14-20020a17090a72ce00b001f20ed3c55dso1647475pjk.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aTRsw9NNiEiqNDcVgpKdGEB2XotOkGjgS2SHwjbe1s=;
        b=nbA86alPBntQhCRG62Lv2MAaNi6U2rIJQyUtd/yt2JZrZf4RRAeGp8L2cFu1sp5ll9
         BjFoWh/T40GZo7hrqgK9yHGPWZvGWUeK4DLhCeBqdgR9ZgRAAFF/PJZfhELOI5KsAbdI
         fTDQXBM+1s+uSm0umqgpG6fNIYP+XlvbsntIEG9NXxsggECE46XkLR/liLQBo1aefySr
         TI7n4NQzwYN+pDY4PnM4WjV5QcIgTdN07LbTgzCWmyip64/3kO3gWpsxUJOb4HcKxMa1
         TQgF4NRvvMMcaJCCKIP7cWucW6WcGAsqyIz70ag1Hub/1WladcpwcpYT8u59GkwouBom
         JEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aTRsw9NNiEiqNDcVgpKdGEB2XotOkGjgS2SHwjbe1s=;
        b=qbA1GoSTjMEv3nn+9mneYy1Js5R35tIarRgxQJdGi/jPIysKjsgp3o0Rg6EmpaTqNv
         yxrm67Eu+vQHs/zuc/Qt0r+AxyI0YQWdA9S5KAEfm9i37Ah4Q0rD5ne7dutlPwTBUR9g
         cvWUyN49LMqReGicCPo0jolUAGpOLuQpmPn6Qr8jBcoXvOmvZqFQEkSrMDiI9EVoyKob
         K1yNS5I/oatAdVysgmfP4NSSrboJYW2sqda2OQGRbgXwp/0MlHl5z3rjstVoSavxABjM
         3iKVbD05mCh8uShXC7MWz62uBhzynQKkFWxUqr4kfYGaF+6+N6zXXYua2QAmw7aaKGl4
         Tflg==
X-Gm-Message-State: AJIora9k+p3gNaszxN1y+NUQDdZSy30dqrsNBdO5ECYqYye+4KxzgC96
	Osmp4pZ3xsMWYVQGHMj3OSsMzJJsC7U=
X-Google-Smtp-Source: 
 AGRyM1sSejJYJxNvJ/SfrP9kYnT/8sIqmd55gwJodptkDE/kKWoD2SPxCpYGGbwgpR/0C1+HbehZHA==
X-Received: by 2002:a17:902:cece:b0:16c:3683:8830 with SMTP id
 d14-20020a170902cece00b0016c36838830mr43324514plg.107.1658415035190;
        Thu, 21 Jul 2022 07:50:35 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 l5-20020a170902ec0500b0016c1a1c1405sm1523291pld.222.2022.07.21.07.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 07:50:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] ndisc6: upgrade 1.0.5 -> 1.0.6
Date: Thu, 21 Jul 2022 07:48:31 -0700
Message-Id: <20220721144831.3730972-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 14:50:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97917

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
# ndisc6: print NAT64 prefix if present.
# rdnssd: fix timeout calculation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c77bc200813dec8a1317ea6651d0f398a3fa5d65)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ndisc6/{ndisc6_git.bb => ndisc6_1.0.6.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_git.bb => ndisc6_1.0.6.bb} (97%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
similarity index 97%
rename from meta-networking/recipes-support/ndisc6/ndisc6_git.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
index f5467794e6..6861314a0a 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PV = "1.0.5"
-SRCREV = "b706f5f01aa82aa0db678fffd15a1527f330c507"
+SRCREV = "7e314b23329f9c24c4c097b8513673fed7e7158a"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "
-- 
2.25.1


