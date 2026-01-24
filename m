Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CA1D715CE
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:13 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14202.1769236210732671900
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m5oi4vZz;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801bc328easo32936075e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236209; x=1769841009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0LOQCJ0KNGIel9cruvis2fCNoEYXay+3Wqgk05d2Lw=;
        b=m5oi4vZzxBOAodSFQqAP1rFIV/fGVA7HyX/Sk3R/ORfonsJ85js3o9cCtQEZu7C+9P
         5WYyLlQeKtBuI3EPMtq57DuM2Ap6XCSUEtxGTO896ye7DtPyVG9OzJABvealGmIKvZXn
         4Vkn0EI8dZAFNm50iDHiZ7vkUWKcoPZvtgG0zZUbsudai5/P9xP35dwTL2kyImfzvncw
         Traa7L+wUlabhVq7uqhjUtjC/5l4bwwnJZQqMtEJojl2+w2tPSiaZsVSkvSfTiBsqRyC
         aIYfWcICIJ6iqstm2xunwQrYbVz9x6iKFzty5Z1r7ejaD4F4qVzV3tuqecWoU4qIqw5H
         bkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236209; x=1769841009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0LOQCJ0KNGIel9cruvis2fCNoEYXay+3Wqgk05d2Lw=;
        b=cOjtqk9oLxlEAi6DvMe4ifMqkHmVRLXs5urUY4q9pdYukaTKAFCoQCBII/74bA5L1W
         d6UwkxBdjozmMb+yGHCDR4uPqEdQizuBOyUHQrlpsOEbLXgttDBW5ztjyczNuc7gah/A
         oMhaheZH5oJsvkVElOSFt+KbeRQeYHE4AwBhoLWtgxIbxXg+CklcLtZrl3+cgkp8emMM
         mWI4yktZGy/9g7a9HKFVXqycyXmwP3AIvyJ8aMpKoERwSUQlqDhdZeJ5TQoJc11k4dCS
         elI58DcabXzyqDtIcYlQTyTQkubUxPl7WQ8DJRc8qrUv53NjL2yQvPwJ4ZRcN6p21oye
         +gww==
X-Gm-Message-State: AOJu0YwJjSVB4UPyv6urdkrvakaLRQN8qFZZ1H9ehtrN87PgBrhFw0CO
	yG6uiiOQPRTq0FjsKY/J+Xu2CuiCpbasUeOfhxXt5wKdaq7FRwV7kyrCHmpPBg==
X-Gm-Gg: AZuq6aJUSg8w9BIwIA+HiqcP+9aMEcirEwnlo59LJ90axI9B6l/EOkuyu1EdQxz33+i
	9fKU1Rifn2uLa0y0+E5jiLgYBNXMZtm8LghSM8e1IhHsuyafZ4IkYeaR8hOTDfJ/4A/hmlCFVEd
	XvUWN5x0d2sWvajyP6V2Nf02uG7YpC5UYgxptbODPggzjIp/1Ox1Zy8rKkb7h8PnQ3VQfjTDzBE
	mCfrIZMl2xQlbjyWPGU6cQoeYpO+EnKeiJXAalEsJ5RMCDzxqhd1IYAqkuJo3N3uIKtL7xRcbg/
	rNg+Umxd28z73Om6+zEALyYZIMjLl5f5NemmoLhYsm+o0PmhKvjxZ83DzU8I4HQWPMq3gj7VhMC
	swWu44Hf6Qt2s90J01j36JNcXXDf/K3NHAcDseLa3Bg6W+cuAuntp2kNAP5WZgWAbnm/2VTeg21
	vbfDpc2jZO
X-Received: by 2002:a05:600c:c16b:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-4804c9b2097mr83915885e9.22.1769236209051;
        Fri, 23 Jan 2026 22:30:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 02/13] xrdp: patch CVE-2022-23468
Date: Sat, 24 Jan 2026 07:29:56 +0100
Message-ID: <20260124063007.28313-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123807

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23468

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 1cb08277fe367850eb130c0995d85dca8e609787)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23468.patch            | 34 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
new file mode 100644
index 0000000000..6f8b3a0fb1
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
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/43cf272b1138462c1bdfc48ef7e9142208194382]
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
index a60c125d06..d2527950d5 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
+           file://CVE-2022-23468.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

