Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7304C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13152.1787485964522391132
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EOijuvXV;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2644683a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485964; x=1788090764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOqlvgJNXDG+HaxsNRbKDwwbliGIvZEjCzf8Qd3ri6s=;
        b=EOijuvXVxZMFxemnENrmf00XX5J5lyW1waCJeJU0UXMJzLIjd8Eigk0BoCUMuIXt7o
         FqVUpzh2E5sFlwMtCcGz2IMkim4ocjhqA1SX/c3yySPHiAhX13xhsWcf1N9XUc06jnAl
         +VnY1AMQL9QyhoRhXAlkOFym1kJ/lnqOHA1Xc6xcjlmGPck9nJYeVK3Sf0LqhWoM4WbI
         QrZtB++DloXdwftd+bhn3ggUh4ECoNRw1i9WggcmSpmH4PPLLMrkwTm7NWblfu087nXn
         dM4iQQ7SnRn7AUWQ9Y/88llXJ+wogn0BpMKYikxZGeoSm3J8QZsIftJsa/Bw8gkCXnKo
         pBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485964; x=1788090764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOqlvgJNXDG+HaxsNRbKDwwbliGIvZEjCzf8Qd3ri6s=;
        b=SNTeQx4YWK8gzMkMkzqZEBBJ7tW8JUTsW/ucDW9wWDJ0HXqstsOh0VgIeAOFi3oiac
         orIxPE62eOafrx+tXCo1JOUqyoJrvgsgC5Umoa6vZABRliy6bRHPncerCvXJ/SZi3L/9
         qqs5gwZBSbTSpsgdN43B8o85g2OsUcBxpZUQFfcMXuno+lsHdPF5EdKbOtEle/LHnj4S
         LbjIUm+Vb4zZ+gJq3Gi1xj+abcTsTHbJejqxIBoq9vl5U6vPR+83t1yxiZj+tPRDX/Jw
         0uo5ir++UzXQbaESdvLMSIj1X+naT2Y5mH8X3clZGGlKyFpLYBYtZ+8YsloxONShHoR5
         4PZQ==
X-Gm-Message-State: AFuF++lhXyiwyr+u3Cs1PKfzzwHXFkU1KkPCQtwTQS0rPsqv6t8XaCB/
	2/egUZQvPoqFJNTJEGIfh0e0Yy6aFB7Zesm5n6IfHtw0Wrbbq0YrFPT9i7Qf2A==
X-Gm-Gg: AR+sD13zAKI3u5rbY6G6ni/onjXfypiIVOtRCYaluHljWTJMN3VmJUxqTE+RL7uBeni
	bWlnPDZsIwLjPpRQqQHQ9KlHJqkld3bNHTlSLTD9oHSljA/9BWjYiSY++JoJlOTN0B9shZynzoo
	OTbM0DOXr79EXRg+OQCThei0CHkaBGSUjclxiuJFOFuvWIC+ce9qucv0crdXOJnCI6ImmrKVaN/
	3kU7ccRHKLfItItHKQtcc4pa7jYCuXD3A5rV4IrqzJdHmFkySZKLcGtc3HcSfThzTOv1oyTvoKx
	WMt54cHSsHiSMyIGcRLjzwDa1QVV7pqVyS38iUGRue6DGSyHrkhcdOkC+GPT9FnnPux7+RHmU+e
	H5UpLhXfW9uajOOjHpAnCx4JnpfxKybgMC2l/0IMwU1vO8S/iRUnC1jrEbVtTWVIP6FluEEeDN8
	IB/jJCJfcSFcyanCng5FBcFLRQaqXlU8UNQ61o+xG7iBksFDd2HjJWHDbEW+vwyNQy13DR491IB
	sf2lIM=
X-Received: by 2002:a17:90b:2e8f:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-395c3abee54mr34421594a91.16.1787485963923;
        Sun, 23 Aug 2026 04:52:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 14/20] python3-httplib2: correct CVE_PRODUCT mapping
Date: Sun, 23 Aug 2026 23:51:52 +1200
Message-ID: <20260823115158.1582363-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129448

From: Devansh Patel <devanshp@cisco.com>

The current product-only "httplib2" mapping generates a wildcard-vendor
product identity instead of the vendor assigned to the packaged project.

Use "httplib2_project:httplib2" for its exact NVD dictionary CPE and NVD
configuration identity. This changes the generated CPE, but sbom-cve-check
1.3.3 with the pinned NVD database snapshot has no current CVE report delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0a8f71a6432ff4990d11fba839bf15697bc4553b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb
index 073818a7f9..5efdb8eb1b 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
     python3-pyparsing \
 "
 
-CVE_PRODUCT = "httplib2"
+CVE_PRODUCT = "httplib2_project:httplib2"

