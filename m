Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E122C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 16:22:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.58710.1697818938379109437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 09:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JUPcmDyj;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-692c02adeefso860104b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697818937; x=1698423737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8UKls1Bx9+cknMHfkDJeJ+40cihWBXj+brXoyTLSonM=;
        b=JUPcmDyj0kd+uCQqbklA1VyOjmrH5JCwdlxXro0UAbldIm2Nhh+iz0NL1S3YjdVgSI
         NfM+p/leVCzsQCi9svxi814nsEqFQEulOmlKCpftpv651/K2uyIDPCCmXOhe0nzimtCl
         /UzOQ6NSSQfhcRN9ik0Dh6JR/brgGWx2cyEI+mlHUDH0ShBoB13xxe5U0lMMk1VF825s
         S2ASdQmYyZ6BdF7KfSp1baGh7rBFENJPRMM6iAR7vco4pnvpKY7rQqNqfeC1epU40b7E
         rBA9hcFoQV5yyM6kgdi5uEIlKvIGjYaoyfYdgKwFIxf//ZajkH48tL/jGbpYB8FaGow/
         egXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697818937; x=1698423737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UKls1Bx9+cknMHfkDJeJ+40cihWBXj+brXoyTLSonM=;
        b=hShZctiRfKWigiz1pbAxyCMBnyJH9ckgk1bxAMWvGzijAH9zeZzQcsMb1PCtnTNa39
         nbJf2Ry00cqGkN3kVt11s6HrmKZ/1/NpAOsjtOP53MFN/lRJarrW8mni4k2f9neyYKCT
         0SjTfHxJtxGaCalmzVJ6fgXMz2OxJgf7AqGqTFwJ+mPsZ8pw86h3D4vWdl7jZLnzHrb1
         J75yRdilcNhosF17e4FFfDhKBmCWp85BX5gPICy0AbQzgDuZzag3oCxR1bU/7phTUFh6
         6W3/00Z76JG0tA8vHKcCGCnAGNcik3p1cHUvS/KXPDuNnw8VTfyMS82U4Hq+OS6RXjqM
         0V9g==
X-Gm-Message-State: AOJu0YyOCk4fZs+eipcBf49+pxGauH4bP1Jh2EotCyoFAA28uATyFBpt
	Yka2KTT1EMep7iVnbzgAvqLy162+HHY=
X-Google-Smtp-Source: AGHT+IG4piO1eti7XTecZc06s+5M3aenwnmc7d60g6sEAt5l+PuCDMzQOn2/2Qno95Ev5tOlxUtQuQ==
X-Received: by 2002:a05:6a00:1302:b0:693:3f7a:eec2 with SMTP id j2-20020a056a00130200b006933f7aeec2mr2359551pfu.29.1697818937475;
        Fri, 20 Oct 2023 09:22:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b006be1dc1537csm1731746pfj.59.2023.10.20.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 09:22:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] meta-python: Add python3-rapidjson to PTESTS_FAST_META_PYTHON
Date: Fri, 20 Oct 2023 09:22:14 -0700
Message-ID: <20231020162214.2051668-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 16:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105622

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 043d4a1358..3272d98192 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -35,6 +35,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pyserial \
     python3-pytest-mock \
     python3-pytoml \
+    python3-rapidjson \
     python3-requests-file \
     python3-requests-toolbelt \
     python3-semver \
-- 
2.42.0


