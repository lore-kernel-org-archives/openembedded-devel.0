Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DC9C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 22:39:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8242.1708727949965976734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 14:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hg6uT3bz;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e435542d41so1080296b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708727949; x=1709332749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GImbrk8kAKSpkYDq1ewSrOFXcoUmiBXsTzGmFJT9k4U=;
        b=hg6uT3bzIGVjs2vilW+nFp3Cqdu/1UXglRExYJRYikg/K6CvXUzDUU38IoD7+sGudV
         VSY8QWYDV0SAaBkDN1FqNE5/fWeotqeR2lhW2CSov+JpajTf+CZ0dKoarMu9hEssKT/4
         c9E3G+9FUom9+PEQHVT3hs2for8KI0NufQAkM/TOwZQnLpWjTZt6sdwttM5xpOUY92eO
         5r2IeHNx2pYgPYmTtuddvfPz+/qWX1JLGpyzamzvf7jmAO/aZq4mz7oCWdGub5ChvtI4
         2wJXwrGrIbbfaJ3EwQbo3+RGhgIzmXng9cUZYidDWZk5AgXlkUxnoLxrnUDZAnW5+Zie
         HwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708727949; x=1709332749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GImbrk8kAKSpkYDq1ewSrOFXcoUmiBXsTzGmFJT9k4U=;
        b=CaqB58tcXomG1wvmVmHP3hdXeFCrG/eI55YT3ylbehSiZglTsIcS54FRKp8gv7P8D7
         Aoc3zTVxTK1pXBvlwZHiTjW49e+xWXSmw0OjYQkMsVpAwmV/d4UcPwDGDM/Z8wdiMKja
         z7SMe0WacN0Tejv9eBMJ3+s1RZHCc13a76Qz5ZRp7g7uKZoS1qyhYPgW1JJZMfhOwN9P
         FBgGBNK6lmCif+595SlifhfSbDAeDwYBxr/SxnJHTePEnANZFhYaYYcfih4lH1FI5ysO
         Q72KoJ+ZGw5K+ab46E2z+aQNBRlxOF16t6MpDvXkptdYSHS+amZfdRs3oFoy7h4M8Sx6
         Ejmg==
X-Gm-Message-State: AOJu0Ywmamg5KNbjbWD7W2YNsdrVy8MAdvy2eTQ82sev58s8dz9joHLW
	I6aC3X83JfK4PYhgT8fDyEPMDR3X2z0RVMdwBhKMrteObKd3yG90+LN5PxG4PZM=
X-Google-Smtp-Source: AGHT+IEdZuE69GqN83gLjL93TLl//7Bv91a8gTyTHKW2OdxGGSWTFg/cKtXB6l4mbaiBEW06TFTw3w==
X-Received: by 2002:a05:6a00:2911:b0:6e4:ed85:a3fa with SMTP id cg17-20020a056a00291100b006e4ed85a3famr1467447pfb.13.1708727949092;
        Fri, 23 Feb 2024 14:39:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1220])
        by smtp.gmail.com with ESMTPSA id a10-20020a62d40a000000b006e4e66d6837sm1579111pfh.216.2024.02.23.14.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 14:39:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] ptest-packagelists-meta-networking: firewalld hangs therefore disabled
Date: Fri, 23 Feb 2024 14:39:05 -0800
Message-ID: <20240223223905.928368-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223223905.928368-1-raj.khem@gmail.com>
References: <20240223223905.928368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 22:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109019

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-networking.inc        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 6b41bfcf1a..5d0100bd80 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -18,8 +18,9 @@ PTESTS_FAST_META_NETWORKING = "\
     tcpdump \
 "
 
+# firewalld currently hangs forever so disable it for now
+#    firewalld
 PTESTS_SLOW_META_NETWORKING = "\
-    firewalld \
     net-snmp \
 "
 
-- 
2.43.2


