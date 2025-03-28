Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F99BC36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:58:35 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7703.1743155911533822686
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kYHVwNll;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3b12e8518so369307766b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743155910; x=1743760710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bvWpHw56SceviS54zXOEzhWP/Inmv70v9mRnkILWSfM=;
        b=kYHVwNllPbBgeGkDA71CJEsQtOwbu7ww23eDQhmsWLN8hOmU+FqcvyYTtxdK831wmb
         sFUl0i7OQQmUb7fHTYrwI4MUoAJXXDcy98iCW/LP9pAth59/x96jJjOCM9aWpItyqQWv
         PWPyEOeluviPXwWXBeVC+HAOJLYAb4DuKjAKph2HqI00az783uiyC1OoutVejTHfqYk7
         Tg7OHMmFu8p5B2dks2DK2zwx4nDnUlcrOUdGv0pCn6ImZ+PgRAIpjQ2tUddxsb8ATaW0
         C2+5eeCguVZMRx7Zf7fFhhQJNkrAbQJdLNhmCoVsYVV9CY+v/wFaghfsU/EtsSfqosJV
         YR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743155910; x=1743760710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvWpHw56SceviS54zXOEzhWP/Inmv70v9mRnkILWSfM=;
        b=AAIdP8cAeOoFU9cHW9ypNtcOED3Jn/NtGoVHvv59ei4+8qWGt4+M7WXJmHLQBcyK6t
         uYqG0YCQi34Y+nRYcn4ZQum90YJaVNxcngSe3vN6w3AVpJGciQxirE7QoXzTX3NCTMXF
         FPrbS4c9m4iM4hpcvcGsHad++PpOK1JwQM5hvwBNGN3ZXLkaEWZuP+y8KWzZ9V8C/si8
         nbBqkZqrQmM+1lE59LqopLoRAhP0APu+VfIITR/j1ygVEQfTa33PABqhpxBdRoG5WGsy
         uwKHf0qIn5xyAbwSZDZi2euHHrw4c2h50JBNZ+JiElBGbcRUEZvSE8MmoeSfwzRvPBiv
         Yq1Q==
X-Gm-Message-State: AOJu0Yx1v3BnWJncMM+hBRTRA9zP0/D52zSsTxoTJO4uwTzDGEOWWnMP
	6pmyuJ/GXjyftgh01S/zhsy5Dd93nq8DQ/gxFy6cS1d3RPpU3NNQrA7yWwWjnD8=
X-Gm-Gg: ASbGncs9oElsQNgXqc5M52viMDoFpbr7QXXRc7MzrYb62DT5V06sx/7ObjyQqGdBXAC
	Xe7k8zbmR2LldLNV8ErcHiwuogzQDM4gy51NeVAEX6XBWxcGva7VfpXOHW/UcRjdKjZkYLqLqEz
	2yzfigjwJ7mlnIoe0TjMbRpm7JVY8nycSpGts9lQmzTz1ZOXq7vaSpAvUKLDgOdeccb0GyqtFdk
	LpDjgMQHVzt4AgtrQHsS0BqDlEMmcu+UU/PPbVIvpW61eU+H3EOTbNVQXDKEsyRj3DbYrGdO1Uz
	b/fVwOK62+jyA03B1gT1SFZibT1Iq8MfwZZKOy8totsd9dk=
X-Google-Smtp-Source: AGHT+IF60J4x1i67IinnOCKaexcGK2EayRKqR83TLwzoy5L/xtzeLbz1zPEajwqhqi9VMJ0Bt69DJg==
X-Received: by 2002:a17:907:2d0c:b0:ac3:bf36:80eb with SMTP id a640c23a62f3a-ac6fb1be608mr542731666b.48.1743155909539;
        Fri, 28 Mar 2025 02:58:29 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71927b205sm137759566b.60.2025.03.28.02.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:58:29 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] xl2tpd: fix build with gcc-15
Date: Fri, 28 Mar 2025 10:58:23 +0100
Message-ID: <20250328095823.3335387-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116352

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../xl2tpd/0001-Fix-build-with-GCC-15.patch   | 39 +++++++++++++++++++
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000..2ba927bf0e
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with-GCC-15.patch
@@ -0,0 +1,39 @@
+From 754b0ca247b2d789f9f613f8757b9732494e9489 Mon Sep 17 00:00:00 2001
+From: Yaakov Selkowitz <yselkowi@redhat.com>
+Date: Thu, 6 Mar 2025 21:03:28 -0500
+Subject: [PATCH] Fix build with GCC 15
+
+GCC 15 defaults to C23, in which the interpretation of function
+declarations without parameters changed from unspecified to `void`.  This
+results in `control_handle_lac_status` not being compatible with the
+expected callback function type.  Adding the expected type parameters,
+albeit unused, fixes the compatibility.
+
+Upstream-Status: Submitted [https://github.com/xelerance/xl2tpd/pull/272]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ xl2tpd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xl2tpd.c b/xl2tpd.c
+index 3195988..0d148e9 100644
+--- a/xl2tpd.c
++++ b/xl2tpd.c
+@@ -74,7 +74,7 @@ static int control_handle_lac_hangup(FILE* resf, char* bufp);
+ static int control_handle_lac_disconnect(FILE* resf, char* bufp);
+ static int control_handle_lac_add_modify(FILE* resf, char* bufp);
+ static int control_handle_lac_remove(FILE* resf, char* bufp);
+-static int control_handle_lac_status();
++static int control_handle_lac_status(FILE*, char*);
+ static int control_handle_lns_remove(FILE* resf, char* bufp);
+ 
+ static struct control_requests_handler control_handlers[] = {
+@@ -1541,7 +1541,7 @@ static int control_handle_lac_remove(FILE* resf, char* bufp){
+     return 1;
+ }
+ 
+-static int control_handle_lac_status(){
++static int control_handle_lac_status(FILE*, char*){
+     show_status ();
+     return 1;
+ }
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
index 08bab4a338..0b7887dacb 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
@@ -8,7 +8,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/xelerance/xl2tpd.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/xelerance/xl2tpd.git;branch=master;protocol=https \
+    file://0001-Fix-build-with-GCC-15.patch \
+"
 SRCREV = "1ef2a025981223c1e16fc833bef226c86ff8c295"
 
 UPSTREAM_CHECK_URI = "https://github.com/xelerance/xl2tpd/releases"

