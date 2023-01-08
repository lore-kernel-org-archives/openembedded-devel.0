Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19639C63797
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:42 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.46814.1673191299254596760
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ERsMBsCx;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id i127so5176866oif.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtsuWYOcfwDcNYKi51X6Yo7QJ6wN9dZA7+REMnXUzUI=;
        b=ERsMBsCxtP1UTetZ6CRw2JvQXfLXrsga6WlOmDttVaSV4WZukUrNkbDf1I66F/5AoH
         /UlpGFlLh/EeMg4eNtrmH5anvx40bhh5Yoh6NdniWDC5qwj1e6VreTHUYOE9vn9GUCMO
         SMeDd7lJVctCO5GBFE+Wt4bhn8E6+yg/4FfxD/mDtr5qTzrPb3SrtGbnJmttMnL9O/ZB
         XpJjH2BcoPzVDhtAcgKAfUnSdtndPzawonSCjzw4rKqLXzuDqLWcDKRYGDc3IqNahILx
         nf9QxAYoVRAW0taOtt+wYXY2iMGYm+zjj+7N0P1u+tgXTwOYYJ2QSIoAtW1gKfd+ImzG
         fjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtsuWYOcfwDcNYKi51X6Yo7QJ6wN9dZA7+REMnXUzUI=;
        b=b4tOy0Cu6ix8vQpJ5gN7Lm0UZNYgNSUPfeD7HXxZdBeAPNS8V7sYzfm60x+DxeMny1
         HfLypQwaFnhTIvM1IyH7NAGwzT3pywNlPVWU+GergbmrGM1k7wrfCgvRuIvqc/Rwmabi
         /iPHNjPUzuTKtAPmAf6va+uPCKslLMdq5VpwI8HUhRUB0WFAOTk8pLXtQiCfocaSf/mx
         1mz2hVAXpiR/HcrVSsDb8NOAV7BuZ0d1dbYTNTBY57KD13IztkwSyHegT0SXa1PC8UKU
         J4dmwUHaWKDV4sveQejHLmMjU4YUG1cPTw8REV/5oVzwWTsaap9VPFxpiBtDhH5oQcWI
         MmsA==
X-Gm-Message-State: AFqh2kqySFOlTZiqV8Hj/f22fkRiBg1qUIsggouUo1G20uauoqY3sxlK
	CoBa2PiU/1NcDnqZPfndexi7FuUuAuI=
X-Google-Smtp-Source: AMrXdXsNa4rwTxHEuZTY3ZsCaEZljua6B6pqFJgnFuKu+kqHODYXFQN0EkgcwuHoIg/ZDo2oUQU9xg==
X-Received: by 2002:a05:6808:14c1:b0:35b:9e91:305c with SMTP id f1-20020a05680814c100b0035b9e91305cmr36394720oiw.9.1673191298433;
        Sun, 08 Jan 2023 07:21:38 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 20/26] smcroute: upgrade 2.5.5 -> 2.5.6
Date: Sun,  8 Jan 2023 10:20:55 -0500
Message-Id: <0b07e0e16801d2a0963871899fa138cdb902d9bc.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100465

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add smcroutectl batch support, issue #189. Based on the IPC support added in issue #185
- Fix #178: invalid systemd daemon type Simple/Notify vs simple/notify
- Fix #179: typo in wildcard routes section of README
- Fix #180: minor typo in file and directory names in documentation
- Fix #183: casting in IPC code hides error handling of recv()
- Fix #186: NULL pointer dereference in utimensat() replacement function.
  Found accidentally by Alexey Smirnov. Only triggered on systems that don't
  have a native utimensat() in their C-library, or if you try to build
  SMCRoute without using its own build system ...
- Fix #187: strange behavior joining/leaving the same group
- Fix #192: typo in README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit abc501113aa7e136963c1bbab9b202d425014dbf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/smcroute/{smcroute_2.5.5.bb => smcroute_2.5.6.bb} (90%)

diff --git a/meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb b/meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
similarity index 90%
rename from meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb
rename to meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
index b0b96bed8f..09752825c2 100644
--- a/meta-networking/recipes-support/smcroute/smcroute_2.5.5.bb
+++ b/meta-networking/recipes-support/smcroute/smcroute_2.5.6.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "9ca7441add4427a91fe90c34ae4a178ed9a50553"
+SRCREV = "999bdd724a1f963ac8bfd0598ffdd2a3d651646e"
 SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


