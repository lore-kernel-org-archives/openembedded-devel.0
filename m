Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3C2C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 22:42:47 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.49399.1672699365071498192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 14:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iYMakSBU;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id z16so11128615wrw.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 14:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ICckW4lzs35hf20mz25KMOsFr0HIJcXeLMqGtvQyM4=;
        b=iYMakSBU2VPpKyYsCpX9pOHHYPTNHglAXMMDMI7GU6vqO6guIjZ5DgppGgf/E3PKtg
         Z7LxfwcB6WTfNOaYUgXPdIRte52F1Gq/U+e+YVqilH+QVSksW+pnWw7D35VXmdOceB7L
         KEvJHA2+bcAafZAFNmc3XwLr8Uv8GBCMoR+50tqH+kgVcgtFczvuhR2p0W9YsXo6n6Y1
         DFnMsE/Tbw8SHmosfpTNpsd99Mr+xprkTUNxgtBWR9kjMMQacXjarbPj7dNQiZ2WTl5G
         VK8s9YUbPjHzMdnbcFHki/xZeKd4DIt5yI6edfMF5zDXLX660tR6KG5nfHFzFj4XjxQY
         hm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ICckW4lzs35hf20mz25KMOsFr0HIJcXeLMqGtvQyM4=;
        b=j1oqqI1mIohw1uwN5MB9HvVLe/HLlgVRceoJ98Ou8MAuxMlireNBxZXTOlHV4in5lM
         SLMFXuVDS8A0FbAINOz0+c4YaZB3c1/h0LdPpcYW+R40Sp8xHix5SeUdqOGr3wtmJ+a+
         QMdjv/8JhuQjaJJigEGOZm01D+pzMYspRCtNgdnuk9nV2/bcct/FjSXYECgt+p1pN/gd
         tQpbdmzbnK6DCH9Jcj3nib1/UpesQd9uyT2JP3bcrGOfWCtQoRSp0zffU01DWXAh/XTq
         PGgzuWGWl3p3i1HysNKeG2rzU00dwsgQu1CJYB4Y63YWtzMbXXpSlElDIBpMZZGdGWBo
         V8Hw==
X-Gm-Message-State: AFqh2kpygp/1eHS1ngLo732pLAamQtYcIUjCSy8GGxbHMqHyEiXV7KWu
	wdatHeXpbExSJV+SBeQG2xdwfuhMh5k=
X-Google-Smtp-Source: AMrXdXvyDJqpsDgDKUwPaTvbWirxj3IZWpdgOcnjroOPThFnePDdoyIKiw5JPQrnp+vkeuVkKgG66A==
X-Received: by 2002:adf:f387:0:b0:28e:f7a:9fe8 with SMTP id m7-20020adff387000000b0028e0f7a9fe8mr8718860wro.71.1672699363270;
        Mon, 02 Jan 2023 14:42:43 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b00282194eaf7bsm19605859wrq.71.2023.01.02.14.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:42:42 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 4/4] ostree: Handle musl's ERANGE mapping
Date: Mon,  2 Jan 2023 22:42:34 +0000
Message-Id: <20230102224234.287772-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102224234.287772-1-alex.kiernan@gmail.com>
References: <20230102224234.287772-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 22:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100342

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...1-tests-Handle-musl-s-ERANGE-mapping.patch | 29 +++++++++++++++++++
 .../recipes-extended/ostree/ostree_2022.7.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch b/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch
new file mode 100644
index 000000000000..d0a8447e3da4
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-tests-Handle-musl-s-ERANGE-mapping.patch
@@ -0,0 +1,29 @@
+From bd182584a1e2f820493d9db689598a20c5700ba5 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Mon, 2 Jan 2023 10:37:49 +0000
+Subject: [PATCH] tests: Handle musl's ERANGE mapping
+
+musl uses "Result not representable" for ERANGE, support this in
+addition to glibc's "Numerical result out of range".
+
+Upstream-Status: Backport [https://github.com/ostreedev/ostree/commit/2d4ee168d7eae0afcce356a3f8135294e6d7fe6f]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ tests/test-commit-timestamp.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test-commit-timestamp.sh b/tests/test-commit-timestamp.sh
+index 0688c63a4bdb..de105b768a9c 100755
+--- a/tests/test-commit-timestamp.sh
++++ b/tests/test-commit-timestamp.sh
+@@ -40,6 +40,6 @@ fi
+ ${CMD_PREFIX} ostree --repo=./testrepo show env > show-env.txt
+ rm -rf testrepo testrepo-files
+ assert_file_has_content_literal commit-invalid.txt 'Failed to convert SOURCE_DATE_EPOCH'
+-assert_file_has_content_literal commit-overflowing.txt 'Parsing SOURCE_DATE_EPOCH: Numerical result out of range'
++assert_file_has_content commit-overflowing.txt 'Parsing SOURCE_DATE_EPOCH: \(Numerical result out of range\|Result not representable\)'
+ assert_file_has_content_literal show-env.txt 'Date:  2009-02-13 23:31:30 +0000'
+ echo "ok commit with env timestamp"
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
index 2683c4f24558..61e208b3b718 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.7.bb
@@ -20,6 +20,7 @@ DEPENDS = " \
 SRC_URI = " \
     https://github.com/ostreedev/ostree/releases/download/v${PV}/libostree-${PV}.tar.xz \
     file://0001-lib-repo-checkout-Add-ALLPERMS-for-musl.patch \
+    file://0001-tests-Handle-musl-s-ERANGE-mapping.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b822411f"
-- 
2.39.0


