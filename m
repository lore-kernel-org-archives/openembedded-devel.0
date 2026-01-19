Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AFAD29C39
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 15:37:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37684.1768837031530278595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 07:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mM+vn5uB;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so41333625e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 07:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768837030; x=1769441830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAJ5rrsIQO3zdo46d1c0nSslEijZZCK9wagFew85T0g=;
        b=mM+vn5uBUxuS7TS/EpzAnSK6u+kd5llw7kIBjeyAGjLLcNJTWJ9IM1x+VEzG1g+EhZ
         kwoRZWO1jxkKFvyLMMTp7a1P4MKRpxqJOtNxKJT7nOgKARttNYFwjFML6A78comptxnx
         k5+lOFixR+FYsNUDsqChPMX3IL8X01bk+lwBpHwB+H0P3gkMeQDHi2gOGsx0AKZ6qs3n
         IK0U41jJ4FSarBubgZCR3JbVLVqnhIj6U6HR2sO4lIVfl8Twcef2MM2NRGrntU+XzUyR
         gNs1NKwrskMMjlcSrJC+gvcpiRxOMiiDxTw3dfVB3ZknwBUHrY06RpoGTOX7kH1p0qWB
         Jx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837030; x=1769441830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAJ5rrsIQO3zdo46d1c0nSslEijZZCK9wagFew85T0g=;
        b=KaOlCKETTTqfxiEjdgrGpnq0pl7JsLnfBEJXDmFjbyXJNo+qyO0JVgAmb2RQaroSra
         Eg+A8w0Ud3v/joynNyALNWLVpuZgxkZfpFoWpwdwqy3sSUq0iVjIEfCeQHhPzRX0c6lW
         awSG98ER7EZ+WyYe9XVZT3YL/yrry0RhQVxr40OjX7wiJBjI3YdOey36Iso8pMkeGqI7
         WB7CvlCQpQtqyMaFWyFKYntSBx54TLkGNX6Lh9N1EqQBsyWNGKcSCeLUXZyaoqOUhIrt
         JcFxvQQR/+z4L/Rr2wUoeHbTkZ0duL3l6R6praPC0+G1A2dhMoGL54J1+4t3fvHP9mlH
         Dt6A==
X-Gm-Message-State: AOJu0YzdUaCoM5FzApwhBOH1Wijv7BpLxpwXDwtEMx7mNUOOWjuy+rbk
	QxxqTyp3gaH96IuHPlHuqSuayYFVII9P8vyP+wFMbSsw0xNlrmOk1ArgtGhSCw==
X-Gm-Gg: AY/fxX5IpnyLWSRDz5S+fwaenfIYIho0HfJMT/iWlsVnBoDn6C+SdvmY8Y+2dvuZrFq
	IDXJkMr0HV/EAy0zIIOjUo0Ay9CkEBJNgPzs5TuwC+9Rzz5P/UF6wd4V4QnVeEIABSwJNhzQ8j1
	7Cvby9HTGqVFOEGmQVjv3S/fg4wZRaub4usjFlLNsSCao78XG2kjXHpW6fLj3kOBDAt198GXgAK
	bAS6MuHQ/CNhZpBLxSZArf4bifXczvzxjthdTzWm3ubutG3AgHxqp0k0OLm9Xs9Pw4PcktHGKDa
	+X8SwRYXf7nuUDpni0wWwGn8N3yEXs42Dnlf0qRqjiBeNcITuj8pccw6oUedljtmnNxKkLHehNF
	nZQFW3fT5B/xOjkXNEAfWZVMqABsrw3gY6UVW/FGdHQlwbAVr+h1WSgjLyqpAWwVIl2ZMCda/vh
	tcZEQFCYho
X-Received: by 2002:a05:600c:1d16:b0:47d:2093:649f with SMTP id 5b1f17b1804b1-4801e2f912amr177869575e9.8.1768837029359;
        Mon, 19 Jan 2026 07:37:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm23662989f8f.9.2026.01.19.07.37.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:37:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] raptor2: patch CVE-2024-57822 and CVE-2024-57823
