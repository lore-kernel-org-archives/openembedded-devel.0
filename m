Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3054CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 04:24:33 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1325.1760070266518490310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 21:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ExsN/NRD;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-782e93932ffso1532094b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760070266; x=1760675066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkh6gxPLJO2kxuZp4gfxRwpklCldZ4TyzkM1zye8I44=;
        b=ExsN/NRDRp+3kQ3hnLuvLegKwHOiLdRdnT/8z+OXLKt8SXWGm+l/qQik+CtPXM5HDu
         fBulWB25EFsSQsh6dYOVS4kQTU+VGkzIOuR8DAZQxnto8bZWjW/TZnGN1noy/NXpN5dC
         8PNoSK0NuQS/v5EdZnBsACleipMCKecYkZL4HSSvgA2j6ILTvhHgn6TqycntkXMLW6dL
         Btg2IkSTUj7WJHo5c+TcnbF/SflBgPPKJL+mZutpy4awkBfM/RUk4J6aBP0mMNLl82xS
         DtjgtknIcwU2WS8cWi5Wzd+xEIQHkeNZsmtwAvW3IWkTMbelPSG6kZBiUlf09C1QJTpy
         Hlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760070266; x=1760675066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fkh6gxPLJO2kxuZp4gfxRwpklCldZ4TyzkM1zye8I44=;
        b=PbeVa7Ua9BkyY+QcpgnvGTop2wQHW6Q1wTq2Lprf3DI9Yvd9DOvbCBZlkaK3b3s+R/
         hWU0km5Kclm9SkpWspr3osbSejspAegnxKJxbhMb8yq7A0Y1BfQoNCykv5g8yOlDatzS
         qVrfneeQxfYsTtKsirqwxTWHOby38zO7zHgf2DiMtMQC4qpYablyamL9zmvwt4FG4Z3p
         RsNktPok3vEZN09fqgVK+oxoPGCuD6vhawtkwo4FcuYyP4q7WIMztOg4MCrVs3utOQkc
         AaXsorY4FLc14bCkwm5CuqyPsItqM0mmyoR346CVDCs98RVCTgdMjLu4KWtpc497+/YS
         rC0A==
X-Gm-Message-State: AOJu0Yw2h6IyF1cY2UJ0xndUhUP7cCDMMKnlj7gf297efc/RflE2h+Xh
	i46Ksp8zdKUsspQ07JFn4QJe+1xsBh9ZE4uPaXAPviyBdDXf3EnpH6bhk9ZXLA==
X-Gm-Gg: ASbGncsbIXyfhOQ72DUjuVuAeK3dtllCFeChERaIDIksWgeHRLdLVUr9L3rpsT+bfy3
	WH9DMER+EV5q1ooDPq7cDR0U61GNW71R/498pp+BqzlLTPI3x2QdiMwdZp+iIqv5zsgJJK3Ltym
	Rp7aXiVWIdPx6cVRYKs2pLmq2Kr8yMnQZI4Q9RNKFUK+2/UON3iNu/OKRJNAmN+aVv+yplgQhii
	Pcev36V+m1qfPraL+r1A7JGmWyg68CMIB1rGHCLouBYEPe2oHdTh35Tj+U9RDbbqJqUP8O1VcTI
	k1MbAbsc9ytmkEWBfj2qJXx6jugcHXpyTa5QsKpeKNLanwWBBQhx0JOo2796kHDnRWNkP7PJDix
	iJXxrL0HTe1US5+NdrVsBP40hWR7OHq6TcBp1EQZ5OqMEzhCG+htWntfrcVkZ+UIzmw==
X-Google-Smtp-Source: AGHT+IFoZ/l+UFpRM5ZCsSopViW/KvUpSDD+ezlsWXhoSzHb3tUOrLXh7lQRzq3XqzKjay4gQ1rA1g==
X-Received: by 2002:a05:6a20:244c:b0:2fa:516e:26c7 with SMTP id adf61e73a8af0-32da81303dcmr12587987637.18.1760070265557;
        Thu, 09 Oct 2025 21:24:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678de09cb3sm1207876a12.18.2025.10.09.21.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 21:24:25 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][walnascar][PATCH] tinyproxy: patch CVE-2023-49606
Date: Fri, 10 Oct 2025 17:24:18 +1300
Message-ID: <20251010042418.70073-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 04:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120469

Details https://nvd.nist.gov/vuln/detail/CVE-2023-49606

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/0001-CVE-2023-49606.patch       | 59 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.1.bb             |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/0001-CVE-2023-49606.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/0001-CVE-2023-49606.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/0001-CVE-2023-49606.patch
new file mode 100644
index 0000000000..dd10d2cd33
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/0001-CVE-2023-49606.patch
@@ -0,0 +1,59 @@
+From 982a46347c5939e08ad659858b1ac32361d7ffb8 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Sun, 5 May 2024 10:37:29 +0000
+Subject: [PATCH] CVE-2023-49606
+
+fix potential UAF in header handling
+
+https://talosintelligence.com/vulnerability_reports/TALOS-2023-1889
+
+this bug was brought to my attention today by the debian tinyproxy
+package maintainer. the above link states that the issue was known
+since last year and that maintainers have been contacted, but if
+that is even true then it probably was done via a private email
+to a potentially outdated email address of one of the maintainers,
+not through the channels described clearly on the tinyproxy homepage:
+
+> Feel free to report a new bug or suggest features via github issues.
+> Tinyproxy developers hang out in #tinyproxy on irc.libera.chat.
+
+no github issue was filed, and nobody mentioned a vulnerability on
+the mentioned IRC chat. if the issue had been reported on github or
+IRC, the bug would have been fixed within a day.
+
+CVE: CVE-2023-49606
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/12a8484265f7b00591293da492bb3c9987001956]
+
+(cherry picked from commit 12a8484265f7b00591293da492bb3c9987001956)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index b865190..705ce11 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -779,7 +779,7 @@ static int remove_connection_headers (orderedmap hashofheaders)
+         char *data;
+         char *ptr;
+         ssize_t len;
+-        int i;
++        int i,j,df;
+ 
+         for (i = 0; i != (sizeof (headers) / sizeof (char *)); ++i) {
+                 /* Look for the connection header.  If it's not found, return. */
+@@ -804,7 +804,12 @@ static int remove_connection_headers (orderedmap hashofheaders)
+                  */
+                 ptr = data;
+                 while (ptr < data + len) {
+-                        orderedmap_remove (hashofheaders, ptr);
++                        df = 0;
++                        /* check that ptr isn't one of headers to prevent
++                           double-free (CVE-2023-49606) */
++                        for (j = 0; j != (sizeof (headers) / sizeof (char *)); ++j)
++                                if(!strcasecmp(ptr, headers[j])) df = 1;
++                        if (!df) orderedmap_remove (hashofheaders, ptr);
+ 
+                         /* Advance ptr to the next token */
+                         ptr += strlen (ptr) + 1;
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
index 4f52ee2ba6..d0232dc636 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.service \
            file://tinyproxy.conf \
            file://CVE-2022-40468.patch \
+           file://0001-CVE-2023-49606.patch \
            "
 
 SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"

