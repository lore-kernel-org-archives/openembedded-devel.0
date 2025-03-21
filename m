Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C8BC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 09:56:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.17566.1742551007457907078
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 02:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZrZNexqS;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2aeada833so333363066b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742551006; x=1743155806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlndysMgpiZd29cHZohkuLE2/KnZu/dIAbamOs44aoM=;
        b=ZrZNexqSLGdEEFQmscJ3XNMwXaDbKvF4rdeSm3WNctp4w9ya/ypFwYj98MrGJ5FhLU
         9EKW9g1fsElieOK+V/pB7gzbZMEHwyYozcfXBBRuEdP2cQ5uqDz9ICHQWEijzafGr8su
         ukfxNtgyrocZoTKQGeYUhVOAKUBTbWFoBLkbLlM52/ZDiANV+HGvTNadtOlIGjA0IF+0
         mQcSTQVVOS0gc7qLsKxlevCyXF/SxESJc89o4FS9M0DF9QAk/4oRyGGI9pYsd5LXjg5Q
         BhKoJogbEJ/oKShQs8vUOBorl6eS1gXwgC2Hy8DlNVR4XCzqqn2ILEwycs8MT5L3/Yl9
         Ct9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742551006; x=1743155806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlndysMgpiZd29cHZohkuLE2/KnZu/dIAbamOs44aoM=;
        b=viQiKCN3nKjLJd5snv9UUD//SjaKdTOdGik4MYOFooU7dItxTgNDpG5f+flOaFU3Jz
         VoO0f0RLENPhOnlRWTixv2FWi5YOXX66vYT9vZnHzTnhFrkzNZ/eAvFgojkq68lePyBm
         jBAlvpib5su71pW941Oi8kTMXyDElPPdgCJlahfwSxFxSWl1Q4hCPZqpKCnRpmrmIcib
         bzfF52eLnEpy92iJo14wHgrx27jw+D3fiP0JrvTdQqNyAq53GxX/XKaHUwMEu3aGUnKi
         k8NwdqxtB6NCOWuyLk83uZxG2ArukJxHEv7Y3eJy1Kpwkyn4rhLui0boa5q1htnNJXO4
         xI2Q==
X-Gm-Message-State: AOJu0YxCnTLGJW/V/GZdrIR95A9qOZY2/pO+8p0LOCDi/YAecKy0qU2h
	Au19bte5nk9kLTmlmu6sB1abyzv/Sm0gsJ75UIXli4OyVWzvX6kjGbsudA==
X-Gm-Gg: ASbGncuVVrmr3jx2r3SGkP6N4KXO9bleXkUOJHs6FWfR0BpTzqn9jBo3F9ZRfu2V1dJ
	4lI5IfxOkIqyG3mhl/9ewx0zoScgLTkQM+kWEX2zzzyP1xXIDDVLZ0ypyEVUdSDAdnkcJToIdKA
	apwBvGtjIrZKk31xgE+f7+egvmlFoGTRA8YV/9g0ORMePE3vC2vVWm1eGHd0e14f3MI4yCeO23E
	CkNVXTpkJ+sS0wfTXCWP0IHjS8LR/W4801nxSz6fRLVKIXAbOJ4v/ATQatJn7yPPbXsR2un1/nq
	XJHAo1b9VZIUncSgQhs4M1bdxLX8dD7SgcRgCgS1ElEw9UFeuxEBNVEFOrK+FyfRMy0O0X9IOQJ
	OdA==
X-Google-Smtp-Source: AGHT+IFOA/sx9thowT032VjXBLTmBdUWG7jX5L9FHyCHOrRbT06AZavt+dxI1iA+8riH9CyAAT2uVA==
X-Received: by 2002:a17:907:daa:b0:ac2:4f30:5033 with SMTP id a640c23a62f3a-ac3f0172286mr261022566b.15.1742551005580;
        Fri, 21 Mar 2025 02:56:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3ef869fe1sm120309866b.34.2025.03.21.02.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 02:56:45 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] iperf3: fix build with gcc-15
