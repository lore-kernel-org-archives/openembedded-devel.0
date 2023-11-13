Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E309C072A2
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:04:34 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.1299.1699905867908542419
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPKQMQ3m;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b3ec45d6e9so3019287b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 12:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699905867; x=1700510667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAhxj/d1U7LYkivTbUGOdU7ddh9P5xCw2gRI1QwTJkM=;
        b=SPKQMQ3mP2iwgSy+uP5L6l/+FmWMfZmJRx+knhPDx5a0K7l2emZz17yyOgle0HBbv5
         qfKhZ90dEYNZqWNKS4mFflZM9sRXa6xr50SNhki+YGttGjsp95D/qkKgNR4JYlaEBH67
         n76oGM43RpwDJbzpm9b2ygQ2NdeuMSmDScdh9B/wxldSLyFYyrofx1EweJEGpRaIXpsZ
         urPZwszerVvyXE3OuZnZm0Nh7aDjzVIDsvorfJPouWDiw6tH6Z5zq76bMO1o2rX0Ic7M
         HJI8oJiAg4d4vtGzXH3C7FSj50hilSTrHG/oYUvnVcjT3DbHJ3XPrsItfVgFgxDgGEfV
         7lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905867; x=1700510667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAhxj/d1U7LYkivTbUGOdU7ddh9P5xCw2gRI1QwTJkM=;
        b=MjVfde1936SWjWn/l305dwAvR2ZNbyVdbTsVZtnvHQBIJMdeTRYT58EO7JqgB5u67A
         89mnuupT+0ZYmKrl42lcz4WSFvVNuDRZJpkxJsmll6D5aiVtz97qsC52ZQgozdSDx/eh
         +LPcaza2DsH2HI4qkxZ/uLGIdT+ME5cXCHBDJ3s1m871sj26KrzQ+NrU8yzAk5M5Od6e
         d19QqpuRStZepa7OlinhiDueQxBCtJlNv5LjIe4GOOvUqB9rJb40RCSmbJ4bNrM1fF0U
         0ZVsBQ0lYm9k5WZ5vpFCUJhzzQyiXTc+PSJuDa7gwZMF7s6uWNyyqIo5G+Tlgwx/64Rx
         bdtw==
X-Gm-Message-State: AOJu0YxT8bUyiUvCO5oEl6EYNcAnkKbVNcATgQ4cXh+aFNxo8GvxmGax
	8meoGmLWDl+FAQ8LsbqFRs3uVMjMQcJiBA==
X-Google-Smtp-Source: AGHT+IGPB4lLvlbvrpld26PGoqwM1vCFV7K4FZ72+oHmwz3z/j8ROZu+pvVvnP+ASUfWE/Bl+E55Jw==
X-Received: by 2002:a05:6808:1585:b0:3a8:7f65:a94 with SMTP id t5-20020a056808158500b003a87f650a94mr11184203oiw.42.1699905866759;
        Mon, 13 Nov 2023 12:04:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id cm19-20020a056a020a1300b005b9083b81f0sm3773679pgb.36.2023.11.13.12.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:04:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/6] dleyna-core: Update to tip of master
Date: Mon, 13 Nov 2023 12:04:17 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-4-a2b88b041141@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106678

Get the support for newer gupnp 1.2

Fixes
| configure: error: Package requirements (gupnp-1.2 >= 1.2.0) were not met:
|
| No package 'gupnp-1.2' found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
index eafbb50db4..20a54b1bd7 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0 gupnp"
 
-PV .= "+git${SRCPV}"
+PV .= "+git"
 
 SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
 SRCREV = "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"

-- 
2.42.1

