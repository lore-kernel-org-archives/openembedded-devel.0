Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367BDCCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:10:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.1238.1761595819536295052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNR4BqbT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-471191ac79dso53320475e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761595818; x=1762200618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXCTuOBnJbv1PMOgnekh1NLWrmqf+u3s+r6v4IwVx60=;
        b=MNR4BqbTnmPNyDhfbGj64H+0m07WkI8V9tZnn3NLyiUc+Uk7ZaFzEXap05V0VR5QY4
         43ioNo1n1B8xxNvEQqDL13DcJjTXutDN4DU/VCG/IEYrabVrT07JQrI8fsmFq4IiOTeI
         Y619mI5ifCGea6UGRzlJejL36YGk729Xe+vDb/ScEg5BeWG2RxtVZquq6aVVbba9Nxv2
         PRsj5dwkI8vKE6CjmQOWk2C79AvKqCMfvcZappCv7GuOWErY65dMsS/ZCA/+E50Rl9Kh
         Wp/YRpts76HIHOZDBdFl2cFzwDIWqtibtp5Fy79Te9RwutXihpJzPupjHC1aB0u9yYdg
         Dzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595818; x=1762200618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXCTuOBnJbv1PMOgnekh1NLWrmqf+u3s+r6v4IwVx60=;
        b=oLz56pW9iPsUxD3Tk/flU6UFN+MIuCsrBG7hzAH5jKs29WQqGwkoOH7ENy70Md1OjL
         cXn5mG3mn+UEnlpKtKiizCsNx0ltmBgPKiUCtJXp9OXe96hfj1n4/bb8q+UFYkJtdhFw
         t4QKOHWMJDMp9i4W4mVP1Xf4psAafPQOmhOqpFL/xD8DvMhH+cUH7V1WPDOIiHU0klN9
         Y77X9W2Q8RZ+KwIIBFhHQtnaAVkx6NKa/E9VqCrACJwLRlJATgpqKQ2DsA3X5dD+mBx8
         DTD1EGdkNNYPG0Ty4rSrLXrLPxifzO72cJ9t0o4MUxrlW6769EsWQTJMp01yRY6+hfKk
         OAig==
X-Gm-Message-State: AOJu0Yyv2Fp5Hawhae6cTKjyA7KAji8F+H8s49z5bbuTAryMQgDKB+oD
	ueCW1jzxsgBDhvsh9Nol/nnJMi6DkXlHJsOSueiXIu8W5Jw0q8tFij/zdNX3Ug==
X-Gm-Gg: ASbGncuRtLEYzio1WB1g3toWTGOTJ3bN9pySd+mofRmND3wyxOxupeNcTEY4tZIyn79
	qy7n5zVqqY+ITbJ8HPZQS6fautorc0E9p9b4gqLo4NQGoVRep2Sr07xCxhJMOO7fHKGHqnaxBUy
	wYwhXy7CxwLxfzKLnRe8yG1hYWrIjdfAGtgHv9bzWTiTt20kUaddJTBX3RI3l2AueOaZOC43+3M
	7XnZYaQoqeFeDaFvqLcc5svXovsNN1JijfjwZoEWfZJU8h9gJTS8/1VjNKOJZh947Du8Rbm1B4V
	RZz/mAHx/V0uwn4QQ20DKJNNr/QN0kgUWhSMG3mjp5WDKPJg620toBtyyTNlGT3fOWewsnsbxx1
	LpLV4PyiYTpYTBlg4YyjYbveeqtEmuQlSEZ7ELWrycLkK/3OUVPYXXgaG3BazGeVUOOkkleMKTQ
	==
X-Google-Smtp-Source: AGHT+IHkHjY4uNk+LQY10ja2IGH/5d5JppFFPw5DhvkWiZOPjODkVM9cvFMRFl8MbjawIHCnpkNvug==
X-Received: by 2002:a05:600c:6287:b0:471:168f:717a with SMTP id 5b1f17b1804b1-47717e04bb9mr6541435e9.16.1761595817904;
        Mon, 27 Oct 2025 13:10:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm155508975e9.13.2025.10.27.13.10.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:10:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 3/5] libtest-harness-perl: fix ptests
Date: Mon, 27 Oct 2025 21:10:13 +0100
Message-ID: <20251027201015.4098472-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027201015.4098472-1-skandigraun@gmail.com>
References: <20251027201015.4098472-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121058

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libtest/libtest-harness-perl_3.44.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
index 58ca70b9e1..6b5fe43e57 100644
--- a/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-harness-perl_3.44.bb
@@ -38,6 +38,18 @@ RDEPENDS:${PN} += "\
     perl-module-benchmark \
 "
 
+RDEPENDS:${PN}-ptest += "\
+    perl-module-carp \
+    perl-module-file-find \
+    perl-module-file-glob \
+    perl-module-file-spec-functions \
+    perl-module-getopt-long \
+    perl-module-io-select \
+    perl-module-ipc-open3 \
+    perl-module-lib \
+    perl-module-test-more \
+    perl-module-text-parsewords"
+
 RPROVIDES:${PN} += "libapp-prove-perl \
                     libapp-prove-state-perl \
                     libapp-prove-state-result-perl \

