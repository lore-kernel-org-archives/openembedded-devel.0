Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307CCEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 02:54:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.3398.1689648874011032390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 19:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=MgF/+KZD;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b890e2b9b7so29383575ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 19:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689648873; x=1692240873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeiciRQIz3h5f57FYRcGyTlpLr+xzYtAmRy8rn/wiIo=;
        b=MgF/+KZDp8rC2ST6p356bdPKKxvHYrAB0Ib1YjppZgOKyQ8srGcaybD5PEI+ei+nYU
         KbE9l1pn3fr1cci5uyjngrO1tebA1Y/wCDTZYNBDMAF7nO5AQo0o5XgaSmvT2oEKD92B
         3oTQI25SOmwLuEkwGQSQrK02VE01Hl9g6SpKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689648873; x=1692240873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeiciRQIz3h5f57FYRcGyTlpLr+xzYtAmRy8rn/wiIo=;
        b=FSHuHtEu9MxC3g5xsxA/DhESEfNL2S1l5zHv5QckINb4Hp4r5hFMZh2IQhPic91bQ0
         sSFTRvIhOChFc3ZUDQJeCUtGv/Pfp96uBLObFU6K4fKkckoxsSGVLQDoiN5eFRufdw1F
         ezWpIwSPIgT+b3UwIf05AZYphs91OSC4/5HFdgm9uZgPkJu0UiEn9a3vjijE62Tv5VuD
         VyF2fwFnEjeO1US+VP2xMjmNm1kZxvINGh649kKOBL8Mww4vS95tE8K6s6THnWI0+BsF
         eesSI6hCAJ4ya19u5wuGFNF0Is1RF2p1pSO0kNtVWr85rL9uDTd87SDYwz3DtOd9o385
         s5Vw==
X-Gm-Message-State: ABy/qLYQpdgtrrOfNJ/mIbokvhxGKxGmpryuPhsrpwMN1Vyg5AtduWLp
	cP4Np5HgqIaaLTVP7rF+hR/iKy8MIlQ9/1f7rac=
X-Google-Smtp-Source: APBJJlFdTS95KrhpJKeExFlHmnIF0bqpMzA1xGFogUkl4YO0PNBKSvJkrgZkIEwqQgLndU3PatyIKQ==
X-Received: by 2002:a17:903:18e:b0:1b7:f546:44d7 with SMTP id z14-20020a170903018e00b001b7f54644d7mr11372294plg.17.1689648872754;
        Mon, 17 Jul 2023 19:54:32 -0700 (PDT)
Received: from MVIN00020.mvista.com ([122.177.47.142])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902744700b001b9bf203cffsm583398plt.5.2023.07.17.19.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 19:54:32 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] c-ares: CVE-2023-32067 0-byte UDP payload Denial of Service
Date: Tue, 18 Jul 2023 08:22:21 +0530
Message-Id: <20230718025221.51690-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 02:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103892

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../c-ares/c-ares/CVE-2023-32067.patch        | 84 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.18.1.bb   |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
new file mode 100644
index 000000000..63192d3c8
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
@@ -0,0 +1,84 @@
+From b9b8413cfdb70a3f99e1573333b23052d57ec1ae Mon Sep 17 00:00:00 2001
+From: Brad House <brad@brad-house.com>
+Date: Mon, 22 May 2023 06:51:49 -0400
+Subject: [PATCH] Merge pull request from GHSA-9g78-jv2r-p7vc
+
+Link: https://github.com/c-ares/c-ares/releases/tag/cares-1_19_1
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae]
+CVE: CVE-2023-32067
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/lib/ares_process.c | 41 +++++++++++++++++++++++++----------------
+ 1 file changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
+index bf0cde464..6cac0a99f 100644
+--- a/src/lib/ares_process.c
++++ b/src/lib/ares_process.c
+@@ -470,7 +470,7 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
+ {
+   struct server_state *server;
+   int i;
+-  ares_ssize_t count;
++  ares_ssize_t read_len;
+   unsigned char buf[MAXENDSSZ + 1];
+ #ifdef HAVE_RECVFROM
+   ares_socklen_t fromlen;
+@@ -513,32 +513,41 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
+       /* To reduce event loop overhead, read and process as many
+        * packets as we can. */
+       do {
+-        if (server->udp_socket == ARES_SOCKET_BAD)
+-          count = 0;
+-
+-        else {
+-          if (server->addr.family == AF_INET)
++        if (server->udp_socket == ARES_SOCKET_BAD) {
++          read_len = -1;
++        } else {
++          if (server->addr.family == AF_INET) {
+             fromlen = sizeof(from.sa4);
+-          else
++          } else {
+             fromlen = sizeof(from.sa6);
+-          count = socket_recvfrom(channel, server->udp_socket, (void *)buf,
+-                                  sizeof(buf), 0, &from.sa, &fromlen);
++          }
++          read_len = socket_recvfrom(channel, server->udp_socket, (void *)buf,
++                                     sizeof(buf), 0, &from.sa, &fromlen);
+         }
+ 
+-        if (count == -1 && try_again(SOCKERRNO))
++        if (read_len == 0) {
++          /* UDP is connectionless, so result code of 0 is a 0-length UDP
++           * packet, and not an indication the connection is closed like on
++           * tcp */
+           continue;
+-        else if (count <= 0)
++        } else if (read_len < 0) {
++          if (try_again(SOCKERRNO))
++            continue;
++
+           handle_error(channel, i, now);
++
+ #ifdef HAVE_RECVFROM
+-        else if (!same_address(&from.sa, &server->addr))
++        } else if (!same_address(&from.sa, &server->addr)) {
+           /* The address the response comes from does not match the address we
+            * sent the request to. Someone may be attempting to perform a cache
+            * poisoning attack. */
+-          break;
++          continue;
+ #endif
+-        else
+-          process_answer(channel, buf, (int)count, i, 0, now);
+-       } while (count > 0);
++
++        } else {
++          process_answer(channel, buf, (int)read_len, i, 0, now);
++        }
++      } while (read_len >= 0);
+     }
+ }
+ 
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 152d91332..2aa789760 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
            file://CVE-2022-4904.patch \
            file://CVE-2023-31130.patch \
            file://CVE-2023-31147.patch \
+           file://CVE-2023-32067.patch \
           "
 SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
-- 
2.25.1


