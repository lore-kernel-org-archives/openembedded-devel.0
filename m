Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EB0C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 19:06:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.21985.1700075202392201782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 11:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ajKpgQ6p;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc58219376so228055ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700075201; x=1700680001; darn=lists.openembedded.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5mtYwVnKFk7OQXfuaIAg+7itWnhtubSpmXnovu5wzo=;
        b=ajKpgQ6pdi3cjGKYMJTr0FcZKT4JQEYP/HxyPTzTn3/+t+ZcRjWN70e4vR7hHzVDb1
         4uvI8xj8DCO6nM5f1Jqxg7riXqQokIuP36t9HGKZcK2YvzdwhVwqddWYjdj7AMyUpinp
         fKiynjEOL31izFey+fLZuI55LQbUd0qs70zv0jDToYfFEzKEANkwpZd0vsCtGtqmKUnN
         rTZkhKbqJIqzGMTw3w3h28eE3fOX7M5xR0Xq8TF/I8NRnebJ5oLT2wpg0PdXfsXJXhEa
         LVWjEuA5Y8QVGlrSCy8UZzS3Yu8QctrkG76bIhxD7ckfquD37OjXZWUKr0B2vUt1HBtm
         gh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700075201; x=1700680001;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5mtYwVnKFk7OQXfuaIAg+7itWnhtubSpmXnovu5wzo=;
        b=iznrVWqryXZXaY3tslTT8Eic+9apwxyxtg6BsIoq27zWJ3G63CADL3F82dKL23MEEF
         r2QedJtMSxCm2Ywh9PIbfCvwSTHRa+TKqNdE+E0BJdPnNE5QkRH0hncy8+uMbmRFxCLj
         EGoSJRvZhSqsYDjFpYgXkBCyqaGNUgBppr2qeIv1yKmZxrp868+kan1Rz7mjL9bAW5ZC
         T9nh9L/nVIWvYKRIpfSvZT6EK6mkMXEDIYOEisfKlIxUwpsoTu3q4svWEX3Cm12Lg78/
         EsSuTGoUGmGMXkY2F0NKxMIr/cI09eelDYH5kKfUevQyIpG5j02VZrQ0n5XhjbIdQ2Kt
         6BgA==
X-Gm-Message-State: AOJu0YywO0xI6hAxTj6C1HAm3nNgbL3jIrGcI372T+vgj/OGZ14RtOZv
	gq41WadhIxHyHfvUg8SGILqKPa7iHGKskg==
X-Google-Smtp-Source: AGHT+IGsNiV/tgxTKFq/6gQYHe0WRKrL14C/5DxNABTbqC1w3kwSPqWYTCpRE4bBfrkXpsC5SzJOJw==
X-Received: by 2002:a17:902:7597:b0:1c3:4b24:d89d with SMTP id j23-20020a170902759700b001c34b24d89dmr6294440pll.40.1700075201129;
        Wed, 15 Nov 2023 11:06:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ji12-20020a170903324c00b001bfd92ec592sm7669004plb.292.2023.11.15.11.06.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 11:06:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 0/4] Delete vte9 recipe
Date: Wed, 15 Nov 2023 11:06:26 -0800
Message-Id: <20231115-remove-vte9-v2-0-c894df1c7af8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIWVWUC/23MQQrCMBCF4auUWTuSTIu1rryHdBGSSTtgG0lKU
 Erubuza5f/gfTskjsIJbs0OkbMkCWsNOjVgZ7NOjOJqAylqtdYdRl5CZswbD0h88dY5r4bOQX2
 8Int5H9pjrD1L2kL8HHjWv/W/kzUq7El5uvZGO9Pep8XI82zDAmMp5QsfmYrSpgAAAA==
To: openembedded-devel@lists.openembedded.org
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 19:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106767

Use gnomebase in libxml++5 recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in v2:
- Fix gnome-terminal to work with vte from core.
- Link to v1: https://lore.kernel.org/r/20231114-remove-vte9-v1-0-720f287a1da3@gmail.com

---
Khem Raj (4):
      gnome-console,gnome-terminal: Depend on vte from core layer
      vte9: Drop recipe
      libxml++-5.0: Make use of gnomebase bbclass
      Revert "gnome-terminal: Remove recommendation on vte-prompt"

 .../gnome-console/gnome-console_45.0.bb            |   2 +-
 .../gnome-terminal/gnome-terminal_3.50.1.bb        |   4 +-
 meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb  |  13 +-
 .../packagegroups/packagegroup-meta-oe.bb          |   1 -
 .../recipes-gnome/vte9/vte9/cve-2012-2738.patch    | 136 ---------------------
 .../vte9/vte9/obsolete_automake_macros.patch       |  14 ---
 meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb          |  30 -----
 7 files changed, 9 insertions(+), 191 deletions(-)
---
base-commit: 5f344ed2dd36f43b8d7fa59b774f29b08313e7f4
change-id: 20231114-remove-vte9-2e6fcddf094d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


