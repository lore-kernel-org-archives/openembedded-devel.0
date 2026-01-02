Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407D9FA372E
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 11:29:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3575.1767353347601644082
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NJGUF3rZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc3056afso6518104f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767353346; x=1767958146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EwbTZKa+Lln6PD95qTlic2S0029CAF6VLZSi3NefMk=;
        b=NJGUF3rZE3qtR7GizlmkZOf6oI2l2WRxbZO2cuIxTkeyTqDCLyRKxjPMAhUYhiGwKo
         xCPWTMceDaNseFaH3sGGTXcgU2wi6ktiSCUJve4YnMiRnKSvdR/OMDeR2KJrW36swPTU
         RthiCQxIcpIorvmYhPVI71IVftScaS5Aakj61a8DO+ux/Gm+Wzz3Ey1c/wAB0cyMZDef
         Fh99SodC8o0KFtCN67nB1CfDmKgIw7BLKw86SMQQwk9WNKPJVJBUhhedYZHbCAqNG3kA
         tRxDmWYZV2dReR63yd92kxcU+JkQ1X/4TQgR8wOKNzqR7z9lkd/ZFswheenJ3Vm9TNjf
         EvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353346; x=1767958146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3EwbTZKa+Lln6PD95qTlic2S0029CAF6VLZSi3NefMk=;
        b=kFa7piaitoporlZOMtwBOXptDNTBFw1mEvUwya1CgH97WNyTgqcIhCfBqBktZsV+UP
         /rkqpJAmum17RTegY05DYoeHfuXZnTxO501B/1zctwifsauT2S0z51vB+eHUr8SDdX0U
         IXIFi99kO06yYgmHW4Y3wSW27QaDfRdn1K30E1sBen7XqnUz5CClHvJZuZpGfQRsw7U3
         OElO1OXd8l+4U30A6veK/tZW6YBUL3D9eddResnDrGHA+qeqKawygqLPXlWP3vs7a5+i
         idBOYoaMMIIbFeoa1OYOwtiUcsd66HPZ+0iYgzeGtAf/1s/p+QrQx6pJawKiRWjrgqlr
         1e6g==
X-Gm-Message-State: AOJu0YzHRipxjk2DbflWm1bMZOAf0sbIseDtD17EoMX14P+vETnp/LP0
	URL2Q3AhJChm4C/+CD3ff6bv84b7hiM2abKPkp8mrsbeclprOlOCyUwVMH2mkA==
X-Gm-Gg: AY/fxX7Y2ZbYStxisk2eMexESmPrrVSbDo48WGpqxBhIHYLLCnifrL8wXeXYHIsR/pC
	Nm416ebq5EqQdn9poYQmX8KACSNDjg2ad3dP3BVMOYE+4oJTbjTxtiRecD9NAyUlfIcU0sA6aCK
	tU7mfCyXxtcpgXpvq29a7nqtj+F45e4Ql8Pmuvxipu2cVJxRzbvKP7wCjnxXJUB6vszpZAnspto
	GPpRYsteQ0jQ+MggwHikqKt+rrdLkYX7m//xXnjsf8uTy2jafBgnC41yV+ZFQbg/Zln5eitx/rH
	K8nqtqwQJHT/RcVtEdxJdgvoBATEqcZPeY9IDP3Xnqo5F2S/hF7XHoUkNaaoisWTQUDBSlGKFN+
	60JMMO+BXZZDFF2KPoiroUm/Qh/lL3Ki0JMGpYuWTaGRIntJmQsEtzvf2DvCRbLWdXVFHhL6tsr
	p9NgM2KRfi
X-Google-Smtp-Source: AGHT+IFA7YxbD8VQ6gyu1BIQuPQh7J2vkvk0Kwqwiycz5xuEwTb06//HUOnyIAsxn7pTF62OzBzgRA==
X-Received: by 2002:a5d:4842:0:b0:432:84ee:1882 with SMTP id ffacd0b85a97d-43284ee2edfmr19704943f8f.36.1767353345795;
        Fri, 02 Jan 2026 03:29:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm85562757f8f.10.2026.01.02.03.29.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:29:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] nodejs: patch CVE-2024-27983
Date: Fri,  2 Jan 2026 12:28:59 +0100
Message-ID: <20260102112900.1800006-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102112900.1800006-1-skandigraun@gmail.com>
References: <20260102112900.1800006-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 11:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123094

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-27983

Pick the patch that mentions this CVE ID explcitly in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nodejs/nodejs/CVE-2024-27983.patch        | 40 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-27983.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-27983.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-27983.patch
new file mode 100644
index 0000000000..895a92052f
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-27983.patch
@@ -0,0 +1,40 @@
+From a8e022586ffe06a27709f4d8c03f328e3042a77d Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 26 Mar 2024 15:55:13 -0300
+Subject: [PATCH] src: ensure to close stream when destroying session
+
+From: RafaelGSS <rafael.nunu@hotmail.com>
+
+Co-Authored-By: Anna Henningsen <anna@addaleax.net>
+PR-URL: https://github.com/nodejs-private/node-private/pull/561
+Fixes: https://hackerone.com/reports/2319584
+Reviewed-By: Michael Dawson <midawson@redhat.com>
+Reviewed-By: Marco Ippolito <marcoippolito54@gmail.com>
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+Reviewed-By: Benjamin Gruenbaum <benjamingr@gmail.com>
+CVE-ID: CVE-2024-27983
+
+CVE: CVE-2024-27983
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/0fb816dbccde955cd24acc1b16497a91fab507c8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/node_http2.cc | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/node_http2.cc b/src/node_http2.cc
+index 53216dc..9a6d63d 100644
+--- a/src/node_http2.cc
++++ b/src/node_http2.cc
+@@ -529,6 +529,12 @@ Http2Session::Http2Session(Http2State* http2_state,
+ Http2Session::~Http2Session() {
+   CHECK(!is_in_scope());
+   Debug(this, "freeing nghttp2 session");
++  // Ensure that all `Http2Stream` instances and the memory they hold
++  // on to are destroyed before the nghttp2 session is.
++  for (const auto& [id, stream] : streams_) {
++    stream->Detach();
++  }
++  streams_.clear();
+   // Explicitly reset session_ so the subsequent
+   // current_nghttp2_memory_ check passes.
+   session_.reset();
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 9c279d1463..9326b26421 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2024-22025.patch \
            file://CVE-2023-46809.patch \
            file://CVE-2023-39333.patch \
+           file://CVE-2024-27983.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \

