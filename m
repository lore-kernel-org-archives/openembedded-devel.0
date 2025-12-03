Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEE9D1BDF7
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27328.1764797399869451101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:30:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8mXiDea;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so2342435e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797398; x=1765402198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5G7ehU4h39LVykCQW8OCkH5MZePjbSx6H9w7wMk0FI=;
        b=i8mXiDeazTBj5xhDAkH76HyukgqBV9IuNx3SabbVlUBRw2TxyZJSwBTrFA59lbg+AD
         wsTCVINaflp/7PXmVKxW+EFzxc7Wl3AAzLmZXW1jzInQ4ihoCNaT0rbBW2IG7d1isgxY
         NTM3WszadFnaIkg5usoRYBkjK+Ljt084dB3uuAvm7n2P9YbWcXfBJC/XSEtsv1qdf+PM
         tRCP1LHWAOaebTgoKIPdKqJ8JNDwMvYUF73v7RSapGYbswdjijVnvBg9rJeWPRCOvrOb
         ljNq150Pdr/x6nXEUbFf/OAI39qMi4H9Thc3/pEiQ4iFkp0bCv6grFDnsok80qgnMXS2
         umTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797398; x=1765402198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M5G7ehU4h39LVykCQW8OCkH5MZePjbSx6H9w7wMk0FI=;
        b=jVglYEwC3WaRnsWVSzSCW06nbKIZa/KgNZGLM4kaDGM1bTPw1R1FJT3svRgkgeCH1n
         E57bVgyi3Ektt+ipv20UtHJ+ECCvv7/rtOH8O9pa9DwkE/1uy/DM8EpvCmZHNF2STny9
         TZWmHIY4ItfYXmEYS1BydFFUFBDpI8WYE5YXwu3EWMRdfYCHh6zr5Wh7XVnt76JeT72O
         aLOJRFxMgzB+QmodwEtUIxG+0t64JwUVly2Tz876ukBV6C1vu6odCTSa1m3jsYo/YMXz
         0lKEQQrDUpRXG2NigENCuRfZ5elNoNn6p4b9HdEkTYzDK7tjHYSS1hvl4Lh6OPitnzYJ
         ZOmg==
X-Gm-Message-State: AOJu0YwI5ELHJAyKVAGfYD46+/FWqSdOHLf8Hnjmt/zY5bVmE6vm33+a
	vwA4EKxI7TDh5k92Jv0CJ0SJQCg0vSBGfF8MNwo7qEn+Iydr4Uli3luhI6d37Q==
X-Gm-Gg: ASbGnct8UCWWoeVpvdkdAkgNy4445mrDUDeXjljrNeEP5XprYK99ffE4XAZo2sORvY4
	TO5wHFh+GEv+lUCxhlwCtzlXd/Os525l61Ky71OgleLI0Hri+VSWZjDA3vtsLgk0rfG2/Cow1v3
	INGyufYj6aSVDERR3LTFVEs5vEIAodB9kO1hosBEiw+T1G4RvohExnduTDyKNdgxTkeqkiVTWUo
	FlwHdjLQUWzE7BQJ7o2T5GHJTOQbjpBZQLlpxvKZAejj0q8/mXULukJnsuTKpoO5LCZrOxQucBC
	HfFWXynX4ZiEKmwjwD5dyhbjANirLoRIm1jXgw2DE2IRxuEU3SHLZHWZhnofltIcXH5ss/DtzBx
	XhW29I1UZtbb2DI9KTZh2AefUrG4GGsyC7yyK5OhhVHsT8xQtNV3ceGWP76W4s3/KzbhfQHK8OZ
	XJ5HZkp1uw
X-Google-Smtp-Source: AGHT+IGT6SorX6rkgzXBhxnaNKcaxf8Weredv89iuGbBxQMRpre+VBnkxn/zQLgc5UIzmrHHuZnLjA==
X-Received: by 2002:a05:600c:1d26:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-4792f24d781mr6225555e9.12.1764797398110;
        Wed, 03 Dec 2025 13:29:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 11/12] xrdp: patch CVE-2023-40184
Date: Wed,  3 Dec 2025 22:29:48 +0100
Message-ID: <20251203212949.4046524-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122289

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-40184

Pick the patch that is associated with the github advisory[1], which is
a backported version of the patch that is referenced by the nvd report.

[1]: https://github.com/neutrinolabs/xrdp/security/advisories/GHSA-f489-557v-47jq
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2023-40184.patch            | 73 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch
new file mode 100644
index 0000000000..c4a6a1b862
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch
@@ -0,0 +1,73 @@
+From 322d11b431e4773f77aaeb764571a3a8d60f9fca Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Sat, 19 Aug 2023 13:26:44 +0100
+Subject: [PATCH] [v0.9] Check auth_start_session() result
+
+CVE: CVE-2023-40184
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/8c5b7cdff3929dc59c5f13e33cec839ed45d1c34]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ sesman/session.c         |  7 ++++++-
+ sesman/verify_user_pam.c | 24 ++++++++++++++++++++++--
+ 2 files changed, 28 insertions(+), 3 deletions(-)
+
+diff --git a/sesman/session.c b/sesman/session.c
+index 441f8d3a60..d352f5e859 100644
+--- a/sesman/session.c
++++ b/sesman/session.c
+@@ -526,7 +526,12 @@ session_start_fork(tbus data, tui8 type, struct SCP_SESSION *s)
+         g_delete_wait_obj(g_sigchld_event);
+         g_delete_wait_obj(g_term_event);
+ 
+-        auth_start_session(data, display);
++        if (auth_start_session(data, display) != 0)
++        {
++            // Errors are logged by the auth module, as they are
++            // specific to that module
++            g_exit(1);
++        }
+         sesman_close_all();
+         g_sprintf(geometry, "%dx%d", s->width, s->height);
+         g_sprintf(depth, "%d", s->bpp);
+diff --git a/sesman/verify_user_pam.c b/sesman/verify_user_pam.c
+index a34d83cd7d..ed17397fc3 100644
+--- a/sesman/verify_user_pam.c
++++ b/sesman/verify_user_pam.c
+@@ -316,8 +316,8 @@ auth_userpass(const char *user, const char *pass, int *errorcode)
+ 
+ /******************************************************************************/
+ /* returns error */
+-int
+-auth_start_session(long in_val, int in_display)
++static int
++auth_start_session_private(long in_val, int in_display)
+ {
+     struct t_auth_info *auth_info;
+     int error;
+@@ -357,6 +357,26 @@ auth_start_session(long in_val, int in_display)
+     return 0;
+ }
+ 
++/******************************************************************************/
++/**
++ * Main routine to start a session
++ *
++ * Calls the private routine and logs an additional error if the private
++ * routine fails
++ */
++int
++auth_start_session(long in_val, int in_display)
++{
++    int result = auth_start_session_private(in_val, in_display);
++    if (result != 0)
++    {
++        LOG(LOG_LEVEL_ERROR,
++            "Can't start PAM session. See PAM logging for more info");
++    }
++
++    return result;
++}
++
+ /******************************************************************************/
+ /* returns error */
+ int
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index f3d11522ac..5a1d904a15 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23483.patch \
            file://CVE-2022-23484.patch \
            file://CVE-2022-23493.patch \
+           file://CVE-2023-40184.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

