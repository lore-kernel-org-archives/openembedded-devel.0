Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07612C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 22:30:01 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.56516.1680474598942557401
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 15:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MNRri8O5;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so28631185pjt.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 15:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680474598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1Di7NEm4GZJyoy8lcAI9tVaB+M+mxS5IYCwNwyMNBs=;
        b=MNRri8O5pPkA/juWQjbtvot/xeRAS0XGTqIhWIHiVmO5SY2qehT8KcuuaYvwmeQV9A
         3rCdzqCbmUpeTaq11vhvQC6XsxnHkBJtQZGHkDQivH1m8DakeSMVSxN6C//JFEvx0wVg
         wTm8+qsTyS7IBKcj+xz6eQG011+NED4MGXjmW+mW8QbBay7xQxcAvUYb3VaHSnYFc5xO
         1OohIvVkYJ82sFjyZjvOmkBJtWncZCKuvvFAqTo1T+NRHLIr9anQc+ptR/66uE8Lz3h0
         wVcCcX+wLkTkYy2U8JtfCOydKeRqc6JxXAiPFKv8wnvS3cZ79GDVluJnk+owwOeuutNj
         ERtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680474598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1Di7NEm4GZJyoy8lcAI9tVaB+M+mxS5IYCwNwyMNBs=;
        b=WBFKeGFTS8x4Hia+UGHyCTIOrnrvBMxTW1T6eiZtgXxkYpjvzapQGd/z0yWAbdLurk
         KlrTsnnCFBk0ZnhGye1A5RbH6NXkzTUuA75kDd3UwyjpcW65AczzGRiTqTuVpb9SoxFZ
         ws5w5D1v1hX7YFCWT8m6HjRgDa5DSJKBYI+ZxTCvzHxvqBH5wXNJIny5IUnbGV/BSgs5
         q3gbKmykaGVGNax22VCqL/txQO7g46a2NcSCW/xF4CGTGnHb+kGN1gcjt1oqPQ1EXUdH
         NBHNYJY2NLTxPsCUinpFMyKKRLHGj6LG/WQ2nYIXp/HykhpIDo6QUoPTxICbkypKqFwR
         S+pQ==
X-Gm-Message-State: AO0yUKVpKk9VHVxPJmZqw3PnIhJoJYbqMk+XzrPJ3TL3HDyJwkmZ2DJ0
	59UjmD9Bul70VFX7nXPB2tFYyqG7pbw=
X-Google-Smtp-Source: AK7set8o9IDEmaAUsldz3IXWHo7KOQGqzLuvnCSR+082oNpgSAKVCOo6u37PlUjtGP9B4spMRYVDNw==
X-Received: by 2002:a05:6a20:6a8f:b0:d9:adc3:6a6e with SMTP id bi15-20020a056a206a8f00b000d9adc36a6emr26069139pzb.56.1680474598049;
        Sun, 02 Apr 2023 15:29:58 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:c5a7:cc15:fd65:db07])
        by smtp.gmail.com with ESMTPSA id x47-20020a056a000bef00b0062cc53e5db9sm5404357pfu.197.2023.04.02.15.29.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 15:29:57 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 01/11] cli11: do not inherit ptest
Date: Sun,  2 Apr 2023 15:29:33 -0700
Message-Id: <6398e3aa0ee8033489c2e86752d7cda5693d3e2f.1680473253.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680473253.git.tim.orling@konsulko.com>
References: <cover.1680473253.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 22:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101879

This recipe provides no run-ptest script.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-oe/recipes-support/cli11/cli11_2.3.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
index b9ff914da..7c6b2547c 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
@@ -15,11 +15,10 @@ S = "${WORKDIR}/git"
 
 do_configure:prepend() {
     mkdir -p ${S}/tests/catch2
-    cp ${DL_DIR}/catch.hpp ${S}/tests/catch2/catch.hpp 
+    cp ${DL_DIR}/catch.hpp ${S}/tests/catch2/catch.hpp
 }
 
 inherit cmake
-inherit ptest
 
 # cli11 is a header only C++ library, so the main package will be empty.
 RDEPENDS:${PN}-dev = ""
-- 
2.34.1


