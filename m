Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9AACF2580
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:52 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7411.1763525564315960666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m7CRiGOW;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ba599137cf8so344829a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525563; x=1764130363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw6NWO24aoZC6LCfsIy4Tps1sfFrB0WsRXPpLssGlIo=;
        b=m7CRiGOW5md+NgH/uCVeMnY5vxf+rDhNAM19J1hC2gXbUAg9qGFT0gfJrkb/c7eabO
         6jpq5CP/uwk8o/qYnLR8sYPDOih9jCNUl7clK8kXPX5jSFo+KrFcn11NpOdKiLpMjiHb
         a8izbQCmGN6b4KiSnWgCDQib+rRatqSqrVVrJ2KQbOtmIKCweojBwqqockBgyXgxt9t3
         PtDB5HJsyEKNtCbOHIYCa4DhOohNnCVe+dJ4RIPOpUI8Erj+6Jb5vKo+w0g5wb8js6dk
         rZI9DcU3LOSI1844o5kUdvE2dP01fF2ZCig99KKOgvMAe5j3uGGrvcrBoMYZrVX7mM4I
         9/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525563; x=1764130363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iw6NWO24aoZC6LCfsIy4Tps1sfFrB0WsRXPpLssGlIo=;
        b=bT7xmubAK6XbzTBeQm+Eq42AvkV6+U4hmtvIXMXnpxzOj2YVbeyZyvekCpAAdcwzCO
         euZ1FGVgPcp5MgslXjdyE1m89Uhcl1/X9+tho045yFhNFpvyglQajIAJ0DSgkb4ltphM
         C1mBNSmCMvcKCD4Q9ZJPeFB2KtATs7vtGDK55KiXRu6yjW7XDvvvtomZqbNMg8Q40f2E
         yqzt4pGFSsy+TTsbPZSYYpC4CzDA6OdjFBubf6cB1OhLQ6GMF3LK6y3DVyV8UwIkgSlE
         nLHN1Keuwuyh59giZecQlaxWOP6EaaqtoR0ek2imUgcm3DrnyGpaxGF8w9ocoLqQgaNa
         eL4w==
X-Gm-Message-State: AOJu0YyxeMB8xtGGLQhtOmKYHRH0ViftUf8ubM/NuFVsHrxh+ZbB856y
	Vps7j8lyC8XLEoLbQLZSqbBFwChEcaluS1/Ngug+237zXf3lHxtoYvJsERbE8F++r4Q=
X-Gm-Gg: ASbGnctLvuGUtuyHq0hTHBeohcZCUkKW+pEFEPOkLV9UkiPxZN4KkPor7kY8mZvmxIi
	8dzkpgNKXSWBCbtSDQTsjLywzQ2RoYd7BPu+L26CTlxmr4JwdUcJL0q/mvIIz9FCrgsMvAMvlPF
	84YyrKndYZYNhShCWDQB62/J1DMvnxXH8spKuX7NcrzT1KmrVlzTzFompto+VKgzGV4m06vEUCm
	SW4CYOstL7l2s4ldTvhllHE/k8vv4oU73XueLP37TIORS0G/miEiZgzymk7CSfcZrzk42iVepSC
	y7aUcVXJfzigA3Aq0XTGHxk9gDo7H007NWbNfco/7JEiRU0rTNf7SHg/hHyMkvrEIcY496p7Sm0
	CzXKNsyOdZtL4ap8uV9QVwNJiRG2FgUPc0Ij6CdLnfQxwNt9JOpzVfHgCexC5Mkp/nrPyy1lmr8
	uDM1PljLCLKD4c9+9+wNlyCANoIPaoZnMFtKKho7OpHY/E3L+ZmQ9qkW1a+GwuMDjPPa3Wizlxf
	PJOLwYCjW8+pobYAdCaavC8mVBoYR3L
X-Google-Smtp-Source: AGHT+IG4yeFDSFJr5c0hppOXfkbNlukuQye8DPvgZYz6Mfxpy4fz73CHDqSt4rhp4QdYlrWJk3ggHQ==
X-Received: by 2002:a05:7022:619e:b0:119:e569:f851 with SMTP id a92af1059eb24-11c8dd338c8mr458094c88.8.1763525563298;
        Tue, 18 Nov 2025 20:12:43 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 6/9] python3-typer: Add missing rdeps for ptests
Date: Tue, 18 Nov 2025 20:12:32 -0800
Message-ID: <20251119041235.2448193-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121880

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-typer_0.20.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
index db682c5d35..f6be56cde3 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.20.0.bb
@@ -23,8 +23,11 @@ RDEPENDS:${PN} += "\
 "
 # python3-misc for webbrowser module
 RDEPENDS:${PN}-ptest += "\
+    python3-coverage \
+    python3-markdown-it-py \
     python3-misc \
     python3-mypy \
+    python3-pluggy \
     python3-pytest \
     python3-pytest-cov \
     python3-pytest-sugar \

