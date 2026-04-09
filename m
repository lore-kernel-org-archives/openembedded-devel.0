Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A309EA3C55
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:42 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129831.1775733751212144974
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=roj6/0Kz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c76b87931b8so508849a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733750; x=1776338550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyavM5VXDL60PETTPUzIEQ5luOV0hyNpXUe2cPfmOLs=;
        b=roj6/0KzTBObG6nzpcSdVxjETO2DQv42hqasX3G5vQgcM+I6bw7+v9ITIFmKhFM7r8
         rGBaq8+WOQO98YcI6XJlZ01sVTQf19Zytx9nw5gPgHYiaZqv9+DBjB3/VEBJqU9wbP/C
         qmKEHD+aVUEFbsfjVtuLvBpGEwjT3cG5qGvocax9btlUWClTYHF1RB7WVtw3RqfNLkaE
         O/See3eVnPWbbrPs/ynrD/fOAdBMtZLBA2kmijQnN90zr56bTzx8kP2uv8Sma2zdSFBz
         Mp+KkmH0uxbEA+laj3SrCAu5wJkSLYWExWG4zn+IJu46G48V4DAZESpCf1wYP8zAt9X9
         vfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733750; x=1776338550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyavM5VXDL60PETTPUzIEQ5luOV0hyNpXUe2cPfmOLs=;
        b=IQgoFTR1k4OQeEFcmI2sMB9UxpDvOCIE389jxfhxIL9ej4HQcEqIhiahIcq3PQWKYl
         /WIfCQqqy5pf7zKy+pLAc1Ujk96MvHt5AMgFltDR20kbYJmxTcu1rWRdpCXkQUc0z6ad
         VHoAAbdGtPg3OK0R0AJZ8WMu3KZlCwFAd7hMt4nzEnQB+2hGpR50bOaUncMIpuJghwgu
         TTRpPfLt+eqo7MOvX006sz5t2O3S68EtZ0hPbWYko2ge9fumyt4V5fJ98mVoYmtLhN2t
         7C3Vv7fvYb+sqMRhfXIK84wGwzvjXyr0FAR56BCCsTL7Ny4a+4P7jLSpstM7P5T3hbZy
         khmA==
X-Gm-Message-State: AOJu0Yx6Wdu0koiHOrtDZTbKTJq0gDPh/BcIE5C7BtR5ljXuv3N3HODk
	pptHuUbCKSGSnZNAG8iMdkpNDY1IPYcD0xOHvxPnbu4hvHJujptU2vOItxW3IJWb
X-Gm-Gg: AeBDietfyfLR1Elw4jnv8cXGHt3OxBzvBlBzdkXycr+kSnYGmGPUTDLGptfWSdvetHk
	ESD8tZ/0u4U8QqP04UpQ4/vL7cLnXNLcAXlx4htj8rC8pSnrbJKdrT+tsAYLyV5fgSji3WcQyER
	PcK7yqLvG4/VNPzcYDabrNRjrCrBZzQbMiZr53+aqsHk7HUx5Kwg3DajpdrQfTFYHlsN/JlPsNu
	wAFxco+oVum7SrQY3FysuIUYDik4NJA9jyWSvwOglFbOorm7qZYD3oG2oslYX6z5geZuM2C/Nj4
	BPhmiIhtz8sD+Oinf6EcPeUP+po7mclIiwQH6oV8CSj6IK2PdIT6WBX+fJOG0AyNNp2J+JL1p0o
	oEl3XuG8+zwJ+svdijnK8vJC8/hJNqHNMyOtJzlAh0USBxln5sZcvtPqcYllD9+ZCtl0F9Smo0N
	jep5HrfKss/e0u6EvXMf2yLzUjaQ0uiCdaS2Q=
X-Received: by 2002:a05:6a20:9194:b0:398:7b18:837b with SMTP id adf61e73a8af0-39f2ee8797fmr25178451637.25.1775733750291;
        Thu, 09 Apr 2026 04:22:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 5/8] nginx: fix CVE-2026-27651
Date: Thu,  9 Apr 2026 23:22:05 +1200
Message-ID: <20260409112208.1119823-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126192

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As per the advisory[1] mentioned in NVD[2], version 1.28.3 contains the fix.
Backport the commit[3] from 1.28.3 changelog matching the description.

[1] https://my.f5.com/manage/s/article/K000160383
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-27651
[3] https://github.com/nginx/nginx/commit/0f71dd8ea94ab8c123413b2e465be12a35392e9c

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-27651.patch   | 34 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
new file mode 100644
index 0000000000..b639b1a158
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
@@ -0,0 +1,34 @@
+From 4f32484e99671d107d0d6c27c0c674f528d8c9ca Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 18 Mar 2026 16:39:37 +0400
+Subject: [PATCH] Mail: fixed clearing s->passwd in auth http requests.
+
+Previously, it was not properly cleared retaining length as part of
+authenticating with CRAM-MD5 and APOP methods that expect to receive
+password in auth response.  This resulted in null pointer dereference
+and worker process crash in subsequent auth attempts with CRAM-MD5.
+
+Reported by Arkadi Vainbrand.
+
+(cherry picked from commit 0f71dd8ea94ab8c123413b2e465be12a35392e9c)
+
+CVE: CVE-2026-27651
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/0f71dd8ea94ab8c123413b2e465be12a35392e9c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/mail/ngx_mail_auth_http_module.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mail/ngx_mail_auth_http_module.c b/src/mail/ngx_mail_auth_http_module.c
+index 27f64b92e..d931183ae 100644
+--- a/src/mail/ngx_mail_auth_http_module.c
++++ b/src/mail/ngx_mail_auth_http_module.c
+@@ -1325,7 +1325,7 @@ ngx_mail_auth_http_create_request(ngx_mail_session_t *s, ngx_pool_t *pool,
+         b->last = ngx_cpymem(b->last, "Auth-Salt: ", sizeof("Auth-Salt: ") - 1);
+         b->last = ngx_copy(b->last, s->salt.data, s->salt.len);
+ 
+-        s->passwd.data = NULL;
++        ngx_str_null(&s->passwd);
+     }
+ 
+     b->last = ngx_cpymem(b->last, "Auth-Protocol: ",
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index e5666f6fe6..d99dd873c6 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,7 +2,9 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
-SRC_URI:append = " file://CVE-2023-44487.patch"
+SRC_URI:append = " file://CVE-2023-44487.patch \
+                   file://CVE-2026-27651.patch \
+"
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 

