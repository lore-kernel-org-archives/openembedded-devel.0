Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571F2C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:17:26 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.79563.1705324641528977292
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X7r/iLFr;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d3eb299e2eso51430025ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 05:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705324640; x=1705929440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cg7UWMPMiDf1ZdsJPMyVYYrBOV5B93OeQ6BK09uhcBI=;
        b=X7r/iLFriANqxa4nx0GzjMhmm7Yoh/W8euQCjvuzjXVQCq20j3Z+rucmSoWiWjek8z
         IbDZqL2Ppp0howeJk4bK8nd4sJe4DEa4eFBtVe3rcjM3mhaDGvmT2wC3j5n6jYw79ban
         KKZvuuD/ZYJKsUj/9V+yyJYNdfWQQ0rgXEZ3/4uYP0l20QKF1/LHm+izZ8IcPYREwe5x
         Fzm1E315NpU8LPSfWjMP9UJgzhSP5/SKJ9z6zI8hDylUZe8eWq7qLpwJwp7KbKqQWUyo
         LFo7N/f5oLMlAeUcpNjlm5YypfoYDdBPv983CqATAc7xXdTe7Z4xRG34o/KDct64fQyo
         COow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324640; x=1705929440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cg7UWMPMiDf1ZdsJPMyVYYrBOV5B93OeQ6BK09uhcBI=;
        b=C+2byf2m1rxHC9IAZKVKOTZuH9LEgBjjh29BFsJIT1oHGfwcGC1aDHkbw8/wKq00di
         Hi4sKhX+dEtxC82EXh6sTy+8zsdv3scqxaoU9zUYblM0PUOM33ERQLfAiGUGsViZqmGU
         Y07lZRKFoWUMIS43ktkViy2lIgqS1Pu/n5aPorZhcWEfLUJJk6RRoH2vMgoYZCB96KD/
         n3aCEXV7UV3z5WxcDGxitZ/GHWWrBY8zuz6F0jV/BYL4bUwJ7F+1HGUSb0DTg6dmPN7d
         tchxqbosdAModQ7Fpd7dpFSX5JLWJ43s0IX98Jcc/CiOsZVkJkZJ1Y1cEakav2pAhzhO
         zlAg==
X-Gm-Message-State: AOJu0YxpBpopSqSqeg0P/Q0NFGfmUdil8luHaS8JkyNO6uvCOLEnVqTp
	brKQdis0bsMHrBRqUp9iGvAGjD3OR4U=
X-Google-Smtp-Source: AGHT+IFEuq45rgG4fmbWNu4CRfK1F7KU6q6zFIPQFHbQVmDG0+r9Unaim+E+cvhA15vGCydPFb7svQ==
X-Received: by 2002:a17:903:245:b0:1d4:cb95:179d with SMTP id j5-20020a170903024500b001d4cb95179dmr2956514plh.100.1705324640517;
        Mon, 15 Jan 2024 05:17:20 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c43:110c:c984:bb4e:e4d9:4f24])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b001d5a578df8bsm5843968plx.179.2024.01.15.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:17:20 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [kirkstone][meta-oe[PATCH 1/2] opensc: Fix CVE-2023-40660
Date: Mon, 15 Jan 2024 18:40:14 +0530
Message-Id: <20240115131015.1170717-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 13:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108286

Add patch file to fix CVE

Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/940e8bc764047c873f88bb1396933a5368d03533]

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../opensc/opensc/CVE-2023-40660.patch        | 55 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
new file mode 100644
index 000000000..74e547298
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-40660.patch
@@ -0,0 +1,55 @@
+Origin: https://github.com/OpenSC/OpenSC/commit/868f76fb31255fd3fdacfc3e476452efeb61c3e7
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Wed, 21 Jun 2023 12:27:23 +0200
+Subject: Fixed PIN authentication bypass
+
+If two processes are accessing a token, then one process may leave the
+card usable with an authenticated PIN so that a key may sign/decrypt any
+data. This is especially the case if the token does not support a way of
+resetting the authentication status (logout).
+
+We have some tracking of the authentication status in software via
+PKCS#11, Minidriver (os-wise) and CryptoTokenKit, which is why a
+PIN-prompt will appear even though the card may technically be unlocked
+as described in the above example. However, before this change, an empty
+PIN was not verified (likely yielding an error during PIN-verification),
+but it was just checked whether the PIN is authenticated. This defeats
+the purpose of the PIN verification, because an empty PIN is not the
+correct one. Especially during OS Logon, we don't want that kind of
+shortcut, but we want the user to verify the correct PIN (even though
+the token was left unattended and authentication at the computer).
+
+This essentially reverts commit e6f7373ef066cfab6e3162e8b5f692683db23864.
+
+CVE: CVE-2023-40660
+Upstream-Status: Backport [https://salsa.debian.org/opensc-team/opensc/-/commit/940e8bc764047c873f88bb1396933a5368d03533]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ src/libopensc/pkcs15-pin.c | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-pin.c b/src/libopensc/pkcs15-pin.c
+index 80a185fecd..393234efe4 100644
+--- a/src/libopensc/pkcs15-pin.c
++++ b/src/libopensc/pkcs15-pin.c
+@@ -307,19 +307,6 @@
+ 		LOG_FUNC_RETURN(ctx, SC_ERROR_INVALID_PIN_REFERENCE);
+ 	auth_info = (struct sc_pkcs15_auth_info *)pin_obj->data;
+ 
+-	/*
+-	 * if pin cache is disabled, we can get here with no PIN data.
+-	 * in this case, to avoid error or unnecessary pin prompting on pinpad,
+-	 * check if the PIN has been already verified and the access condition
+-	 * is still open on card.
+-	 */
+-	if (pinlen == 0) {
+-	    r = sc_pkcs15_get_pin_info(p15card, pin_obj);
+-
+-	    if (r == SC_SUCCESS && auth_info->logged_in == SC_PIN_STATE_LOGGED_IN)
+-		LOG_FUNC_RETURN(ctx, r);
+-	}
+-
+ 	r = _validate_pin(p15card, auth_info, pinlen);
+ 
+ 	if (r)
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 3bb79b9d9..816d9a3a1 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 SRCREV = "c902e1992195e00ada12d71beb1029287cd72037"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2023-2977.patch \
+           file://CVE-2023-40660.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.25.1


