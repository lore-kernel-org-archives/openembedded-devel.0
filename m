Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2AEC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 07:24:31 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web12.3402.1642577070880821826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 23:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=PqLIwvza;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202,
 mailfrom: 3rrznyqmkanst7hdlldib.9lj@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id
 s7-20020a5b0447000000b005fb83901511so3115688ybp.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 23:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=oBB7L/iJqrkQKoMTSnpe1wtL4nMz80h6Ms71mISnCBs=;
        b=PqLIwvza++XsbfsBNkArne2UVrB5Ec815AoT7v131DFdAtAttT4dvJpaJSHEXaGLsY
         8xgGRooB71lt/86ymNjxB0egXjhXf4UpVFL3C7/oVIOqw5HjngW6S6l1nDGH2cEcdedg
         87D1qrP6WITrEBx4uK1os1zFE0BgXWTba1q39KE4pMTIiuExRG5JPq4K7ohZ3/sqP7bN
         KmfdXUIzjwBu84cwYhl+pPsJwZ2d7zIB9oOv4s3IZPoWkITDFupZM6r1b21ZHvE5DuA9
         GxhVbOsmsDDHercfWDOJuoeoqdVpjT5cR9fuXqkHM5tx7Fv+oGULwDVMqXkPJTjH1s9B
         Qgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=oBB7L/iJqrkQKoMTSnpe1wtL4nMz80h6Ms71mISnCBs=;
        b=yxFrBI+vy0n2l8KiisW+AJViCZYuoEaeoqKOnactrGLlOcCiPaAuroFiJeXEaOyriq
         ujbmb3sAdLKUDk2hJyLpoPgHS48xrWyAlpInlhX9bPxMI91KFqMCMZHLF0zQKH0gVKE7
         q6WfX+ZAX5RDZTRDOg4aUSyEZaSVf9YiFopEKJj4XqWieJTG6nld5Wi0It5iYlSIYRhF
         O64yJbRcmTmP5W9BkRS/uuAJDaRWSloN26U9IsvwmG0eXdlhTYAuH0wlzldNKXe95mZp
         cM2hj29RGynYgK60X/Vxnm9i1gb7PKy4+4yIDGQ5mfDHbY568wI0AHAB9r7fXJ/J1MOP
         AMsA==
X-Gm-Message-State: AOAM530pKhCf4J/esA/DieYb6JwkvNvoLP5MuAAu2rl4dJZ9sJ5omn5I
	3IJluDoLme/mKZlka843EImh+m3efm28gqJWCPeONBSNeEAr8+OVPMMZeUMw09tRLdwY3o7qGqm
	Z/D5JRsQYkB/ruXWYhAkjyhrem9oub5Xl9rsqAR/b/sq+bL+Yx/YblCbeOFtTbKdL+20DlsgiuD
	C66GI=
X-Google-Smtp-Source: 
 ABdhPJzvsvGGNTMTjreqz8WO590/hiRiIycaQczTwmUKO+xiOKKWooU0UssksEh5Fd/UXTh36qkXYSU=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:384:74a2:b8e4:d9a0])
 (user=wak job=sendgmr) by 2002:a25:c7c1:: with SMTP id
 w184mr1319408ybe.1.1642577070002;
 Tue, 18 Jan 2022 23:24:30 -0800 (PST)
Date: Tue, 18 Jan 2022 23:24:26 -0800
In-Reply-To: <20220118230000.834968-1-wak@google.com>
Message-Id: <20220119072426.886030-1-wak@google.com>
Mime-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [meta-oe][PATCH v4] jq: upgrade 1.6 -> 2021-10-24 git
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 07:24:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94937

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
index bfaeed5fe..1e5af022e 100644
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
+SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master"
+SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
 
-- 
2.34.1.703.g22d0c6ccf7-goog


