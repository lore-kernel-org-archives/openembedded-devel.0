Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D4BC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 04:08:05 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web09.2182.1642565284318665317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 20:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=IO+fCDNW;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.201,
 mailfrom: 3o47nyqmkahqoscyggydw.uge@flex--wak.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id
 4-20020a250304000000b006137f4a9920so1982091ybd.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 20:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=P00tYhnGEpM/7O3OszPycw/aG/6QSHaIfHrhHeLmefk=;
        b=IO+fCDNW4s5eQvoqSk5lVW7HH6+uTYbU4cj1tBQwhj1byaSuQs2E5HZ7LDLZtDQ/h1
         rTuGIb0kaRHrYdl7VYie6cy+tz62frUyfX1/zl1xLv2TnEROA7mgEfo3z67c1zp5q2hX
         YIPZCfLdweLa763ZNpjYXwycKyCEYyhpsxbQIwWyQM5kt3/S4DeTe0zBnpuyxyxmpKAg
         mEDbQxz2zm9eIB7gxqJDUFol9+Vc7hun+YL5bOYNVjteQ+8f7EiLPobr1eClaN0HWpsS
         RWp3GyjvRSnz0QO53HCGs8kTC8Gnal/b58isH5/lu5LIIKFcO1KgAS6EgXW7EIPItgrB
         WdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=P00tYhnGEpM/7O3OszPycw/aG/6QSHaIfHrhHeLmefk=;
        b=HhN9Yg6HPrxtfNlPylL/slJibdJfYqJIJt17N7HUglUGdhUUZjOVgvuTaAXaWkOLXv
         2IPwHMjqkrHLBj5Z00OkY1P6B/QR+pWg6KVdJTPyrbfAWrzndXqFHaPdazH8p9sLY4sM
         yYFsd9JSCaiGFvjtnf+MQGRAD1qSfvM1J1dmpM8EJwZzFhOV6VVOaqUC0P62MMgGTJKS
         eSPrZR6bivFVGSBX4P3kBYylfL3tcS7UnNZH+fmZLEzdqlSkDy3SiWc+/Q0Uvf8dlmZM
         X7b277fYV4vsV86iIfhgPgyXVbv3NH2hT88MHvgbMUY70HzKxOtGN3+KeFsVaXPlK3dU
         1gqA==
X-Gm-Message-State: AOAM533UeE5xYyDWEqQLO8Vy8A7LNEJ5/ziZ7GsOG6jkmw2CNdT0j3U9
	D6SM0n68EkRvBLY6b714iDBTPq+QnpoxWNOlyq4pKz8Ba+0gLN8HSaE2/R6dvO5xzi5sNS5kiXc
	S7MJucSqlMUOPVkkzxcY4cmeQyekXcVrcWlR0Ruu/wB4PA+4+I47RRybka59HVCKnWz4dElPZiX
	QXv3I=
X-Google-Smtp-Source: 
 ABdhPJyBYcOd1sIH11nCI8anNW5m9JAmTFakUsNYNxQZmgs+mfiFW2M33t7FmugFZUkRpCGgApzOVcY=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:384:74a2:b8e4:d9a0])
 (user=wak job=sendgmr) by 2002:a5b:f91:: with SMTP id
 q17mr35451898ybh.546.1642565283436;
 Tue, 18 Jan 2022 20:08:03 -0800 (PST)
Date: Tue, 18 Jan 2022 20:07:59 -0800
In-Reply-To: <20220118230000.834968-1-wak@google.com>
Message-Id: <20220119040759.859566-1-wak@google.com>
Mime-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [meta-oe][PATCH v3] jq: upgrade 1.6 -> 2021-10-24 git
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 04:08:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94933

JQ has gone through more than 3 years of code changes and has had
significant performance improvements since the last release. The team is
still figuring out a new release process. Use the latest git commit to
pull in these changes.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../recipes-devtools/jq/{jq_1.6.bb => jq_git.bb}    | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.6.bb => jq_git.bb} (65%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.6.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
similarity index 65%
rename from meta-oe/recipes-devtools/jq/jq_1.6.bb
rename to meta-oe/recipes-devtools/jq/jq_git.bb
index bfaeed5fe..ef6fd1db8 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.6.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -6,15 +6,12 @@ HOMEPAGE = "https://stedolan.github.io/jq/"
 BUGTRACKER = "https://github.com/stedolan/jq/issues"
 SECTION = "utils"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=15d03e360fa7399f76d5a4359fc72cbf"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2814b59e00e7918c864fa3b6bbe049b4"
 
-SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BP}/${BP}.tar.gz"
-
-UPSTREAM_CHECK_URI = "https://github.com/stedolan/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "jq\-(?P<pver>(\d+\.\d+))(?!_\d+).tar.gz"
-
-SRC_URI[md5sum] = "e68fbd6a992e36f1ac48c99bbf825d6b"
-SRC_URI[sha256sum] = "5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72"
+PV = "1.16+git${SRCPV}"
+SRC_URI = "git://github.com/stedolan/jq;protocol=https"
+SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
 
-- 
2.34.1.703.g22d0c6ccf7-goog


