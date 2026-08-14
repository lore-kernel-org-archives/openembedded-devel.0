Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E532C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24484.1786747559430497969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dMIxkHLc;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2257504a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747559; x=1787352359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex6M8LOAS7wvgrxt6x4ZCrCs97GN+anTDqDk6K0JuuU=;
        b=dMIxkHLcXmmFgVWmdGiXMrNL2fgw2VeJfojrBoOW4s/4Wldmkfqdlbsp/hUMFFkF9Z
         Xk4I/GwiPK9ZFreXBgmE3fnb0msgeEUV0En0RYQ+JeWMsEJnlLHbEhvNLAH11lGMBQnD
         S6QfSl1iC69NMKS1SRfCVPqdrWbpjKGFx/j+1gbU2IrK0z8lqyuClt2ny1BUhUzxU516
         frsrgzdjwRLfGkDiNL0e4Yn5y5zmxkHpjc3tRDoMw7jLyU7wKeZysyHAEUSTVcwUxCjt
         bVGd97ojKzeOk8I1lqoa5cyZfngnx8WS/Ug0aI/GuEl0ZbH043TwLXvPS0zwYAmJP27I
         xW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747559; x=1787352359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ex6M8LOAS7wvgrxt6x4ZCrCs97GN+anTDqDk6K0JuuU=;
        b=sRw2MUMeNdXs+JjAxBnKyUjjUx6AfOoe2t6OT5caouyqtlp2WkCCyt2IQ0/r8Pyd7i
         LsmnVHiJL8kfIquWtEZhk37lXephw/rFKW6G574sfT5Cz61GGEnHgu437kTAzLqCMD8/
         KkcN7xkj89PbUpReLln42vCZfCpWwNkdFVeDH7zzaE0O9ZH4A/6MUOVHadRQAsR/YQk6
         6E+0d1cm5p5gR4JM5ztpoPaaaS8uoP492UwVTf1msmVsSfCMXMZOgAiUjyPgO39PXI87
         SaRPowO4PPMyvACz8cjZXXO/hspcTE9dEkz8+eU+KpbL/UceVcr5p7NX0ea85Co5ccAE
         ygkQ==
X-Gm-Message-State: AOJu0Yzr+5CwB/W6m/x/YNSqhaYV0CoT5NCKIciViaqPJT31ti4/63z3
	aoqyC0BSBME/+38VxJzNkQl9xFzFuQsk/PwtXYGOj3kCV3Ui8avDrl7gvgnDsezs
X-Gm-Gg: AR+sD116wJbCrQ61SlBljD7+ntCrxrtlveZE1N1lKi1AXlXO7do8NB64BnmF3azsMJf
	wGVUW3ayZzf+rq0OwUA1EmpYJwusGRyLKH1Ev+RevYV9bIZaAPC4FyWxVrASySa8SWV7WFswwMJ
	bAXi+sd+1HXEKB15guB11IbNVeQ8/unJEaqNSVpAj/vdUrdh4w3CCpYM3cTzH6IRqz7ccVMKlQI
	0zK1fagvUjty6TrG58h/nf5Qv2JRF9yPryVYnFNJbi5tkcU0t9Pc8t7gqJH84wPYLLWmDrGqIIi
	0+Fk3n1HKzCr3sDYxIUDRrkeOPvZucSrIF7+z6oe9voqZs29OYAMRHxBNW4HL2kEEV+9UUdJNNE
	BKRcXReEx5Uwo9UXwdbRVX5hCy1ZuxXe1/i/+3CZW+1ziMMbi2z2y/Y6BOnIRKB4tp3CYn8qokQ
	uSWKmc1HkRl+s6ZzoKroTxeW0IZ/XwVsIuwHTIF8Hb1Vy826GKzsJL7sGlxqJozYZli1f5OsvqQ
	c49+Vs7vmhfvaosbqGTMmkJTCISO41bVth4HMZ8SlKaiz8zYcedL8HIkKeCPvUaoudBXvKboBLa
	eaF9zeZqXua/SrAa8VXGXXlL4L/Gd2rgxrVZNHTaOSMDzM1rJEsJhpIcU18/tkweaHeuLgTyf5l
	gr96KUT9oWCPqMCongNPqJulRv0mr3DvT3+WaZumPqp/hJQ==
X-Received: by 2002:a17:90b:33c6:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-3933b96b54dmr9439025a91.15.1786747558720;
        Fri, 14 Aug 2026 15:45:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 014/109] catch2: upgrade 3.15.0 -> 3.15.3
Date: Fri, 14 Aug 2026 15:44:00 -0700
Message-ID: <20260814224539.1523174-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129078

Three bugfix releases on the 3.15 line, per upstream release notes. 3.15.1
fixes a potential out-of-bounds access when locating the start of a broken
UTF-8 sequence during linebreaking (#3096) and TEMPLATE_LIST_TEST_CASE_METHOD
/ CATCH_TEMPLATE_PRODUCT_TEST_CASE potentially causing ODR violations (#3161).
3.15.2 stops --warn InfiniteGenerators from firing when the generator was
limited to a specific element by path filtering and silences
-Wunused-parameter in -fno-exceptions builds. 3.15.3 makes the JSON
reporter's number handling locale-independent (#3176), improves inf/NaN
handling in JSON output, and rewrites catch_discover_tests for a 4-5x speedup
with deterministic registration order. No API or ABI change; only the git tag
and SRCREV needed updating.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-test/catch2/{catch2_3.15.0.bb => catch2_3.15.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.15.0.bb => catch2_3.15.3.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.15.0.bb b/meta-oe/recipes-test/catch2/catch2_3.15.3.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.15.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.15.3.bb
index e68fe9c885..f331a09f68 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.15.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.15.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https;tag=v${PV}"
-SRCREV = "6ee0826dcae55ed1e06b2c5701981221e979e1e6"
+SRCREV = "95d8a61b089317bec800c7cc4c64064cbcb3802d"
 
 
 inherit cmake python3native

