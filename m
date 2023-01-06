Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6F1C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 18:39:48 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.1143.1673030383403078521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 10:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJuhq0uc;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id z4-20020a17090a170400b00226d331390cso2555919pjd.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 10:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+NF+3UqXVanRfKMfLylLtM+4Q02gljnnwpAtgYikaY=;
        b=UJuhq0uc/qEMQ8XsbG7I226zVEFVoW1pDun4OYjB0ZnOOSKhajXs2FsUvdfkwzMuXf
         oGm3u/hfYokeFsRZ/k52Gl+gCYS3aA54U2712EMAcrZ7X9QjS34E1AMyUCXPkyzEZ9tK
         2A24uoIqpHrKPezcwottvyBKzS6gwy/nw2dDUpij3o9C3f8KXJGZuwXyjAEUaWbZPoW9
         Hgc1CahCmIBdTDdX6cMZfNjJa4aU4s/lgx5TPnigFslsQpws3hy2uQNgFMYPbIL6KMoA
         9PHaLz06hECo4gFTE7yQDMrukNvmS7BMHmZqBYDopQbBrf2dpe/HdI5YDoSDSCN90nuS
         2lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+NF+3UqXVanRfKMfLylLtM+4Q02gljnnwpAtgYikaY=;
        b=RK482M5c2VRBtZcriV63xD8++RCx2VDHt1NIfGsOtKmCrkSuodm2V5cTtPj83QiSuE
         cBixoNLboCIPRMEpSjBKrFIyQBlE+XoDwp9CZIccqB/fmxSY6amqDtWaPB7WegvcjiYU
         5e6dsufQye4xF1ICR/OD5Aw4zb7g+YBco+y5qv7Byq8beFrtCIDmS/3L3EebtaB+abAi
         7bITrQOOO4bO1ehX1u5/a+7ctHu9/w5VkL1sxb2n1BDRs1RyYyfOfvFrvMm97zWcOOp0
         1HiSz6Ep3hGnYUvATeyxXxI4PKvKKW9IJF3Q96hmhHhzS946PUfJLC8peRpY0otSdcke
         08iw==
X-Gm-Message-State: AFqh2krQGIma7lzm2GMlNLm4gSoOTOOLUrt/ZVaKDSYskWpYb8ll7eTL
	muuGkh9+fYRfJ30iuH8eH1zol49X0DO9OA==
X-Google-Smtp-Source: AMrXdXtuXApJ23LB852RqwaY+Y/PtWjFd36m4bD2eeie11gUCylg+GJ4gcP+yprRC+kLzBhnL9B+3w==
X-Received: by 2002:a17:90a:ac04:b0:225:ad50:3b18 with SMTP id o4-20020a17090aac0400b00225ad503b18mr57754659pjq.25.1673030382480;
        Fri, 06 Jan 2023 10:39:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id 7-20020a17090a174700b002265ddfc13esm3113051pjm.29.2023.01.06.10.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:39:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] trace-cmd: Build libs before building rest
Date: Fri,  6 Jan 2023 10:39:39 -0800
Message-Id: <20230106183939.1201278-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 18:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100425

There is a dependency on libs in trace-cmd binaries
so lets build libs first before building trace-cmd

Fixes errors like

trace-cmd/2.9.1-r0/git/tracecmd/trace-record.o: in function `make_instances':
| /usr/src/debug/trace-cmd/2.9.1-r0/tracecmd/trace-record.c:5037: undefined reference to `tracefs_instance_create'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
index e6afbfaa82..51e46533de 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
@@ -19,7 +19,8 @@ inherit pkgconfig
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile() {
-        oe_runmake libdir_relative=${BASELIB} all libs
+        oe_runmake libdir_relative=${BASELIB} libs
+        oe_runmake libdir_relative=${BASELIB} all
 }
 
 do_install() {
-- 
2.39.0


