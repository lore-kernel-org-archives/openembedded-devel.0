Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEE0C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 03:58:51 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web12.2060.1642564729987053602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=E4ZA1Obh;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202,
 mailfrom: 3eiznyqmkaeu3hrnvvnsl.jvt@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id
 191-20020a2504c8000000b006135c8d0c88so2344141ybe.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 19:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=44VkdfM7kQF4FVkWbB9UljAGmV6M5rckdnjOfppMRg8=;
        b=E4ZA1ObhsVskaCGk/aF8Umtz4e+aLpvCQ1Onl2EeY89fk9GFERqnllJy/w08nGRkYB
         DKWBi/6xXV58McEkuUN3qE3tEZry5vgkXgI09ACbYlTDktP4HmgjDB9zeG+4trdfivxq
         VYz3V6H+SUEbXYCViazYTot4R62s8HqLqFMeppqdGClmALXW59rwZ1YstKoQXPDsYtAT
         5aUCl4QheEc8aBcsSz+SfiumBDcHyRuRaMsGTYyDqV77oTcsSfMlVaOVZPwycPZTBF5E
         Ls3gvzJtgMncPItb83jOhBmFtNNYE4hGh0qFRU1vh32ZgszUEuA0WdPXFIU4dwQKEjAr
         ALdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=44VkdfM7kQF4FVkWbB9UljAGmV6M5rckdnjOfppMRg8=;
        b=c4gsbdwKW+35KeaKxjtOzJq8f6bXBlB+RlcwQQrDu+wlRLLwDEdIJHLi4JmOBwCHfp
         BcWP0+rBXoeyJkhkEikTyVeGE1iI4EuNxKHe1/7fyW4kUuZUXRMDbqQbig0yeW229w3I
         YkcNpkmMaZYH+acgy95xJ8Ur51ZDkzd/IwLFwKdkUtaRyd5bVWl7Y0pMEbY2cjO7DwUz
         lTvtvBGIojfgl384YhLfmWf5oadHqDJgIt4bfMRc9EhI6v4Qnp7LakrDXK66RyHCBffv
         tL+LwSW/zF8L3g7PF/+dRTIcbi3JX3Lilwl4sqcpn1CAeQb7roIj0S1MQ8emMAlAvR43
         nK/A==
X-Gm-Message-State: AOAM533w0ZxkLFsCkFgnKISyTH/6gHEQF3wvDMxG7g04TDRvnUxLSD7g
	XdHAz5KFyXi+E9YAr/UYFsGSdgWrSDJ9pI/iLZUkYMQx4GkiXKZoqR1cSmmkazFk09p//aT/bdd
	5mEQ2kr3OWQOL51M36VE6gej5i+05b2ja1AO6mj2wtIY8XdNQslG5XAuwsLFfBgN/kkv3jVJNAJ
	s5zFk=
X-Google-Smtp-Source: 
 ABdhPJzYCEcA069mI7zGOM6zq5ZaFv8HjApW1FIiWyaCy8aJGlS+IDGl3qGJtWw2wKh9nLx6xOX0/FA=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:384:74a2:b8e4:d9a0])
 (user=wak job=sendgmr) by 2002:a25:8b85:: with SMTP id
 j5mr40084525ybl.698.1642564728939;
 Tue, 18 Jan 2022 19:58:48 -0800 (PST)
Date: Tue, 18 Jan 2022 19:56:19 -0800
In-Reply-To: <20220118230000.834968-1-wak@google.com>
Message-Id: <20220119035619.858455-1-wak@google.com>
Mime-Version: 1.0
References: <20220118230000.834968-1-wak@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [meta-oe][PATCH v2] jq: upgrade 1.6 -> 2021-10-24 git
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 03:58:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94931

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
index bfaeed5fe..cfbef9393 100644
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
+PV = "1.16+git${SRCREV}"
+SRC_URI = "git://github.com/stedolan/jq;protocol=https"
+SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
 
-- 
2.34.1.703.g22d0c6ccf7-goog


