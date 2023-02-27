Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31441C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:51:14 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.8120.1677534672273376968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZxA31yIG;
 spf=pass (domain: konsulko.com, ip: 209.85.219.45, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f45.google.com with SMTP id o3so5537839qvr.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1677534671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PV0qsoquesSoGrMdZ24DXzfCIwC2a5vXJS4xy7TY11Q=;
        b=ZxA31yIGJb8EJdjIJKcANHstt77cYwFGtMspyW3oCpEoxPL6054ikZLCW4rIA9xyeE
         6XnTc5vDTB4XfjtTfC6rpM8bOFmeJEUdyiqPit/dgskBVPzWgbmRuNS+PSC+WVmBprC6
         dK3T+aT4NUdMnNtfevQiNeMmB4PZ2F8ysUObE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677534671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PV0qsoquesSoGrMdZ24DXzfCIwC2a5vXJS4xy7TY11Q=;
        b=3oZnjz7Yv1HP/nI8neLj3t3VkJ2ooJtj3rVWstcU5KIHSPw2BCpLlf8tG0ew+3p6dG
         NwqetFsKj6MXVIPDWHooOAet+4zJrJEZ+nyVm+a6J0f/ojb9rW1vHgNLovfXh/yYv97d
         kpgZZeE8NluuV7CMMsWzpDTuD8DoPqH8rd6fjGZV1F/s7YzclSM/z93JqnL1QzLhHHYJ
         cdEtTEwNLcuF7AwBsTDpeBtbBqmHPalHMEidCoUzVV0/v3s0AqVd07DXMywmDIWOdDAK
         tmI6GLH4svnIVP8GX9xzmscGyBNR0SD4VOUPYJfaq61TuN4A9fsxgvclhm97NrtjAA9j
         xMOg==
X-Gm-Message-State: AO0yUKXxJlzbwFzJWQdMKt2NJwHQGq+XaLCLONrTp5RF6LzHNpoljwGB
	5pd/HzKx1jz6RuJcrFrRUPbgUC5+6d07+JtJ
X-Google-Smtp-Source: AK7set8kBdqh95sm2xMIGkv1RSZOkOT1fMbJYzZRDhXV+ZE+V7dpAUI2WrSh1Bj9G1WMcC4EPTf8wg==
X-Received: by 2002:a05:6214:2387:b0:56b:f1e3:320 with SMTP id fw7-20020a056214238700b0056bf1e30320mr2002574qvb.0.1677534671072;
        Mon, 27 Feb 2023 13:51:11 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a186-20020a3798c3000000b007423c122457sm5650370qke.63.2023.02.27.13.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:51:10 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/5] mpd: Update to 0.23.8
Date: Mon, 27 Feb 2023 16:50:59 -0500
Message-Id: <20230227215103.795230-2-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227215103.795230-1-scott.murray@konsulko.com>
References: <20230227215103.795230-1-scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101303

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 02fc7f371d957cbe47f3e1a9f659eccb923306cb)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../recipes-multimedia/musicpd/{mpd_0.23.6.bb => mpd_0.23.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.6.bb => mpd_0.23.8.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.6.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.6.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb
index c74f1074c..22bc15969 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.6.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.8.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
            file://mpd.conf.in \
            "
-SRCREV = "f591193ddaa7f9bcb6c85ff5899517fc7b53e35a"
+SRCREV = "1f28790476f7bca935edec67eecae909741ff287"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.39.0


