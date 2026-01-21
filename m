Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C30FCA5FBA
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:04:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6845.1768979082063811818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RuoY5f5/;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801c314c84so40435345e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 23:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979080; x=1769583880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTvoy7Heb7fbn8TgY5zHi97jVbCDENv8RC9rlBZ3duY=;
        b=RuoY5f5/qn179JZM9V90Q+dzKgFOxFnn47KOGDpmyPcoGM1H0nAE7bpizQwJ2QOR8c
         1qLGOPNzBBNZryQuOlvw7K+vNax+OugWJBODMua5GkSvGi3yX4dJsBjXGqXfaYUQnk+t
         LqvtIgX9GlUeumifCmPdve+j9UeHDhWt7sd/1FhSJViJ39FSxpR53BsMYphJTOlu8HHe
         arzfXIadozDzlkSWwEu6BUYydxDzXOjrlZKvkn6SiaRvlgxLp3UUGT4gVI0KhhXuI8d0
         iwU/wYgkxowjq9WUNLhCv5b3HfwlgEHXSUoX4rfOYA8ckI1rQUEuOIVjy4N7sNzD0/Sf
         119Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979080; x=1769583880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTvoy7Heb7fbn8TgY5zHi97jVbCDENv8RC9rlBZ3duY=;
        b=CqNPzBzVT9SyqkCd7zhW4WPiR6Zh7jELCbmgE+c4d/XnE6+8iEP/vteZZ8T9tX/1Bo
         h1WIAVw84PmZb9PH0VIe737IIbZzAvIMJeRKctMz7438hw07/GamtRrI5E/3RMxHbE57
         dtUW9ZR9yFxAXo8g3t40XAO5zkjFPUTNsrI5QOdXNHPoY+iaibPDKxUypvgxS4OMBv20
         jtZdVWz6XlSakJK0H//RffHehZIGBN2RpKUjKZj5Z+Ics51OAnfqBnh3yY9qUS4Hirdu
         xSDMsJXYJmqcYOOusHmFxDV8aERJMa8Q5G2aKMoVzRSjU5JzMnJCGxj/IU+uo/ROqj3D
         YlEg==
X-Gm-Message-State: AOJu0YzGA7BW7BGeSJXLuWtkdv878Avd6gc9Eixzo+IZQZkKgGyyuR7f
	FGaceUa8nPoRORVP86d1R3QGZ4gccyL6n6OX5Ok1ZgPecejOiuXd+k7M+DZAfQ==
X-Gm-Gg: AZuq6aKgwo4T4o8ZAhCgPoyMEu6ZqvpreGRNb9A8kM1rGL13FijIiSOBpLz/c+ElV30
	p+CNkNBiPcv46YYiBIjXSINmvyf1/aE8hdcFTRmGY83ZGk9i/R6uXW/YJRpUqbQ9ofAY46ZA11t
	dcNlCICX4BT+5e0X7UGcCneoAEt9Of+ieyL8dJXtC1jpV/5EpU+BORMkIIgvkg7wz/2/Oi8G+IU
	8QFYlZI57+51cIsO1N6SGLXzTHDus7lIiKY255AH7ZwfFSNhEHS2KAtEke1YQ36ZyQMViDu5+Xc
	0bv36UWryEm/Re4jm5GcQttnJy0m1fcxZSgYCKmsDER42/Xg8mc0lL3gqwtFKhnupqtC7F23eGU
	Sl8cAcuhOeE3vgvWMxjecYQSy0qYXUlSbbpDgsRN1i/zfY2tve1yCCKTLYvGWsznAPQN+2EkV/R
	oPt56xtOg5
X-Received: by 2002:a05:600c:19cd:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-4801e359031mr228933175e9.36.1768979080107;
        Tue, 20 Jan 2026 23:04:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dadbsm34106880f8f.21.2026.01.20.23.04.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:04:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] freerdp: patch CVE-2023-39351
Date: Wed, 21 Jan 2026 08:04:35 +0100
Message-ID: <20260121070439.1632875-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 07:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123684

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39351

Pick the patch that is mentioned by Debian[1] to solve the problem.

[1]: https://security-tracker.debian.org/tracker/CVE-2023-39351

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2023-39351.patch      | 30 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39351.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39351.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39351.patch
new file mode 100644
index 0000000000..549b0ec61d
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39351.patch
@@ -0,0 +1,30 @@
+From 4a6475e50797218dec507f75477d6c047b14e9f6 Mon Sep 17 00:00:00 2001
+From: Armin Novak <anovak@thincast.com>
+Date: Sat, 5 Aug 2023 09:29:19 +0200
+Subject: [PATCH] free content of currentMessage on fail
+
+(cherry picked from commit e17ee48065d1ebcf863e8d0421cd656c4ef04d41)
+
+CVE: CVE-2023-39351
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/99e243cdbc31f66b5c917452c8fed3276e8bdcd5]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/rfx.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libfreerdp/codec/rfx.c b/libfreerdp/codec/rfx.c
+index 8c65e7508..3001f71bd 100644
+--- a/libfreerdp/codec/rfx.c
++++ b/libfreerdp/codec/rfx.c
+@@ -1225,6 +1225,11 @@ BOOL rfx_process_message(RFX_CONTEXT* context, const BYTE* data, UINT32 length,
+ 		region16_uninit(&clippingRects);
+ 		return TRUE;
+ 	}
++	else
++	{
++	    rfx_message_free(context, message);
++	    context->currentMessage.freeArray = TRUE;
++	}
+ 
+ 	return FALSE;
+ }
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index a104f33e52..5c196f5ff0 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2022-39282.patch \
            file://CVE-2022-39320.patch \
            file://CVE-2023-39350.patch \
+           file://CVE-2023-39351.patch \
            "
 
 S = "${WORKDIR}/git"

