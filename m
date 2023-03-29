Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A988EC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 13:12:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.23156.1680093152198387619
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 05:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nw0brbIZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id o2so14751672plg.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 05:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680093151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWTvJrLtgS5wdN+hRhA4VqIxk4qY/ku5OoCAn08ghYA=;
        b=nw0brbIZl7mxVcaBZMIDI0n42ZXk4u2UQSYsorYpIbLr6bBFOpk6ghTgV+Xuk467VV
         F+QG6m6k6S8YEBBdtDpp5syJT5w60Yw6Hy07XNq6it3DU5W+3fvCODOrMLvirJkzqskF
         LaQDn6maA9RTHWJg2Ml9fVpG9DLqXPglDTtjF8aXI/EpkfL42O5v8kJUkSJZQbbS0oiW
         Fu893HzYx0Al55+TtCWydikp7a6UynjMtDbQia66Es+mJn7sG2BgVYPrJtzV8B3W/aem
         unfOcxSJfb+rFMwPb3iYj0KM4r+GdDr3AaJ2zr0isBSOy5XM53zcYA8niY0f3aPAhHre
         I6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680093151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWTvJrLtgS5wdN+hRhA4VqIxk4qY/ku5OoCAn08ghYA=;
        b=mTWQckrQLY1BP/4MUvsQOZGSiIDOkqQVFeaPx7SpJ15ZYwEY17+QsleJ1U5St5gZk/
         BuzosYVe9rhNgrz3HtPQv/I1or07QsfvFHhenwLzfkxi32KmrB0LsVCIXgGD3P6t5orv
         W2WgsQPhx3qymGl3BZQa9DKbWJ5uGnX75I7EYDpm5mNvbQd5HmrpSBme5uOzexqbnAId
         d5XMIed0Yabd0GqZrt2ib4gGGN1L+xUJUraaYbKXpb6o3EGfXi4o2Er+VKarc6W3biaG
         NWTGNQ1Fyc8iyx/AMnwFQM2uJKSzHEfc76sA/HNB85mit91eNT5eqDu5OXh4spS1Cj+i
         uxzw==
X-Gm-Message-State: AAQBX9fQw67/y8qoTQ5/T6tiLPfAYFhOZ9ehtbn5ehtzLcXfw7T5xlq4
	z9rZ216MV9UTQHPRuBhyuZo6UyTYz0FZsA==
X-Google-Smtp-Source: AKy350aK64vsl4kbHDdJNZpBKViPlgL/TZuhva/v9uGDD/QF+hKBRa/HsIU3imf5GOaijw3jedN+Tg==
X-Received: by 2002:a17:902:f08c:b0:19f:31c5:1848 with SMTP id p12-20020a170902f08c00b0019f31c51848mr15720664pla.27.1680093151407;
        Wed, 29 Mar 2023 05:32:31 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b001a1a31953a8sm22954691plb.130.2023.03.29.05.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 05:32:31 -0700 (PDT)
From: "Yash Shinde" <yashinde145@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [meta-oe][PATCH] librelp: fix function inline errors in debug build
Date: Wed, 29 Mar 2023 18:02:25 +0530
Message-Id: <20230329123225.2048688-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 13:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101819

With DEBUG_BUILD = "1", the following errors occur:

   src/relpsess.c:95:1: error:
      inlining failed in call to 'relpSessFreePermittedPeers': function not considered for inlining [-Werror=inline]

   src/tcp.c:146:1: error:
      inlining failed in call to 'relpTcpFreePermittedPeers': function not considered for inlining [-Werror=inline]

   src/tcp.c:158:1: error:
      inlining failed in call to 'callOnAuthErr': function not considered for inlining [-Werror=inline]

Compiler does not inline any functions when not optimizing unless you specify the ‘always_inline’ attribute for the function. Add ">

Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/librelp/issues/256

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 ...02-librelp-fix-function-inline-error.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-function-inline-error.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-function-inline-error.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-function-inline-error.patch
new file mode 100644
index 000000000..60cf1b632
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-function-inline-error.patch
@@ -0,0 +1,59 @@
+From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
+From: Yash Shinde <Yash.Shinde@windriver.com>
+Date: Tue, 28 Mar 2023 04:06:58 +0000
+Subject: librelp: fix function inline errors in debug build
+
+With DEBUG_BUILD = "1", the following errors occur:
+
+   src/relpsess.c:95:1: error:
+      inlining failed in call to 'relpSessFreePermittedPeers': function not considered for inlining [-Werror=inline]
+
+   src/tcp.c:146:1: error:
+      inlining failed in call to 'relpTcpFreePermittedPeers': function not considered for inlining [-Werror=inline]
+
+   src/tcp.c:158:1: error:
+      inlining failed in call to 'callOnAuthErr': function not considered for inlining [-Werror=inline]
+
+Compiler does not inline any functions when not optimizing unless you specify the ‘always_inline’ attribute for the function. Add "__attribute__((always_inline))" to avoid these function inline errors.
+
+Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/librelp/issues/256
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+
+diff --git a/src/relpsess.c b/src/relpsess.c
+index ee7b595..aa52b71 100644
+--- a/src/relpsess.c
++++ b/src/relpsess.c
+@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis,
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpSessFreePermittedPeers(relpSess_t *const pThis)
+ {
+        int i;
+diff --git a/src/tcp.c b/src/tcp.c
+index 7a75cc4..f4088c0 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pThis, void* cert);
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ {
+        int i;
+@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ }
+
+ /* helper to call onAuthErr if set */
+-static inline void
++__attribute__((always_inline)) static inline void
+ callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const char *emsg, relpRetVal ecode)
+ {
+        pThis->pEngine->dbgprint((char*)"librelp: auth error: authdata:'%s', ecode %d, "
+
-- 
2.34.1


