Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C67EC77B7D
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 07:45:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.6647.1684568718542284754
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 May 2023 00:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ng+PZ3le;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d341bdedcso1040009b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 May 2023 00:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684568718; x=1687160718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0aNsdpp6pUkR7WpuZJsJ9uFgf/OYijl/lwS4NswDX8=;
        b=Ng+PZ3leLWCUNHloiH9AUzuG+a57ufd8GfB3CVgTwixm+a6Rrz+K0Jj0i8ole22Yqg
         IpiXGWW8JoFUDY+3/8pBxDy9tjWA7mJA/FxX7y3183QnXSVoJAxF8Q2Bi4SjDcGSovwx
         6fiPjOx9R/9juGL5vSnhXwJ+JYppEkRc+e3WvO+Y7h+VyjoucDrZT2MWdgvK7u0XjnVs
         AS1j6uffDndnW9LX8utOzevW353n/mT6a8E5O/Wvt8b9/ZEuu70E7Cw7rOdEOjWDd9qa
         RzLQUb5pn8qfVZORJ30KXERT23/8uTSISlMptknhP+6bpiBCSSZw0z3cVPNe4k05W9VJ
         z/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684568718; x=1687160718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0aNsdpp6pUkR7WpuZJsJ9uFgf/OYijl/lwS4NswDX8=;
        b=Au2jG1/C5nvZywazNUta+uFC+T2drAfSzJ5Qrp/Oviw3zQjfLWwmV6kslO4ir8lYJc
         uiD2nyvqdUT62yqyCJiloc6W1RhiStcx0BUGw4qiAb+AWLkEeXjRFoUenrAcb0ZlGy9F
         4+hD7Tuz/Ysp9g/wvXYEivJ91Yd4qpOjaQH6n9k+bxA3VDOPCT6p1uSw3H0ScQONQrNW
         H33sgNzU3nKNf231EyRl5r4c4q52Y2dgSNaz+8krVaK9DqfFeVPd7TNoULaux9JUVN1j
         xQi3Y5BWYbgZsYCoIYH1RMKad0hkJBtkoy351eZc0fc2T5XbD3LuWkcGD9zCcGPTk4hQ
         9CgA==
X-Gm-Message-State: AC+VfDz+nxzmcj+3akax7GHgZKo6ge2XwmlzVA/Bm5SrwC6ytTg5LLsX
	3YC0zKphhPmfNUcRSmR+CMwrPNdWP4c=
X-Google-Smtp-Source: ACHHUZ5aJZEf6w+x6ZTZxYINWKIXH1AHUqQWqoXvg1/ydLRcpjWOx2xKO8Lkfts8MQE8Sfq694EDVQ==
X-Received: by 2002:a05:6a21:9999:b0:10a:c09c:bd with SMTP id ve25-20020a056a21999900b0010ac09c00bdmr1293929pzb.55.1684568717435;
        Sat, 20 May 2023 00:45:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b001a80ad9c599sm822140plb.294.2023.05.20.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 00:45:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mce-inject: Pass CFLAGS to make
Date: Sat, 20 May 2023 00:45:14 -0700
Message-Id: <20230520074515.306156-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 May 2023 07:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102690

This ensures right debug directory remapping options are passed to
compiler

Fixes
 WARNING: mce-inject-git-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/mce-inject in package mce-inject-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index d440a53d87..a228c3cc06 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -21,4 +21,4 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
 inherit autotools-brokensep
 
-EXTRA_OEMAKE = "destdir=${D}"
+EXTRA_OEMAKE = "destdir=${D} CFLAGS='${CFLAGS}'"
-- 
2.40.1


