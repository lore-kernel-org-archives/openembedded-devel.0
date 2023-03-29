Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BD2C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 12:36:45 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.23248.1680093403562931308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 05:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h1EbK8Ob;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: yashinde145@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id l184so61098pgd.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680093403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWTvJrLtgS5wdN+hRhA4VqIxk4qY/ku5OoCAn08ghYA=;
        b=h1EbK8Obg5+ClvBYLwo9Hpel8n6WVG/4gFN+qVw0V1oI0ldmcD2K0+7EGIT/qh7Mgv
         gif951u/aGIf8hC8pCBSty9XCUgvkWuHpLM6FZa5X/H3orojkOsWEEz1pg6waUbJi9eu
         gG5o1H3SxxDd3h6cvP92six51sPHE3RWOvGnoR9RoZW7jw8mQs+EhuIk8e9Tu7r3yggS
         RQMn0gLLzUJvsNRrt82wM1THuQcLC1vijSDMtp7uxkwl+BTSeBUajrNm7qAZFsJOa8sF
         mZU9GOcoYNdgAJ9RqqTknzrY82qHhcvUAZ9uC/crfrpuNXfIcxoaGijjREOAB/mj9G3Q
         gi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680093403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWTvJrLtgS5wdN+hRhA4VqIxk4qY/ku5OoCAn08ghYA=;
        b=09RrhQ6wqq9/9yx2bsShqLdWYFgO/s+HudOI5jw7HXmLYpaNhLV3rNl+CcTr4KlvIZ
         M/ahyF4rbZYpQnXfL2fiFg+wvprJXV7t5xqDeHzhCFNhSQm87RkXnj7NdYIg0pn9HVyb
         lF6Jhn8egoNoomea1UB9IWg3H2qvDh0NY4F3QELSR6vY2oym6aKnxlHb/Qh8K1CchAir
         rptotBi+XYe2upCdO1pVOV9E5XB6foVdLAvox3UgIdR7Tgk3ThgexoXQfPrMgMbhmrvA
         SWa9B2QtQJ/c0Zp8YG0M1ZjQ6oiEE8YJJWnsblQPwUhLTVSwV/FC26iRbWKHPQdcB48j
         OBBA==
X-Gm-Message-State: AAQBX9dNdBeru9MZiv7IseX6H/uQSXlB3hJO0RHXdCCwJHsARsa5Ku7Z
	fTkeB9fnjP5XYmDOg0e/egDqde8powmM7g==
X-Google-Smtp-Source: AKy350ZQH9jrorZ/R6KnCYaPTOdH1hzPUoWOTwqDi0LXRdV1R8i6vGPb2jTO0tR6Vl0uWi4TPOMe9w==
X-Received: by 2002:a62:1c57:0:b0:624:f46:7256 with SMTP id c84-20020a621c57000000b006240f467256mr19358651pfc.21.1680093402749;
        Wed, 29 Mar 2023 05:36:42 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id 5-20020a630205000000b0050fa6546a45sm15226997pgc.6.2023.03.29.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 05:36:42 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [meta-oe][PATCH] librelp: fix function inline errors in debug build
Date: Wed, 29 Mar 2023 18:06:31 +0530
Message-Id: <20230329123631.2190425-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 12:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101818

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


