Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B39C636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 15:57:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.27281.1675267050856311425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 07:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H6Cpwvz/;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: david.bagonyi@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso2767688wmb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 07:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvMEymFeAZnLmofDLExqw8pGa4uxffudWHrIg6DzBh4=;
        b=H6Cpwvz/of0OjjTv6mWsma/90C2iDC5IhSiV6C0miF+TI0KnQXe29/iHQDnHsKRP1p
         WueGX+jFhed7B7UxTrbAfAW61FPESfEWJCxO2xEERcA2TPqrZ7TyTEdUR56YlPkDQVE+
         +eswYyw+s4n3jPekXDLovoDiLJZYVcX3aB35VFgP1x9TmHl0TqxOyaVSljCHEBzdJ2LX
         9QAfcOCmKgkgmL/4ExOAy6gdkH0NtFYDd03LbqKgIPWxQFD1PF5s+6qiwsydG3MOgMTm
         EIuoFRMD2yP28WEK91bJdI1x+elak/So/9spyGjm8QkSUWTvzDfaOieAoeuloO4Qrw/J
         hPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvMEymFeAZnLmofDLExqw8pGa4uxffudWHrIg6DzBh4=;
        b=n1KPF1jdWnVSr9V+5QhAvEdlyD40Kf0RXsTUpcJWiJ4z3L1CZ0GR8hlBBeYyqpYLtT
         A36FnRCNgPdkUdbQPhOxGCArIX6UFnRW9ZPcbc0IFNeIu6b9tsG6TXrl62R/IUZj1g3D
         uIh2D0oIOwcax4k5xmtxODGwqgMSYEBzp4H+iM3LcUl7NssOtWqwkAeZZJpBDkPe0f61
         RL7rqc+4iSR+bsO8t2nN0H0/fCJvJ259zGvbqd6t32VjVPDaz+BkX3s0HpVkajtDgaQx
         z8tINb0iq4VGq81gdGMq5zDMJ9gLUIxRJipdbkYwh82eJeW4rJvPx0H4w/T5RZlla65z
         KsKg==
X-Gm-Message-State: AO0yUKUJHlXdlYeCEDHyUN6lChxBOarbFzOSSaKGyeuPOPcfaei121wU
	lsYwle3bnafVSzGEsxCRf9iH+H0BnC8pYSsq
X-Google-Smtp-Source: AK7set/MB3zYECqZMXtNxEeE9Y8plOd/StJFw4DwlP1NYQ4iQ2lY1Uh1MekLHvqA8SBiN+0gcnurjQ==
X-Received: by 2002:a7b:c8ce:0:b0:3d9:ebf9:7004 with SMTP id f14-20020a7bc8ce000000b003d9ebf97004mr2540470wml.29.1675267048850;
        Wed, 01 Feb 2023 07:57:28 -0800 (PST)
Received: from ip-172-31-10-113.eu-west-1.compute.internal (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c028500b003d9de0c39fasm2108755wmk.36.2023.02.01.07.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:57:28 -0800 (PST)
From: David Bagonyi <david.bagonyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: David Bagonyi <david.bagonyi@hivehome.com>
Subject: [meta-oe][PATCH] concurrencykit: Make patch compatible with Bourne shell
Date: Wed,  1 Feb 2023 15:55:37 +0000
Message-Id: <20230201155537.26746-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 15:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100906

From: David Bagonyi <david.bagonyi@hivehome.com>

The use of `>&` assumes we are using a shell that supports this syntax.

In case of running this through `sh`, we get "Syntax error: Bad fd number"
---
 ...configure-Fix-compoiler-detection-logic-for-cross-co.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch
index 6be024662..718f8c19f 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch
@@ -35,9 +35,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  fi
 +  assert "$CC" "not found"
 +fi
-+if `$CC --version | grep gcc >& /dev/null`; then
++if `$CC --version | grep gcc > /dev/null 2>&1`; then
 +  COMPILER=gcc
-+elif `$CC --version | grep clang >& /dev/null`; then
++elif `$CC --version | grep clang > /dev/null 2>&1`; then
 +  COMPILER=clang
 +else
 +  COMPILER="not-found"
-- 
2.17.1


