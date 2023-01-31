Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8322BC636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 11:30:43 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.9965.1675164637134218618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 03:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=O70GgHEP;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id ha3-20020a17090af3c300b00230222051a6so453533pjb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 03:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+LLVpc4vSt/5fkyYMQGViO/bAV9yINcRMdIcC2300g=;
        b=O70GgHEPEA7X2zU/i6Iegdz+/uLZO4sPsUPOx/z8Bt8LTdHbfxnsBvQxSryepHkyPt
         FplBuP6ZZOJLk2uF4YEYY3yNaZiiZTY1fimHoSCtbQrWqA7/QdTSfmMZdiXhoT3rdOdG
         WJf9gBiixaw4btQDrrVWoqUoJULQV3XSVksMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+LLVpc4vSt/5fkyYMQGViO/bAV9yINcRMdIcC2300g=;
        b=SVhIcN8yf5Hit8kmm/e3+Cxu6IojmIlcnOY6L69jDGrMW+mRzywWFR1Z4CvzJabnX8
         FOlplfTFwYvrvsIbSoKrO0gnTEw+OqTqsObwk4uwMGt97zjTjjJpv48TGOZwLjjdSlGJ
         CV/nSa6HO5SovfWEdJeioNN4om0TTGe7xQjOtLcpU6PKqkvfIe/cODWCAilcLmGtZeGK
         LXCwCP92dBBq9MMrvBXSC7eIqV2xb6rzAfpdGONjVcgQ4zg/bWZB5CtOPatm2T29/6fz
         65DnbFIJF/BapE9e+AcKVNmkkGGFxsr56tgvlnt0D6avfjrjztWe0h583fV4Y2Vl+9rX
         DTLw==
X-Gm-Message-State: AO0yUKVZRFem1UBK6z6HrkQkEan3DD8m7yBCuzeXkM2BC9ZALeA6vIkN
	lsuu64M124wwg83J8P/b/fgG9sN23KF1KlS9
X-Google-Smtp-Source: AK7set8llbaDvFL2Cw77iYRrKVc6UdxOV/DLwNf8a8q9IOh/n5oJo0YPfQRSl5rvB3IJCgyP/e3zzQ==
X-Received: by 2002:a05:6a20:a015:b0:bc:57a3:e6e4 with SMTP id p21-20020a056a20a01500b000bc57a3e6e4mr16025710pzj.34.1675164635910;
        Tue, 31 Jan 2023 03:30:35 -0800 (PST)
Received: from MVIN00024 ([103.250.136.204])
        by smtp.gmail.com with ESMTPSA id v22-20020aa78516000000b00592a74b9b4dsm8045179pfn.141.2023.01.31.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 03:30:35 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 31 Jan 2023 17:00:30 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][dunfell][PATCH] httpd: CVE-2022-37436 mod_proxy: HTTP response splitting
Date: Tue, 31 Jan 2023 17:00:29 +0530
Message-Id: <20230131113029.164254-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 11:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100876

