Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DBCC433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 16:29:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.23361.1639240172176394008
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 08:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=40g7SQAE;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.175, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f175.google.com with SMTP id 207so17815745ljf.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0W9O0Hc9uqadDhsUTeapgvcdSEoVLyeeUG9f56U94w=;
        b=40g7SQAENpPdQSUdApfaXErRE9SSHaX2e2/hhBeZx7QTWhKfOO+kf3J1IfmeE9/gYH
         Cn5I+JXeeqzR8nj6BEnAmnSa+wL6JXr15MVGbYD0yUMbu0qba5flonFaG7bj96rNZA3u
         lSrjs6hePjU7xhuCTlsGpl3nA/HD/GfECXWoC8Ai0ZkD3VamdNX4EgdwIUv/9HZFJ3kH
         lspsce3knUoh+sSXRLIRyXxVUfQMD4MZgQM+9HxAj2HWnSWFDeUhblDbMTd3vg95OR1j
         +3tix/kvxVPQY9V6rsMaZ6qcXrC1ocE/bY24NiINZRxIajIk4D/VifZyb2Ll/DhfemOx
         w7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b0W9O0Hc9uqadDhsUTeapgvcdSEoVLyeeUG9f56U94w=;
        b=qgelMrtf1r8SVOTskFEs4R0lzLNLk8cKW1KHSx0TDjoO8wnzh511omBCynW6yixhbO
         H2/Hrjpoq8mLTh5txtmP4x/yUVzViCqr+ff/caE0WWA2cMZaTMGhKb4nDmBSb0GQW9Ge
         mXSiSWIYGp5j1Q7XR1WRsA/9s8b0Ovy5bov+KZjMrwOobhLFqdqdx8r9q2L1nTzIKNDC
         y9hcLinSTy3XZIPE2TDLczSYPw4OxAgDSysPAa+R0XUCtzJKxQYNzX8y6AAs9Rdmu/oa
         8yzcEP1UeKk2ph+VUEZP3gO5PXJR0n1Dy8dFjxMQhasuICH6FprV6Hl6yiClihFEmaAV
         BqVw==
X-Gm-Message-State: AOAM5332jhXVMYvZEPEFhOVoXQbTqb0u8PwbiO0/u2g6Fiur8C9MmdHp
	DHeZWCulL0ASylvTgXgY/gAIyGV7w5s4h2M6
X-Google-Smtp-Source: 
 ABdhPJyaKklIzrKvkU0zpoHrVnAJhmNvyMKUWz1aFbn6ZQHjz07YfiOBtKfiksgd8GkSmHz2eCvMrw==
X-Received: by 2002:a2e:7d0a:: with SMTP id
 y10mr19853242ljc.259.1639240169708;
        Sat, 11 Dec 2021 08:29:29 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 c17sm687033lfr.235.2021.12.11.08.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 08:29:29 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] uftrace: update to 0.11
Date: Sat, 11 Dec 2021 17:29:20 +0100
Message-Id: <20211211162920.3600413-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 16:29:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94286

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../uftrace/{uftrace_0.10.bb => uftrace_0.11.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.10.bb => uftrace_0.11.bb} (93%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.10.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.11.bb
similarity index 93%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.10.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.11.bb
index f7b952fc4..59c9dd4cb 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.10.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.11.bb
@@ -10,8 +10,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-PV .= "+git${SRCPV}"
-SRCREV = "a5e5a51d32bdfe59af8b453ca08d78cbdf0b3c61"
+SRCREV = "304a492652dc0fd220f601167c4ebb30e2ae4a39"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
            "
 S = "${WORKDIR}/git"
-- 
2.25.1


