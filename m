Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459D4C41535
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:04:34 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.1181.1699905869639753278
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+UtMkZa;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7a98fdeaac7so210493139f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699905868; x=1700510668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEVxMQJrj9drNGv8QDL2SxQGfG9+IVUI81Wj1ud4dYs=;
        b=a+UtMkZaIcVzJq2EuzjY6bePty6khTK33gZLQIJ5vk3XI+gDHEGmEoyo7VXLMTB+Yh
         b9F9lU86nBDD+trrC7x/+PFl3tYyQj6DT6lVN//2YZORwpAXm2rbqJGZYwbsNX/FVrIw
         kHKzoCPk69uVVXBnaKVwTPARnT+gnordOUxT6adH8mAZ50RPUuZKTqCcd48eejv9vvCf
         AAZZjcgVXcXdpVnCZBXrwVZ8QUma6K6qxetn3dtIHEtQN3fxpg4ksTvq0D2e6nVIXtYl
         cpq8gypK55JYR1pmRRWUjm2twSKkgTT9T/8qTp3p46yjRddzTzEWdo4l+ZSdbeZn/tdZ
         ff1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905868; x=1700510668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEVxMQJrj9drNGv8QDL2SxQGfG9+IVUI81Wj1ud4dYs=;
        b=fsmFdx6JMbD7z+TfXhHIrJcUvQvzNtCGnlKqf3WQ/75g2Gfb1UWuky+lzrwI8ac50U
         pbyIfpiqJ7Lu1w+V5BOMGC42F1XzfdT/vU18twtbD8q1+Cmq1DUKm/FV/0rmttwwb8JD
         7G1s5XGIL6iv0+dh8je8qUpHjkEU1G8HI+C4Ljg3lF3pR4e7mqs0QQEhM1ucwGw/23ij
         L3+OSe6aozVqjXtdHzkOu1WuMn5aNcUsZ5UtWOCbW1nzQ22iSxI2nXfT8MlxV+LaqTHT
         DbF4dOTLzOZUn2LF+dPaQrsh4s6oP1uk2dx4fBfZIIlqruA+kzf65d0qEiYVC6+WiOLx
         hh+g==
X-Gm-Message-State: AOJu0YwmZU0JAld24GH71geQMUV9QDR2JcAeyAdIhbYD4J/59teHBbBT
	jdeUgpz2mXGFjA4QnbnLgH2fUybclWecHA==
X-Google-Smtp-Source: AGHT+IHgP8llNi1j06A+R8NvpcBcvLqueQFJ1IMM88xQocUIGEhl43uWeXwLYwcx1XWihI8JJQ9yOA==
X-Received: by 2002:a05:6e02:1baf:b0:359:d2ed:15f4 with SMTP id n15-20020a056e021baf00b00359d2ed15f4mr12073029ili.8.1699905868083;
        Mon, 13 Nov 2023 12:04:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id cm19-20020a056a020a1300b005b9083b81f0sm3773679pgb.36.2023.11.13.12.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:04:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 5/6] dleyna: Skip all dleyna recipes, slated for removal
Date: Mon, 13 Nov 2023 12:04:18 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-5-a2b88b041141@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-a2b88b041141@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 20:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106679

Upstream has marked it unsupported [1] and no development is going on

[1] https://github.com/intel/dleyna-core/commit/47638f14fdd0f1a1d3c0c0bd1ce31aa64c66025f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb            | 2 ++
 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb          | 2 ++
 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb      | 2 ++
 meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb        | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
index 033854f19e..bed5af9bf3 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
@@ -16,3 +16,5 @@ inherit autotools pkgconfig
 FILES:${PN} += "${libdir}/dleyna-1.0/connectors/*.so"
 FILES:${PN}-dev += "${libdir}/dleyna-1.0/connectors/*.la"
 FILES:${PN}-dbg += "${libdir}/dleyna-1.0/connectors/.debug/*.so"
+
+SKIP_RECIPE[dleyna-connector-dbus] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
index 20a54b1bd7..8aaab7893e 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
@@ -18,3 +18,5 @@ SRCREV = "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+SKIP_RECIPE[dleyna-core] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
index e7f918333a..a385a50de7 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -23,3 +23,5 @@ CFLAGS += " -I${S}"
 
 FILES:${PN} += "${datadir}/dbus-1"
 FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
+
+SKIP_RECIPE[dleyna-renderer] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index 071379758c..719aecede1 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -20,3 +20,5 @@ inherit autotools pkgconfig
 
 FILES:${PN} += "${datadir}/dbus-1"
 FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
+
+SKIP_RECIPE[dleyna-server] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"

-- 
2.42.1

