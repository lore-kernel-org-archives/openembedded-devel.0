Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B060AD715E0
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14211.1769236217445728418
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jd3nGaqz;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso31429375e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236216; x=1769841016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8KlEqcOPu+bmiCswZOs5Dy2ptAfBsrmu8Ta4ips9H8=;
        b=jd3nGaqzDF+7xXcTIeAToK8P0ZYd0+BupJJeiBdOtf7FyiMQ8ZSFVOgc9yYxIShiJe
         8LDs5T1vbZniZmop55zNvbd1pSmkPztc1EhhfFu1OiJwBn3jXo+nBtXGVp62O2+0p2Nf
         HgZDq+BPe6+nG4sg2As7OHi10Oi7VGJATWSiiVs95H7+9YnvGZJYQOIJZiaSwm4dEzpt
         VH9K2hravXx+8Ij8ypsPcqfSB+zZUVlSgj4t+iUGZfn7gKkh+FQizoBbHtJ79xHioRex
         k0St7HwZgtxEMPrPhZvnFe2y3LJy+a7GSPYVqy+CB/L4K0RKp6GZu5f/C07DYLk9JQTs
         FgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236216; x=1769841016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H8KlEqcOPu+bmiCswZOs5Dy2ptAfBsrmu8Ta4ips9H8=;
        b=ew1iOPUn+WDgZVEx75/5EDWhZusxcF/LO80tj09K3hjgtqXEt3FgHOiOuuUqoodFBG
         DfEyEZYAbe55EuNTRuxfZ9z/SvL/qiYxFNX2ryvZfAr35nrtP2A9sv5K54bvAaEAJU8l
         SOL/xG4ap62mVeeCpRt+v+QFyR/2kQLcOP64J/eoTdXxWZmYi8VDKg9swyPrsXRDF0Qn
         V88lPLPp48hnH5j5qwUoH7MVSkmAalF9YgwlCjqQ3tA9c/yGX29V2P2I+l362Dcrjx9U
         52PZdwLtnnbwxb4UQ1p3wpmEl48Dr7ujJ7marNpPjesMmF3ty8/wE8m1qeebG4VKgkEF
         pT/g==
X-Gm-Message-State: AOJu0Yx0OiOY955JLsaRqP6bZJEOd7twS2/FyLSMMrMR+UUAncNQ3zHQ
	bqCU7xBiy+pBcFTY2UanAexzhJ3lDem8lWTgD3nApWrM/G4Y7fU3MfL+O0jIlw==
X-Gm-Gg: AZuq6aLKHwalOvmRuHCYeX4cJcKkZfZ9ugKxK3qP1nGjU0P8qEvPYtWQJJGIrpo0/JE
	5d6XSlbqBHKRvxLeUwK2+NzI9imasLv7J8c3JKnO2zUaFmuP74f3lvRj5qjEyiKPQhN1mEhoe5O
	gsqJDeEKTnsIIrUPGju+/ZDn8FOUBcZI/5xgE+DctwESQaqni8MXkiYYN21Y5YgESlgzmn7l07E
	Xtjz4mAqxJvQwQYj4rSHSZDyvi0tb7r/MvUZi84qYvHgu1B6BWqwQ1oWSCfdObZgaq94oy5dZxI
	Hkz1k5uROY+dHhPETkGLAxXFqFKxz+d3ruYzwMTqcz+FhR5bejuHnQrOEtdzp/VwJNf7aEQ7Hak
	lrhYproWy8+MIZmHOTs0xZkjsJgBZVQ4hGsd1XY7v3RLJACZdOKDY2YvgpD5fIp6t+dxnWD13j/
	HFPmYsFpU0gY6/VpHEFDk=
X-Received: by 2002:a05:600c:3e19:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-4804c9b23bemr82478235e9.19.1769236215665;
        Fri, 23 Jan 2026 22:30:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 12/13] xrdp: patch CVE-2023-40184
Date: Sat, 24 Jan 2026 07:30:06 +0100
Message-ID: <20260124063007.28313-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123818

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-40184

Pick the patch that is associated with the github advisory[1], which is
a backported version of the patch that is referenced by the nvd report.

[1]: https://github.com/neutrinolabs/xrdp/security/advisories/GHSA-f489-557v-47jq
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 259e4f9266680f4afd2c54a3a4a6358151edf41b)
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
index 663ee9297a..4ede3d285c 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23483.patch \
            file://CVE-2022-23484.patch \
            file://CVE-2022-23493.patch \
+           file://CVE-2023-40184.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

