Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F5DC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 22:39:18 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.8143.1708727948707441755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 14:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgD0OtsO;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e4e7e2594cso745666b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 14:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708727948; x=1709332748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nm1P/dYjGJwFPkk0m4U8zhJeOqiH/LyC39JE2zf8D7M=;
        b=DgD0OtsOUjhUFyUTMy/6Qemo+xy2mnTvJ09xqDTE0U31mvXbuwGsDmd7O+prJP9/w7
         RpIcAoywbK74sjy9l7mmmh1rZ77PrKVMDyyDZ8eGjnQjjE/aWGOD0YJzInHZT10aGQJy
         yJS7wGqKOzXjeNcRg6jl2je5Rvn1tZG/wFcACFl6t0SLf9f549zNmizfEBupZlXZQkwL
         etsK9pe3dg35utUnPC/ww+TRM9UMYK5qoVWsr+CzlTm7ur+4wIasA/BUpq4umu/GdUUL
         OcJOpT7LCVUuatfAWOtnruHwbQc3ODmlXU3sH4Dkm7kWHufmnFfNz9xaZMb5FDvZtTZq
         gVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708727948; x=1709332748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm1P/dYjGJwFPkk0m4U8zhJeOqiH/LyC39JE2zf8D7M=;
        b=sWq3aGjhVMxsQf4wX/l2JjNTpa3Mtj0UYeXFokAK6wacN75LOzgW4h5G+7jUKxJnrD
         vgL0EiTSRWHCJJtdZcgytrGRBWsUcd5utFnWWCq8OuVqfgzAR0JCwPghElScZaI7/78y
         5CCJv8jKHvASAZDR5DhtfbHjY3qUZd50p4ZCiafM9Dxc1I1toU3aMI5hK7rdhEz8je82
         IuwhxqktKRktI9NfrxwGb0YgVgX0JcliN00inpDrjQ5ZICc92gOkFq+4mw3gxJyfAD9B
         EsdoUVCF4CAYBxcnDMMDFFHOlN6bTgdlKx/cbA+kKknfMZx2osoR88nCGVWwL3M8yKa1
         NO3w==
X-Gm-Message-State: AOJu0YzLFg2HMEdPqZqobzu4+X0ujRdSrL9UtYnafgIk86sIt3/GSRDx
	odR+PBLKDmw2Q1ftG53L+vami5zWSE/Y8jqqVpA1muLrkJv+RdKsRACQFaZGnKs=
X-Google-Smtp-Source: AGHT+IFBequdNeuq4h/sDfPl0Ku60h4T8NSRV8ar4dXnAY43rWW2TmKHeG+6Ee6IAsHUMS8v/L3MBA==
X-Received: by 2002:a05:6a00:18a5:b0:6e4:eee0:5798 with SMTP id x37-20020a056a0018a500b006e4eee05798mr1603950pfh.14.1708727947791;
        Fri, 23 Feb 2024 14:39:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1220])
        by smtp.gmail.com with ESMTPSA id a10-20020a62d40a000000b006e4e66d6837sm1579111pfh.216.2024.02.23.14.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 14:39:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] ptest-packagelists-meta-oe.inc: Remove oprofile from PTESTS_PROBLEMS_META_OE
Date: Fri, 23 Feb 2024 14:39:04 -0800
Message-ID: <20240223223905.928368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 22:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109018

Its not in PTESTS_FAST_META_OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 0645cfc753..a0e23bec42 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -72,5 +72,5 @@ PTESTS_PROBLEMS_META_OE ="\
     pv \
 "
 
-PTESTS_FAST_META_OE:remove:riscv64 = "oprofile"
-PTESTS_FAST_META_OE:remove:riscv32 = "oprofile"
+PTESTS_PROBLEMS_META_OE:remove:riscv64 = "oprofile"
+PTESTS_PROBLEMS_META_OE:remove:riscv32 = "oprofile"
-- 
2.43.2


