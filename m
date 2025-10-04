Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6092CAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 19:02:18 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.15429.1759604529789179477
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 12:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyeeUiOR;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso7747588a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 12:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759604528; x=1760209328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tV9vpG1X6070o0wzXGtrg6IFBD1gcPYBKdSsnVjDJ1Q=;
        b=IyeeUiORGnfnuF6y/B0rVXuvQ6mhQHfw5i1inBAq41wRnDAaS6q0Ep/wbc4tzT/qcb
         WdbBOnsKN7oEkQl43Hm62J8ChKSUgem6jeriLKkzoP/U04Xc31XybstODoXeoQBjDF3o
         ZWyA0dHTwVo+85nKbu8qxL5Mwnp0TSXkWq8VI2BP5VS7FVVHI1YPUBgGxbL8ckrLG2dt
         mOi2oVqk2HhYbSBQkuzr/WyGNOs/SZgvabdi8llry9oPlh72U9eW7FZV+qzqMOEgB4yN
         chLVbUKkv5yGIrPnG560pyNE/RUg1jT8Lq1NbA9zq/5zwMAmDS/433g6zNN/IM59m+a2
         wLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759604528; x=1760209328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV9vpG1X6070o0wzXGtrg6IFBD1gcPYBKdSsnVjDJ1Q=;
        b=l/CuK7DTzV58faJ+CuR4MJQsiPu/LuC8kH237f5hjqwX+Bw8JwHvHgu/wQV8PGTLMA
         7ekWoYYz3ehiWRzYVS0g0r6anJ/Zbnksg/nO6P30WoAERVjZ0EzmYwTcsiu2tHTmBCrA
         TYTrgqYz2+mGHk4aZzeKf4913am/IC29oSTrN2ln7KN49LbharwXVTLoyJZM0TMsKKAk
         75c/IQJ1ABXai1VqqENg3HTmoPwuF9Skrl0/BRMQkGCyRYoN69FwoJb3ZN7f1dHOKZq/
         tawcy715W9dz7JVXVOUE4BalZVzWL11x5UGadiio7a7eQT0diBcw1WlgROrMiHVv0H+8
         5QMw==
X-Gm-Message-State: AOJu0YxUmQ1ou0m1/vwLBita6blQ/vKt6w6ITQ83BHBzR15QTM6Hkf/V
	FGGGCB/wQjzidN8iywQVr9k5wUgU63ycwcAchI4UFQRzMW02fAbaJB0HMbn5Gg==
X-Gm-Gg: ASbGncs6ucf6Ocrb6DsmS95rvjhWsK3+JuTQdK8r3UcZVLNqK44XUjuYQo5DoYeghbN
	absF7WZL19dxBRLHlVlWioYKqu9hQp2ejmih8R5CTzlbcCFbV4087LIpjx6F+tKJe9t8Pj2T9vA
	pDP02tA6wUxVMrbW5LMFNfXVodNI8KkzlmJL4T/+UxSXuCExVl7b/g9+mU5KbwSHvwRJfCQLAlX
	pLiej+pSQZcpTA8XrYXstFX96NIvPQZrlCbB7ocds7aCXrBZS/hCvefisfX1IyFCP5jUTtrmihN
	liSVsBPH8Jfvro3BGoSiGz8xCMiuw3+RdiV6KDJmGKUtJVqP8S3rqmHpXoE7EUeWpg2TtqoCT8u
	f5jA+OYHyRgWI0cDdLtjCHwmUTZcnwtrasEh8mWeCQSNl
X-Google-Smtp-Source: AGHT+IECopqbxFlHMeYEKXGDy87lZ0gOoZO3CkvlT8TkyFQSI68iCss6l3hxBI4Ot3tnJs6xE+hF0A==
X-Received: by 2002:a05:6402:274c:b0:62a:a4f0:7e4f with SMTP id 4fb4d7f45d1cf-63939c233a8mr8417733a12.29.1759604527866;
        Sat, 04 Oct 2025 12:02:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881011e9sm6523307a12.25.2025.10.04.12.02.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 12:02:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] civetweb: patch CVE-2025-55763
Date: Sat,  4 Oct 2025 21:02:05 +0200
Message-ID: <20251004190205.3200208-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 19:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120236

https://nvd.nist.gov/vuln/detail/CVE-2025-55763

Though the original PR has 2 commits, the second one is just
about minor code-cosmetics.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../civetweb/civetweb/CVE-2025-55763.patch    | 59 +++++++++++++++++++
 .../civetweb/civetweb_1.16.bb                 |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch
new file mode 100644
index 0000000000..9840a66029
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch
@@ -0,0 +1,59 @@
+From 76e222bcb77ba8452e5da4e82ae6cecd499c25e0 Mon Sep 17 00:00:00 2001
+From: krispybyte <krispybyte@proton.me>
+Date: Sat, 21 Jun 2025 23:33:50 +0300
+Subject: Fix heap overflow in directory URI slash redirection
+
+CVE: CVE-2025-55763
+
+Upstream-Status: Backport [https://github.com/civetweb/civetweb/commit/c584455624d9a9f6ec72839f61dd3cdb9d8435ba]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@mail.com>
+
+---
+ src/civetweb.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/src/civetweb.c b/src/civetweb.c
+index bbc9aa8be..e969c939f 100644
+--- a/src/civetweb.c
++++ b/src/civetweb.c
+@@ -15579,7 +15579,6 @@ handle_request(struct mg_connection *conn)
+ 	/* 12. Directory uris should end with a slash */
+ 	if (file.stat.is_directory && ((uri_len = (int)strlen(ri->local_uri)) > 0)
+ 	    && (ri->local_uri[uri_len - 1] != '/')) {
+-
+ 		/* Path + server root */
+ 		size_t buflen = UTF8_PATH_MAX * 2 + 2;
+ 		char *new_path;
+@@ -15592,12 +15591,26 @@ handle_request(struct mg_connection *conn)
+ 			mg_send_http_error(conn, 500, "out or memory");
+ 		} else {
+ 			mg_get_request_link(conn, new_path, buflen - 1);
+-			strcat(new_path, "/");
++
++			size_t len = strlen(new_path);
++			if (len + 1 < buflen) {
++				new_path[len] = '/';
++				new_path[len + 1] = '\0';
++				len += 1;
++			}
++
+ 			if (ri->query_string) {
+-				/* Append ? and query string */
+-				strcat(new_path, "?");
+-				strcat(new_path, ri->query_string);
++				if (len + 1 < buflen) {
++					new_path[len] = '?';
++					new_path[len + 1] = '\0';
++					len += 1;
++				}
++
++				/* Append with size of space left for query string + null terminator */
++				size_t max_append = buflen - len - 1;
++				strncat(new_path, ri->query_string, max_append);
+ 			}
++
+ 			mg_send_http_redirect(conn, new_path, 301);
+ 			mg_free(new_path);
+ 		}
+
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index bbf284474c..97d90dab13 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -8,6 +8,7 @@ SRCREV = "5864b55a94f4b5238155cbf2baec707f0fa2ba6d"
 PV .= "+git"
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
+           file://CVE-2025-55763.patch \
            "
 
 

