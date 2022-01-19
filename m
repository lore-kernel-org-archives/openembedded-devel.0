Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC247C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 07:25:56 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web08.3512.1642577155768296184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 23:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=kAAbJuS+;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.201,
 mailfrom: 3ar3nyqmkadejnxtbbtyr.pbz@flex--wak.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id
 n196-20020a25d6cd000000b006139bdfade9so1769694ybg.17
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 23:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0HIEosIMrlInRl/3V4KGLHgYiJOxdhujAQ10DAKP10Q=;
        b=kAAbJuS+B7ZpLbJrm2kdsqSRmg6We0r/WplOOj/qq+H+O19YPfHM1orb//eZG0luyF
         6FY8w8EsZVMD5tmGld2qS4ChQsR8ka/T/XMEExUTtutJpIpmt4qqCaGx23r4cTPHcBuA
         96anikVgULygWqNEU2CdN+PM8bFf1j2rYdhYmIGb70Lp0IJezRL2RlQd6288Llc+VLnp
         AgMUsIdYfJHump9nUFCz7uR4swZqjCLY+mVoM4xBwQJ2yXDEsIUcIYxlUqeQxhXB8op7
         61Sfgtm1iXVSy1DbTmf5JkniBAWkCcT/O8GKS6NT2agFIXwMNO992b1qZQiyVTfiiuzV
         1HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0HIEosIMrlInRl/3V4KGLHgYiJOxdhujAQ10DAKP10Q=;
        b=0q+kc/z4joYV28QArQ5NoU8zjOAbPxnLu6XvD5xIBOg9/YrpEDdZCfcwl3X7SYMlr9
         1DhoP87IUhLj6fpK+r6W66fxE5YuF0rQ44Xyx7Az0I2pr5ZN1x1G5/e9TrtQTlndozj4
         q0UABaa+8KbnhE1Oy3FwztDJQR6x7heHfTEYO+8PeyLmq52eysKsuT6JIP8F0Gz0TapD
         /d9fh66nM9j+lJrj8doL52cnfAc+vmrZ8WNiszOwh74dI409DiU/jUiDwXRrEoEEY+tZ
         j+H0xCc0sOZyBlqWJ9gtJBQsS1EfI9DCYIxgDpzw9nV/cvORAse1H/x3nuNunQO7Y5KR
         Gqqw==
X-Gm-Message-State: AOAM532Pppnn6VVvdg1v1foDzYS/w3qAaUkIIlXS4zOXD9kVXHESmYi/
	P+lnvuI9cNGiQTABVWMm41w5Hv7+LTdohM0epRovTre+nuLsPcdhe4qujViUgNKum3A7gc3PTYa
	1Q9m7dj0T/151GOOfjKwW4kGml85AxmWBqhR6oTw0H1uJMxaI827TP01G93zoOZiKQ8NFLzxzqe
	xGrhA=
X-Google-Smtp-Source: 
 ABdhPJxrTNJsQz+a2A2uYB1HDzfQNph/wF+IIlvoeaZ5rJzcxidETZFTatH+K2y+18SSf7Co540YgQQ=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:384:74a2:b8e4:d9a0])
 (user=wak job=sendgmr) by 2002:a5b:290:: with SMTP id
 x16mr5205384ybl.557.1642577154654;
 Tue, 18 Jan 2022 23:25:54 -0800 (PST)
Date: Tue, 18 Jan 2022 23:25:50 -0800
In-Reply-To: <20220118230000.834968-1-wak@google.com>
Message-Id: <20220119072550.893397-1-wak@google.com>
Mime-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [meta-oe][PATCH v5] jq: upgrade 1.6 -> 2021-10-24 git
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 07:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94939

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
index bfaeed5fe..d0c70da76 100644
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
+PV = "1.6+git${SRCPV}"
+SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master"
+SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
 
-- 
2.34.1.703.g22d0c6ccf7-goog


