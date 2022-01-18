Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE77EC433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 23:00:06 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web11.1996.1642546805498822924
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 15:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=LRrLl8sc;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.201,
 mailfrom: 3debnyqmkalmptdzhhzex.vhf@flex--wak.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id
 v70-20020a25c549000000b006130de5790aso1175665ybe.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 15:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=cCYR/99M3m3LGrHOYH+UIyadok6vh1YQvW1ZGm6+qSQ=;
        b=LRrLl8scft+X4Ul8o+UxvRKUULtT2huT5wY5kP2puxZFPPIQu5h/eBT7VjBeNzqnYM
         HSE/vpqIrMlLeZGZq4ymQEkoFD8mSr6Lmloo1Kv1WqyY0Omu8am/slhf4bYtpogckM3P
         6zsLHuAiQO+4X+5/W+kbz7P50y3IvVQFzDXCcHr3MkusjYSgQ3JNyjuuDSiWclUPLN1M
         h/791Icxh/IhPn5CEhk6nntEA5/+gi9MLnSeRLw4PB0RwIqYXulRXIGGuXD7oQUB7ZTm
         S3CrWPN+22/FWGrxJHOm1/1xFwMSowsmNiAKLFbgPrp6xoMoVrcAyFH538K8H+cSU63V
         gaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=cCYR/99M3m3LGrHOYH+UIyadok6vh1YQvW1ZGm6+qSQ=;
        b=KQsD4eG0fm8Kv3Bi49z3vSmTlOF5UIB/y4+y3BOxiB6wpGg1ggSwi1cdCkv8qWUKBK
         LfHaDffsFora1eh+xHJf5nbctyXnroVcOGe/U1vbV1biZKXg3QPh4qMkY8xCAk85loGj
         AMLuUqDq61AfGZtnPBlnlFjXSrDg7eZyK0ATrucpv+2VzORDyXy/ot/brMPvYYWGenrY
         7MTKuJIaoPHkqUrY9dgkoWw5StRVg1Y7d773b3s0jcdLD1ZQVJtZRjED58cc0WIKrOM9
         2O/rXEkcvIqCnDxZvD5lvEUsz/3ODiHJYrSWn2Ff7iczL9/NKKfwwHjdasuL2w13P5iB
         Ys+g==
X-Gm-Message-State: AOAM533O+xSXHPE2CJu3K6OQTIQQEULkpvCeCTLohhls3MeN8tFaU2Eg
	pRDGiqQmQlmMoPwN2udn+ZjD04XuOMUNLCYK3FVSFmb9UEcIgi9FfHw7y4bCutOnUILsPAeTGFf
	+KQ7V9clr/On/0mQ+pZK1HxLtHVjr6Ip166S0e71RIRN5g2gmiqiztL6fsTePLPbnGRpE6swdI3
	SuG+M=
X-Google-Smtp-Source: 
 ABdhPJwgja8jjQbP9MfVCVHWM70OruyW9BQZ5QGw0K/fdr4RtHwm9cCs1kPZjP/P0DEFIfVL2KZfrSU=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:384:74a2:b8e4:d9a0])
 (user=wak job=sendgmr) by 2002:a25:8045:: with SMTP id
 a5mr1115198ybn.607.1642546804547;
 Tue, 18 Jan 2022 15:00:04 -0800 (PST)
Date: Tue, 18 Jan 2022 15:00:00 -0800
Message-Id: <20220118230000.834968-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [meta-oe][PATCH] jq: upgrade 1.6 -> 2021-10-24 git
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 23:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94922

JQ has gone through more than 3 years of code changes and has had
significant performance improvements since the last release. The team is
still figuring out a new release process. Use the latest git commit to
pull in these changes.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.6.bb => jq_git.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.6.bb => jq_git.bb} (71%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.6.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
similarity index 71%
rename from meta-oe/recipes-devtools/jq/jq_1.6.bb
rename to meta-oe/recipes-devtools/jq/jq_git.bb
index bfaeed5fe..102bb9f15 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.6.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -8,13 +8,10 @@ SECTION = "utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=15d03e360fa7399f76d5a4359fc72cbf"
 
-SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-
-UPSTREAM_CHECK_URI = "https://github.com/stedolan/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "jq\-(?P<pver>(\d+\.\d+))(?!_\d+).tar.gz"
-
-SRC_URI[md5sum] = "e68fbd6a992e36f1ac48c99bbf825d6b"
-SRC_URI[sha256sum] = "5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72"
+PV = "1.16+git${SRCREV}"
+SRC_URI = "git://github.com/stedolan/jq;protocol=https"
+SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
 
-- 
2.34.1.703.g22d0c6ccf7-goog


