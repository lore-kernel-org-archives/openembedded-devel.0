Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3B9C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 01:10:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.3015.1684717838947717052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 May 2023 18:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HEWKP7Rv;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2553663f71eso966953a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 May 2023 18:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684717838; x=1687309838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU41XBPfB20sZSN8OW2nIFZkF5Uuyfgt9l2C1naapWE=;
        b=HEWKP7RvDqo7KwsTHKeKkqqZzGInCSgJZOyB4kOiARHRelLug56r0PO1ssJPjhfK3Z
         ZCgKp1YPrDPpS3kuKWAh/HProGrLVcgnrT2b8enzT1pj/wXCWcD7/1aI8HIf5DZYt5/2
         sS3Qt4sr8z+Zi3i9JYrtBLGMoeyrjTDu4ZLSNGKAeQvvhnji3CT6HMwBGKUBs9vaJ26r
         +Z4JonteQZbvr2uX4ptPVQuslRQKilRHHNtKFfJY2hoPSwz4ETnKws0bNk7BQH1sm1FI
         Jr0tgSXq4pdDjk2Fdj35OdKhCn8wMX3DDLNyZkrPhW9QolRKtn/HmE6hcHOFVLhAbIJu
         UOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684717838; x=1687309838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DU41XBPfB20sZSN8OW2nIFZkF5Uuyfgt9l2C1naapWE=;
        b=B+QUotZqWC3Qoi22TDdtmrhO0Iv0Jdta0EVG6xPoSX1/PCwnFtnKkK7cgF88XQG2ba
         7Uv8c/XtYR38De7ZknBjw0/yJCNcxZxTHKcME/7L2DUQSirP2rzLw4JGL6FBHUdjjVC9
         z53OicSHV2L38IyTAaudTP5hLO06uWZGiUW9Rga4naDDyUw/tbpnuIIiqyNiUZd+Phum
         shlKoV8Qk0V0UxT4q0oRGQCYMxB30ANb6LNByIE6ITyc2t6ruoOAt7cTlymRc5RU5wvk
         0/63SjZYrFE8HQYV9ZMBwEQLBUENAyZBtr6XHPrwcJ9bwiAZhOqlaCzsd9kCroNQZCVx
         YKWQ==
X-Gm-Message-State: AC+VfDwKPEqvAwRmmgqyMEjbJ9HwZ1iHYUB1ciRNrCaH1RR7UN2avAEE
	7X77WLv4HYzoAP/0Wiz9X5XClIsVgYk=
X-Google-Smtp-Source: ACHHUZ4/lfPW147cbh/ak6mLYG4UI5s0B4VsDM0XuUOW3SeJKdyitiLv0VDrKJGhBMjlFTQyh2B1Hw==
X-Received: by 2002:a17:90b:4a0f:b0:252:8910:db42 with SMTP id kk15-20020a17090b4a0f00b002528910db42mr8966171pjb.1.1684717838026;
        Sun, 21 May 2023 18:10:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id v23-20020a17090ae99700b002532d74fb59sm3037349pjy.22.2023.05.21.18.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 18:10:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] mce-test: Pass CFLAGS to make
Date: Sun, 21 May 2023 18:10:34 -0700
Message-Id: <20230522011034.1311197-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522011034.1311197-1-raj.khem@gmail.com>
References: <20230522011034.1311197-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 01:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102694

Fixes QA errors like below
File /opt/mce-test/cases/function/erst-inject/erst-inject.o in package mce-test contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mcelog/mce-test_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index 99487fd9b6..fd302db897 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -23,6 +23,8 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 S ="${WORKDIR}/git"
 
+EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
+
 do_install:append(){
    install -d ${D}/opt/mce-test
    cp -rf ${S}/* ${D}/opt/mce-test/
-- 
2.40.1


