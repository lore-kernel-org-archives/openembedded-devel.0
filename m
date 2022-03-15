Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6FFC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 18:53:17 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.15312.1647370396446603837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sSy/dERt;
 spf=pass (domain: linaro.org, ip: 209.85.160.182,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f182.google.com with SMTP id 11so16643871qtt.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FjSnUN2C5VuRTmHAvm7eEENie4Dsg5Ee52O7Q54JGos=;
        b=sSy/dERtF1iLQ5K1aw66r7PUmo34yTQod/jsq1AopSa4399B+vElHuvjjcho2qTXAN
         fEuDyl7sPFQlucdUGKSSthptTWqVSCQPTXdTT0ynQ27+5I6FllW6iAxH962epYkaWwZV
         GPFMIqcG2V33OT6+QCmC7r04d9uvv5sDmsjyy8IbqI8zY+OwfluT4GmElkq8hqOVGqSx
         i/EDdBCURilrcBjlFUjKLwZEcmTBVQLQOhlOI8ychDZaMnNO/fxCe5dR3sUUuNe51zNj
         RlXXRzAjcNuey+TgR+5VjGnxqKcpBgyazfgxgiKv4pElHoy3JI8ZAajidDBTD2qpZlb3
         Fx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FjSnUN2C5VuRTmHAvm7eEENie4Dsg5Ee52O7Q54JGos=;
        b=g9vbp7v35u7/FALgYdZLrEZ16at5WvQDirPqDhmHLxWvnFPKw0TgpmBHVzxkUcFhGj
         zKkAllEG9O6hNQP2F0eWevg1ApOcgbnygilNNjSBmPi1JC6PXqfeGu4fRT/PIKSPNWQ3
         KjfgXcMuNXSKWuFmN8YqoVRU3FWgkgA6OnUBuQGzMsyJ3PYUpyNlCK9udIc6Zdv+RmS4
         4U4oAgSjn9I0+3pCryVELJORwZFGIuG9u4GABcAiQvjj1dDNIYcxywecL44xaTqelXdD
         BOKcC7Z5eIBzA7LSDdplrrSl/i4TRBRC7/JCCCMBLxY8sEiIPLgN27gR4fdYLmqlbzcI
         A1gQ==
X-Gm-Message-State: AOAM5307cwl6ZdLLZxuEyTsCZ6YY+RfB42RGo0jZ5uja9WqDykjURxVp
	OLWj0Uqgp8DH0SR0YOObLyADIa918JiZHQ==
X-Google-Smtp-Source: 
 ABdhPJy8pARww9uFPvPOSi1pC2CylTRCAYVo8UkuRJAxAsd63UTumblqx2SYnbDct/rG6i6cHqWvoQ==
X-Received: by 2002:a05:622a:453:b0:2e1:d293:c190 with SMTP id
 o19-20020a05622a045300b002e1d293c190mr8969866qtx.91.1647370395432;
        Tue, 15 Mar 2022 11:53:15 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a376b07000000b006492f19ae76sm9705904qkc.27.2022.03.15.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 11:53:15 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [meta-webserver][dunfell][PATCH] nginx: backport fix for
 CVE-2019-20372
Date: Tue, 15 Mar 2022 14:53:09 -0400
Message-Id: <20220315185309.3241473-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 18:53:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96003

Fixed an HTTP request smuggling with certain error_page configurations
which could have allowed unauthorized web page reads.

This issue affects nginx prior to 1.17.7, so only the recipe for 1.16.1
needs the patch applied.

Fix is taken directly from
https://github.com/nginx/nginx/commit/c1be55f97211d38b69ac0c2027e6812ab8b1b94e

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../nginx/files/CVE-2019-20372.patch          | 39 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.16.1.bb       |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2019-20372.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2019-20372.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2019-20372.patch
new file mode 100644
index 000000000..45653e422
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2019-20372.patch
@@ -0,0 +1,39 @@
+From 6511195c023bf03e0fb19a36f41f42f4edde6e88 Mon Sep 17 00:00:00 2001
+From: Ruslan Ermilov <ru@nginx.com>
+Date: Mon, 23 Dec 2019 15:45:46 +0300
+Subject: [PATCH] Discard request body when redirecting to a URL via
+ error_page.
+
+Reported by Bert JW Regeer and Francisco Oca Gonzalez.
+
+Upstream-Status: Backport
+CVE: CVE-2019-20372
+
+Reference to upstream patch:
+https://github.com/nginx/nginx/commit/c1be55f97211d38b69ac0c2027e6812ab8b1b94e
+
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+---
+ src/http/ngx_http_special_response.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/http/ngx_http_special_response.c b/src/http/ngx_http_special_response.c
+index 4ffb2cc8..76e67058 100644
+--- a/src/http/ngx_http_special_response.c
++++ b/src/http/ngx_http_special_response.c
+@@ -623,6 +623,12 @@ ngx_http_send_error_page(ngx_http_request_t *r, ngx_http_err_page_t *err_page)
+         return ngx_http_named_location(r, &uri);
+     }
+ 
++    r->expect_tested = 1;
++
++    if (ngx_http_discard_request_body(r) != NGX_OK) {
++        r->keepalive = 0;
++    }
++
+     location = ngx_list_push(&r->headers_out.headers);
+ 
+     if (location == NULL) {
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
index 207642575..09d58b8fb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.16.1.bb
@@ -4,3 +4,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
 
 SRC_URI[md5sum] = "45a80f75336c980d240987badc3dcf60"
 SRC_URI[sha256sum] = "f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b"
+
+SRC_URI += "file://CVE-2019-20372.patch"
-- 
2.25.1


