Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C705CAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 17:48:28 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.14118.1759600099638058157
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WNF0/FTI;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3da3b34950so314746266b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759600098; x=1760204898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xh+LbR8/Gmjze/NLbwI8I/kRKgEncDeaASpURG0GfFw=;
        b=WNF0/FTIX6oEXKkh1A15x9MB0ONyAQuVNXUeEP80FYWLq6IMIKKZ7eNdeCe/6d9k6k
         EsmYOcwj4yLyPBsbPCLkD5PeLGgEDGxQalTy9nqgPkW9uTktCcF4fNs+TfVeYRxRuW2K
         rTLI14LWOB/1LIA2FJSH5nNLDz2DS9Vgev2rnCAsesv0hD0pZ6G62CEHJx1iChBGvqnc
         9RjaEUIS4UmCxlN19iyDayZQwK5WVWyiGslAljuqSI/SozDlEfkm/QJW5KIZWo8mJviy
         Kb1bTQKRC6lwxgZw3lYjWG0NV/F61WcZN+u93iKZ/vDahS37rBmDCCq9ZHegTUr8hOVh
         TsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759600098; x=1760204898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xh+LbR8/Gmjze/NLbwI8I/kRKgEncDeaASpURG0GfFw=;
        b=GLSi2oTAmZVYk2CUiwNw07Gid4XiU7BObCUt/95/e4wRSSXjNQvoZ0nHoFto//psda
         5m5WlQvpxXDarWXHrD5DlBTydpM/yo2BCo/hqZJO+tmL5CRrSafB7JR6S5prVbbY5bqC
         6qv3QeUN+s8VVVFkhT47aLiW1Ni8o7WKQHzJxN9aNtWq/Yoh7pbrH2MWbhDNYxIn9K4U
         wrAOatzdLh2BXtyOK+rjVYqc37be9A/KHjwmAHt9RrlmuXY6DYlF/LEYQx0C8Mlw6GkE
         bH4+rkNgLaG3cEJVUXKLJy9frof2hyfJjNevEXCf1XFmUsGFRrM/70dxu5skxldFOx/e
         rc7w==
X-Gm-Message-State: AOJu0Yxxb2LyOauBuKlgh26k/aCoLeE+g0qhxJKnUzoG7XgrIFbOWzcg
	eoAGhKDwNhr1jEnro3tq1CA2ljqwjQRBFHFIOFnyK2B2F61q/AuvkH3bxgvkuA==
X-Gm-Gg: ASbGncubm6b9HkACnDaYKo4RhwcnxiGZBBG/lGz15XpCAYrscNRoavuH0q1rF+zIhk7
	PG8YyJJ+YmUc5ZvuNVw9MM2JhfwUG/Y6ZsSaavrr3BlV9rtUlEaTfrj1Z0D/YdODIZvoVTF520+
	gxD4kC7ekmgBU0l0BLQNBbIfjI9gAKFEpDlCEmsfp8FUVyF5f+P3F/YiZEiWeJmpOSozdMnVeB/
	rxbZCIM2FwigLs7FvZW1da4P6ziGFHrarZ170RBwg/Dq3zr0cUB4Lr46IMxitBIGqUd3wx1m9cN
	J5OJECo++KJNm9Il0yioxUTEpK6boA1qfRIjMn80PA2FK1ewwkjJu25WEj91e8MlQF30hWU8NZH
	0YqcH35GFEybgWUacEQOe/DnZyqMgl4g8A5uPAluSQF6elSgpuLDIw/Y=
X-Google-Smtp-Source: AGHT+IGcetvUd6H2jfWKSKBQyYlGbc6cUd2GQJZmGn5xTSU/RnjUP0epM5t7LRSrNh0zIabKDSVnyw==
X-Received: by 2002:a17:907:3f9a:b0:b40:9dbe:5b57 with SMTP id a640c23a62f3a-b49c33501ddmr912767866b.62.1759600097601;
        Sat, 04 Oct 2025 10:48:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f7420asm725516166b.43.2025.10.04.10.48.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 10:48:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2] ace: ignore CVE-2009-1147
Date: Sat,  4 Oct 2025 19:48:16 +0200
Message-ID: <20251004174816.2294425-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 17:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120230

From: Peter Marko <peter.marko@siemens.com>

This CVE is for vmware ace.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_6.5.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
index af4f2c54bb..911c1f69ab 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
@@ -13,6 +13,8 @@ SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_1
           "
 SRC_URI[sha256sum] = "739be290a38229aaa5b5150e6ea55ce427e80970f0ace4c5040ac46644526f41"
 
+CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
+
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/ACE_wrappers"

