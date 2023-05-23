Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716BAC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.13898.1684816025859051193
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Xz2Ush7R;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d2981e3abso3912476b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816025; x=1687408025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkcMESbmvi4hQ8WwbQjsGZDCSRYNLMpRDNYaxukiiF8=;
        b=Xz2Ush7RYoAN+B/g4lIJwoVWE+ZNkIJuAcZlGvCeFD6ag8UM6lM99uVEsFuy1PJSxm
         Akr+T+TFxPAgX9dZumcHTyHrNViuSwvAKXDoqfvHKfcbl5smdeSekfda3QyE/SkmkU2f
         Q7QD8Pvhnfbn2am1cYSm8+srt0dlMpiiju+u0Bgt8XOxPPKfyd8m3FGEHZhDQJCrxO09
         jAkqV9TzX0hqy/ksjYxwLW8Y9JXUoHOFeL/kUCEwYhEDZoEbwnrlIi9Tj28WxbJ6TnTX
         NkK1uxGZ7PvRnYigVlIiXmxJNVqTyZvEo8YvH2CyrzrD9FyuTYvUT8y0oQpyt4kscPxl
         ZuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816025; x=1687408025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkcMESbmvi4hQ8WwbQjsGZDCSRYNLMpRDNYaxukiiF8=;
        b=E48gpRhCKJJFWcFQesxloI1RTTsjPQEqu7ok4riCMkly8obZdRBPnnsCSuy0KzH5Dp
         W2I21KtTjUI0Kuvkf30Ts7Xw2KsdDLKVq/erz3bA6D8mXmi6GIsuCOZ8Q+N4Ef86YmFP
         J3Y7BytwoCEP1ZkTATbZCDbGogPJqOj9pEdqouaziAc3A+BHOdIhrmz7K5Hr1IlVRdiQ
         kGu4JhRhJf016LsZRPPunlB3se4gRshem8nakkTyI55VQFCLyZ9f572/5w4/pSvyuvG4
         SeovzPMaIcjzKZGzc8ellRGk7JRQ9qenDPFYvMIOrOuKDw93LCFCf1Ff5ZN7KIiIvKAV
         EENg==
X-Gm-Message-State: AC+VfDyip2A3RlAgoJ789aDFIKJRNTja/uPxQrjh5ceg/eTP0BovVpiZ
	8tokMhTBxaZSw3VlxZYj4vRZTRTFXIU=
X-Google-Smtp-Source: ACHHUZ40FxWCyRKXBwsCLycaEIUOiAJ3EP7+bJfZv05IwfGrSGLRbpI4VltdBhANDTO0WwMGyCw2pg==
X-Received: by 2002:a05:6a00:22d4:b0:64d:3227:b806 with SMTP id f20-20020a056a0022d400b0064d3227b806mr19215654pfj.33.1684816024872;
        Mon, 22 May 2023 21:27:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:27:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/11] mpv: Remove references to builddir from mpv binary
Date: Mon, 22 May 2023 21:26:55 -0700
Message-Id: <20230523042658.4159559-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523042658.4159559-1-raj.khem@gmail.com>
References: <20230523042658.4159559-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102723

Fixes
WARNING: mpv-0.35.1-r0 do_package_qa: QA Issue: File /usr/bin/mpv in package mpv contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
index cfb461a4c3..0f50a6e8fe 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
@@ -98,6 +98,10 @@ EXTRA_OECONF = " \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
+do_configure:append() {
+    sed -i -e 's#${WORKDIR}#<WORKDIR>#g' ${B}/config.h
+}
+
 link_waf() {
     ln -s waf-2.0.25 ${S}/waf
 }
-- 
2.40.1


