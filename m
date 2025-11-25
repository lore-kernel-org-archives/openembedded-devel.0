Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4863CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:06:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12499.1764057983968194980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CxcyVMNz;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3436b2dbff6so799602a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764057983; x=1764662783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=01leQzscFHUMYfThn5M2a73VSskpKhm2JZJQoHhQXUI=;
        b=CxcyVMNzWGmaaTA7RYwiJWWzbFXTgc50dA2nm9+TuEwqNMXQt0Vu2/Hkr0Qbp8oLpm
         U6g0qWXz57y7oWLp4872K97PjvWS+PtTH2G4PMeqK9/oWJ+ZuhN+vZy9CFIHopxAiz33
         wT6qgluL2LhHIK3tvq9eYElj7XyJtj2YC3gik5DB0K4S3YVLxiW8orazfHGXchtC0mpF
         CZ3OGJ6A0wH/khdw0Sak/Mqiiz30HXMakoI7VfkG7kuy2p5L0uiprqsAD4MeAZy0FU4O
         KzYLwOWQ8r1zhdA+UaGu2yEu5uzX62e69L7F9msyGC/N8GUyhtXcpOO9vT/aq7lS9GRJ
         zTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764057983; x=1764662783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01leQzscFHUMYfThn5M2a73VSskpKhm2JZJQoHhQXUI=;
        b=E6ChV7MI7xKkD42Dh4j18lqVIHhe1MeNCH9ePQItIptl+hznry9wTAEWOWm++aD7oQ
         JdPt1JAFHs0DtgoLd9fmKfo86Mrvkd4kVaR7p3fUHOsNnqQ/l+IaWow1Vq/BCFcL9g2q
         sztVvr5GoCCn4NVNXsK2N8cPEi1h4j6jhG7/uBXIW/ioWAsywEQ+4guyQ5EhlfyxLSe1
         wvKr+Ew5qGeLJgKPLLed0jzDTfCXbcycKvhMG0no+SdsrGHIYlcon7XVBBUg0HIBWqYL
         n4QX/QojEDAiKYHXVSaE2DL8zyJkr06bpt+49anNpLE+ozdFM0ZESJePuQXtwhHqayPg
         8/NA==
X-Gm-Message-State: AOJu0Yy+ICKOwpIVlQbG8QKBL+AOD6d19RuseRO3I0vvfYfSF2k13g2S
	bYor9wNBxSKJP11O/QwDwFuIGLCQLk+08GIE0GeXNhxIJpxNviw5diXWglLeqw==
X-Gm-Gg: ASbGnctxr26CvkrozEksnCswm7CQyoMaIK6SSb6RAsLvsq9thgH5b1fynsFHkaoWqXf
	K7NsCA7WP6pBWMFl/bTgXeMCpZlEDRIej0eWWd0nIgQ48QVw9f3/Zo1NKtsZBxfy04cEhy770ZF
	jZFl6yleNctW1QioiCPnNjSx5ziz51+reHfW9tMifzATeISSAD3RynUEiGUBbqlcgcM1LhmfB6s
	+ptrtn01snxbh4sEXkZLhyLiCNQTwCe8ilEFuwhBpKt1FNw7CNEgWwrm0k/Isn2OqnO8Tik+o65
	nuhyQkyO9TjUG2gvOMgdjsxztUmDOxB/i/YkMxUuO+0d/7TkEmLVi7TSdU2RtU6Ki9KCsXNMx/p
	Sf4buRWpY3OToao2LJbb3coitkpalEz4sr7Pr1gQ6sZyJUYbv8Vee4Wcc1KTTadD8hYSKyqr5y7
	Zo0HBL5CVQX2d1sq6RM0x4ZlQgrBIKizFyGg==
