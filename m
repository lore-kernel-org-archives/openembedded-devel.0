Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25D5C47255
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.219025.1704025427162371680
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHozKMzL;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3368b1e056eso7365113f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025425; x=1704630225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qn5OfA5Tln2wU67Us4DujZ0FS66eI8krjvaA8/iDX8Y=;
        b=cHozKMzLf0OMQWr67tzqC5aht7INP4K+cvnQAqV5Fc4l3LLKxj3wxEaRqQebYPMeMb
         Vmskj7/rZCOkTaiQcwYrj/8QBWekBr9GtylXUHHgFuXP5dKwuX4FaCerXjtDvXFTxOwh
         hXZnYDKYUrVc9fkOpX8WRJbl/r+4iwtNU+xIFxAh5IcMQObgqg84E1bJzkxpg91JVKcA
         dF+jOQVEJzDicuaMLZl3od5TYXEI+jDe57PvvS+gMc+rv9ZVAKvCdbstzUoiAludgSTJ
         yZ0DLspS/BbVaAVsdhJz7OxDJOAVhHmNtjGMmOGoG+HOuICyPlBMVooEt65bZMLP/f46
         qrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025425; x=1704630225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn5OfA5Tln2wU67Us4DujZ0FS66eI8krjvaA8/iDX8Y=;
        b=pLoFX67IZEKdoW9Vn46XpG2RP7qB5ImBANt3Gdi5PLpnk4w+rKZj5Bnkhs0X9WAszp
         MLmQSUnVojNiGT1l+KQwwkw2G6F7QpssyxZLUU1N77xs13O7bhDNXPGMtV/YUiLCbgSm
         pUCrtaH199CsKL/En6wE/92/5OfjAWYEls4Yu0+zQQ5lV2D+j9dxowG68BpgGft3S1XZ
         cxFrimTUAALfzr3WKxWdLDtQZuB2ar/JR2e5aEUBDrV2K2u0Gb4+HOrWIe++uP8TreJE
         PWFCsvrTPUEFgDTXyQm6quzwjHbjZHNHfzappJtKPt4Z20a97TSG2BYe+8SwtMX6S9XB
         4u6A==
X-Gm-Message-State: AOJu0YyD+U6INIoKSfTcN7xSKea+wBdiRbwz8kZtQuSqDsMIjnFNU3aV
	u0hP8Z4EVhrVfq59YxunYmbVgipXPRg=
X-Google-Smtp-Source: AGHT+IHvvBfvRgw3GXEEL/1abhWj8KCsGtGBWGSzUHJOzLZVDpO9sHdsoe3MllhUF39ewHb+iHlA/Q==
X-Received: by 2002:a05:600c:4f43:b0:40d:8590:a310 with SMTP id m3-20020a05600c4f4300b0040d8590a310mr606175wmq.88.1704025425655;
        Sun, 31 Dec 2023 04:23:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/23] cockpit: add setuptools dependency to bring in distutils copy
Date: Sun, 31 Dec 2023 13:23:23 +0100
Message-Id: <20231231122329.405225-17-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107968

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
index ab05fd377..df7f47a11 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "a87d090c930e2058bb3e970ca7f2bafe678687966b5c0b8b42a802977e
 inherit gettext pkgconfig autotools systemd features_check
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3targetconfig', d)}
 
-DEPENDS += "glib-2.0-native intltool-native gnutls virtual/gettext json-glib krb5 libpam systemd"
+DEPENDS += "glib-2.0-native intltool-native gnutls virtual/gettext json-glib krb5 libpam systemd python3-setuptools-native"
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3-pip-native', d)}"
 
 COMPATIBLE_HOST:libc-musl = "null"
-- 
2.39.2


