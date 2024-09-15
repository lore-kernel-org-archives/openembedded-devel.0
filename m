Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7574EC3ABA6
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 19:37:24 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.121518.1726429034502888036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 12:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I7/FvNEz;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20792913262so16332515ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726429034; x=1727033834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnK5agy9Bs5pPbZ+YcRjqyI/vJuLHGc01F1xvSWeqqE=;
        b=I7/FvNEzcYUFIl1tntZEYap91ghBvXhRKSMq+hbULoXJeTh1HyRxoYEPQdzzlPDODN
         3vtZXn+apsheFeDahk5XSi7SrLS/2NJwa5ef6Jg6YW2sWAdvRrGp2Q0EA5gEA0VRLCnZ
         qwVAOWRnaPmiJc9V7mWtn4Zjp8VaD3cSLhzEw1qJLLb5QYSIEftPtlQoySQ/lUKZnLJV
         1NpotRFxVmEnGtSJnTvuG5i9BLH4U6ivrggtzu1hn7QI8mA5MfCjMTJRbfWA9BFHvmoQ
         Le8/2H327a2HljcCPneNzQeMVucReWgkMIqwwNi8Yz3EpGZnaAqx/SU4uF9fXO5Q1DxS
         MslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726429034; x=1727033834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnK5agy9Bs5pPbZ+YcRjqyI/vJuLHGc01F1xvSWeqqE=;
        b=Z9K2XbyrtEYZAebG2DfNXxyNTUUNrkHZ4cKE5l9jHePAF7FdRnkH8E3aIb0ZK3wGMF
         3yOldURNjyTAzyHUvjb0UEVGAjqmfPTKzdfenUFtQLjAk1qp0JvG+dlqBa4VdVNGM6p/
         11yT6D+876ydxexk/3+bSfpuBja77QLu6MKxsSP9Zz7HXfZlj6BqY1F1q1m9SRZ+1hA0
         42Cb+ynfg1+g+f1UVDqqY5fFnDBL+gU2hykTpCM+EkZaeqnBRENCs4c7/nH3zsQZm3n3
         bNOIn77j5jukmYGToo9iMjkSCHP4dP863CaE2E3yoTXnNp7MsLs8nhcN0VMK31Zlovlk
         jX6Q==
X-Gm-Message-State: AOJu0YyXC2q9d0Bcnyv13ockHJkZAu+Wyr7ySi5TXdypvW8AcNgk9F4i
	hGJiIAhjWuQz7Ndb5yrKgwc/e2W7KGEScfFmrfpvg/MHDOYO4MvOul2xyWKx
X-Google-Smtp-Source: AGHT+IGr64RHhXLHhj8ru3S9UIvZrBremfnDCFY8DT0oWevvnrJGUv++6Gavj0A4mB4ZuYDKUP+dEw==
X-Received: by 2002:a17:903:2b06:b0:201:ffcb:bbbf with SMTP id d9443c01a7336-207820502f3mr152706455ad.22.1726429033588;
        Sun, 15 Sep 2024 12:37:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207947364d5sm24688795ad.282.2024.09.15.12.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 12:37:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-pylint: Add missing ptest rdep on python3-misc
Date: Sun, 15 Sep 2024 12:37:08 -0700
Message-ID: <20240915193709.1131399-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915193709.1131399-1-raj.khem@gmail.com>
References: <20240915193709.1131399-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 19:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112313

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb b/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
index 0de1576af4..eae30dfbff 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.2.2.bb
@@ -25,10 +25,11 @@ RDEPENDS:${PN} += "\
     python3-shell \
     python3-tomlkit \
     "
-
+# python3-misc for timeit.py
 RDEPENDS:${PN}-ptest += " \
     python3-core \
     python3-git \
+    python3-misc \
     python3-py \
     python3-pytest \
     python3-pytest-benchmark \