Date: Mon, 19 Jan 2026 16:37:07 +0100
Message-ID: <20260119153708.580011-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 15:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123641

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
https://nvd.nist.gov/vuln/detail/CVE-2024-57823

Pick the patches mentioned in the github issue[1] mentioned
in the NVD advisories (both of them are covered by the same issue)

[1]: https://github.com/dajobe/raptor/issues/70

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../raptor2/raptor2/CVE-2024-57822.patch      | 44 +++++++++++++++++++
 .../raptor2/raptor2/CVE-2024-57823.patch      | 31 +++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.16.bb |  2 +
 3 files changed, 77 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch

diff --git a/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
new file mode 100644
index 0000000000..cb98f4250c
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
@@ -0,0 +1,44 @@
+From 3b0ded4ae8110b6291d030af927ecd08197e668f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 6 Feb 2025 21:12:37 -0800
+Subject: [PATCH] Fix Github issue 70 A) Integer Underflow in
+ raptor_uri_normalize_path()
+
+From: Dave Beckett <dave@dajobe.org>
+
+(raptor_uri_normalize_path): Return empty buffer if path gets to 0
+length
+
+CVE: CVE-2024-57822
+Upstream-Status: Backport [github.com/dajobe/raptor/commit/da7a79976bd0314c23cce55d22495e7d29301c44]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_rfc2396.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/raptor_rfc2396.c b/src/raptor_rfc2396.c
+index 89183d9..2f0195f 100644
+--- a/src/raptor_rfc2396.c
++++ b/src/raptor_rfc2396.c
+@@ -351,6 +351,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+           *dest++ = *s++;
+         *dest = '\0';
+         path_len -= len;
++        if(path_len <= 0) {
++          *path_buffer = '\0';
++          return 0;
++        }
+ 
+         if(p && p < prev) {
+           /* We know the previous prev path component and we didn't do
+@@ -390,6 +394,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+     /* Remove <component>/.. at the end of the path */
+     *prev = '\0';
+     path_len -= (s-prev);
++    if(path_len <= 0) {
++      *path_buffer = '\0';
++      return 0;
++    }
+   }
+ 
+ 
diff --git a/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
new file mode 100644
index 0000000000..79833a55cb
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
@@ -0,0 +1,31 @@
+From 0b028dd16eb504d3d4dcfa9c72ceb29a9e1f3915 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 7 Feb 2025 11:38:34 -0800
+Subject: [PATCH] Fix Github issue 70 B) Heap read buffer overflow in ntriples
+ bnode
+
+From: Dave Beckett <dave@dajobe.org>
+
+(raptor_ntriples_parse_term_internal): Only allow looking at the last
+character of a bnode ID only if bnode length >0
+
+CVE: CVE-2024-57823
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/ece2c79df43091686a538b8231cf387d84bfa60e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/raptor_ntriples.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_ntriples.c b/src/raptor_ntriples.c
+index 3276e79..ecc4247 100644
+--- a/src/raptor_ntriples.c
++++ b/src/raptor_ntriples.c
+@@ -212,7 +212,7 @@ raptor_ntriples_parse_term_internal(raptor_world* world,
+             locator->column--;
+             locator->byte--;
+           }
+-          if(term_class == RAPTOR_TERM_CLASS_BNODEID && dest[-1] == '.') {
++          if(term_class == RAPTOR_TERM_CLASS_BNODEID && position > 0 && dest[-1] == '.') {
+             /* If bnode id ended on '.' move back one */
+             dest--;
+ 
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 03e57ce86f..1b77103a8d 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -13,6 +13,8 @@ SRC_URI = " \
     http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
     file://0001-Remove-the-access-to-entities-checked-private-symbol.patch \
     file://raptor-2.0.16-dont_use_curl-config.patch \
+    file://CVE-2024-57822.patch \
+    file://CVE-2024-57823.patch \
 "
 SRC_URI[sha256sum] = "089db78d7ac982354bdbf39d973baf09581e6904ac4c92a98c5caadb3de44680"
 