Date: Fri, 21 Mar 2025 10:56:39 +0100
Message-ID: <20250321095640.1847235-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 09:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116179

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/848456/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../iperf3/0001-fix-build-with-gcc-15.patch   | 66 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.17.1.bb |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-build-with-gcc-15.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-build-with-gcc-15.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..d3f3e712c9
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-fix-build-with-gcc-15.patch
@@ -0,0 +1,66 @@
+From a46630d4e373e9a3ef974c1b67767f6816c66572 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 10:13:02 +0000
+Subject: [PATCH] fix build with gcc-15
+
+Upstream-Status: Submitted [https://github.com/esnet/iperf/pull/1805]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/iperf_api.c | 8 ++++----
+ src/iperf_api.h | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/iperf_api.c b/src/iperf_api.c
+index 7fb741e..4bb5b2f 100644
+--- a/src/iperf_api.c
++++ b/src/iperf_api.c
+@@ -599,25 +599,25 @@ iperf_set_mapped_v4(struct iperf_test *ipt, const int val)
+ }
+ 
+ void 
+-iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (*callback)())
++iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (*callback)(struct iperf_stream *))
+ {
+         ipt->on_new_stream = callback;
+ }
+ 
+ void 
+-iperf_set_on_test_start_callback(struct iperf_test* ipt, void (*callback)())
++iperf_set_on_test_start_callback(struct iperf_test* ipt, void (*callback)(struct iperf_test *))
+ {
+         ipt->on_test_start = callback;
+ }
+ 
+ void 
+-iperf_set_on_test_connect_callback(struct iperf_test* ipt, void (*callback)())
++iperf_set_on_test_connect_callback(struct iperf_test* ipt, void (*callback)(struct iperf_test *))
+ {
+         ipt->on_connect = callback;
+ }
+ 
+ void 
+-iperf_set_on_test_finish_callback(struct iperf_test* ipt, void (*callback)())
++iperf_set_on_test_finish_callback(struct iperf_test* ipt, void (*callback)(struct iperf_test *))
+ {
+         ipt->on_test_finish = callback;
+ }
+diff --git a/src/iperf_api.h b/src/iperf_api.h
+index 1313142..df10c38 100644
+--- a/src/iperf_api.h
++++ b/src/iperf_api.h
+@@ -213,10 +213,10 @@ void    iperf_set_dont_fragment( struct iperf_test* ipt, int dont_fragment );
+ void    iperf_set_test_congestion_control(struct iperf_test* ipt, char* cc);
+ void    iperf_set_test_mss(struct iperf_test* ipt, int mss);
+ void    iperf_set_mapped_v4(struct iperf_test* ipt, const int val);
+-void    iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (*callback)());
+-void    iperf_set_on_test_start_callback(struct iperf_test* ipt, void (*callback)());
+-void    iperf_set_on_test_connect_callback(struct iperf_test* ipt, void (*callback)());
+-void    iperf_set_on_test_finish_callback(struct iperf_test* ipt, void (*callback)());
++void    iperf_set_on_new_stream_callback(struct iperf_test* ipt, void (*callback)(struct iperf_stream *));
++void    iperf_set_on_test_start_callback(struct iperf_test* ipt, void (*callback)(struct iperf_test *));
++void    iperf_set_on_test_connect_callback(struct iperf_test* ipt, void (*callback)(struct iperf_test *));
++void    iperf_set_on_test_finish_callback(struct iperf_test* ipt, void (*callback)(struct iperf_test *));
+ 
+ #if defined(HAVE_SSL)
+ void    iperf_set_test_client_username(struct iperf_test *ipt, const char *client_username);
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
index 2a93109b9c..c84ce5e630 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.17.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://do-not-listen-to-old-udp-prot-listener.patch \
+           file://0001-fix-build-with-gcc-15.patch \
            "
 
 SRCREV = "2acfcfe94e928e74542c9f107e02aa6dd4748a79"

