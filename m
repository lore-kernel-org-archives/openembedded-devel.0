Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27188C9832A
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 00:39:39 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29996.1790469574501491280
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Sep 2026 17:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H1Z9d0zz;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88286981a36so58417b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469574; x=1791074374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRSYQxx4zNrOx7h41BDfUcuhevWI7gAJRuA+HTuoMus=;
        b=H1Z9d0zzCjCbhmgFxl0nnBETgf6u2/EgTSsnVTDQzw6rM4/A1a+Ndqem/otTpasRpU
         E1SMJTojZ4eH0d3dT5IMxxqinyAzcKPZKJUEyx+xBF3/5YMZvkjaiY70wZuzC+8nS7hP
         urwxAbiZDFlsGqhJgzpH5rPNja9FklyAqAfo1dhJOvx7DuttNKMkIFk9xW8jVDqw4ojy
         kPDVdhDDhC3kJvfXv7bq2i+vWJUDEdG1883/+2oOAG1G/XGBkXme67uJ6V0hPC7Igaqk
         4co0dwIh1Ffgm9RsQPGyEv30s6mQdta2TBikIEhadQ06xjBtiGVRBRDAvI6Cwkd9RR8V
         7iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469574; x=1791074374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRSYQxx4zNrOx7h41BDfUcuhevWI7gAJRuA+HTuoMus=;
        b=ww4j78Kf5PkWO/FYBh0OE7q3nP/S3/vuJhINmQJljV/9MdeWxwMYystpg8GDmh1DZo
         WOI5YR9F6C21VEtHXncpbOYb+DDhQrRCL+yx0lqj0zeoej9KU0UqOnUU6+Rfup34zkHH
         EYivKaWQCymyX9FosarOAPqSqy8CXpGSchzPl5ilDhIN3ha4eMWsyCboFJfT57v8c9sb
         UlS3Yohis7uj+1iXDC8pLVSR6Vw0HoJrF/jkskNZ3TeIMxeNQXQkfdLguOTZpwRl6siM
         ajQAgRrdsXeQYgjZX5uBSqWgPtTw3yRfVLkNXAIZrFOa/w7Xt9giXDaS6K5dKfOXbKa4
         zEiw==
X-Gm-Message-State: AFq9FYK8xcA9B6ZSCugowHxV5xmbA7fMRFhcvikB0GR5UY4rryozAPFd
	hnXcgplrmC2Q5ozEi1tK0458EwTy6H10nSAxpiQOoadFJn3WUcPc8QuurHamdg==
X-Gm-Gg: AYBFou3BMhphHgyFYR/uHClhuzStz28rWfgl4dp6L4lCe+MSzs/Sb/FrVvvK/6/Lnug
	byy9Jr/z9sTLOpHdbDYKQnZZ5X9LIhsOpDzSN7T903CQgagXTcCu8CnHIgHhGkbqlPZdG1wJuMD
	m7vyWEmzb2e6mIfpJqQwCKzPWb+RfiQ14+8h1emK1mf2o0qu2idDumDV8+8rBTlpZAL+mea1/nI
	Mwv6/dTabR9wpci3OlUMpsQbXpQ+03sDTu9vx1J19djdpfbm/NW+ygyDloohGS91gecPXtEoBZz
	QDfo0y1WZPaHfPRSC9ahMliunOy62sDIwU3QLNtzIq7hoSMSH9uWMgEy3Cmo4bUBa12xR3+ncn7
	v6SjQNgHDk8pmolCKbCeNrd9S7+xiY4eAsV/WZp8xE1US/yNWlbIaaxw3DktdIsyo42tFIFqhkF
	1m8RGmWDpWSsh2+gYOTVyolXX2rbR70oaqTvoWKcCyu6h5EMB46aTfRCD+Yub+cmTwFi66r87ms
	J5gk/bbDv6nme87Gnp6DQndvLRfSQarNw==
X-Received: by 2002:a17:90a:4ca7:b0:3a0:b809:b9f3 with SMTP id 98e67ed59e1d1-3a0b809bb4dmr3418968a91.8.1790469573750;
        Sat, 26 Sep 2026 17:39:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm2876420a91.1.2026.09.26.17.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:39:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 3/11] unbound: patch CVE-2026-78227
Date: Sun, 27 Sep 2026 13:39:13 +1300
Message-ID: <20260927003921.746786-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
References: <20260927003921.746786-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 00:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130322

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78227

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-78227.patch      | 30 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-78227.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-78227.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-78227.patch
new file mode 100644
index 0000000000..b434885a1a
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-78227.patch
@@ -0,0 +1,30 @@
+From 1bec118f61aaf13cc5d1dfbaf1d45e0af8986901 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 16 Sep 2026 09:25:05 +0200
+Subject: [PATCH] - Fix CVE-2026-78227, Use-after-free in DoQ stream output
+ buffer on   reset re-transmission. Thanks to Yuqi Qiu and Xiang Li from
+ Nankai   University, AOSP Lab for the report.
+
+(cherry picked from commit 7914901915dd46817e7ae9877776d6fb6fc2060e)
+
+CVE: CVE-2026-78227
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/7914901915dd46817e7ae9877776d6fb6fc2060e]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/listen_dnsport.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/services/listen_dnsport.c b/services/listen_dnsport.c
+index 9b6fb557c..f748070f8 100644
+--- a/services/listen_dnsport.c
++++ b/services/listen_dnsport.c
+@@ -4477,7 +4477,7 @@ doq_stream_reset_cb(ngtcp2_conn* ATTR_UNUSED(conn), int64_t stream_id,
+ 			"unknown stream %d", (int)stream_id);
+ 		return 0;
+ 	}
+-	if(!doq_stream_close(doq_conn, stream, 0))
++	if(!doq_stream_close(doq_conn, stream, 1))
+ 		return NGTCP2_ERR_CALLBACK_FAILURE;
+ 	return 0;
+ }
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index c8d7c6cdab..1ab81879f2 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-56444.patch \
            file://CVE-2026-80225.patch \
            file://CVE-2026-81642.patch \
+           file://CVE-2026-78227.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