X-Google-Smtp-Source: AGHT+IHbqZ2Jmw6IE50VAQ14lF+yUKHpPYo+xzIWshcsmZSQPAMazjr18GIi6aWTfXaamBg/B/41HQ==
X-Received: by 2002:a17:90b:380a:b0:340:5834:39ad with SMTP id 98e67ed59e1d1-34733f5ed08mr8351795a91.7.1764057982783;
        Tue, 25 Nov 2025 00:06:22 -0800 (PST)
Received: from LL-3324L.kpit.com ([122.167.113.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475fee187bsm697685a91.3.2025.11.25.00.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 00:06:22 -0800 (PST)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
X-Google-Original-From: Nitin Wankhade <nitin.wankhade@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Jackson James <jacksonj2@kpit.com>
Subject: [OE-core][kirkstone][PATCH] libssh 0.8.9: Fix CVE-2025-8114
Date: Tue, 25 Nov 2025 13:38:57 +0530
Message-Id: <20251125080857.2758353-1-nitin.wankhade@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122022

From: Jackson James <jacksonj2@kpit.com>

Fix NULL pointer dereference after allocation failure.
Fix was available for this CVE in kex.c, but version 0.8.9 have the vulnerable
code resides in dh.c.

Upstream Repository: https://git.libssh.org/projects/libssh.git/

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8114
Type: Security Fix
CVE: CVE-2025-8114

Signed-off-by: Jackson James <jacksonj2@kpit.com>
---
 .../libssh/libssh/CVE-2025-8114.patch         | 52 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
new file mode 100644
index 0000000000..27d53a012d
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
@@ -0,0 +1,52 @@
+From b67ac7d9d2dd0dfb834cc657841c32f085661a84 Mon Sep 17 00:00:00 2001
+From: Jackson James <jacksonj2@kpit.com>
+Date: Wed, 19 Nov 2025 15:29:41 +0530
+Subject: [PATCH] CVE-2025-8114: Fix NULL pointer dereference after allocation
+failure
+
+Fix was available for this CVE in kex.c, but version 0.8.9 have the vulnerable
+code resides in dh.c.
+
+CVE: CVE-2025-8114
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=53ac23ded4cb]
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+
+Comment: Patch is refreshed as per codebase of 0.8.9
+Signed-off-by: Jackson James <jacksonj2@kpit.com>
+---
+ src/dh.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/dh.c b/src/dh.c
+index 33883f2..607db15 100644
+--- a/src/dh.c
++++ b/src/dh.c
+@@ -872,7 +872,8 @@ int ssh_make_sessionid(ssh_session session) {
+ #ifdef DEBUG_CRYPTO
+     ssh_print_hexa("hash buffer", ssh_buffer_get(buf), ssh_buffer_get_len(buf));
+ #endif
+-
++    /* Set rc for the following switch statement in case we goto error. */
++    rc = SSH_ERROR;
+     switch (session->next_crypto->kex_type) {
+     case SSH_KEX_DH_GROUP1_SHA1:
+     case SSH_KEX_DH_GROUP14_SHA1:
+@@ -925,6 +926,7 @@ int ssh_make_sessionid(ssh_session session) {
+                session->next_crypto->secret_hash);
+         break;
+     }
++
+     /* During the first kex, secret hash and session ID are equal. However, after
+      * a key re-exchange, a new secret hash is calculated. This hash will not replace
+      * but complement existing session id.
+@@ -933,6 +935,7 @@ int ssh_make_sessionid(ssh_session session) {
+         session->next_crypto->session_id = malloc(session->next_crypto->digest_len);
+         if (session->next_crypto->session_id == NULL) {
+             ssh_set_error_oom(session);
++            rc = SSH_ERROR;
+             goto error;
+         }
+         memcpy(session->next_crypto->session_id, session->next_crypto->secret_hash,
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 891b2c38ac..3781b501cd 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-8277-1.patch \
            file://CVE-2025-8277-2.patch \
            file://CVE-2025-8277-3.patch \
+           file://CVE-2025-8114.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.34.1


