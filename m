Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B394C63797
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 04:54:09 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.38875.1673153646503023262
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jan 2023 20:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cbocX5f2;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so9414299pjg.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 20:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdqYuOlKa6esYU0LnN7ZSxqqWiFvv0fKhaJeIRxe/Jc=;
        b=cbocX5f28KFbMOrHXaLKpivg+BEE5SJ+hACDiAcVAxtVtE1aGkra9bcUDoWIYn1nmi
         tkrdw7084ESQP+FfjRHn+bMwBVkJnLH0XsS0dQHDxnHbFstzMYICYJUdRvOX61Urtq28
         HvfAYsr4E4NzVhnWiMsx/aFIUH9u74NtgXYBdpIKPikUAcPVTomX41yt/qhT6w6bbcHc
         5v6u19IxtXmAdgHxpVN+NzI5I8ipLRo6IehQL8tdKJUpsM5QtIwH5+0CUeLvZPHWRzr9
         04JCLJPexxr93xEdoAXkKdwa8GrVZBG3MzuwG2cYyWqcxpo4zzXuwt/biESkoQefJHa3
         FGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdqYuOlKa6esYU0LnN7ZSxqqWiFvv0fKhaJeIRxe/Jc=;
        b=t3nXNM16N738fLwCWda69VTYvnigQjp88JT5zI3YfSStJ4HSiJaZU+9zL/GIzKtkWV
         CqL4WxasNXJqTuKkO97vUcurF25DULrCiGdowvCYFvYKdAhWDcq+TS2f40FBm/xMUq1T
         vTEseBUGQnrO2XmquS5RDKFvyurBNUfZh4ZmCmrpzETWg0FWwubqA9s19RtYJmDfdv+E
         67BR5T1L7KTlG+LK+Sdtvj32W5F6kiujTgEjrRzP/cq5KkQfLu1sjA5EFHdLBlnT88zV
         MvAHlDRSNp3IBProUdyVcI/V7QBRilDl4EkJazi6LdAxaT429Q3v0sCYNa9vphsHYAQ/
         7hgg==
X-Gm-Message-State: AFqh2koPQ88YivTq+9pUxQE/3XqY2q70o3an1fe8z5inMf6a2q7mxmwV
	mQ0hxMlf6z4UtJwYtZXf2IagXdrvAcoYNg==
X-Google-Smtp-Source: AMrXdXuv2G27eSuFN4zwI7AnxZdRbGPRKVa2/91rzALxLTBxn51EETWAl4LKvLr3o9FgCok7F00Mpg==
X-Received: by 2002:a17:903:2348:b0:192:fc57:23dd with SMTP id c8-20020a170903234800b00192fc5723ddmr18697976plh.17.1673153645650;
        Sat, 07 Jan 2023 20:54:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b0019276616e9fsm3498835plk.183.2023.01.07.20.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 20:54:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] sysbench: Enable only on architectures supporting LuaJIT
Date: Sat,  7 Jan 2023 20:54:00 -0800
Message-Id: <20230108045401.1559499-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108045401.1559499-1-raj.khem@gmail.com>
References: <20230108045401.1559499-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 04:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100437

LuaJIT is a hard dependency for newer sysbench

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
index 098954af37..945e2c3274 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
@@ -15,7 +15,7 @@ SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|riscv64).*-linux*"
+COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64).*-linux*"
 
 EXTRA_OECONF += "--enable-largefile --with-system-luajit --with-system-ck --without-gcc-arch"
 PACKAGECONFIG ??= ""
-- 
2.39.0


