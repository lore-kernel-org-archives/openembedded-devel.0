Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906CFC2A08E
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61167.1767607364794947308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H9bh6skY;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so110052045e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607363; x=1768212163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/e6AirPtPHWQ3hIoiei5bh/kZWutSHSs13ApGAQEHe4=;
        b=H9bh6skYXqe1MB5v6sQ8XaHY+dbbdjFXvch1M5I0oxdLWL2YAD1/m42qF9aTqYLEeh
         Duc2zY58nKeWrJjsUjnYWQhQcjC8nzNQkbw9hRkbCuaiIfS6txYsGE9cITKXoyMnBcZ1
         EY+mlkiLeAfHC4CYpTMXiDwaZBBlZPQDzm0yDJDBs4vCK+fq8SXaeuAuuXpgufqTuXNh
         wbA3nn1wOvAs9zsYLv5ImmT4xF4ppNcxdVFDc3prw+V+1Z67Gh8NVuZA8JgCryrScx79
         7yutTfojQUJ2RmMDMcGNMopZJMqkrQWXM8bkJmqDinyAZawfd41AHqsBgZT9NZfD8d8K
         amOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607363; x=1768212163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/e6AirPtPHWQ3hIoiei5bh/kZWutSHSs13ApGAQEHe4=;
        b=xJjX9pl6BjVEozAW3j/4T15JfExTJmVZbK29EWgcNebSFIghsPOtgIChL1rKKwz4Gi
         +vzQNAesp6JErKwxUkQWMfewzyPNs2R00OD7zddhVPUBDnHrfRs0uJots/QnN8esU5dD
         smW8aPiI03d1H0dMozkWtOlWO42NeYvowURagFpTIqy/tqZ5vl0OovssiJ2I3t9KC68v
         qVtKtMJrvP2ImSJQhFMkXjU6baWQTudx8jCJnFBuTB9xPZnSsJzbN3DSvmkrQnfTw5Xh
         xIPtNwMSIBmo4JGIgzmXeADLi5tjIPRabB7P0x9RsmWmLRfpHpEoRTAoB92b1rAgjTlu
         ybIw==
X-Gm-Message-State: AOJu0Yyf8Sq6X7j6Z8yUE4T+jZ72MBMA9OTG3XRMgO5IAY+YFa4WanRR
	ZXhmB4sO4XfgUjYlS5uwlucRZP6L8zcG/2w3E7SInXccaAdbE2a0CjZw3u2i7w==
X-Gm-Gg: AY/fxX7Nr9Whmo0LETVkPkhREKZ43HPmTFkxmoit+0Vt2Zrhp3scGvCNTtK01RcpwV2
	rXi93VvYOf2eVN4nRuJrwcX4/tMvMU8v0f2WYAwnlRtPP/Kn3g2JAPR86pLtaudnzP33kIrtZj9
	nzE0b0PUAyocJkwgGUJbPz+7LwLlL2t48Smi/OXhzaQdk+kEiUZl28NiqL8tPlY0y8qBGH7HZTc
	pk6m+N9Zww0BCrUI4mMkWYCsKdVf+1ExYiBF6KTQk0NIJSrx5iqGxJKWz6cRA3BKg2tymRpihhK
	Ju6VSPlPWNENH6fzgjCHH2OSWtUglHaRJjrSlUbIAK6viYyEzHMxQU59glguzg56H5hs8zowf+s
	QK6KSmsGHW+MWGwJM7TFaGYQOhjgt9PODb37ZT/PfIKs5kV3DNCVgpOHljS9JYiBi48twiJAS1s
	y51rDTPPyK
X-Google-Smtp-Source: AGHT+IFkMSrCTfbSMQAu/F2+LVv66pLUfhBgVV5Kn0XW0qGnNospOE2sE/Pupgvy0mzmWlVt1ipPIA==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr423827175e9.28.1767607362945;
        Mon, 05 Jan 2026 02:02:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 06/17] gimp: patch CVE-2025-14424
Date: Mon,  5 Jan 2026 11:02:26 +0100
Message-ID: <20260105100237.3081345-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123137

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14424

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b16c1a543ac5e997d6d3aa27978393106d5a8937)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-14424.patch            | 34 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
new file mode 100644
index 0000000000..e7821d3109
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
@@ -0,0 +1,34 @@
+From d30875b606085316b1cb7ac1da0d26e5bac0cf2c Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 13 Nov 2025 18:26:51 -0500
+Subject: [PATCH] app: fix #15288 crash when loading malformed xcf
+
+From: Jacob Boerema <jgboerema@gmail.com>
+
+ZDI-CAN-28376 vulnerability
+
+Add extra tests to not crash on a NULL g_class.
+
+CVE: CVE-2025-14424
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/5cc55d078b7fba995cef77d195fac325ee288ddd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ app/core/gimpitemlist.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/app/core/gimpitemlist.c b/app/core/gimpitemlist.c
+index 6473938..a431519 100644
+--- a/app/core/gimpitemlist.c
++++ b/app/core/gimpitemlist.c
+@@ -345,7 +345,10 @@ gimp_item_list_named_new (GimpImage   *image,
+   g_return_val_if_fail (GIMP_IS_IMAGE (image), NULL);
+ 
+   for (iter = items; iter; iter = iter->next)
+-    g_return_val_if_fail (g_type_is_a (G_OBJECT_TYPE (iter->data), item_type), NULL);
++    {
++      g_return_val_if_fail (iter->data && ((GTypeInstance*) (iter->data))->g_class, NULL);
++      g_return_val_if_fail (g_type_is_a (G_OBJECT_TYPE (iter->data), item_type), NULL);
++    }
+ 
+   if (! items)
+     {
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
index 24281e5dfd..bc55aed06f 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
@@ -63,6 +63,7 @@ SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
            file://0001-meson.build-require-iso-codes-native.patch \
            file://CVE-2025-14422.patch \
            file://CVE-2025-14423.patch \
+           file://CVE-2025-14424.patch \
            "
 SRC_URI[sha256sum] = "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94ce466a62862e296b"
 

