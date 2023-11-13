Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DB5C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:34:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.32222.1699860889333759850
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8x2VpjC;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc329ce84cso36632835ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860889; x=1700465689; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q78uCElRQAmjsn3KfEWTVMWkFzjv4QZMztMHKdGbQ5M=;
        b=i8x2VpjC7rqL4S+uKFRdf7lJwVjsar9SdxXCtZQTzK778wXYTKqKS3jMr8Kho8lwwd
         74SQi9XBoUT4Sclk1oo5S2rjARQxq6uGqvNgky7HzBzmQtewlo+Drf3z+JYwgEVjUY3m
         lkYXvN9TIrYkm8aNkZJMP3nnwawuDPlOtVP3PU2LNdZpQ4vZsB7ZpbaWJy1wMctlVamB
         fmLUjfmOr9dsZcjDy9Y1AMy1YdbhCf11IHiDzjd7IvmRirSoZSIV7TNogi+abKY7cq7f
         ZcFz31dUDcfOBnnyGjPgyy/WKqK5zAW4OjXmG/rATWbBtob0OGgNsoPusIMM0nZ8tI1W
         42QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860889; x=1700465689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q78uCElRQAmjsn3KfEWTVMWkFzjv4QZMztMHKdGbQ5M=;
        b=Er6p2fGSUUfj7uHDSvNMAC1cdYVaEnJrsPKRju0J/CMQidt+uH3zeuib8WsZgwsYtP
         2RbyxDCzNG6Q57X4T32bqyftcedNMXrKMhW3Ty+PqveKBWHD16o66EAp2zJecbLuYiiT
         e6AL7lRYqFzCKYw48Y3AqLFyNaNjn1+iEUZExbsKoa0X8iMXTTmiGGFyEoYHS56cDWWF
         XZKDXkBNgFA8kylgZiNB3BdAec4IzAPWRHzdwJJ4ho0M7l60Ld+udjH7BnxG8zPO4pm4
         ttXPc97gfhYVqivA2z4ea7ssZph8OLuETY2z7zgXfmA8kKwDCWOKMxlPF1hnJHRMP4W1
         tb1w==
X-Gm-Message-State: AOJu0YzNthZtP1Ui31pmX+dE9D9XWR3iRYuGiqWHkZJWg5XpHgs5DtmE
	Zd/+YU7YtUQ6j3SiB9XDSV8=
X-Google-Smtp-Source: AGHT+IFFKKUIVs4pMSN6e66Kw+fE37dqjhiHQ6W59P7HrUK+GwZ1sXtynxe2q8rNy9JS4KVFZra0LA==
X-Received: by 2002:a17:902:d389:b0:1ce:1674:fd15 with SMTP id e9-20020a170902d38900b001ce1674fd15mr5683435pld.65.1699860888497;
        Sun, 12 Nov 2023 23:34:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm3509691plx.281.2023.11.12.23.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:34:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 0/6] Adjust for switching default build system for
 gnomebase
Date: Sun, 12 Nov 2023 23:34:44 -0800
Message-Id: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTRUWUC/3WMyw6CMBBFf4XM2po+EIor/8O4KDCFUaGk1UZD+
 HcLKxPj8tzcc2YI6AkDHLMZPEYK5MYEapdB05uxQ0ZtYpBcKiGEZDdvrmx6MlVXpi6lrrkuIb0
 nj5ZeW+l8SdxTeDj/3sJRrOtvIwrGWVGh0aooD1bhqRsM3feNG2BtRPnHk8mzSre5rQre5vm3t
 yzLByxRQEbWAAAA
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106626

Its changing from autools -> meson in gnomebase class in core, however
not all recipes can/have migrated to meson therefore demand autotools
explicitly when needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in v3:
- librest: use autotools to build.
- Link to v2: https://lore.kernel.org/r/20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com

Changes in v2:
- toscoterm: Delete recipe.
- Link to v1: https://lore.kernel.org/r/20231112-kraj-pu-v1-0-69ea83675f3e@gmail.com

---
Khem Raj (6):
      meta-networking: Use autotools make system
      meta-oe: Use autotools make system
      toscoterm: Skip recipe, slated for removal
      loudmouth: Upgrade to 1.5.4
      toscoterm: Delete recipe
      librest: Use autotools make system

 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb     |  1 +
 .../networkmanager-fortisslvpn_1.4.0.bb            |  1 +
 .../networkmanager-openconnect_1.2.8.bb            |  1 +
 .../networkmanager-openvpn_1.10.2.bb               |  1 +
 .../04-use-pkg-config-for-gnutls.patch             | 25 -------------------
 .../loudmouth/loudmouth-1.4.3/glib-2.32.patch      | 12 ---------
 .../loudmouth/loudmouth_1.4.3.bb                   | 21 ----------------
 .../loudmouth/loudmouth_1.5.4.bb                   | 16 ++++++++++++
 .../packagegroups/packagegroup-meta-oe.bb          |  1 -
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb     |  2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb         |  1 +
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb | 29 ----------------------
 12 files changed, 22 insertions(+), 89 deletions(-)
---
base-commit: 6f26ff340bc9d07e7bdf6f4f75b2c81935230069
change-id: 20231112-kraj-pu-3b9ab728b087

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


