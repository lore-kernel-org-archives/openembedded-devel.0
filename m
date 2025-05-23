Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86539C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 17:55:13 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.369.1748022911746406694
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 10:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PkHVQfpl;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2322f8afe02so1196445ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748022911; x=1748627711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3M6kNcLNn/84Hq5LSKLpzxhDBAidtYjsZnDC6K8ESew=;
        b=PkHVQfplaBayvjry75cRphXCWw/Ob59QYPnQU52gP5IvM31smkJm0MIJvkTtmrKaqX
         hM+c1Fd0eC5jYCAIeCXGj/1X6x8Qwqh9Bpjwz7qdegQbKdMVwg+VIriCTw507NLgGEC3
         6ERAL46xY7ofFWpl7hFg4FCBCYPL6FSJZ67avzIwTmKvUbqlQvzJn1Voju5kEemoJmc4
         CcapuhTYiv8eN1IXHYn817KpyPrVla9Z82ctUFRg6lwr+40HCg9V9cqC+huTDakqhvOL
         wUJ2z0yQPpRzXcw2d1NqE8D6KpMMd1WBhP0HeFoQIFGnxALBtrfghrfkW2ZatnbhGpOX
         Chcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748022911; x=1748627711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3M6kNcLNn/84Hq5LSKLpzxhDBAidtYjsZnDC6K8ESew=;
        b=VEj6AI+84YaiNXn1fHHdl1ojjqusurCJqcv62qR0NFs0y4YIqthawk55S+RG+4IouL
         8oDS6qaN8V7uG69niPiI1nRtCxnw2TyjfaHMGVZ2BGMeYnLRBjhl+2ccskw6ZfNdS01r
         YqenJuRm2XOd+suK1gXjsc8bX4IsK2sBbaxHoKQYvSbBBHS4TxdrtbYJW5r5WRNd9aik
         iAurcGJo3iNjAM2pj12VTfv8VMglPNq0qILqKtuadr3zivlr2UN3EdOpgS+EZMutCi4M
         qFBZLsNGNkTuykpC0b0JzJequwOk1dqF07c7g/Kuo2GoBU5aE/Aw4jiihK6o4EhMoLpf
         EmaA==
X-Gm-Message-State: AOJu0YzRLYwSSwaI1yg3Q1uJyXIjH2E6UniGtH1kv8DQBJ0PifgAjwdi
	R4hcD7wmkCK3pjqMFydNpheLCH7lKT+KFmq0vy6IbRZxCyKt5U67l8a+amvxEjiD
X-Gm-Gg: ASbGncuVvjNA0VTI4HXs4O6lc7TV8IB+DgfSpJaQI2w1xKs+6iMO01Po43C1wZliwZE
	jnKMBsly/QYYfRCTfVylmeAaZ8UQtVaHuwDLenSAuM8acuTvPKOWwa8HvbSpEQhk80j1WUyFWj7
	cN64haWr3ZiqgmsTphTXpE3PImsU+4k79JEgf8DFbBGJDpcYXGSUz6jGIK56qB/lBKlxj3FF7+y
	SepeDrhp2vjipgvJcQ6Jkvue55vYqPTLWkGbPiMox7RMHHBrRgugAZKzo3r0xigmXZjMiHHFNUJ
	wRmjU/Esh8tBlurf8mRRe4mH4zJuvm0lkbrwvqTSZjI=
X-Google-Smtp-Source: AGHT+IEHCeiDdYGLNB0SdWGZz7nrt1lumR+yT1iKVc1ET9n8NTIe8OMJoIyy16C/rf1b8nKxoG6vuA==
X-Received: by 2002:a17:903:1b6d:b0:232:1daf:6f06 with SMTP id d9443c01a7336-23414fdf1f9mr3758115ad.47.1748022910747;
        Fri, 23 May 2025 10:55:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9fc8sm126892655ad.27.2025.05.23.10.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:55:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] webrtc-audio-processing-2: Add latomic to linker flags on riscv32
Date: Fri, 23 May 2025 10:55:07 -0700
Message-ID: <20250523175507.1099934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 17:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117611

This is flagged by lld linker since it defaults to --no-allow-shlib-undefined
which disallows undefined references in shared libs

Cc: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
index 00bf26c750..8eab2c4ff0 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-2_2.1.bb
@@ -16,5 +16,6 @@ SRC_URI[sha256sum] = "ae9302824b2038d394f10213cab05312c564a038434269f11dbf68f511
 S = "${WORKDIR}/webrtc-audio-processing-${PV}"
 
 LDFLAGS:append:libc-musl = " -lexecinfo"
-
+# | riscv32-yoe-linux-musl-ld.lld: error: undefined reference: __atomic_store_8
+LDFLAGS:append:riscv32 = " -latomic"
 inherit meson pkgconfig

