Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C09D3F28A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.29967.1729278811605091235
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BvSfzWLX;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e508bd28so19652217b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278810; x=1729883610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpDapyS2PhrNLyS/CEZ/4ZyVInW4QOiF6Rk4cs+66EY=;
        b=BvSfzWLXFn12qAcTiNanNUf5lYLddbVWGYCLMnKbO9l2fPChg1kNF1OHIhgaz7IcAx
         fc0JYEFaJruRiTd6Aeos6OEJZP0mxWW2u9aNyR8xWLsAw6hQqV37t9JkrKUF2oDRYWWv
         q0f+4oxTiJi3AikrK0nmTmqqGZS19+n0uIRDkRCbpcuyAJmUV3BT/OwCeHEJ2izTNv0T
         g3fjaZer9iU4zQfnS1tjR+gers2pBo+jfiQ0fsuS/wLpDbItWEWK/3fKmQFP8j2aa3+d
         gYnTs3GRv44HId2NZxo7bWl+EhkNuw2LF/6A+QpXd0NeabKl3fBt02AwdVp0lfXjKKi5
         TD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278810; x=1729883610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpDapyS2PhrNLyS/CEZ/4ZyVInW4QOiF6Rk4cs+66EY=;
        b=GOJkBabHvqTpdHzoD3bwpqEDDRBbihPS/wonXCg5RiSctCEHwMR5o7kyAVJtCo2RbU
         plIH+Gt+p9suCPq5MKQ4GYr9YIa8Mo+/5lRzvWR019qzSQhT7ukWmfc+er6l8cI4k6pb
         lMa758pzw9gzokE0SCAIVtA6UfwGcaaEHYgQ4KSpHoCxn7XaCdDIrEjDli/yvPnCuplC
         0zwlSpSQK2XPPjapKqpsSY3CgjI5NIw7ODaFA/UFHk0de3XswCQh3Xjh5qeLhFseZGNt
         1Xdo23bT7mYPXnl0XyHLY8ejhb3AYRpyAuB3lTalEzXOyxEOH1CBGer3tW+KsmaHhHGX
         Ynag==
X-Gm-Message-State: AOJu0Yzl/1aLk43hDCVEVxXt6agD5sxwlPgPSV+DS/HnXEHgFYL2zN0a
	CBPgrDSjfuR9MJXHmmxm0eSnxlIGtadOmb4PyjiEP/P3JK4iHPFPGKNpjw==
X-Google-Smtp-Source: AGHT+IH8raByTY9PLSNj1B8mNx935QH+jAIkYQkGfipVaE4HbprfFWSZ9kqBUSwfkHL7tYW5z9YlmA==
X-Received: by 2002:a05:690c:ecf:b0:6e3:b8f:3637 with SMTP id 00721157ae682-6e5bfd4b9a8mr28482287b3.36.1729278810258;
        Fri, 18 Oct 2024 12:13:30 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:30 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 30/68] python3-ipy: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:17 -0400
Message-ID: <20241018191101.25184-31-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113017

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ipy_1.01.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 36d0b9ae2..6e65d622a 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -9,7 +9,6 @@ HOMEPAGE = "https://github.com/autocracy/python-ipy"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
 
-SRC_URI[md5sum] = "d6cf83e7f418ebbd23324ba1c658b907"
 SRC_URI[sha256sum] = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
 
 inherit pypi setuptools3_legacy ptest
-- 
2.43.0


