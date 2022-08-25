Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5CEC6498F
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 00:03:25 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.18221.1661385800659611733
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gS3wFqxZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 83so12338469pfw.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0LunTckSX1wLV7AusYKuiQUCavXnb8JKk1RkVj8nTEc=;
        b=gS3wFqxZs2T21ME+ts0WaKZ48gKGUMeyMkErNKbX9UFAriQL170JJujc6DNzp5T6o4
         zjzXEQK321A21+Im0+DLcDeSN8M14pyIuYcJAG4xHPpYNSFUdN/nK0pEF1itwn0SDjjr
         0H64DBrfx7cTzLF3WJCZZZBg2XvLi/dkehXCDPePmv2w1s2qDpVrLWcRCc9Hjy5PYhD2
         +3EWsgVckaWCdMD5EKWYy31P45aOtDcP7d+NA2OP/Bltga/TvQAGbLGa/OjSAyrhUgH4
         PoN5Wh1YAW/lOUIMlZZ8wIBZ2A/s3bsFHBynTEoPNltnn5ehr/5aeRYlVsQAHrhf4PAa
         ZE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0LunTckSX1wLV7AusYKuiQUCavXnb8JKk1RkVj8nTEc=;
        b=me0ManrFAG0yBczgekvWEqzG3/liiq/h7J8TNTrM/HFKFfxEear4wONsfvGAcN7XyF
         N8y4cYYQfW0Q8Tinw4m13eeClbGtJc+q0gmh9YWqmm++NeA4VVGvJtpxX/rYUO/Xjx4F
         FcKgqT/qcYYhIKVgId3rc83cm7Ha1zUT/OraKQ+rpsWIjVIQSu0hBNCpvZpHdUHr6hyV
         Q7xXkKmIM+SB36hapdpc07/pZvDLknfo+6lwzfNsCxNOiojTCpG7yq2mCLM1DAP9TAiP
         t9sRBTEEst/epmpnS85mZ746WDbvdaIokn1f1Q4cHrspbqcGm3XTSRd7viwA7CGQpl33
         u90Q==
X-Gm-Message-State: ACgBeo2+PpRdefEJKTeHfvc+pSjPtkyEgvg2iYRtrDdM9wHwXvlaXlU0
	3pFRIl2xXrxplZZs0XywCycYxIQs0otudA==
X-Google-Smtp-Source: 
 AA6agR4G+qNeBN69kNTeikr9qNy4NkiayQo27+TFMwdmHdXEMYowBr7fafteAUuUs9bghairPSbP/Q==
X-Received: by 2002:a05:6a00:1a:b0:536:d522:dbf1 with SMTP id
 h26-20020a056a00001a00b00536d522dbf1mr1522793pfk.42.1661385799870;
        Wed, 24 Aug 2022 17:03:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a170903244400b00172cdcdc183sm4236373pls.93.2022.08.24.17.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 17:03:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] dhrystone: Disable warnings as errors with clang
Date: Wed, 24 Aug 2022 17:03:14 -0700
Message-Id: <20220825000315.285545-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825000315.285545-1-raj.khem@gmail.com>
References: <20220825000315.285545-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 00:03:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98427

The sourcecode predate C99 and newer compiler are becoming string about
language syntax and standards compliance,so this starts to fail builds
due to additional warnings which are being promoted to errors. The
objective of this package is measuring performance so we can ignore
compiler warnings as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
index 17e8c700ca..d809a564e9 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -22,5 +22,6 @@ do_install() {
 
 # Prevent procedure merging as required by dhrystone.c:
 CFLAGS += "-fno-lto"
+CFLAGS:append:toolchain-clang = " -Wno-error=implicit-function-declaration -Wno-error=deprecated-non-prototype -Wno-error=implicit-int"
 
 LDFLAGS += "-fno-lto"
-- 
2.37.2


