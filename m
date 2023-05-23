Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E36C77B7A
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:27:07 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.13892.1684816021346120497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mH7Ba8J+;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64d18d772bdso6234786b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684816020; x=1687408020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8j8ppYyxHzuT8r2EhWRK7S2rDSpK49vQloV9MN1bnk=;
        b=mH7Ba8J+78QqcoPxaTIvEunUDY8ON3J8dua1IFhk6S3uwnrlgDi9M+RcdCT55hDgtS
         ygQBEH584gtB7XUAmYtJRrsgOd2M6T+s4mRuP3DjRUBAV7V8cMXv9vtVBl2Bp6ET/YgQ
         gAE9pVbv3t+F0No4hTma46WcU/qX73/ioTpdZW0sw3JC0JjFXmK+xeBI4/Oa//4Rvfpe
         odV//S/+t6sAX3KBd5ojwy9tCcPKSw8cfLtVN5E1fDW1N9e4kH7TUEf90Tw6NJQ7POhE
         UG/f4/UkiU9nl/kcSrSSga8dSoeZZ+/8nhoukfISXEZ2L0r8gNXmXt7/4m4usCiQil00
         PScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684816020; x=1687408020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8j8ppYyxHzuT8r2EhWRK7S2rDSpK49vQloV9MN1bnk=;
        b=VKZa0emop67t6HJicJpOcv4iv9xs/orGqPClaEJH49QtbxBmePxFlj0ISXexjAGp8D
         geeLttmfRlCyM5xhmpMDPHZRdU/mkVUo2pBrPC1sydMWfZPtz5LuHnQMwOHohLkiExdA
         8ykV/hylZKqRrZY4yI6Qm9dNhIKnuwNtRPQnTF1pJt+GV3zp2bCZ74shbfp7/Be9DqZx
         0kQ7hQ+u0OXD9izquz6S5/FllpWH29LjAJkIDXJu/q78gHcCY4AZkrS7YSO8Q+vRhGs3
         VfAoHVzPu/pMbIEdYzikC2A6y8htxcGQSrpsh4RJHjgvgRCnOPbodM9Ld6K9WeMvns6v
         4EeA==
X-Gm-Message-State: AC+VfDxHJ4w6dLv2af5aEBNAYJaunuOrVGGlJeWeLIFg65ykZDmz2lbG
	cXWvkM8iBhL1wWjqngPDn+MJVqzGaqI=
X-Google-Smtp-Source: ACHHUZ5ujuLe3Kz378sFcDe/9of7QSBiAkIKtr5sukH6OWx52aZDykyFww5zkhrZOsSpcqwa5Sxq3A==
X-Received: by 2002:a05:6a00:2e84:b0:63b:7119:64a9 with SMTP id fd4-20020a056a002e8400b0063b711964a9mr17112962pfb.16.1684816020246;
        Mon, 22 May 2023 21:27:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b0064d2c7ac49fsm4844332pfo.31.2023.05.22.21.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 21:26:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/11] lockfile-progs: Pass DEBUG_PREFIX_MAP options
Date: Mon, 22 May 2023 21:26:48 -0700
Message-Id: <20230523042658.4159559-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102716

This recipe overrides normal CFLAGS which loses the prefix rewrite
options, add them manually.

Fixes
File /usr/bin/.debug/mail-lock in package lockfile-progs-dbg contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
index d7ba6e14b2..834687b43b 100644
--- a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
+++ b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
@@ -12,7 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.gz"
 SRC_URI[sha256sum] = "2c5704b01c8f474f82921780e4592a927b2bf6a6d7616354a6c5d7cd5664857e"
 
 do_compile() {
-    oe_runmake CFLAGS=' -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables'
+    oe_runmake CFLAGS=' -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables ${DEBUG_PREFIX_MAP}'
 }
 
 do_install() {
-- 
2.40.1


