Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78243EC1128
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:51:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3491.1771876290958186308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3iSMCyJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43945763558so2900835f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771876289; x=1772481089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EeYL9UYenAp9vMCHt4us0Kp3ERdZD52KOUWwaGvSccs=;
        b=j3iSMCyJ0/dol7UXhDGQAm6uS+2NoW/dEsoxhVuqCc2bWuoNh960oyIHhkrmKKoDsW
         3BUvfOQ7NH2pIfLaAN99YHrfNbDdpBq+mA3BMtz7GY8cMt5oDQDwocmnJiTnydvhiGpg
         mcORd4J+8bHnQtpNwHR0AkL2pR7Cwqa9m1E2bEczOpxlsT2riqj3BJcvcVnnPz/N0Ok9
         5gPqOH8fIya7azU0jbVJPF6mzZyeKnDpPEjiSCzpfl5RGIGCpv3sVtVBTGs+D1gPgOaD
         p9qrEolx6YxF78xBCLOJs7fyeHgYNiPYsf5cL2LXlm8OEwveHIMcoocXfgijrSSqQJe+
         AIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771876289; x=1772481089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeYL9UYenAp9vMCHt4us0Kp3ERdZD52KOUWwaGvSccs=;
        b=mWKddiL0VTMZ6f/ch/c8nzbKvVvrMR8cYYa4DowhDMtBqgTMbtnL61v2RgTFE/qiUq
         F4B6eIT+7Gm+24eTPlDCJoHZ14GFGutYSOvf1fihplHwVQjuwtTwS2H8ITKwJsry5OMp
         TAVNYJKz7nMR68U0oUsNhYS+t2+abRjs+k6oBMbt29ncJ1w93MEkwZhM0CzpGkDaNlgd
         fFrtw4Fe5Z5HQsji3EedxHF0APyKA+SGjcQ4xHpsfgAhEVP3pd48/hd4R/7lraOXx/Xw
         jmAkwyCii0LQh9hdmkg7xE4DPqaSgogEv+P1tU+eJonn7ICYXdmbJ/ykV/fZasVAfQ/s
         qk8Q==
X-Gm-Message-State: AOJu0YznaTcrS8rnmNWZcVRT0WotUNfVHVm01Omm0oMu6maFZl9FVbeY
	3FPc7Z3C3pm9y9dbiuSglPH2/9FE6Ufk33H2UZpO70Bdosxj1BeqjYl6NVGfpw==
X-Gm-Gg: ATEYQzyy3KA4yfisE9HsPDBJycxfuTQ2tXPxRouvTpeiSXJNXqT8zfoDfNd5crzhver
	ljjnFi8zllro95MlyrxVdjKbVoYrP4K8G3DJSXiT6QLosePCpLkp7uuSS77YdKHFjzPeLE53kPJ
	2vDqGsry7uZGrFlBFob9uRFpWv8x3iqQo3P/6MtCr1cH3v+up3wrUuOqpQvU2D63+1KJ/R66HfY
	8Or1Nc4nbVEZ5iwtXS6yIBGvYLVyFVinYzojXQ0qnJ+NpwxsJNDblAT1MJZGpc7TDiIJpJCcvFL
	Hy8tCM5SfCKRymXA+9ugLfpo0g8pZfzhJFFwfT7EzZFOWTJemhC8jYpN7xKt9IwjlNpaB7nXBzg
	+KaQ05xxerId8r+jIOFbRIgSipJrotNjZl7JKaQOXntTK+QcbDAs9LHM8oiwS1mF2sEV5cWzX6t
	BoYEpOaC/GFAqKUtPsyjCJ
X-Received: by 2002:a05:6000:2403:b0:431:752:671e with SMTP id ffacd0b85a97d-4396f173e6bmr13906227f8f.15.1771876289175;
        Mon, 23 Feb 2026 11:51:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm20547725f8f.3.2026.02.23.11.51.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:51:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] streamripper: ignore CVE-2020-37065
Date: Mon, 23 Feb 2026 20:51:28 +0100
Message-ID: <20260223195128.1075389-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124569

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-37065

The vulnerability is about a 3rd party Windows-only GUI frontend for
the streamripper library, and not for the CLI application that the
recipe builds. Due to this ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 6014326826..1600d9d3ef 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -30,3 +30,5 @@ EXTRA_OECONF += "\
 
 # the included argv library needs this
 CPPFLAGS:append = " -DANSI_PROTOTYPES"
+
+CVE_STATUS[CVE-2020-37065] = "cpe-incorrect: the vulnerability is about a Windows frontend, not the CLI"

