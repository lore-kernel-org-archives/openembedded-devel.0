Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EDDC2A08A
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61163.1767607362007324038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eEfy7saN;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so69090915e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607360; x=1768212160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNRk3+Q5c7jAj6Aec+cJSMTmlVgJY5jvtYI7hoTwtig=;
        b=eEfy7saNxJfubId6RXwi+cdX+tsdAyAwkKzsLWKRjEFyjJSNKVfE8HcWj+8sW+2vmK
         AyM9f4NXHHHoWZB0GrnuaMzWunh2BzQpUxN4Oo7L+EhvAxPpZk7wUOxcgn5l7+JId4Sk
         QiDV7xFGpDc4F+YkPlZpRKllY8Mp0JClWr/ZKJObw2fk4qYQXpC/f9qFfE32mY64PnJL
         M6H4pI0MKYmMSsJwsk7xdeD69tC+U5uvNyw1IGoyr8H8OUEyKJAu4FvJN/3D32teGvo6
         z8L4J0vAXqpZQabQJrnQ+wIWsUX52r+gRA76HcAQNq7ocnEq25/XMsMfes4QZXO/YeUX
         697A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607360; x=1768212160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNRk3+Q5c7jAj6Aec+cJSMTmlVgJY5jvtYI7hoTwtig=;
        b=k4pQkaqvSLWfvv/aT2U8KothYh+2dKXnEubGpRh3I6YTZpAa9VGPzNklMPgBOBpo5N
         zbJMAoxwE7Km3grDRV+ntQksPf1pKyGmVW3ZMaYjyfi9qM4By9l2ephcdLMOQX/IDBUL
         0Mu0OgEnJkrDy8bTaQCYDFP/o+TcWqJn1JsFQBd/BHadvmDzdQUdKEVmYZKMup8Zz0kr
         9HkLL4yAhZdDQTQ9ysj+JwzYNEmtsNWEgJ/tjz+LsBwYjM0T5q22qx6fhnL8FrQbXpkG
         Efua+sMwCY2QjZgDgNKzm3teBNPVxkMswDDzqW/jjo5SPLBkOjy05CUzLiqLoStaSUde
         4Fow==
X-Gm-Message-State: AOJu0Yz0ZM8jsTiVKzgKH+BA1u5rH5YMr7lnTiVR7GuYKgrjh+YXaRBO
	RCULkt5+dHn6O4n6l+LiGqPkMdI0sGpzJMh9uXv8pISJOtipPgRDvjIhKQ3DDg==
X-Gm-Gg: AY/fxX5YPyuDkvAWpNmQwXPTipCxcu8a4T4S9CUCPY+H2ptT2mks78CGEbmwEnZqd4v
	NRX1YJyQtz69c/x88eyKtE1e++5t1JpyFMX2dJZzU3rX4hUjKvnXV9qfuPzLiLI7rg8aJmoTq2R
	fjCUhD7vXUl/weyZWoYKeWfThLxaA3zgXmBPF4AN0OhYA/MwBzyR3X3I3ijz6bdaPg/y4hQ3w2V
	PgDIrGwcZlUa/6BaYHnVl4TGRj3zN/Q0HCu2hh9n3kfF8IKlYoRbzR7VxSROO9XwxgIlsA51JuP
	GwyxCF9UH04aSW7ERpmMRbY++EhvLAPNTBJjhubHfnnR1XfnfkWP1G6OvgMw1AdYfcqEMyzyHE5
	y/s+JEkgR4jp8nxZ3n3U+/ETV3IzwAxHhTYxxV2HZIq28BPi5Kyg4XdST4WuAB/A4xUXJqfdiF6
	rOSCMPQoeE
X-Google-Smtp-Source: AGHT+IF9mC0HLUJFhtSDqfipueYHhj2AJ+Ireb0BWjfsBA9RAIhsp5061/9nLq1Gq3BPUMYvg5CodQ==
X-Received: by 2002:a05:600c:540e:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-47d1955794dmr532136135e9.14.1767607360245;
        Mon, 05 Jan 2026 02:02:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 02/17] fetchmail: patch CVE-2025-61962
Date: Mon,  5 Jan 2026 11:02:22 +0100
Message-ID: <20260105100237.3081345-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123133

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-61962

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 0d9da1105276f04cb23046de5f31fc75f09e2e89)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fetchmail/fetchmail/CVE-2025-61962.patch  | 51 +++++++++++++++++++
 .../fetchmail/fetchmail_6.5.2.bb              |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch b/meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
new file mode 100644
index 0000000000..e7555021e4
--- /dev/null
+++ b/meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
@@ -0,0 +1,51 @@
+From 7860cf0689f8bd828bdd6e7116c6670416ead6d7 Mon Sep 17 00:00:00 2001
+From: Matthias Andree <matthias.andree@gmx.de>
+Date: Fri, 3 Oct 2025 13:11:59 +0200
+Subject: [PATCH] Security fix: avoid NULL+1 deref on invalid AUTH reply
+
+When fetchmail receives a 334 reply from the SMTP server
+that does not contain the mandated blank after that response
+code, it will attempt reading from memory location 1, which
+will usually lead to a crash.
+
+The simpler fix would have been to check for four bytes "334 "
+instead of three bytes "334" but that would make malformed
+replies and those that don't match the expected reply code
+indistinguishable.
+
+CVE: CVE-2025-61962
+Upstream-Status: Backport [https://gitlab.com/fetchmail/fetchmail/-/commit/4c3cebfa4e659fb778ca2cae0ccb3f69201609a8]
+(cherry picked from commit 4c3cebfa4e659fb778ca2cae0ccb3f69201609a8)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ smtp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/smtp.c b/smtp.c
+index 8295c49a..9a89ef09 100644
+--- a/smtp.c
++++ b/smtp.c
+@@ -92,6 +92,11 @@ static void SMTP_auth(int sock, char smtp_mode, char *username, char *password,
+ 		}
+ 
+ 		p = strchr(tmp, ' ');
++		if (!p) {
++			report(stderr, "%s: \"%s\"\n", GT_("Malformed server reply"), visbuf(tmp));
++			SMTP_auth_error(sock, "");
++			return;
++		}
+ 		p++;
+ 		/* (hmh) from64tobits will not NULL-terminate strings! */
+ 		if (from64tobits(b64buf, p, sizeof(b64buf) - 1) <= 0) {
+@@ -145,6 +150,11 @@ static void SMTP_auth(int sock, char smtp_mode, char *username, char *password,
+ 		}
+ 
+ 		p = strchr(tmp, ' ');
++		if (!p) {
++			report(stderr, "%s: \"%s\"\n", GT_("Malformed server reply"), visbuf(tmp));
++			SMTP_auth_error(sock, "");
++			return;
++		}
+ 		p++;
+ 		if (from64tobits(b64buf, p, sizeof(b64buf) - 1) <= 0) {
+ 			SMTP_auth_error(sock, GT_("Bad base64 reply from server.\n"));
diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
index c1def016e9..6cb1a52d82 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=46d2874dd6a0c8961d80c805f106a35f"
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
+           file://CVE-2025-61962.patch \
            "
 SRC_URI[sha256sum] = "8fd0477408620ae382c1d0ef83d8946a95e5be0c2e582dd4ebe55cba513a45fe"
 

