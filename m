Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9FFCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:39:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.6670.1760474363725719190
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TRLuSLM1;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-782bfd0a977so4858565b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474363; x=1761079163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuHObWYC1ebz1v78RMCaXViosS6lpH2EK5GFmog0Eb8=;
        b=TRLuSLM1JqytkYOdmnSZtAG6rWpmnqAwBr6mEN1yYFP6me1q7YM72W96b/F2HjklXR
         FPLGtIgzne3XkN7AtO16va7NyXs7CJcy037f0T3LayVE/0zXxOt4jq9xtDF4M52qTpJO
         H535b6+Hwq0nCp3V4AGIL0gU9XkgvTsWrrHGz43Q86vdIuDljD3f/HXSdgtCA3ApctFd
         G426vvUzEKHlCXXSwBKC7sVvolMPia8MrbqclWvCfAvq92BPo9PZpH+VMYa/xW1WzEk9
         FN9u9EG+3waHL/u9N1CgAn4t/46tnpwNWSNaC4QUKQaH7sDE3EZaiZrZAlcswXeUJj5X
         vYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474363; x=1761079163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuHObWYC1ebz1v78RMCaXViosS6lpH2EK5GFmog0Eb8=;
        b=Gg+y7iNpJhwnURmh7yYi0+Y+Fg08xx12exqlMf4vquRg3Tz4qJtL9+zDaYIhnPZpb+
         jd8/zUzfpNXvLPf4BRIDvaNI9EzwjG/Lp3xu1hwLnt0qw7QI56HCqdAASfSNX+exukkV
         1Vqg49hPq2e6bfpDASwprw6MvL+0LXqSTIisGQcnEold5QFlOktytfKDKeDO4M1Ca8kW
         cyDCqtz+j8xoD6ekVndfQyWrurxRavsrfhVemGwpsE8pF2JaF8AuwuhY/DznLcQEXXhi
         A43+q7JJijOGrYekyQzSNhw9AAGe1ecVfVKLZksjtt/rYzNh0nND63iw/8JtUrHfYBJp
         EHQQ==
X-Gm-Message-State: AOJu0YyBH957cmj/F2xgZ+P71lGCaVNlJd4xkGWr6kZui7VhiED5FC9/
	3JsBun1HlSwzAAx/biLL69NWiF5WugOgyaRJPTJM/EsLgZCCAM9amn/kYBl7YA==
X-Gm-Gg: ASbGncvp4Wx9ildZgh4Orq9CjAHfN1jv47o1m4dRvi1QZLFq0+2KT6CNSDMNMXeDP5C
	Y3F9kVohLPAxqFvVEw8SlyiPRKu5GQeQaHErHmOUmipVqSK1dm3QX5l814ggR9s/c7+exkyVcUr
	hlyrwfxpUJOFczaZsX3hPzvVL1ns/LJrR2hwFB3ci+EjxwiU2Nnl08dKTC+VZvCdCmXJ5EFV0Ur
	ALC5A96DKKNEeT5iTNC+BUPGaUBv9Q+5l3G5DurE7EJZU5dRR2SaD6hUWT6S9LWP6RqGi2g4IMS
	aLqVwjayUGNlnH9ZJcTixdjvwP3pTBnudN+GQSrIRBLquQ7VkKuTheKiNp0TfafSIs6+WdEw4CW
	9xGHBM0FooVLS+ehAfh1QvgfgvdtCDoZp9170H9rqF8iCkqroxGPmRCI=
X-Google-Smtp-Source: AGHT+IGP0Mcv2BPWI363wFeWFnUkajN5qMBhatkYEBGneWbKCPwqDGUPaVqzir49sS3A6DndVpsNUQ==
X-Received: by 2002:a05:6a20:5493:b0:263:3b40:46d4 with SMTP id adf61e73a8af0-32da84640d0mr33623359637.56.1760474362890;
        Tue, 14 Oct 2025 13:39:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b733355sm16009495b3a.26.2025.10.14.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:39:22 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 5/6] tinyproxy: patch CVE-2023-49606
Date: Wed, 15 Oct 2025 09:39:00 +1300
Message-ID: <20251014203901.1479326-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
References: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120630

Details https://nvd.nist.gov/vuln/detail/CVE-2023-49606

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 7f8516d8db5e51c5d2e75f6c6ca75199bee55217)
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
index 999deff4de..8aff50fac8 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.service \
            file://tinyproxy.conf \
            file://CVE-2022-40468.patch \
+           file://0001-CVE-2023-49606.patch \
            "
 
 SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"

