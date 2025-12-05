Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B4AD3399E
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37.1764954702921552284
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NcnBJP5/;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779d47be12so21595015e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954701; x=1765559501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42n/dX6AOn4spuQhV78qS0+F1SnrWwqvKMs9rLGI594=;
        b=NcnBJP5/skklrwT48bvx+cgZwAMwLEDYTJz9b0u038UmmanDCqvmrGRRqTv/5414HD
         emo0AyDdzHP/mcN7XvzSzo2minqH7lIyP8yj06n6v+jEyGlaCCXX5aP6gExK5E7RIb8O
         aGV9g69F9dDRNJLEencsUBh/uMc1GO9veE8KcDFGvKyUtTzLUzjnO1hzM/1fiU3NnGjX
         qiSUFc9vo5mKFeJ2niEdMkqertQU+SmeyPYvMmdXADfaQ8fB+2fJDRMq0aFFYJF60pXj
         wNwZcCtMPa8ut+TXU9V7cnzwQf1NjG3pfts/cWWg+p7vbMq+OmxqDkvhYDIoy04yZv5n
         dsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954701; x=1765559501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42n/dX6AOn4spuQhV78qS0+F1SnrWwqvKMs9rLGI594=;
        b=A/kC/kFg1uq6VqCkWjf+R2VNCLfCfT9vpcnY3mayWhL2IaFRRIlNrlAdxrdMoAe/1/
         D0Orm0m+qFWTf0t7aYP5NEY4WNKwLHouI4HfZcgzlWX+Qq/scCzveMTdsg8b/fMlgwtB
         1dhJUUgvd+dzynzdYbO+GA/QOYT1PG6cBEnzCU8SGOXaLDJffMahBjAirhbLITC4uUpK
         YA3VPfKeTvyH9hHpjZSJSYz3PNcCudu0wvixskr5X104Mkfgrziz0zdCrNjj4o0ldhbG
         stcSwNvDfScpDp6BKKTXKJV7fXJ6qbZh3rwHTjqP0PfHjJzpTMFMDaeAn4Fik+c9nd5K
         W/Gw==
X-Gm-Message-State: AOJu0YzaiPQVLg2I0dB1gh5zhuHWCQp0VXUNxVku1F6z1oNVH4vbFYv7
	w1LgcnCMttju/CjUbflNmK9ekxv42zby2NnX1f0WN0aU7UlBua6AkTSoRBMP8Q==
X-Gm-Gg: ASbGncsvnc1AKGSZxy80i/QXiGDhD8t4ktdfU3xtpYi8RvMDYvT5Wp/4DNJ99uWz3gu
	tibFP8n4jkM8nrr5m+0/EawlET67asFk1iZCMrzyGn4V64+npVJY5kA3NydsY/jFb7C4SJ2/1Hi
	hfNk98you1Yc5MuLXJD8fD3x3O/qaUUzP6rVaZDzMsXnNrppBOyyROKi4vTfQ6TPvczmUXgTqwD
	1PkqhpXzyeET2n6tH+/LMN8iIe6mgWCll1nvjuCl2TvzGzugozZDzOxgEVvb1whv9RzyZcYtYhf
	cH7NSvleiZjfqDcfon2GrzYKtQ/pg3A8ce81F+1yAVBkU780GIjYNzRf1tP4I4U3hSzDJD4LJxx
	cLFGZI+b++SgfYFS3fvpwaII52I/76lxn7beeYpnCMdFnDA5dnDcEt0wD93veFOUUduldYI+URw
	uENZpyLxkGx3esoY75rwI=
X-Google-Smtp-Source: AGHT+IGGZCn8uOqVjNhZO82AJTiRyJRVErqm80eSisu5GmiUum/g4Mk6ngXyUKpMAPL9x0KCqj6LTw==
X-Received: by 2002:a05:600c:1c10:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-47939dfa487mr195295e9.9.1764954701246;
        Fri, 05 Dec 2025 09:11:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/10] xrdp: patch CVE-2022-23484
Date: Fri,  5 Dec 2025 18:11:33 +0100
Message-ID: <20251205171134.1346494-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122355

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23484

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23484.patch            | 31 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
new file mode 100644
index 0000000000..af27c50376
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
@@ -0,0 +1,31 @@
+From c2c6efb1d377be6baaa4acbc9d3700490fe92887 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:03:24 +0000
+Subject: [PATCH] CVE-2022-23484
+
+Add check for RAIL window text size
+
+CVE: CVE-2022-23484
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/c2c6efb1d377be6baaa4acbc9d3700490fe92887]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..4352625874 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -929,6 +929,12 @@ xrdp_mm_process_rail_update_window_text(struct xrdp_mm *self, struct stream *s)
+ 
+     g_memset(&rwso, 0, sizeof(rwso));
+     in_uint32_le(s, size); /* title size */
++    if (size < 0 || !s_check_rem(s, size))
++    {
++        LOG(LOG_LEVEL_ERROR, "%s : invalid window text size %d",
++            __func__, size);
++        return 1;
++    }
+     rwso.title_info = g_new(char, size + 1);
+     in_uint8a(s, rwso.title_info, size);
+     rwso.title_info[size] = 0;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 4902990272..e78dba945d 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
            file://CVE-2022-23483.patch \
+           file://CVE-2022-23484.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

