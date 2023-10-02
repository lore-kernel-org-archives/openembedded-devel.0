Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FFEE7849A
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 12:11:51 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.80051.1696248706056510562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 05:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTr4afQy;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53829312d12so3364408a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 05:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696248704; x=1696853504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dBnObqYxfUzhISdaUz9MhpA+PmemSYolZ7eec8vDbvg=;
        b=HTr4afQyFR/DdsOjCbfzMEW6n62OgR4Agf+4gBYdhqedZESC11e5za+MPSPVZNiLMn
         5n44zaHFjqG9W6uYLDEAVGBQnPsdQj105ngMFwMiF/JPlBgJhzdZ38hp51wKwc4gnUnb
         yzsC58pgmRVQSm6LAj2CoUZ0v3SZl0TmmLIWagSaC/oUieEE7zGUJSpAq2oOe5TKJ/+B
         oaDBpvMYHlvpPsIs2oB10Sj2sZoCdvbWtmhlyNt5K9QY0FQyRnXiL/EU6JZY4E0LG45W
         q0Ndw3wGVIJF7ClrYClco0BGRyvPcKXbv5dleZWy/nagn6be/F6eUwwjFkuvpaoPcMwm
         rdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696248704; x=1696853504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBnObqYxfUzhISdaUz9MhpA+PmemSYolZ7eec8vDbvg=;
        b=fkNbf38hoYxccd5WCssrLpOG7RJcHdXgYOpn1SS4661CWvvjfPh40nU71zN/lTcNj8
         mXR3Ir4/fi0wCZ7Ek2/B7X0T3LTC2QytWQfkPZydGbSBLBXmb0tkKCz7CWQKLw3SIGhn
         ObdHAnmQXrm4PWlQh65pLCHxbsFYtO5ksBBC8MZA3fBGkvur3i5fU8v9VsrKWx1c5soL
         bLVMEJeW9VXE4uWz7SWQidKy9TwdO5yZjaswCyLrzIEZbhLlkQFGseJ23F5zZBvB1fMJ
         CxtPn5XKWLrkeBClnA8qNVEDQ1Pa0Cmaq5337sm10SJFqCWy2Qa4Cis5gWp4H46OtURz
         8/Rg==
X-Gm-Message-State: AOJu0Yw3E5pgZ+dfmQ4adUmNdU1s+oDheCu+0HYi4/RmaJMRju4txdMf
	jjRpnVAwu07JP24Dlnrw86FxzvAx7xILcw==
X-Google-Smtp-Source: AGHT+IGOgntpNeXksME39DruR+1ylwYX5189Wm23+gCTt8F8p5LQDj4WvpeoL8GyoXmLufeZf9rXTA==
X-Received: by 2002:a17:907:7622:b0:9ae:699d:8a31 with SMTP id jy2-20020a170907762200b009ae699d8a31mr10399812ejc.33.1696248703731;
        Mon, 02 Oct 2023 05:11:43 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906540900b009930042510csm17105703ejo.222.2023.10.02.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 05:11:43 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon:
Date: Mon,  2 Oct 2023 14:11:38 +0200
Message-Id: <20231002121138.982985-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 12:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105304

do not disable dlt-system build when systemd is set to off

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .gitignore                                                | 7 -------
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
deleted file mode 100644
index c01df45ec..000000000
--- a/.gitignore
+++ /dev/null
@@ -1,7 +0,0 @@
-*.pyc
-*.pyo
-/*.patch
-*.swp
-*.orig
-*.rej
-*~
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 410fffa24..47d7b1d21 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd s
 PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF"
 
 # Linux options
-PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF -DWITH_DLT_SYSTEM=OFF,systemd"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
 PACKAGECONFIG[systemd-watchdog] = "-DWITH_SYSTEMD_WATCHDOG=ON,-DWITH_SYSTEMD_WATCHDOG=OFF,systemd,libsystemd"
 PACKAGECONFIG[systemd-journal] = "-DWITH_SYSTEMD_JOURNAL=ON,-DWITH_SYSTEMD_JOURNAL=OFF,systemd,libsystemd"
 PACKAGECONFIG[dlt-dbus] = "-DWITH_DLT_DBUS=ON,-DWITH_DLT_DBUS=OFF,dbus,dbus-lib"
-- 
2.34.1


