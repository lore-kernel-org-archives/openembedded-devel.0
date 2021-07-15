Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.898.1626368447828592399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tFxOjdBR;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id v14so3713424plg.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3jxbIcIQJkLlwV7wX10EsjX7yGrmPhtDyaws6mNfuWE=;
        b=tFxOjdBRcirbdI4VTBI503sguxcKVMVwtCFULeQRuLG0ToBFpYYEAtwPC1Xo/Vwuop
         A8qIYXGkzyVZws2N3gp217jhCUGq4SKTmOh8l7MUfbd/x2rK+3eQEwYS6pELK/7W1JN2
         C59eFQw03XKkfetbT1SAOTGRg97iGp9p7XilrYeUu8UbUnsGee4uDh089bsLNHtMBBd+
         m0gE4TQSQF+X9/FWOpgJCJSE7ll+Ql+lAVA1ygT3RJUqZ+D4QE+7pdkP/XG6IClrgLZL
         pCd3oQ3lGnw21XWZ/rHY8ubh/rRs52h5f3OOi/Jo6cN4ZxjPO0sJ8aTnLkBolenuRlom
         rUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3jxbIcIQJkLlwV7wX10EsjX7yGrmPhtDyaws6mNfuWE=;
        b=IMyIVJa5VdxpAvvHXHNIE3qlA/gZsdh0BzPemd/G0DgbKZzgqas/hVWYBIaE3BDlD1
         R15QqVw2VQ9E7JNEvYc2cMcdhzrUTSTAtfgGU1zcli83M0YSGENEz9BOp8Do4l3P6TkT
         ctJnn58xzuZPsxxr1EciH1EZpVHbl8iTPS0y7B6SVwNF2PSvuR/+4ZfZyBBt1HRhKAZz
         e3DNG+5kbrs0CEja+FgPCFx8PX9TnzbbtIxSuOt5++IW2DvAHRM2nlWjI7sSIaR45mBd
         9hOuFzMvNgWi7G3zXkH12iWD5fMPVmjKltHKz8heu2mXcJMb1ij+daCGi5qrrPRLx17J
         CBww==
X-Gm-Message-State: AOAM531GzAjtDxPcCvspt+r0A1LJd9mNLvW3BgZcWxPHGdlJbLqeS+ZT
	IEexiisBnpt2hggLGCSUozQczALMyrs=
X-Google-Smtp-Source: ABdhPJzRY//2aV8UEn/+3c28wnKcJPPHLUiKfhQT2/bvKiS8rtj57U6/0A6p3+xL0LcBlEV/SNjECw==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id p15-20020a170903248fb0290128d5ea18a7mr4149439plw.83.1626368446950;
        Thu, 15 Jul 2021 10:00:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:46 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 1/7] nginx: fix CVE-2021-23017
Date: Thu, 15 Jul 2021 10:00:36 -0700
Message-Id: <82385049035a3a4a81b18af099d2131b46802965.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626359076.git.akuster808@gmail.com>
References: <cover.1626359076.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nginx/files/CVE-2021-23017.patch          | 46 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch
new file mode 100644
index 0000000000..a708033775
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch
@@ -0,0 +1,46 @@
+From 7199ebc203f74fd9e44595474de6bdc41740c5cf Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Tue, 25 May 2021 15:17:36 +0300
+Subject: [PATCH] Resolver: fixed off-by-one write in ngx_resolver_copy().
+
+Reported by Luis Merino, Markus Vervier, Eric Sesterhenn, X41 D-Sec GmbH.
+
+Upstream-Status: Backport
+CVE: CVE-2021-23017
+
+Reference to upstream patch:
+https://github.com/nginx/nginx/commit/7199ebc203f74fd9e44595474de6bdc41740c5cf
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/core/ngx_resolver.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index 79390701..63b26193 100644
+--- a/src/core/ngx_resolver.c
++++ b/src/core/ngx_resolver.c
+@@ -4008,15 +4008,15 @@ done:
+             n = *src++;
+ 
+         } else {
++            if (dst != name->data) {
++                *dst++ = '.';
++            }
++
+             ngx_strlow(dst, src, n);
+             dst += n;
+             src += n;
+ 
+             n = *src++;
+-
+-            if (n != 0) {
+-                *dst++ = '.';
+-            }
+         }
+ 
+         if (n == 0) {
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index de080a2b01..a4583ed8f8 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://nginx-volatile.conf \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
+    file://CVE-2021-23017.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.25.1

