Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47756C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 13:16:44 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.46665.1712927801538589649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 06:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QyukuR3l;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso1428065a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712927799; x=1713532599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jsS8r2bnK4Y1z6m2XxpBFyaClnrZ77H0MZLkCMlNzlg=;
        b=QyukuR3l87jfd/JF+k2mVCdpKTNxSkBgII75e0pCp3IL5Iy0zQVewJvScuwByjQZed
         CdzOu6Ou8eCe2gDiPmL6nX0uBuacqf20HmciDZ5ezQL89WW0DGDxMK9l6jIs3Qwq0UjP
         KuUFMaT4Vos/V0M8F2f+WsSlQH8MgtLKtMsuUoU9Z6t58Tb9QyBDAKWKALmOYaL39vk3
         VoAAPQSa+Z10ZEfWDNfqQN0L3SLZUObUe68GYJhYSn17qZD5DYkEHUC2lKmuftEUNm8l
         E0XBtDq/UFMzeXFvInjVj6dacsH1YvlWM/NLNyiZRoFZ0AH5skiSj3XR7N+mAuyMbcHh
         6JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927799; x=1713532599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsS8r2bnK4Y1z6m2XxpBFyaClnrZ77H0MZLkCMlNzlg=;
        b=mDzqnFvT51yE9XfEMqN0U53o7AWCcaVyAyEeA4eET8glxRu8O6kiJitOS24uXcmaZ8
         baP/ULEgH4YIbadzRzdlOMYwcuDr3cBU3nd9p3bWOe3NaidbobJhxr3zqyMUw2C0PY5q
         urfwNLkde0FWUGnnqC6RgY6iHv6mR8fqkgogrJuBERF6EgQafbLIwmYxJsgax46L81QQ
         +9b1Aycr1UDDjfS4+R4Yl020KYxSPZkODLkTgivohSCCTje+vxVJcYmo1/Ha6TvqSzSO
         KkXHYWuc42zayJiKMyN25H8hbZHizTcH02DuC8hhlPrN0N08Iy0jMWMD+pgTZa+xBSal
         1/Xg==
X-Gm-Message-State: AOJu0Yx09hdsnosLIrid/r0Pj45a4jFli7/yemhuBN7JBttbMhDam/Bi
	/JGVwygAbJpsEr2BkEE+4gD9v3Y0gAIxg5LOvOSsuJEIlBp4EsSNQ6I/uQ==
X-Google-Smtp-Source: AGHT+IGvMKivm+s98nCpMnA6DgvGQkAxIieCIDpq8AbGHEZmetBy8x0Gr5pIWJQIjsv/3ENvgN4Isw==
X-Received: by 2002:a17:907:94d5:b0:a52:2441:277 with SMTP id dn21-20020a17090794d500b00a5224410277mr2361679ejc.66.1712927799055;
        Fri, 12 Apr 2024 06:16:39 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906495100b00a51db91186fsm1831668ejt.119.2024.04.12.06.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 06:16:38 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] libcoap: fix CVE-2024-0962
Date: Fri, 12 Apr 2024 16:16:33 +0300
Message-Id: <20240412131633.153539-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 13:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109943

CVE-2024-0962:

A vulnerability was found in obgm libcoap 4.3.4. It has been rated as critical. Affected by this issue is the function get_split_entry of the file src/coap_oscore.c of the component Configuration File Handler. The manipulation leads to stack-based buffer overflow.

Upstream-Status: Backport [https://github.com/obgm/libcoap/pull/1311]

WARNING: libcoap-4.3.4-r0 do_cve_check: Found unpatched CVE (CVE-2024-0962)

This vulnerability is only exist in 4.3.4.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libcoap/libcoap/CVE-2024-0962.patch       | 45 +++++++++++++++++++
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch
new file mode 100644
index 000000000..add52483b
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/CVE-2024-0962.patch
@@ -0,0 +1,45 @@
+From bf6a303883bde40cf96b960c8574cddd89e71701 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Thu, 25 Jan 2024 18:03:17 +0000
+Subject: [PATCH] coap_oscore.c: Fix parsing OSCORE configuration information
+
+A vulnerability was found in obgm libcoap 4.3.4. It has been rated as critical.
+Affected by this issue is the function get_split_entry of the file src/coap_oscore.c of the component Configuration File Handler.
+The manipulation leads to stack-based buffer overflow.
+
+CVE: CVE-2024-0962
+
+Upstream-Status: Backport [https://github.com/obgm/libcoap/pull/1311]
+
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ src/coap_oscore.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/coap_oscore.c b/src/coap_oscore.c
+index 83f785c92..e0fb22947 100644
+--- a/src/coap_oscore.c
++++ b/src/coap_oscore.c
+@@ -1678,11 +1678,12 @@ get_split_entry(const char **start,
+                 oscore_value_t *value) {
+   const char *begin = *start;
+   const char *end;
++  const char *kend;
+   const char *split;
+   size_t i;
+
+ retry:
+-  end = memchr(begin, '\n', size);
++  kend = end = memchr(begin, '\n', size);
+   if (end == NULL)
+     return 0;
+
+@@ -1693,7 +1694,7 @@ get_split_entry(const char **start,
+
+   if (begin[0] == '#' || (end - begin) == 0) {
+     /* Skip comment / blank line */
+-    size -= end - begin + 1;
++    size -= kend - begin + 1;
+     begin = *start;
+     goto retry;
+   }
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 20bdbee25..98f0f02fb 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1978dbc41673ab1c20e64b287c8317bc"
 
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            file://run-ptest \
+           file://CVE-2024-0962.patch \
            "
 SRCREV = "5fd2f89ef068214130e5d60b7087ef48711fa615"
 
-- 
2.25.1


