Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AFAC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:47:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.43551.1700452044919398546
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E07Z/Cme;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso3348222b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452044; x=1701056844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4LPMQrC1IHxbR6176LF3gRoPa43MsORoJVJtnK1tz8=;
        b=E07Z/CmeExiCN+Yijcpdz6kmfRWpcbLrXB5hFqHtGZX+NkUOsDe0y+/YiDjjFyJuyo
         Y/zhNqtysOkeX6xGAXTmQk9rxINj+lE5CGlK64pazvROyVRarF02WWbxzUZt1Eb8rq/h
         Y4fnSmV26JvovKGsXDsT8ldYppjzixtfFtH/I3imQQ3bL2s97MDbo60CWHpTewdt8UBY
         Fq1lfaiZbS3mDq+E4nbgOs7XKcJCbjsOzj4HrfK8QLr60VGH0EPsbbkq5cAbIbeeDTN2
         v+Qm9DfDnFEeyJUQJd4baNiYnEvau7lvG2e2CikC8V/uyzDLXMhRLvxTnWTf1JS8NTs2
         M/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452044; x=1701056844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4LPMQrC1IHxbR6176LF3gRoPa43MsORoJVJtnK1tz8=;
        b=Wr7zCyWhJD29rDbgp5zvE3+wCz1PBkS5QnjQSkQNdUPmhPWAc7cr32PDqCwz/qFMSw
         IZYLuMBYFopOiG2zfR/bin4lgVIEcZRszfo9WiXL2CXSHfAnDgxyybm7HpZS6PSIOkvB
         ly99hEYfOsMEMQcext7QmmVBlV9L4vr9cWIVnfm+zCHGvfVGZjfPrlI23hCbA8c10ewe
         V2mb8BxhMlAkHfBCzYCe/gsKJQO2XgzuYFVSgI8AsvHqwU3uJKfsuPdJrHsVOhZY+HES
         rknhVYGs0B7Vzb2KzbAslTJ0zztFyzsB1+MHlRR2jm9ZDA1Z5MF776Y746dshOYZAADT
         fsag==
X-Gm-Message-State: AOJu0YwHtr8GcHbLLr2UCN0TPtpJnfq76dpkMxioX8ifVhMOx+qEct3D
	RZL1NDWzDriT5H3BDEcp0KYNUynXHNelSA==
X-Google-Smtp-Source: AGHT+IFm9ig4VzZOXU63gldxRnxjfbnin64/0EeKWThB9UiH1mxwGHqMJbUQP7fpxXezJdDcWv/rlQ==
X-Received: by 2002:a05:6a20:914b:b0:17f:d42e:202c with SMTP id x11-20020a056a20914b00b0017fd42e202cmr5163035pzc.49.1700452043796;
        Sun, 19 Nov 2023 19:47:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902a40700b001cc5225c220sm5008319plq.15.2023.11.19.19.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:47:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ledmon: Fix systemd unit install
Date: Sun, 19 Nov 2023 19:47:21 -0800
Message-ID: <20231120034721.1414989-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106898

Use confgure knob to emable systemd service unitfile generation.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
index d431fd9a84..88a6e5bb30 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
@@ -25,15 +25,10 @@ COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/git"
 
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd', '', d)}"
+
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
 
 # The ledmon sources include headers in ${S}/config to build but not in CFLAGS. 
 # We need to add this include path in CFLAGS.
 CFLAGS += "-I${S}/config"
-
-do_install:append() {
-        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-	        install -d ${D}${systemd_unitdir}/system
-	        install -m 0755 ${S}/systemd/ledmon.service ${D}${systemd_unitdir}/system
-        fi
-}
-- 
2.42.1


