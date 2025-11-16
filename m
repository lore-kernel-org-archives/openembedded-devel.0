Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B52CCD19A
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 22:50:38 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3926.1763333428759751927
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 14:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+AJQPC9;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b736ffc531fso374008166b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763333427; x=1763938227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcPGI2Xgc2TwBxFwMbh50v0M9iuGfIbKm+2oHyRIPcI=;
        b=Z+AJQPC9S2hLQNCsJ9DOSjnYwkpe4MtY7nEEfhdVhuMBgSS9I0J+GamdzX8UdIrZdU
         7nT1gUXd5edZPYgC7li7DBH2MoxwrHV0LxOUxzTSIR6FwyhSuJvNsagxnSo0Xgc2yUpV
         RU6F7BZZdSCALzMFFYyhEuCXtSIII+Zq0QWzOfa5o7j5CP7o5BNU82N3qKG7+dUHwQ3j
         FLywgfGZwdJuy2GsrAEKmA0Mx8Jgir84NzovnodO1hHcuclzJzAf3rkBOj/lwAUBOv1W
         69G00so/taFe9l403mwZ2WYnZv4S9vDaLJWfRHqJv4e89WLBl5KMdpxUzGpPY84aV4kI
         EXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763333427; x=1763938227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OcPGI2Xgc2TwBxFwMbh50v0M9iuGfIbKm+2oHyRIPcI=;
        b=nlKCihazoIg4HodS6dJbqKSTdkUnRtXVSUSf/f58RWL1Jfqc1IspYIOu8nqeHfE1dj
         /GM7zQmv/LkwkvK4PdmzBe5s58mTpKCgEE2V2MKQo6MEDeVDUULe7yat+i227z2Fk4kP
         KS0tt+HVpr19GJ7GRJS+ftjsoKFNROyJkipmhl2EzJ80LN77QmkmLzvDFrE1JJp8TY1D
         tB3UKXPjl3sblhB0alEa3KYVvuUzw9Gi3mSFYiYcOKAfgGvLa8xZv6yJAko6wWRr+7+0
         2/aM16tglsZ2LFixBQ8BpQtlErWRr9yQN27x/Eb/sDCWxjRj0CATBSxYqHr5Nkd7nBno
         KPng==
X-Gm-Message-State: AOJu0YyEFFr94XJddV9fx2i5+3ZLaQkuIYWl2ocBa0g3X9MLPTuYnUqc
	reQIf95Q9lb0jQ2euVP9RGIemzt+LNBPXvOi5WjU+Xnlgn1xJkPkCGmR+KKEAw==
X-Gm-Gg: ASbGncvxVyxlpwkmYGX2wzPKfWUCZhZCGdGPYfMG1QYCUjNe/X6iwV7sLSz4EFGLS1B
	WU6Vgcjhy//2r5vRR93PcJIApKlN4IHTMsZ9CjVOHhYc2qha7XLYFawRk6zMHUd5XUv3Rj2EtZV
	cS2DioVPxEg+RfjppVXlYlqGAQtvBgTc74Zf62QJd1omEV2TDFZgXnWQI1w6PSPHju5d3C63+qU
	IfAcMmKSwWc394s2yXijHqmPKMlbYmj3J3bU3Hrs9CvqLORyKivQnMnNcTdqc3PtwIXONGJaKTR
	6sN6LTfQnd50f4yMOyV4dnFS6kZLD5Jl3Ahg1gzBTk3oh1CVHQbqUVywlUJUCkNohkfB6SY/Og9
	A7+BybYsxDieltTlZbIOVm0DURDUHZJ7qwixHM641BGv6g3O1fpODPCjLxPVj9VIJVFM9cqMeuV
	4HjYfXCZFEP9oY9UxH81N2yGU7ou4nP8z07AXKqGFw/GuXaWGkjIpCY3cQzK/RfUjp8Typl15bR
	kB1+1wpsB6yx82yuRV8oCP/
X-Google-Smtp-Source: AGHT+IGZe3GhLec6fgEcb1QvsUefK9OMmUyc1vyY8Ka9wojUTlCdhU2U/JiRea49CtVWd0oG6219LQ==
X-Received: by 2002:a17:907:d0f:b0:b73:5a2f:2f0e with SMTP id a640c23a62f3a-b73677f3ee3mr1019830266b.3.1763333426727;
        Sun, 16 Nov 2025 14:50:26 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa811e2sm942983566b.5.2025.11.16.14.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 14:50:26 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-yarl: add BBCLASSEXTEND = "native nativesdk"
Date: Sun, 16 Nov 2025 23:50:13 +0100
Message-ID: <20251116225013.2063395-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251116225013.2063395-1-t.f.g.geelen@gmail.com>
References: <20251116225013.2063395-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 22:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121750

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
index 6be8a6773c..6c2e2259b7 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.22.0.bb
@@ -33,3 +33,4 @@ RDEPENDS:${PN}-ptest += " \
     python3-unittest-automake-output \
 "
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


