Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A77EE498F
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 18:51:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2332.1692384664061822717
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 11:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=e+ahCr2V;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1bddac1b7bfso8934585ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692384663; x=1692989463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+3iqxMCSS7Fm68kSmh5J8WP/OXOLaRYXnYKNvr+70A=;
        b=e+ahCr2Ve/VYn3kOxa6I7GIQxvKXeSj7NIvjbIH3BR7A6WH2gGnUcwnKIxuoofNe3x
         p7zUsBg/YKpWyKa+EnO6rJD88lkn5nWUf54l4UK6d+RLgnkh1VBfpn8Ufu0Uco404Yvk
         aDbdctzNhr5Whoqlhf7QD6faZoZAkvz2kFYp/YO/dIvwO2CiR8O55deENHADt3N0r974
         ziDPueAkw5Unc5vRsZKCFovU2NzBwqX6kyVmR2ETiD0y9hpx+YTycjxAjSFjFCMWf5gs
         74Pa5mcV0DpyJP6GNmpq+RCpBC884xN8yQvpH9CaMv4Ie8kiMD/bTBNO/KxDA8afJZYM
         RRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692384663; x=1692989463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+3iqxMCSS7Fm68kSmh5J8WP/OXOLaRYXnYKNvr+70A=;
        b=FHbMz9B1SO3tTqnE+3pG3a3wPz6BcnpzuP2Df/1mO9BpiIIsKAShbT4n2dATgBjl8j
         1LO/GRQ5aTu3Ava+DnWQnGnwkYf211tsPvJffncezUfFx5d98QbUKiJxNtGm25/UsU1M
         JATlzRBeh/ljnI+Ol4a3hZOZwd8F3KWlxuTzXyif4Fp5LedPA5M+UoY9M9iWaG4hv3v8
         jrhsKbM0+vslmm4Bdu7rtjcTK93hHy5o7xcm4iTonUlgoOBinNMODDbllLh2vLQkmIru
         f722ijGVGgi97klAPNxIVMfE2tj0AxOF/L6cWnc4978DhjcZophl7qMsyFhlmeHWayl0
         Oh6w==
X-Gm-Message-State: AOJu0YxWkEdkXSuZQY/0x3kGyIT2TqnMynirojBvn+MLdpXhAqQwjWf6
	4BiUvpKHZpwoBzNvvErzvw51SyX6iqtLIw==
X-Google-Smtp-Source: AGHT+IHYZKtdGI5laCitzC2sLgVC9gkMZkYL3KszLoHrTuX45rYemkpw9ndk96Z7HivUXKQM7oQ7Xw==
X-Received: by 2002:a17:902:d511:b0:1bb:55be:e198 with SMTP id b17-20020a170902d51100b001bb55bee198mr127519plg.0.1692384663089;
        Fri, 18 Aug 2023 11:51:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::e31a])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902968400b001bbb7af4963sm2094681plp.68.2023.08.18.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 11:51:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] librelp: Add to meta-oe ptest image
Date: Fri, 18 Aug 2023 11:50:59 -0700
Message-ID: <20230818185059.1376511-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 18:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104493

it takes ~35s so lets add it to auto ptests

RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (34.93s)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 77dace08a0..06f3e16054 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -20,6 +20,7 @@ PTESTS_FAST_META_OE = "\
     libee \
     libio-pty-perl \
     libmanette \
+    librelp \
     libssh \
     libtinyxml2 \
     libxml++-5.0 \
-- 
2.41.0


