Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E88FCFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 05:21:09 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8875.1764480063440458902
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Nov 2025 21:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wunm1ieE;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2953ad5517dso30326855ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 21:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764480062; x=1765084862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xaH/HhpEx5bkOreYVdTz8OlLgvBK1U99iYxwrDdOyM8=;
        b=Wunm1ieEalmA+nQoA800GG9/7A29veT47W1Jv1wP8gMy6nZhiVdgfgWmeAmL+ITOax
         7pe8PcmdRJZ/w8wlzSmcsGmgprPu6XXNpZ8wD8Alh/k4NnOGD6FgHGd1x8PbuUX8bf2x
         s8BKksL54XE1gDXd6ag7ltv3+R/1xioSGRD+sx5lXnqEGSqtnYR9Vv61JlAxs1ryv99K
         ihmAahXq6I/8EvyvxEIvDiXF3yf6S20+hCTuHUZV8dAlO1+0oKi6YrXBS0q5kFD3vScq
         QXLDgjthKScrZMzDBXVMJooHJ2AMQdgr0gTjZnVCcJU0MAtqD0+yB39Kp1WS5COgylG9
         yLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764480062; x=1765084862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaH/HhpEx5bkOreYVdTz8OlLgvBK1U99iYxwrDdOyM8=;
        b=n3LwZOnl+iS3QnKrIWmKpis2CVbyVRBknh76wCfJgXbqYN0ylPCMlFp7WLWwsqGQEd
         4TChuYTzYsMaflwzDzhjjTsFgm8qTqeN/FmOyMY+4IVPkb1VKOr2p8m382mnUAiLuS9G
         i4yAWYcbmq/edIBU+Ez6+3kv51OdFAals+QV+Nl+zIfOJAGmazHF5Y7i0VjgqfpPUWu9
         sbm5CKAltaHop2DWA9bnF9SIpYYO+KB9ofaXPUdZeibwvA/FFc0riq5DJpLamVpXjwZF
         sRCruz8dSK+Gr0s/oasrUt0P9lQKUW29mdeBPsgmhoRA/q6xsygTBAfxciXhhrNTakuY
         9DcA==
X-Gm-Message-State: AOJu0YxcZrMxx6fJCP38BwM4EzeS1+D5qv3nEv5iiwFy/DcS7otC+llV
	1oAm5gUveHOFobFhXWBDqm3gRmjWRMHAg2oWNti9sSZyf4c6Rntrp2SgAjILx5TA
X-Gm-Gg: ASbGncv3lRiPa27kIuG9IoKkI3LJWSS3NFPwl1PryYv8sneTa5ckp+S4jrtv8WT4vrf
	EIHnCM+uyHeg7oq3fttHczx38005PEyebEnky8uXc1T2Cs/wPCVZMXLf3lyiSCN2xh8qSMK0Yz4
	m9QOZM26jakRtRTlNcB3BrpfGPtwLyC2V1IBRUp9U7Kl9JZtJqreh0MvXZOtSzTtriiC1EcsVJv
	/EJ6f4R9tm7ZSPpg/LxJxEZFCuPrqFdJOOf3helUUW7j+1pde5vxGOTA8EFGHmcTUGjEAao7YSK
	r6a3tYaOz2FQD6b8bcExRzupEiQXMBaOwnmT+3HgwPqeLOIZVDg1jJBEdofrFO4yR2gekXYhG6v
	rMjlYF3EdkfdpKTUsYyONDylRHAh+qCvse3Fs10/qpABNrIUfZ3q8z1OAgHhgvk1b0aQHX6qVzv
	+zVOJVPoKUIiAY9rMjgd/T8XNkPpm1NxNtoC7IJ1kj+uxwUdI2NMC744bgLgMcI5F+zs2bZs3BW
	Z8eOHZO6yJDXoXo8KnFv98uDBQrLypn
X-Google-Smtp-Source: AGHT+IHFy/+q5W6PSrtgBbx3BTuagzfQoLwbIcLtL0DPJtgQiAOODeWXXR5hFZ3jg9LJ4VrcNkgpjA==
X-Received: by 2002:a05:7022:2510:b0:11b:9386:a386 with SMTP id a92af1059eb24-11cbba8496fmr14685645c88.41.1764480062413;
        Sat, 29 Nov 2025 21:21:02 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::821d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaee660asm47527382c88.3.2025.11.29.21.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 21:21:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] gerbera: Upgrade to 3.0.0
Date: Sat, 29 Nov 2025 21:20:59 -0800
Message-ID: <20251130052100.469371-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 05:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122160

Add missing dependencies on icu and jsoncpp

Package bash-completion scripts, fixes

ERROR: gerbera-3.0.0-r0 do_package: QA Issue: gerbera: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/gerbera

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gerbera/{gerbera_2.4.1.bb => gerbera_3.0.0.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_2.4.1.bb => gerbera_3.0.0.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
index 6348f25a57..fdbd91f9b0 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.0.0.bb
@@ -3,15 +3,15 @@ Description = "Gerbera is a UPnP media server which allows you to stream your di
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"

-SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master"
-SRCREV = "870dd32d42f626dc2246d34b2224ffb6fd73e205"
+SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "7846f3dd5d0f848a60d0c3146c3b7290881a8992"


-DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2"
+DEPENDS = "pugixml sqlite3 zlib fmt spdlog util-linux-libuuid libupnp libnsl2 icu jsoncpp"

 SYSTEMD_SERVICE:${PN} = "gerbera.service"

-inherit cmake pkgconfig systemd
+inherit bash-completion cmake pkgconfig systemd

 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} curl taglib inotify exif matroska magic js"
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=TRUE,-DWITH_SYSTEMD=FALSE,systemd"

