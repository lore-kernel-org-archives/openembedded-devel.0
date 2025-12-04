Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C9BD1D88B
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38408.1764834998166466871
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KCcWOf2Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so1117058f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834996; x=1765439796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBUf9vnUVKOza78EaXi/Lcy9nwQCEYI0/ggL5jwgL5o=;
        b=KCcWOf2Qzyl9LW7mSBQIZc5aWFvqd1qsVib4IEPTYM+x7bR8MV4nsCalq0NSasMPQh
         GEUq9tIDHPqh31zxvzFqIKxbuVO0u3eW0uhMwUV3i4nNNsXINsx1nW9iMb0WObSe1iQ9
         1d/7/BZjKBZy/eC3r2pY7gno1hUrtl9lm1oqayRCeg8XMc1KBW05jndBr91HFJHlnsqu
         g+7HSlp4XBw4GnPuhm0lkjOGDZl5hnD5Jf6EQANoAXTs7E3oYYAKfshSplcm4odureXR
         Mrq5qeLx0cxFm+K/Uj07Txf+gdcjf/7M4WpT0zFCuXU9PzY3mLTV4y54naLrjOSn3GFR
         hZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834996; x=1765439796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBUf9vnUVKOza78EaXi/Lcy9nwQCEYI0/ggL5jwgL5o=;
        b=RO7UU853RjOqwxNzawwaRNI12FgqCnxQR+y3MFDnwM2DnPwqb0mJKFERsPVZaiCrO3
         h8MsQiFEtJQuXCYEcG2lklx4SltrmLmtuxvDwjzql6fiqGF7LTYFfCMzq4VxnBfQ1b00
         uBpggCs2FOj2vjSIGNeVfauKlyazbCfjw4oSSDSCt3FZq+/l5kSCwkCKsHCDyUAFun98
         3ZcIpivEXHtAWYdqk6jZxpo5G1dsYBkaXlan6sEgqBAnThZ2sqBWPNSfjnUMfpFD3Ojh
         4hNqmB7ZJKZAFdQUfWCZ4GT4gvRr24QIReJ2M3AaLKjLi6cKkgYjYMmBlZDM8NWQ+3nl
         tLOA==
X-Gm-Message-State: AOJu0YxHk6WiO8zk/BTdUFuYl+zrFRwgF+hNkYzI8ZPyKergtZmhEwUA
	PKTOz34ax83otj6v4lTw9OYN3/vBpcY1MUkBkn16Vo2Y+LcvltlruaPBYFYgVQ==
X-Gm-Gg: ASbGnctK1TI82wzb1xem/JJXcD2OOhQrAiYj5y3emeXbhL3mXSQ57rD6rfVXn3nuumV
	cg2YIwb1l7BBZX5vumaV8Xf3XLkQV1nsuWnyUvWHuPpu9I1MNXoQhhMMl8JZsxrX3N4NEytwvG2
	HwHTN2DukvDRX32mq0KTEXktC4b5ojSY/GX4iCadzzAzcOgiRLPcCUDoI1z/90x54LpYSaljmA3
	jP/ueZBJmPHKqZ4j8bOjA4SsuIHBymwjpCbIC141d6tLqT2fEjrA6HpqQhXv9KB84nGFdhN/BtL
	V2wWCdN9OQHNVgvJjAEuQKz+tmzGGWga3LXeF/aZBmD88eXo7bCg3aMKDnxaCOt0xMSmO0NETvn
	dogYAughzq8Txz3C7ZJ/XwcbXkkL0oD2OrPo2fBTTX5pIXDDUrhNF067Ie32Zhq0IP4Hs/ijIeX
	eiCX3NFlHd
X-Google-Smtp-Source: AGHT+IGdx1jZF3PMa1OSMCQcr2WlyMpMSO1iwM6jVywGX8h4ngKd8SSHH+cvfw7Q8xDzkeEbHBGK4Q==
X-Received: by 2002:a5d:5f92:0:b0:426:fb27:974a with SMTP id ffacd0b85a97d-42f78895c1dmr2369105f8f.27.1764834996257;
        Wed, 03 Dec 2025 23:56:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 01/12] xrdp: patch CVE-2022-23468
Date: Thu,  4 Dec 2025 08:56:24 +0100
Message-ID: <20251204075635.1088007-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122303

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23468

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

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

