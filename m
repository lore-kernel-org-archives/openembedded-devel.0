Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1527C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 19:34:38 +0000 (UTC)
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by mx.groups.io with SMTP id smtpd.web08.2324.1664220869845010621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 12:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=NIu0Isbg;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.201,
 mailfrom: 3xp4xywmkakkfjtpxxpun.lxv@flex--wak.bounces.google.com)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-35153b4b756so9471007b3.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date;
        bh=GUyZOfz7FOmXOibSqlBJ8H5xB9NE5CW+UDKIwhQWECg=;
        b=NIu0Isbg8l+r5CCWxJmflmwzjbpfjDUVPFsu0g+rfTAjn771zxlA2ID2KCfR48kn2v
         aNO7gsiFJFF8Dod0nXqoRD8RLEQ3NDPQ8A0J0EmuP+do8t5zF21aWmkXWhUlhhfIrkAd
         OgWkpQpIZZuWTuXDBkAWjC68+kw+LtJe0hFOdrI0OTOtqoRTRdfT25WdY6B2mRrFdlUc
         82QbNP8AYUVqM8GWTr2t4XBf2X/6lunYFW0LqCvzcR5TPAYxBVJIebZheyEMFJERON1B
         IOPPQeNrUWWbzfIqjLPHNNox2djT3kRUN9OvBO+KVuW1G7eieAKeFR/H73JVTQEZlby6
         T7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=GUyZOfz7FOmXOibSqlBJ8H5xB9NE5CW+UDKIwhQWECg=;
        b=sZiDaVxXp54Kc0RU/fIkP4NASx76Y6haChmRVNSai0X9EEkaZ424FbfnOucGUKhs0/
         XhuAAA2/2gtPgloSnS033zIZmYXqDYHYD5tcoY/5NInCOJ75bkdyqqn9XtrsVYYrhO1l
         2+F9X4YrOmwlxfbfodR3hDb/l+9EOfHtSK8t/aoDL8OIcPgj8GTeVWzW+oj+zHxw+om+
         bpwkA7DGimLmTebSu1LAWcGKrFYFPM97fiI+wiYR70glW6K3q1E+MDwCIa9HU8yqLR2b
         1O03LkIbZhfuwJ4dMt70+4KRndwTe8/fv6kmSLFR1yfuERtZPV/tOHgjM5esy16jIC6g
         fUew==
X-Gm-Message-State: ACrzQf1NfCQCbrjs47uAKwvfHIBBpSwrs//vhZH8DV2mldFD0pCahOhU
	oZlyQgUeXUweIQS2YVU5lbiH2KjjztZdbsFU2JGxtV4Ega0rHSO/fPi7zEsv3Pnr55SaUjcjgR2
	dzJPslOPATGpTUC3M6Z4lTFgxi+7mTe/73Rv68BcCjGTsQ0LNuXyBwpPN5S/D7QUVbs9A1Oc2zS
	fTHuU=
X-Google-Smtp-Source: 
 AMsMyM4ZTc9M69Z0TnjS0mfLm2iRT2seEQHMpWXFCMTCN9w/PL0vYQx4KlscpctK1G8QX8Etvkc+Nb0=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:cade:9738:3308:776c])
 (user=wak job=sendgmr) by 2002:a0d:e247:0:b0:345:711b:c5ef with SMTP id
 l68-20020a0de247000000b00345711bc5efmr21363582ywe.230.1664220868920; Mon, 26
 Sep 2022 12:34:28 -0700 (PDT)
Date: Mon, 26 Sep 2022 12:34:24 -0700
Message-Id: <20220926193424.427667-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Subject: [meta-oe][PATCH] fmt: upgrade 8.1.1 -> 9.1.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Sep 2022 19:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98955

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_8.1.1.bb
rename to meta-oe/recipes-support/fmt/fmt_9.1.0.bb
index c53dd3890..34896153c 100644
--- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
+SRCREV = "a33701196adfad74917046096bf5a2aa0ab0bb50"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3.998.g577e59143f-goog


