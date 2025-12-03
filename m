Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B5CD1BDF2
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27325.1764797393093855695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EZmz5hhQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47796a837c7so1666555e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797391; x=1765402191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esyABswi0seMrWPMSomBcwNU4Jpi4Rw8Jt7IkBpZCog=;
        b=EZmz5hhQ4QkYUlWD7WrkReiq4kSitUivhGb7d3NOPNY5MDR9Y7TeKgm++Z0ZRADReF
         spb4YnMemeN5Owr7O3DIrb0lcJAay01CVG3+QBSRstB+VMeY4oiczqIOyEChYetHYf8K
         UvAMW1YlopOOBysBjXZNr5GAUn2i8ETmBoQgYU48BQLsNSozJviSW8OIvok6/FNceFpH
         Hx3xezY9hBQ2v9cpvCRn5D0sxmppJziJLH/naVbZ8StXPLkzfjGvq+eoAqyN0lovEWXV
         q/Nq60XBJDvfoM8o/3EZ5yIDg6ifKESJNLWZF2c6Pgo3CkCS+uRIiJ60lwsgl0KCSK70
         rv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797391; x=1765402191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=esyABswi0seMrWPMSomBcwNU4Jpi4Rw8Jt7IkBpZCog=;
        b=lpiekvBU6s5R8X65jXZd2sU2+5Wys3AqWacYDFwhu/LEJeffDd0xm/lv14Wfg5PSZW
         Xd9qvZNMJzxVRlMy9M5/g2kiAKKH8SUiqBCcnjsN6nNdqFTD3QrgbjtFLKbPUwRQqdxT
         0N3JEe398+PUzO9Z3JoosoYS4JTGUDnMHl22ouoDRHLeeUO/viNhNTG3TDN6aKai2eU6
         /aF2OrE8jgE7nRAykXOTvCz0+lhYJszsqPVfZkDqpGc/UTg6eujkkmwlS+Zfn6oGIwSJ
         7qC8G1fPwCeKyZ1tstkLlss3noHxFKSXYeM3JqHI3zA43rE4RmJwxOfleyNBAPZRNEvO
         QkWw==
X-Gm-Message-State: AOJu0YylF+CRgdlIeQjVdMvFZoseBzOqz2eTp7A7LiYsKqg+nOXGCb9Z
	kTt7I564oc335him3MBtrDJAdEOUav9UDXOTVkUvWBLLLyC5j7AREqNLC0OXVg==
X-Gm-Gg: ASbGnctauVX+ZFwhnRkUPPhPepgOpHDUIjVsaCRLnUVGGtdfM2HuBKlFeHhg0Z9Sxvm
	RFc5dyCFbvur95WoHEbCMeqUQSA6ovzyaV9gnRbvlaIr/3JePo2UMdn/Dv10n8ZYbL8XMWIJzcG
	92CIq1+3s8GOHBC4SpxGYOww9dlHIbC1CO8Mtaq2g4DaF/lNolZSoAsGfO0NvvjZlxw7/DXBCqe
	D5thAp/2f7kB1QEA7ukLPow4o4Gw3r9mrIX1cRjApGvmISbviEApZnrSyfabZJWDEH7CPm6su5X
	EHhx7NpY1wsQkBMQp3g6nAFRnxrSkOdvdhIVFZuhym82ak/WtecPT14CVY/mjlXw9v+zEwhEPkv
	vnAvrOuveAry45Qw0/c6WABWE/l0AYMAjQoNDEQScmRdcf2FLhdIW5qDn8u37/qLFvVjhHFQM03
	mxUqqL65P0
X-Google-Smtp-Source: AGHT+IGUJYxXuXxvXR9rlXnoYGcUU+Hi/dg0WArtxi7Q4xqPcWUhxaXeBzBACtxiJMVJd2sxojJr8A==
X-Received: by 2002:a5d:5d05:0:b0:42b:43cc:9827 with SMTP id ffacd0b85a97d-42f731a4ca6mr3712016f8f.38.1764797391185;
        Wed, 03 Dec 2025 13:29:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 02/12] xrdp: patch CVE-2022-23477
Date: Wed,  3 Dec 2025 22:29:39 +0100
Message-ID: <20251203212949.4046524-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122280

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23477

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23477.patch            | 38 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
new file mode 100644
index 0000000000..93aeff2925
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
@@ -0,0 +1,38 @@
+From d49f269af82be5f14b193d4edfcb63b547a16ff4 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Tue, 6 Dec 2022 11:31:31 +0000
+Subject: [PATCH] CVE-2022-23477
+
+Prevent buffer overflow for oversized audio format from client
+
+CVE: CVE-2022-23477
+Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/d49f269af82be5f14b193d4edfcb63b547a16ff4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ sesman/chansrv/audin.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/sesman/chansrv/audin.c b/sesman/chansrv/audin.c
+index cd802fa519..36a8027a57 100644
+--- a/sesman/chansrv/audin.c
++++ b/sesman/chansrv/audin.c
+@@ -181,15 +181,16 @@ audin_send_open(int chan_id)
+     int error;
+     int bytes;
+     struct stream *s;
+-    struct xr_wave_format_ex *wf;
++    struct xr_wave_format_ex *wf = g_client_formats[g_current_format];
+ 
+     LOG_DEVEL(LOG_LEVEL_INFO, "audin_send_open:");
+     make_stream(s);
+-    init_stream(s, 8192);
++    /* wf->cbSize was checked when the format was received */
++    init_stream(s, wf->cbSize + 64);
++
+     out_uint8(s, MSG_SNDIN_OPEN);
+     out_uint32_le(s, 2048); /* FramesPerPacket */
+     out_uint32_le(s, g_current_format); /* initialFormat */
+-    wf = g_client_formats[g_current_format];
+     out_uint16_le(s, wf->wFormatTag);
+     out_uint16_le(s, wf->nChannels);
+     out_uint32_le(s, wf->nSamplesPerSec);
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 5eca9d3bf6..91d4134789 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            file://CVE-2022-23468.patch \
+           file://CVE-2022-23477.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