Upstream-Status: Backport from https://github.com/apache/httpd/commit/8b6d55f6a047acf62675e32606b037f5eea8ccc7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../apache2/apache2/CVE-2022-37436.patch      | 138 ++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.54.bb   |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch
new file mode 100644
index 0000000000..62a6a3844e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch
@@ -0,0 +1,138 @@
+From 8b6d55f6a047acf62675e32606b037f5eea8ccc7 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Tue, 10 Jan 2023 13:20:09 +0000
+Subject: [PATCH] CVE-2022-37436
+
+SECURITY: CVE-2022-37436 (cve.mitre.org)
+
+Prior to Apache HTTP Server 2.4.55, a malicious backend can
+cause the response headers to be truncated early, resulting in
+some headers being incorporated into the response body. If the
+later headers have any security purpose, they will not be
+interpreted by the client.
+
+git-svn-id: git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1906541 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream-Status: Backport [https://github.com/apache/httpd/commit/8b6d55f6a047acf62675e32606b037f5eea8ccc7]
+CVE: CVE-2022-37436
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ modules/proxy/mod_proxy_http.c | 46 ++++++++++++++++++++--------------
+ server/protocol.c              |  2 ++
+ 2 files changed, 29 insertions(+), 19 deletions(-)
+
+diff --git a/modules/proxy/mod_proxy_http.c b/modules/proxy/mod_proxy_http.c
+index d74ae05..04dd221 100644
+--- a/modules/proxy/mod_proxy_http.c
++++ b/modules/proxy/mod_proxy_http.c
+@@ -788,7 +788,7 @@ static void process_proxy_header(request_rec *r, proxy_dir_conf *c,
+  * any sense at all, since we depend on buffer still containing
+  * what was read by ap_getline() upon return.
+  */
+-static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
++static apr_status_t ap_proxy_read_headers(request_rec *r, request_rec *rr,
+                                   char *buffer, int size,
+                                   conn_rec *c, int *pread_len)
+ {
+@@ -820,19 +820,26 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
+         rc = ap_proxygetline(tmp_bb, buffer, size, rr,
+                              AP_GETLINE_FOLD | AP_GETLINE_NOSPC_EOL, &len);
+ 
+-        if (len <= 0)
+-            break;
+ 
+-        if (APR_STATUS_IS_ENOSPC(rc)) {
+-            /* The header could not fit in the provided buffer, warn.
+-             * XXX: falls through with the truncated header, 5xx instead?
+-             */
+-            int trunc = (len > 128 ? 128 : len) / 2;
+-            ap_log_rerror(APLOG_MARK, APLOG_WARNING, rc, r, APLOGNO(10124)
+-                    "header size is over the limit allowed by "
+-                    "ResponseFieldSize (%d bytes). "
+-                    "Bad response header: '%.*s[...]%s'",
+-                    size, trunc, buffer, buffer + len - trunc);
++        if (rc != APR_SUCCESS) {
++            if (APR_STATUS_IS_ENOSPC(rc)) {
++                int trunc = (len > 128 ? 128 : len) / 2;
++                ap_log_rerror(APLOG_MARK, APLOG_WARNING, rc, r, APLOGNO(10124)
++                        "header size is over the limit allowed by "
++                        "ResponseFieldSize (%d bytes). "
++                        "Bad response header: '%.*s[...]%s'",
++                        size, trunc, buffer, buffer + len - trunc);
++            }
++            else {
++                ap_log_rerror(APLOG_MARK, APLOG_WARNING, rc, r, APLOGNO(10404)
++                              "Error reading headers from backend");
++            }
++            r->headers_out = NULL;
++            return rc;
++        }
++
++        if (len <= 0) {
++            break;
+         }
+         else {
+             ap_log_rerror(APLOG_MARK, APLOG_TRACE4, 0, r, "%s", buffer);
+@@ -855,7 +862,7 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
+                 if (psc->badopt == bad_error) {
+                     /* Nope, it wasn't even an extra HTTP header. Give up. */
+                     r->headers_out = NULL;
+-                    return;
++                    return APR_EINVAL;
+                 }
+                 else if (psc->badopt == bad_body) {
+                     /* if we've already started loading headers_out, then
+@@ -869,13 +876,13 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
+                                       "in headers returned by %s (%s)",
+                                       r->uri, r->method);
+                         *pread_len = len;
+-                        return;
++                        return APR_SUCCESS;
+                     }
+                     else {
+                         ap_log_rerror(APLOG_MARK, APLOG_WARNING, 0, r, APLOGNO(01099)
+                                       "No HTTP headers returned by %s (%s)",
+                                       r->uri, r->method);
+-                        return;
++                        return APR_SUCCESS;
+                     }
+                 }
+             }
+@@ -905,6 +912,7 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
+         process_proxy_header(r, dconf, buffer, value);
+         saw_headers = 1;
+     }
++    return APR_SUCCESS;
+ }
+ 
+ 
+@@ -1218,10 +1226,10 @@ int ap_proxy_http_process_response(proxy_http_req_t *req)
+                          "Set-Cookie", NULL);
+ 
+             /* shove the headers direct into r->headers_out */
+-            ap_proxy_read_headers(r, backend->r, buffer, response_field_size,
+-                                  origin, &pread_len);
++            rc = ap_proxy_read_headers(r, backend->r, buffer, response_field_size,
++                                       origin, &pread_len);
+ 
+-            if (r->headers_out == NULL) {
++            if (rc != APR_SUCCESS || r->headers_out == NULL) {
+                 ap_log_rerror(APLOG_MARK, APLOG_WARNING, 0, r, APLOGNO(01106)
+                               "bad HTTP/%d.%d header returned by %s (%s)",
+                               major, minor, r->uri, r->method);
+diff --git a/server/protocol.c b/server/protocol.c
+index 7adc7f7..6f9540a 100644
+--- a/server/protocol.c
++++ b/server/protocol.c
+@@ -508,6 +508,8 @@ cleanup:
+         /* PR#43039: We shouldn't accept NULL bytes within the line */
+         bytes_handled = strlen(*s);
+         if (bytes_handled < *read) {
++            ap_log_data(APLOG_MARK, APLOG_DEBUG, ap_server_conf,
++                        "NULL bytes in header", *s, *read, 0);
+             *read = bytes_handled;
+             if (rv == APR_SUCCESS) {
+                 rv = APR_EINVAL;
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index 2bda18d2d2..8b98865641 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://CVE-2022-36760.patch \
+           file://CVE-2022-37436.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.25.1


