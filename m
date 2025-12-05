Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB57DD33992
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38.1764954703638115814
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YDQf858p;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477632b0621so17217045e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954702; x=1765559502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oXfesDdKPXstCM620W+/7DfSh+9R6AoRJ8TQTGyVQU=;
        b=YDQf858pkj2OKM5MST2ABrOMpdhc16haIQDZ12MnEs/oKo6hGSO5skHmNLlDpWWTT+
         BJkEN0Eae0ayo6VW9iOp1O6Tn2tXCIwS8bnabmyWUzWY0LZnnG17+vryWXPDpXCPwSo8
         x5xIRwpeyOs5OZAvdKuz0m4Acm6fiWk3RHArL4tSrp9DES409ueXgWUOC2Jtmf3tziWE
         VRAqTta4yZPqUVNk1AuJm1nd6QiqjbbaNb3+cCI/OPRhC1zbsuj1DSgZzCyeyPgi8cdq
         RsZONY7SrrN/KISLp3bVujE+YLoTTJK5PNnSSQLkrDTe2/oO7TT5Ogh+jrmrsLcRgQNr
         rC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954702; x=1765559502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3oXfesDdKPXstCM620W+/7DfSh+9R6AoRJ8TQTGyVQU=;
        b=V6fntuzhNHm07zJwmlD83fawKbJPCbC0SDhwKMOL97QaXxspZb0k/RY4CSzyvpfOh5
         JRDGnEY9aq2jXybSJADQ/Yrgp5UHH0nAqz3mrBiXIxfSQ7Ve1yOXrZmeF2skrAPQ+v0W
         WjDzCv4P+MtnZ4NEhMxoVaPKJiFX4NClm8xOrngvKyrnAGMf7dzbQ5znPJpqJJ7URDTU
         iJyNyfB3OjEuu/YDCrh+cZoWLCEmlaxfr/WiOis60vt3BncZKEIsOdsynXaNpJ2ttQpK
         eolePQfiLkkm28Royk7LvklhY7g3hNucKh5eLMo0zYH7NHpWS7n1/8IgG8Q8i91quHrK
         pMyA==
X-Gm-Message-State: AOJu0YyB9+eGUANpRG9GMDpEm3hopCiZJ29zl3u6dBPD1JZtJAW07/eB
	7AIxAwsxPnoKEzipIsttst3MdjQN6QMvsK2mkxw6Unt79ThDPoKYgXoll/2r/w==
X-Gm-Gg: ASbGncvjuwgY6jkUlFwdyjr8tJvejGaAnDGSc0voF5Pqg8juvzHmjeYqlMI/l9Gg1Lt
	2Lkr8vOm3XB1HdytuiiUX/Q0KsAxyeGNToCnnHgcGJv8ZRwef/Mfa+Wz2m0WkUts8RFfu3ftZI0
	rr6H1Eu8xklEKk528U4p4LlPrFXeHjIRHNEKZL66Wzm3gGNCpqKXroVaVjVS6tVVE56UK+g+Unv
	5bR38/kA3i9ts0aNJXl5teoAtxo1LuLpcySFAzTImmTCbNMdNJR8+1Rl6OFVQYm3Oo3RgV/9GMU
	lATGXo4D1lTFqQD902p0gxGwXG9pcflshqgUygzuRHWdUnaoYzDBAzw9iEuti15AY7yTdFgajG2
	sE3MJJKvBfvTvXf0nWrmUg4uS9Vak5BqZKKcD9raHOWQhWZjZE1jbzeQxwJVEBqCd22qEmi7Zam
	Aju2Ql+vUp
X-Google-Smtp-Source: AGHT+IGZr1oNrb1jDHHjK2Y5UZOkSQUZGsSwsoagU8+AD3Dp5ynx22px/V1Mj+quKr3ZQrISNEuneA==
X-Received: by 2002:a05:600c:4ed3:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-47939df12f6mr226205e9.7.1764954701850;
        Fri, 05 Dec 2025 09:11:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/10] xrdp: patch CVE-2022-23493
Date: Fri,  5 Dec 2025 18:11:34 +0100
Message-ID: <20251205171134.1346494-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122356

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23493

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23493.patch            | 33 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
new file mode 100644
index 0000000000..de3f7a42f3
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
@@ -0,0 +1,33 @@
+From 030db5524be7616967ae9e7d26b3d4477cf6082d Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:49:06 +0000
+Subject: [PATCH] CVE-2022-23493
+
+Check chansrv channel ID on a channel close
+
+Prevent OOB read if an invalid channel ID is sent.
+
+CVE: CVE-2022-23493
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/030db5524be7616967ae9e7d26b3d4477cf6082d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..068424885e 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -1435,6 +1435,12 @@ xrdp_mm_trans_process_drdynvc_channel_close(struct xrdp_mm *self,
+         return 1;
+     }
+     in_uint32_le(s, chansrv_chan_id);
++    if (chansrv_chan_id < 0 || chansrv_chan_id > 255)
++    {
++        LOG(LOG_LEVEL_ERROR, "Attempting to close invalid chansrv channel %d",
++            chansrv_chan_id);
++        return 1;
++    }
+     chan_id = self->cs2xr_cid_map[chansrv_chan_id];
+     /* close dynamic channel */
+     error = libxrdp_drdynvc_close(self->wm->session, chan_id);
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index e78dba945d..5526027712 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23481.patch \
            file://CVE-2022-23483.patch \
            file://CVE-2022-23484.patch \
+           file://CVE-2022-23493.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

