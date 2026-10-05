Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50559CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 08:52:43 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15824.1791190357289555663
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2026 01:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H42xBREx;
 spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so9357725e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 01:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190355; x=1791795155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RA+3p0NlHCPMUqf0f0/lptPu7qFgSf0OkESXSq7bmuo=;
        b=H42xBRExUUzkaHNL14c40/QB6C+JYlJ65vnLMmCDOiE0MDb1mQhjca1UW/JXJWAscE
         suWqMEEgTcU1NLu1Z7v+206m8i/tmBIcIFtXnG/BW1FaVo/hlfJjSuY7xMKHhY/23Ssd
         sZtchUkFaMeT3QkzJ2fr1p3Zz5BU8x1/f2de/6HoaYbELsM1k1A4geci8P+/2ubhXw/A
         hUdeCQIBMPD7MYV/W5ywRWZSJ7xxTV4KsjFNU5Nwy7R55aOkPF8mKW9au+177stPD68T
         TD+VA0+yNIBUl2g/p5ZY7Wg6kP5ixeFDyJprUInmP4kh7h7Oh/6j0ESLI0TUm3supZre
         iJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190355; x=1791795155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RA+3p0NlHCPMUqf0f0/lptPu7qFgSf0OkESXSq7bmuo=;
        b=IPixmDBYYEEg4wdn/661/a6DsVuDhzULkG3Z30kNKpMY8rTaOt2qIjSekAluw0Y8m2
         qi8ysMqdltenNAYaQBkP65DLfflQM8KFaHDho7hqYNh6Ot57Q2F7ue6h/cJiSlo+36Jd
         k9T40d0UDzvQ3D2v4dUiaMK0Qj/+NmEYBxYkqqFRiO4TM3HlJQB/byQ/khd9zxsFdDNV
         h2oTH1oR0uJhhyl6DXAkg7RlEPZjWTV0PdRgE+96IKwR48OywbyPnBfHZGUZZCamEBW9
         tWsuMuvpwY/7YaybNcQsLbaSwmsRCg56KGOM35tJ1w3AXf7+CcS6b13rmD9+WP7CpgqC
         HcLA==
X-Gm-Message-State: AFuF++nNnTFoy4irDJt1H8cI6dPi3/ojkdQxV9RZwKuHWBZ7XVIECE72
	5MKSfyXNph15BgOgfx30LgD1bP7zDS+Kcs0VBlvRouQDiUvBfTLFueuW5HKIaw==
X-Gm-Gg: AYBFou1trezZqGRpA6Z5PIrA1YDlE40SfvSJQwZC+DAlNmKUv+30wP8KhCgQx+uXR81
	40xBOE2p9DEon7nHvgyhSwuOC1qaOSC3xNGrFnJrdXb3TvKJ9+7fcaL6DMNDx0IK3BqnL8kBvXz
	M93KguActWu1Kigfwh1aFfiLtkT/PD4gqctcHWF2/NfW+7C9EXaZ1txYCn6cs3jObyo4NB0irs9
	8XaaGoNv67INhyT7XlOr0gw1x8tmY4d8MdwkJTm25UV+QXOE2NgPXGgM1LyVKv4QNwQsU5JWQas
	LRGTgCH9F6qg2bUYDRjejXC5xftE22ZEvi+DN6PyxBguS7BiedD6dAPyGYIXzAP6ar95QFruWwl
	ydV5ylYGfR/gDE1Qh2FSV8e0qu1Mj5u7t5aKQ/MFN0yncLBe7WW71RDQlEiK0UsmyzvadOcv6fN
	PvrI4MHJK9SvkmBK/mK6DLk2hk9XGb6xMprih7Lsh/i63E3NR0ptqMi5TWLDDXBAltXuFFx57w3
	S9mYvEdczxVlQbOhp6O7zGHfrLS4BlRNouOMmJ+hD/bjVTQewceDus=
X-Received: by 2002:a05:600c:3152:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a0275977eamr167578825e9.18.1791190355347;
        Mon, 05 Oct 2026 01:52:35 -0700 (PDT)
Received: from localhost ([109.238.212.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270968sm2259055f8f.8.2026.10.05.01.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:52:34 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] pcsc-lite: use nonarch_libdir for sysusers.d
Date: Mon,  5 Oct 2026 10:51:55 +0200
Message-ID: <20261005085155.1621055-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 08:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130625

From: Martin Jansa <martin.jansa@gmail.com>

It uses pkg-config to query systemd's sysusersdir which is defined as:

sysusers_dir=${prefix}/lib/sysusers.d
sysusersdir=${sysusers_dir}

Fixes installed-vs-shipped in cases where libdir isn't 'lib':

ERROR: QA Issue: pcsc-lite: Files/directories were installed but not shipped in any package:
  /usr/lib/sysusers.d
  /usr/lib/sysusers.d/pcscd-sysusers.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
pcsc-lite: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
index a8735a449f..51f6bee3b2 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
@@ -41,7 +41,7 @@ FILES:${PN} = "${sbindir}/pcscd \
                ${datadir}/polkit-1 \
                ${systemd_system_unitdir}/pcscd.service \
                ${systemd_system_unitdir}/pcscd.socket \
-               ${libdir}/sysusers.d \
+               ${nonarch_libdir}/sysusers.d \
                ${exec_prefix}/sysusers.d \
                ${sysconfdir}/default/pcscd"
 FILES:${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"

