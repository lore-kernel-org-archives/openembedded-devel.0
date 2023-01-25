Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9365BC54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.44858.1674653502215918132
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SHQG+VBq;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id x15-20020a4ab90f000000b004e64a0a967fso3145744ooo.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtsuWYOcfwDcNYKi51X6Yo7QJ6wN9dZA7+REMnXUzUI=;
        b=SHQG+VBqXNLiiAsIepjL94gkgolHIFoFYe2W2xOmfJcLPwn4gaUhFoFoerywlYqApb
         qisJHwWimggofyDlLotzN/wgZHjE/po7Zw+KOqMyoO+Yc9EyPHgkABB2Knhr12wd9TkT
         hZQI6WiQaHpEl9lHVMTm6VHkuJ4Nseha10bj2vaSCNfAlUfnO4w1wgQl90tUQzNmvkLQ
         GgDrVqdpj/nDeNDFCyIc3mSw9TmZI4/sxoVlW/emDyhccH3q5XEsCygRO1jzz0TT1glz
         FpD4VrSkb/epSSsWDS6ROEhIxAL7SIt9OCz/J6684ShHw2EYOd+xL/kZ+vVBGkybz+4B
         4S3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtsuWYOcfwDcNYKi51X6Yo7QJ6wN9dZA7+REMnXUzUI=;
        b=CtQrrAHI4HEsYNQsh33py+RthHsfWwvq3hajd0XjIaa77O0gET3LfBmK8EB7VO3v22
         6rFS9NBQDG7NUdpUvIL5oxa5O04oJeA4XPQxqFRFblkITHGsUAzz69NMZcy8IDoGOb+v
         bdhWDZ3CjZGlV8fEljUi6uzfBmgwDE4MlEWTOV3PqkQpywGihXSrx9ICspSt0IebPQ7g
         BemQzv1Q1tIMdQS3f7mXetKKs3n0H6Hh7mmhnj7ojpEEIkLyXe9GEA2BubIsc39knqsv
         mF1m6g8iISwQ9EFX09eMN3aHVLz8sjfHJlW6gx3SOHUM7S5/dAs0xlHfkanZ7zVLs8bf
         s0mQ==
X-Gm-Message-State: AFqh2kpxpctr6GlfLJum9IVLLfTQNeNvMvUKBrvmmmLOZCe6kAezDuzR
	iCtfLGniEFJaww1GFJGGQa2LtqE8NQY=
X-Google-Smtp-Source: AMrXdXuUSe9awkxVlC1lQsRdmSD6zY/Z/jvrk8AkT9oMzwZS2IFghZBToeyG1FLfWxU+Lm53WYiVDA==
X-Received: by 2002:a4a:a8c8:0:b0:4f2:ba0:85f1 with SMTP id r8-20020a4aa8c8000000b004f20ba085f1mr13976611oom.5.1674653506117;
        Wed, 25 Jan 2023 05:31:46 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 20/41] smcroute: upgrade 2.5.5 -> 2.5.6
Date: Wed, 25 Jan 2023 08:31:02 -0500
Message-Id: <0b07e0e16801d2a0963871899fa138cdb902d9bc.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100755

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


