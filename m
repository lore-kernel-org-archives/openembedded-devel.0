Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88473C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 00:47:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.5296.1645404440366194864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 16:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lPQpZmg6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g1so7285354pfv.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 16:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+zLPWULESP9BpM4KHoeMKUTW5TG1nvnoVFNdUVBiLd0=;
        b=lPQpZmg66TJX9nDTn8nyBtdHnKoiEaKPaZnRWWgRWv9MAIPbkkRtTHVL5lH82sWJYj
         lyfpDemRpb1qa4RP+NKbsCwdQSRjRmB5RGdIG5fOBxrVA5JM0GMfG6YwllYI6i7LGj70
         bY3tVxeW0nSnP61BiKZfTze/cysVGjN4Xt0jqYR8BlfSQx01PIBbu6ksHOHpoH8UARMl
         VAH3vct/D/Ma4fqAJciB/SeegB163o29CJ9hwrMb26vbIWKw4Pc+ZNOQciKIJ+CIid38
         I97R2sw5HPrETn7Fwbs2a4cPgWgoLTcVdzBB7VWIdLDajYc6h1GGyO1RmbHMNxcli8Vt
         1gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+zLPWULESP9BpM4KHoeMKUTW5TG1nvnoVFNdUVBiLd0=;
        b=q8EXLc/V2LDYJnsn/fVMc5bzabFnn7uLVU12BGI0ldToGNUU2lqFIeNJnuHKQM0TVD
         tFyWlxRbMFMU1FC8962Mdxuw8pOEMMJGaMVgtV2UmNfevPvouN5sbbxlL8/reIUUPL/T
         SyNQ+MmhbCAyJorThdzH1/W91wPsQgzhcArzZIO6XLlp3bCdcfds0tP46VHcUnpPnpAR
         gPAfKnM4FTl4vZJQqUstuiHEtej1mtfmNY1dac+d2xPfkg2nlMo6+yOoxoE0uzCCzX5W
         3wzcS61yqPLlyh2OZybtZMci1F8LKeDXLOHgTA0yAC+AvYObztJQMh6ctfaw64l9XVip
         Ieuw==
X-Gm-Message-State: AOAM530JYInMCXA6jj+boJGShHSu2IqLABMNYKIHntGqu4/pDciVyC1v
	RgoIbbUs2hXo14g5g+zOjgx5r5SCw8xrTg==
X-Google-Smtp-Source: 
 ABdhPJwruqCSdw2p90T+ESRqCJ6SmvzV0+PcXq9PrkvfbxeW3dRGPJheCD8wpQk35EspkNZ8cJg8tA==
X-Received: by 2002:a63:f606:0:b0:363:c24:1576 with SMTP id
 m6-20020a63f606000000b003630c241576mr14331350pgh.388.1645404439485;
        Sun, 20 Feb 2022 16:47:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 12sm16789627pgb.71.2022.02.20.16.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 16:47:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] capnproto: Link with libatomic on rv32
Date: Sun, 20 Feb 2022 16:47:16 -0800
Message-Id: <20220221004716.3125216-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 00:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95394

Fixes
riscv32-yoe-linux-ld: layout.c++:(.text+0x570e): undefined reference to `__atomic_load_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
index 9616edd732..36004c53d6 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/git/c++"
 inherit cmake
 
 CXXFLAGS:append:mips = " -latomic"
+CXXFLAGS:append:riscv32 = " -latomic"
 
 EXTRA_OECMAKE += "\
     -DBUILD_TESTING=OFF \
-- 
2.35.1


