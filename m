Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26978D1BDE7
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27230.1764797392501412500
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UG4MsFvI;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so1445965e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797391; x=1765402191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ueVGmg/cG4d7H+CLAido9M6I1lbXFEZgLV1UvCWe3Ko=;
        b=UG4MsFvIIq+XiYFtjV2bUcRYyuc4q4dgbluy3hLwXGc4M98DvLOP6tj8gXDN6i2iLZ
         q9Gu3jHbG90tmxCfdzsaVQJLQx/6BZAdFYCTCJm4spurX9PIb0I5w7x+69geP8/yhv9G
         av8oZRoSYQrp2zMtuvVgC9Qwg77YHD0XNFqeCQ1gIPIM0jYSLeO8hHqz42E3AHJiLmBF
         0AgITxWa7YaAEF6NHqnM58NQ/14OEFgvL1I/17ugqJQKRZcePmIN3oEJwJEUfqiHyElJ
         jDR6WRbY4u77yWz0QZAqN7GIgAP3ryWcmJjpU1O9lHrv2ieyhCXP/t4r/N9Zu5nh8NfQ
         2XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797391; x=1765402191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueVGmg/cG4d7H+CLAido9M6I1lbXFEZgLV1UvCWe3Ko=;
        b=ZojPugNV8nZTstb+Vz2Ki1m/I55yFS4ijBB3ZKTXhtuMLBIfFnXRwp4nrfTRWk/uoQ
         kYFT1MJHxET9Ci1VluF2fLl2kdhslH1FmXqWpNcjWcWPqOe22fOV+Vp1SmNE1nsGwaE9
         z0ok9Dz36s4FWuj3EysKx6mm+SVPwlXofkoLHFQq6bizNgB98bqDVlj4vmcqWtDKkyC2
         3b32qdwHmWMVgp45o7hHqxk1QJiQrdNCdIy5himbfqAQX23AV2CgmCUCnymXW/Mpb3Ih
         v7MEG09L1ONiGYQsK1ojFKlpT2SRaRwx3/d2/yWbKYDlSFRjLAuXARI+ROM1ex7z+4hw
         irrA==
X-Gm-Message-State: AOJu0Yw+/RlAjDJ1glww+TRhI9jotyJ05jrRj0ObFguemnNiR+MoC/sM
	boL+Fn407+I0+YXObS+ZrS8CkdrwslbywdRORcVurcnVJpgSaov1zNuYgec+Dg==
X-Gm-Gg: ASbGncujyBe6aqStO3bl7NiaELPDTQRlRX/fX/CjhyTqeMzn03u12AdVvcy6gCPGY+L
	aEbCtRYXg8yfQjT/a1x7NVKN8YRtniZ60rOibFb6tjBj/1151Hq5hdxxWmGLHoQqshkhNwOZi58
	gKVd27ItNOdlz4985Al2kkrfcLovMmww2Qmv1MuQXwvmReCfGHpEORQpEJpfCWNDesMPVDGeR8X
	Rl8y4TBaH/78Hbmo2N9AgMG2KaJKaX0DlK/+vnAm6+E3uIOzGzZtfKyEyFLqTUhDw/K72oTO8fM
	+1UKWlzX7TIcwWZzJWIHTys/4QEysgBA6OYhf4+FKIfNP/i64gRV8M7YNvucGGAv6jMjy+rnYso
	9CS4xyt4qzJCqnuAnHvAeZ8rI6DpyGJYLN8YYslYBms/M+Pd1koHE5/DnmKNuup6FjGotWQCH2p
	BmNaFMmvI6
X-Google-Smtp-Source: AGHT+IFSNUKfFRIqLgfNKwDzitEK6MMuuCCgvAEhE+tT/9Bg+zb2w1rxDn6V613UQAx7B4E54/c3jQ==
X-Received: by 2002:a05:600c:1c15:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-4792af404fdmr50174905e9.24.1764797390542;
        Wed, 03 Dec 2025 13:29:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 01/12] xrdp: patch CVE-2022-23468
Date: Wed,  3 Dec 2025 22:29:38 +0100
Message-ID: <20251203212949.4046524-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122279

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23468

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23468.patch            | 34 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
new file mode 100644
index 0000000000..e92908f938
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
@@ -0,0 +1,34 @@
+From 43cf272b1138462c1bdfc48ef7e9142208194382 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 09:16:44 +0000
+Subject: [PATCH] CVE-2022-23468
+
+Login window - replace g_sprintf() withl g_snprintf() calls
+
+CVE: CVE-2022-23468
+Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/43cf272b1138462c1bdfc48ef7e9142208194382]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_login_wnd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xrdp/xrdp_login_wnd.c b/xrdp/xrdp_login_wnd.c
+index 7a3134fd3e..28748676a1 100644
+--- a/xrdp/xrdp_login_wnd.c
++++ b/xrdp/xrdp_login_wnd.c
+@@ -722,13 +722,13 @@ xrdp_login_wnd_create(struct xrdp_wm *self)
+     if (globals->ls_title[0] == 0)
+     {
+         g_gethostname(buf1, 256);
+-        g_sprintf(buf, "Login to %s", buf1);
++        g_snprintf(buf, sizeof(buf), "Login to %s", buf1);
+         set_string(&self->login_window->caption1, buf);
+     }
+     else
+     {
+         /*self->login_window->caption1 = globals->ls_title[0];*/
+-        g_sprintf(buf, "%s", globals->ls_title);
++        g_snprintf(buf, sizeof(buf), "%s", globals->ls_title);
+         set_string(&self->login_window->caption1, buf);
+     }
+ 
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 363ab3ff8b..5eca9d3bf6 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
+           file://CVE-2022-23468.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

