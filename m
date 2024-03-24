Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05EDC54E58
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 03:10:12 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.22747.1711249810357390817
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 20:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=byIziJls;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so2536720b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 20:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711249809; x=1711854609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJZmPup00nVGlW86hETXuu03cdwo6+vxss/87gZyl30=;
        b=byIziJls9QquH0rJwUetGFMBlX2LS/NWjJsJsqE9QGZPH4Hrhm7CvEsQiJNYpLYrnT
         5WNmfWHRtRHngPAyyE151DATMG9/Fe+eQAr5RbxeTY8JGrHFdCL5dT9NH5bICU2ZwpTo
         jfOelPTv/ynb2wpppuyf9gaPLH964pkKvuXpXJDgEZKtgaRhqK5DvDGiMgMZ5q+hfkIS
         2BxpiH2qw+h8cr4Po2YhVfngiNeo7ZcUk5Ex3IXYwLoNEbL2GIqwQwXBD7ki3/CI9RcA
         QXJyuf3GdoMmJ+23zC3trZOe+JHFNdyBYhb2vCTmyqqggFOgdetqHayN4GDlDoYlPBsw
         dxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711249809; x=1711854609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJZmPup00nVGlW86hETXuu03cdwo6+vxss/87gZyl30=;
        b=etJA6+fzJrkmR9E9rFnVTtFGmj66JwV2hPab/ZhWyE+woCiZcMGvrtGmKOP7xTpv7d
         ByMEIqTfPG8hpvPbWgyD5cDSmE7nPIQm1HELs+Ia3axX/g9aGA7q8nxfrbMTtExY7auZ
         0BakNge3bApP7dzd+qnY49y/PyJiBK9irIn7AAsndLi33M3h44D4VWk1t78xC/ySDomm
         lk9il/fCTKXW9pfCJ0jwksBWgOLxR71akMfuqwoIvZg92Cwm9ZChhU8NM4VKMMA8SAHP
         2/q86vQDAyCOhQb5O/u9M1kaZVYib/WPT+QDK02qUNXr2AIOdcGnWPdH403HKY7PbdMU
         +05A==
X-Gm-Message-State: AOJu0YwNKMkD1f8UGva0D3JyC1NIYJ/XcTZX4XM0FKBJRtXtTZ8RzTBg
	VsBorRkC5lA4UeuDOKVtAO6vHZq+RxktYrc7tBS6qjnez9yWPxW1EjofKvZe
X-Google-Smtp-Source: AGHT+IF+h9iB5e1XhJqQXmL5U9dbBCXITWw8I6ueZuYZCpLkSOuouYwiNwmRWZ7bEZC4okYSsbRi2A==
X-Received: by 2002:a05:6a00:4b50:b0:6e5:9a0a:b668 with SMTP id kr16-20020a056a004b5000b006e59a0ab668mr3822938pfb.27.1711249809296;
        Sat, 23 Mar 2024 20:10:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::779c])
        by smtp.gmail.com with ESMTPSA id a19-20020a056a0011d300b006e740d23674sm2075521pfu.140.2024.03.23.20.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 20:10:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/4] openflow: Delete recipe for 1.0
Date: Sat, 23 Mar 2024 20:10:03 -0700
Message-ID: <20240324031006.3072120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 03:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109560

_git is the maintained recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/openflow/openflow_1.0.bb | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/openflow/openflow_1.0.bb

diff --git a/meta-networking/recipes-protocols/openflow/openflow_1.0.bb b/meta-networking/recipes-protocols/openflow/openflow_1.0.bb
deleted file mode 100644
index a7e254dd85..0000000000
--- a/meta-networking/recipes-protocols/openflow/openflow_1.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include ${BPN}.inc
-
-SRCREV = "5ccca75a69f99791659bcfbcf35353ab1921320a"
-PV = "1.0"
-- 
2.44.0


