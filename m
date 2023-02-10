Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44804C636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 04:35:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.6674.1676003721942465247
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 20:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VbzgLNkE;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id o13so4105241pjg.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 20:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aEfewAnZ9M7e/zeNjhlweNNtFHwmB9yXLITBwnC5BAc=;
        b=VbzgLNkE1ukxQhm5VOHVxuFGW5GkEqjtqe4m4YKSp794Qda8psL3CNQ9GePjn8WWXq
         10/UoZ05D2sqvzgTuatlp/EvjXWcGc6bisKuWPq/lvjbbIH9Aaymq61SOSAi6IZpTH84
         Y7Q3hz0PeVVkXDPYzlXYl5LoUvuE4IHPLbOtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEfewAnZ9M7e/zeNjhlweNNtFHwmB9yXLITBwnC5BAc=;
        b=Hyj0BurKa1kYtmLkW0ipfG7xpTrPZFB8CvrJMyvuU1+NvIx3NrS4s2wSkJJYugslzx
         H3IhwAZePWmz94XdRboay0crth3TYBTvXAv+YaW2LWwhQVBFdSD0NaNJi/Oc6K3qGoP9
         AsTjlrrtyOe/fe06RL/Qcpsfl9thSEHjTbMp8oDdqjL/Z1+xkVwcdZA4xOfENTAfobT5
         GOoxB2pKz7xr+WzkcIjTAg3qDCQ5teMuxG2WL+OPWtrI5hhVej2lMLqkQzrgRfInrCta
         SzfZ2ymCzlxoImqJm+PlhoUzcDqFTq1J4ZVhfyVQpX/XaWqnfDAyc2gsEm8NbaMXRJsY
         SeOw==
X-Gm-Message-State: AO0yUKU1+uP8pZnl6r+X/K2dOQ6ADQrh3C1kF7gTYgWmNJjq1PzSEWbC
	KKrpLhYDBeiXsMBYaCKs2GWoE1cVWXJCb9WS
X-Google-Smtp-Source: AK7set8iSVoew9RYX+Z3W4GACXtw/i27FhHclezZ6f4xtQIXDJGJUQDO8EiK8lbL9hNqLQzuGAOdfQ==
X-Received: by 2002:a17:902:d541:b0:199:53e4:6ff9 with SMTP id z1-20020a170902d54100b0019953e46ff9mr5280737plf.13.1676003716041;
        Thu, 09 Feb 2023 20:35:16 -0800 (PST)
Received: from MVIN00024 ([103.250.136.146])
        by smtp.gmail.com with ESMTPSA id jd9-20020a170903260900b0019625428cefsm2309442plb.281.2023.02.09.20.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:35:15 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 10 Feb 2023 10:05:10 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][kirkstone][PATCH] httpd: CVE-2022-37436 mod_proxy: HTTP response splitting
Date: Fri, 10 Feb 2023 10:05:08 +0530
Message-Id: <20230210043508.6793-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Feb 2023 04:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101015

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
index 37d498f52e..429b1e5dd0 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
+           file://CVE-2022-37436.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.25.1


