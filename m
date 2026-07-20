Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A408AC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:51 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11394.1784590726741066658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n9jVZK5H;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso8363746a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590726; x=1785195526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e02KKQcCTiQdZ5q3uLvXks3karYgaYp68QpYb88XFK0=;
        b=n9jVZK5H+99RU6iKwDwy2+LRpSTVYYcIBwHMIhrkkquoRQGdlY8qlqTzGii3iP7NN6
         2syfxFYGJcBrFic48Bh7/TtW0sB275EdHsTMoLE6g+9KdSmcb9D/46ckUsEt3G+bxJ/Z
         dtQ3rPLWmTV4PdeF1L7ap1kjjIPUfnSmZ7ZkValCAcIiENIfW0M6P8oNsNtZ2jBzh1pT
         iqcdBA2vPYuCsvxEITd3OmnzmIK1xGKqdg9vkS/OKiBElQ356m009dBqy08AyD7m+EE6
         6HscyJS/DvZ+rg15ADQP9EYzkVAPlFkEZ0YDEpUihRu9jgsnIbjdi5zDTb2VVtR4WuVR
         CPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590726; x=1785195526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e02KKQcCTiQdZ5q3uLvXks3karYgaYp68QpYb88XFK0=;
        b=iOeOhYaF7RTUp0gdcYDaQOV0RTXsevJ1Io0sgGscXYSuaJ8MAPyklHo5Mk730+GJn8
         TG8YuaG18naVIPs5IKDP0glCZrJWgjys2V8xbjSip551zCFVXsMztMhLlvlSaE41bJCh
         ctV34WHZg5rdXNoAS0GpwapUTzAAOXZ7uormPKJiDNJxP7I7TPjX13AuKK1z+fNksCT2
         /zQp3Ugx4Cg1Op7NWuPJfzVDt/JNHpW4NJyk0lVb4sguYYSydNOPBroOgsM8vHCtEgfr
         B073N4EL2VZZyx61TpOCLGzkCkvLIWJpXnaA2fss4dsHNHN2u2Du5zGySV9SNujym4lh
         TZ9Q==
X-Gm-Message-State: AOJu0YwLFmNLEHWGhykBjv7S78bv5B9y8jM1MKrgtUReZ8N46qlnrRM9
	ybjN6hHmATmyzUSWM6QYwTT94AtR4bE4JZ3+tf1RCchiJ/LPpbqXSOSEm47hAg==
X-Gm-Gg: AR+sD13YH16SHpZcPPVL9377RCAW4xRVjM3XVleEzGclNJ9D6ZvvyADC2M9rqn2f667
	KrFHUkDQHzbIlKhAfMOuAIo2oFRSdU+5pHEmQuSZVg/oa4tZ6PGjjniMu3ZTVZSWBLiflEYeVOu
	wVoqk1sZN1yCS1Uh/zzZ3C0gQhm2hr6omrJmJQ++qtF7oksDYLFkyRED++1ph4npyBUcJC7cv2h
	YwkPD2A8has+L6DPSbyC4I8t1uoYqksISzWMQiUGeimQMSiJ/02IUXRckxbasedXjp2iXtoJszs
	PFG1JtIAr7OKcqjz+XN66lX4IKCEvDzU6P02xpeoHNTVRNKptSUAALLMNwZEEgPS6BV4ZYDSVNt
	4kG/qR/FW8nrFazAUC2ovS/0BPWCdWNcTIIw7jRrjrxvL5Fvqbr9qMTIoDaUCM1M+A+cQTHneL3
	1ZSToXVS9KAji7YR0=
X-Received: by 2002:a17:90b:6cc:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38e4b5792a6mr17623604a91.37.1784590726167;
        Mon, 20 Jul 2026 16:38:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 9/30] pipewire: update 1.6.6 -> 1.6.7
Date: Tue, 21 Jul 2026 11:37:50 +1200
Message-ID: <20260720233811.2324493-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128310

From: Markus Volk <f_l_k@t-online.de>

PipeWire 1.6.7 (2026-06-18)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix a race issue where some ports would stay silent after a rate change.
  - Fix sync regressions between ALSA cards in some cases.
  - Small fixes and improvements.

PipeWire
  - Fix a scheduler regression where some driver nodes would not run
    correctly and cause sync issues. (#5210)
  - Fix a race issue with suspend on samplerate changes. It can cause ports
    to be silent. (#3547)

Modules
  - There are some locking issues in the RT portal, for now reduce the
    DBus timeout to something more sane. Also disable portal RT for
    pipewire and the pulse server. These are not usually run in a sandbox
    and can go directly to RTKit.
  - Fix potential incorrect delay in combine-stream.

SPA
  - Fix a regression in ALSA period_size calculations. For non-power-of-2
    periods, it would in some cases round down a a power-of-2, causing a
    mismatch between requested and configured period_size. (#5302)
  - Fix a potential segfault when removing a card because of bad ALSA api
    usage. (#5255)
  - Emit a route param update when card properties change. Otherwise, jack
    port updates are not always reflected correctly.

Misc
  - Make sure we don't deal with uninitialized spa_dict.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ce604315bc162136e8053e772c7653de74e5cf91)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pipewire/{pipewire_1.6.6.bb => pipewire_1.6.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.6.bb => pipewire_1.6.7.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
index c8631904ff..50feeaf843 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.6.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus"
 
-SRCREV = "a1c1d9f9f128ec987f23a0140a1704b8f8781787"
+SRCREV = "3b2cb4fb037bf6033b87d3c87ee917b2f686d309"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
 SRC_URI += "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"

