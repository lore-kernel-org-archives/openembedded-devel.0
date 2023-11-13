Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349DEC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:04:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1178.1699905863670493298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJQhguj+;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso4159550b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699905863; x=1700510663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSvVwAD05LR1mWzIsEUMS9nIaup9VZSdcpgk851B+6A=;
        b=WJQhguj+twbSW68OlvWkT4sO8sr3K8GiY0AVSZbthJ5DmZe3Suk+QVDkFhgJXjTbQR
         ZEDVsobdf5Axq8+u9oEcoFRos/NTsKYCYUIdZDqM/46QzTc2aniEk8IGc1lAM4Yt0kj/
         2PSYN/rrVcRZ1yn403FwD3Fs2g5Cq9h6M/f4I3Kv3MTQG/2U+Be61j/2aDiNySzmA9aF
         6+smkZFr+zvpvmmjF+pTdlUSQO/djlPZh5tf/4gUqiWVPB3dF3muQ2WoIcfH5T1gjshF
         451i8BT601bZeKfeR7L/ZFFjy1B4rKLb3eb+fU732uEC3c9fSrROSWZ7t9OC5ggG4sHV
         BwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905863; x=1700510663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSvVwAD05LR1mWzIsEUMS9nIaup9VZSdcpgk851B+6A=;
        b=ZJQNf0IyI30u0z4eJhfNPNHi+ce8XCAXlmXCOrUEn9ivbp3pCwY57ssRNgr2aMnUln
         e2vtKEfwFKFAP1oLv4fVZY9RCewcMoDKBjCjSAR3vKx7oUOgdWxhixORyRV1rmgW0t9q
         IyRV5t0Q2EB180+KYxhZi6dC2zgI7sHbn+xOhPEo5yM43NAunYOh5tYYv8z/mRXIGHFY
         Qs6hNyHRA14HuaU9mVvIHzANcgSBWzOzCUJAeAyMzoYeuQu7PSnwDMCXfU0tXqpjSHQj
         7Mytm+GrTXivXCyTW0mMfIAhM5qVqc1dm+n0ry8+KHAeoPg2zU5yzwZTTywwJUkAnDxG
         E2/Q==
X-Gm-Message-State: AOJu0YzdsIMmeIyzD0yktreMeLIKJdDuo4N8tHrhcZtAfPy21FdFOWOb
	1UKvEfhX5IE0YWTA7QSEtVGrg1aXGH3C5w==
X-Google-Smtp-Source: AGHT+IG48LlYaJ1RCnUcU3k6HLgIwQ34wkbaRWPgZnnIg687gZr1o9l/VN9D6w2dNl51mBaQ5MyZQQ==
X-Received: by 2002:a05:6a00:1d10:b0:690:422f:4f17 with SMTP id a16-20020a056a001d1000b00690422f4f17mr7010966pfx.4.1699905862709;
        Mon, 13 Nov 2023 12:04:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id cm19-20020a056a020a1300b005b9083b81f0sm3773679pgb.36.2023.11.13.12.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:04:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 0/6] Drop dlenya recipes and fixes recipe dependencies
Date: Mon, 13 Nov 2023 12:04:13 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106674

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Khem Raj (6):
      cannelloni: Fix build with clang and libc++ runtime
      gnome-console: Add missing dependency on gtk4-native
      gnome-terminal: Add missing dependency on libhandy
      dleyna-core: Update to tip of master
      dleyna: Skip all dleyna recipes, slated for removal
      packagegroup-meta-multimedia: Remove dleyna recipes

 .../gnome-console/gnome-console_45.0.bb            |  2 +-
 .../gnome-terminal/gnome-terminal_3.50.1.bb        |  1 +
 .../dleyna/dleyna-connector-dbus_0.3.0.bb          |  2 ++
 .../recipes-multimedia/dleyna/dleyna-core_0.6.0.bb |  4 ++-
 .../dleyna/dleyna-renderer_0.6.0.bb                |  2 ++
 .../dleyna/dleyna-server_0.6.0.bb                  |  2 ++
 .../packagegroups/packagegroup-meta-multimedia.bb  |  3 --
 ...lude-bits-stdc-.h-only-when-using-libstdc.patch | 37 ++++++++++++++++++++++
 .../cannelloni/cannelloni_1.1.0.bb                 |  4 ++-
 9 files changed, 51 insertions(+), 6 deletions(-)
---
base-commit: f1109887083d97365e3e0c292a76cb0195af269d
change-id: 20231113-gnomebaseclass-switch-to-meson-929926feba62

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

