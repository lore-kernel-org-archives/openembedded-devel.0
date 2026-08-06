Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2BDC5AC7A
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:30:55 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18154.1786019448023700429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 05:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YBhw3FDK;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso954483a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786019447; x=1786624247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFdOC6I64NI63+qZ6VRXxlcq20+jOp3T9NaDKC7FRpI=;
        b=YBhw3FDKawfspeuIBsWZZKvPuL1eRxLrg62WvsUE8moNVWzn+cgFOefxr3SApNsvU7
         zEn84EmVyHpVM6UJwY9yI5PeVV/cxEiZ2yx7VmTgFP3mEe1HM6YB3gNONTruzgXZJ8f8
         vxaEk90ui8yCY675EFPDK39HOx9iyW5I2Xn8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786019447; x=1786624247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFdOC6I64NI63+qZ6VRXxlcq20+jOp3T9NaDKC7FRpI=;
        b=I5Iq3BkssOAZjQXADRK2Udltc1RMCIh8wdRDFtdV1tfntE181qW/a04kX7hzEEPG/n
         rmwRhUTO59PrHMMtdBfH3sTTATw8AzE78m8gtKNR7Nn4MVP51tNzT25gMuh5RWRm0arp
         tf8XpKpmo5KaemL3BCLPj7CeYo0eie+HdBzOmx6cNlKB8wZ7IWgqhMZsMWh/aEOWe2iv
         YYxxNqhgHNEJ8jIAvNz/X2CSNOzDmhX39RoUcHnzSFzlSKFEujM/WXM/b8F4ha9nfvuT
         sxkkEqOlVuFrWSj84GMw/sTvAVOYVxYxK7r2B1EYyltFPcCYvgbmrY5CPa7UBKXXO9MJ
         aI/A==
X-Gm-Message-State: AOJu0YweRSiDdTg4npl0vAm5JZQT9VqNljHSCbUEZ6qdgTJJuY+fbbgG
	5we+cKx3nEsmEhPOKuO6fPJm3TpE8cAhsExDKTn2AeV1mEFdTSfnuHEuCs642UT75gp4v0E0AEu
	wN9IEYiQ=
X-Gm-Gg: AR+sD134sakZC4QUxsW4R3y+X64wxLi7qXOjObca2hFkKAh78zCKDuv7SoC5cErd+gr
	wgyo//wRbd10jg+bie5KavY75FnZS5RjZr2n9H/Msu4kGQt2YVkib75bbIqeoFB9wsXmnqK1/DT
	uikts8PXF483UsvSS4Ai5tdprx+Yy4zjqU49B5hSqBoywdO9sa/xW/KWB35BY4Fby1Dv+t2UZpF
	W+O7lOEf4qvftSASXeN1EXuiyvIUu9JKByWxMrIlLeKOCRmXQNFCLmUSlMEeME0PFWYixElqwGW
	wEEIheQKt2HzCEhWrLPQu1BUAFmYfvnFFqm+6edJmd+PlCc2l80t8usu4yyQaf9GFNIARD16l/u
	mlyRfc7/SFlH3X0mkv7zJXzq49WNDzollg2vS3s0hDphlq9UvjjQfbaCn5j8YLVQD0RmSpS2GD7
	nYRbESK4Gt6gS5fIuucILoIgFnQuaA2n0PA3MGlDVJFkRBzbATGt8ihFQQlGA=
X-Received: by 2002:a17:90b:524a:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3908974d471mr1739308a91.5.1786019447126;
        Thu, 06 Aug 2026 05:30:47 -0700 (PDT)
Received: from MVIN00352.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158678ec37sm27658066eec.23.2026.08.06.05.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:30:46 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch] libssh: Remove duplicate CVE_STATUS entry for CVE-2025-14821
Date: Thu,  6 Aug 2026 18:00:38 +0530
Message-ID: <20260806123038.48655-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 12:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128848

The CVE_STATUS entry for CVE-2025-14821 was added twice in the recipe.
Remove the duplicate entry to keep the recipe clean

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-support/libssh/libssh_0.10.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 1f64920a50..1e1b5fb0a5 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -46,8 +46,6 @@ PACKAGECONFIG[tests] = "-DUNIT_TESTING=1, -DUNIT_TESTING=0, cmocka"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
-CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: The vulnerability is Windows specific"
-
 EXTRA_OECMAKE = " \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
-- 
2.43.0


