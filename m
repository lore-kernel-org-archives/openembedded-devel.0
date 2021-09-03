Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2757.1630632404966638671
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 18:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qVxaZ7rN;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id g14so3055430pfm.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 18:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pkazdYHw9QVV2A6fwacEzZM6jpugg7HDzQUO/qjIFiU=;
        b=qVxaZ7rN8BhmrQASFkjassMDb+MUMjPKbn8u1Y57Ml7YQ5rEFs4MkCxL0pVuSycfMu
         2ALhzxQM4I0gsWO89aWzPklLAMq6yQgNLpcP9HJJgAKMb57QaE/OWtXwQGVOEjSfbK18
         b/ViLpWlq4+oZOtd+N9VOTBtjL7HDXavJGKaXhoskl8gyzEJOKncIhyXP6rUQqvC6Lf5
         sYITm1yagNGFkvEnUardtES5bvVlRlGTi4OHyP4WO6EhlQd1C/FsVxuS0QF0lid7vo4i
         uZma+anVTJDBDXnsbZi8gosKMlmBEmhfc49kdsDzkMQD1k/u8vNVF3ePe8HjwXiyHB1g
         UPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pkazdYHw9QVV2A6fwacEzZM6jpugg7HDzQUO/qjIFiU=;
        b=rXNPeAXp7VlpXf9YV67VkwyR0zoMzBHcMHO7H5KTuW1cdO82auIIyL56keHtgv9Kkd
         G2ev1qb17wiHRfM7e5Mc1qi+eB8R2lrqTcoOBT6eK1uabzCmqumYGPIM9zDK9sHQKCuj
         NnrWZIszxi9Fxf6ESDWhqgR3Dhoi8YMDlc3uIiZ0UVUYIPeI3iGy3zbrJRPFsMxt15ty
         4oFy1OG6Uyoa6eZ7TBxuJuEe6AmmjKidfidVX1DF7lcdUfgeHbu0U8x4v+Jws6HYE7pm
         2JgQX5w1RjSZz8gr0KeuwaeAg6RJ2ayAsIMMMR41j1Qr91YmpVBfuaoUy/0ZXPiQ8w79
         bOew==
X-Gm-Message-State: AOAM533++Md3HMTfGE86Sn7HT06gbWvqX+30xOgD27Il1gwyXPN5wVdO
	Dfsz+Rt/6zDbUPigWxjJB4OnIN7u3Rs=
X-Google-Smtp-Source: ABdhPJwIFixRqxtaT7v3xcXkRFEcxSot6qKHhVVFeN0VP7V5vQB/GKzWZUhXxWNa13xPwqXnaBhVMw==
X-Received: by 2002:a62:520e:0:b0:3e2:1c21:f1ba with SMTP id g14-20020a62520e000000b003e21c21f1bamr1149244pfb.78.1630632404187;
        Thu, 02 Sep 2021 18:26:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:5019:494:e14a:977])
        by smtp.gmail.com with ESMTPSA id y26sm3295183pfe.69.2021.09.02.18.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 18:26:43 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-webserver][dunfell]] apache2: upgrade 2.4.46 -> 2.4.48
Date: Thu,  2 Sep 2021 18:26:42 -0700
Message-Id: <20210903012642.3260628-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Source: https://git.openembedded.org/meta-openembedded
https://git.openembedded.org/meta-openembedded
MR: 112869, 112835, 105131, 112702, 112829
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-webserver/recipes-httpd/apache2?id=ba016d73b5233a43ec6e398b45445d13ddaad745
ChangeID: f3ac0bc1005c94a694573b823c8f3f7d4a15360c
Description:

Apache2 2.4.x is an LTS version with bug and CVE fixes.
https://downloads.apache.org/httpd/CHANGES_2.4.48

Includes these CVE fixes:

2.4.48
CVE-2021-31618

2.4.47
CVE-2020-13938
CVE-2020-11985
CVE-2021-33193
CVE-2019-17567

Drop these patches included in update:
CVE-2020-13950.patch
CVE-2020-35452.patch
CVE-2021-26690.patch
CVE-2021-26691.patch
CVE-2021-30641.patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ba016d73b5233a43ec6e398b45445d13ddaad745)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../apache2/apache2/CVE-2020-13950.patch      | 45 -------------
 .../apache2/apache2/CVE-2020-35452.patch      | 49 --------------
 .../apache2/apache2/CVE-2021-26690.patch      | 39 -----------
 .../apache2/apache2/CVE-2021-26691.patch      | 35 ----------
 .../apache2/apache2/CVE-2021-30641.patch      | 66 -------------------
 .../{apache2_2.4.46.bb => apache2_2.4.48.bb}  |  9 +--
 6 files changed, 2 insertions(+), 241 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.46.bb => apache2_2.4.48.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
deleted file mode 100644
index 4eb6b85b1a..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 8c162db8b65b2193e622b780e8c6516d4265f68b Mon Sep 17 00:00:00 2001
-From: Yann Ylavic <ylavic@apache.org>
-Date: Mon, 11 May 2015 15:48:58 +0000
-Subject: [PATCH] mod_proxy_http: follow up to r1656259. The proxy connection
- may be NULL during prefetch, don't try to dereference it! Still
- origin->keepalive will be set according to p_conn->close by the caller
- (proxy_http_handler).
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1678771 13f79535-47bb-0310-9956-ffa450edef68
-
-Upstream-Status: Backport
-CVE: CVE-2020-35504
-
-Reference to upstream patch:
-https://bugzilla.redhat.com/show_bug.cgi?id=1966738
-https://github.com/apache/httpd/commit/8c162db8b65b2193e622b780e8c6516d4265f68b
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- modules/proxy/mod_proxy_http.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/modules/proxy/mod_proxy_http.c b/modules/proxy/mod_proxy_http.c
-index ec1e042..5f507d5 100644
---- a/modules/proxy/mod_proxy_http.c
-+++ b/modules/proxy/mod_proxy_http.c
-@@ -570,7 +570,6 @@ static int ap_proxy_http_prefetch(proxy_http_req_t *req,
-     apr_off_t bytes;
-     int force10, rv;
-     apr_read_type_e block;
--    conn_rec *origin = p_conn->connection;
- 
-     if (apr_table_get(r->subprocess_env, "force-proxy-request-1.0")) {
-         if (req->expecting_100) {
-@@ -630,7 +629,6 @@ static int ap_proxy_http_prefetch(proxy_http_req_t *req,
-                       "chunked body with Content-Length (C-L ignored)",
-                       c->client_ip, c->remote_host ? c->remote_host: "");
-         req->old_cl_val = NULL;
--        origin->keepalive = AP_CONN_CLOSE;
-         p_conn->close = 1;
-     }
- 
--- 
-2.7.4
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
deleted file mode 100644
index 001ca9252d..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3b6431eb9c9dba603385f70a2131ab4a01bf0d3b Mon Sep 17 00:00:00 2001
-From: Yann Ylavic <ylavic@apache.org>
-Date: Mon, 18 Jan 2021 17:39:12 +0000
-Subject: [PATCH] Merge r1885659 from trunk:
-
-mod_auth_digest: Fast validation of the nonce's base64 to fail early if
-                 the format can't match anyway.
-
-Submitted by: ylavic
-Reviewed by: ylavic, covener, jailletc36
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1885666 13f79535-47bb-0310-9956-ffa450edef68
-
-Upstream-Status: Backport
-CVE: CVE-2020-35452
-
-Reference to upstream patch:
-https://security-tracker.debian.org/tracker/CVE-2020-35452
-https://github.com/apache/httpd/commit/3b6431eb9c9dba603385f70a2131ab4a01bf0d3b
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- modules/aaa/mod_auth_digest.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/modules/aaa/mod_auth_digest.c b/modules/aaa/mod_auth_digest.c
-index b760941..0825b1b 100644
---- a/modules/aaa/mod_auth_digest.c
-+++ b/modules/aaa/mod_auth_digest.c
-@@ -1422,9 +1422,14 @@ static int check_nonce(request_rec *r, digest_header_rec *resp,
-     time_rec nonce_time;
-     char tmp, hash[NONCE_HASH_LEN+1];
- 
--    if (strlen(resp->nonce) != NONCE_LEN) {
-+    /* Since the time part of the nonce is a base64 encoding of an
-+     * apr_time_t (8 bytes), it should end with a '=', fail early otherwise.
-+     */
-+    if (strlen(resp->nonce) != NONCE_LEN
-+            || resp->nonce[NONCE_TIME_LEN - 1] != '=') {
-         ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, r, APLOGNO(01775)
--                      "invalid nonce %s received - length is not %d",
-+                      "invalid nonce '%s' received - length is not %d "
-+                      "or time encoding is incorrect",
-                       resp->nonce, NONCE_LEN);
-         note_digest_auth_failure(r, conf, resp, 1);
-         return HTTP_UNAUTHORIZED;
--- 
-2.7.4
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
deleted file mode 100644
index d3aea9e122..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 67bd9bfe6c38831e14fe7122f1d84391472498f8 Mon Sep 17 00:00:00 2001
-From: Yann Ylavic <ylavic@apache.org>
-Date: Mon, 1 Mar 2021 20:07:08 +0000
-Subject: [PATCH] mod_session: save one apr_strtok() in
- session_identity_decode().
-
-When the encoding is invalid (missing '='), no need to parse further.
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1887050 13f79535-47bb-0310-9956-ffa450edef68
-
-Upstream-Status: Backport
-CVE: CVE-2021-26690
-
-Reference to upstream patch:
-https://security-tracker.debian.org/tracker/CVE-2021-26690
-https://github.com/apache/httpd/commit/67bd9bfe6c38831e14fe7122f1d84391472498f8
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- modules/session/mod_session.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/session/mod_session.c b/modules/session/mod_session.c
-index ebd05b0..af70f6b 100644
---- a/modules/session/mod_session.c
-+++ b/modules/session/mod_session.c
-@@ -404,8 +404,8 @@ static apr_status_t session_identity_decode(request_rec * r, session_rec * z)
-         char *plast = NULL;
-         const char *psep = "=";
-         char *key = apr_strtok(pair, psep, &plast);
--        char *val = apr_strtok(NULL, psep, &plast);
-         if (key && *key) {
-+            char *val = apr_strtok(NULL, sep, &plast);
-             if (!val || !*val) {
-                 apr_table_unset(z->entries, key);
-             }
--- 
-2.7.4
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
deleted file mode 100644
index f9cf868d01..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7e09dd714fc62c08c5b0319ed7b9702594faf49b Mon Sep 17 00:00:00 2001
-From: Yann Ylavic <ylavic@apache.org>
-Date: Mon, 1 Mar 2021 20:13:54 +0000
-Subject: [PATCH] mod_session: account for the '&' in identity_concat().
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1887052 13f79535-47bb-0310-9956-ffa450edef68
-
-Upstream-Status: Backport
-CVE: CVE-2021-26691
-
-Reference to upstream patch:
-https://bugzilla.redhat.com/show_bug.cgi?id=1966732
-https://github.com/apache/httpd/commit/7e09dd714fc62c08c5b0319ed7b9702594faf49b
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- modules/session/mod_session.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/session/mod_session.c b/modules/session/mod_session.c
-index 7ee477c..ebd05b0 100644
---- a/modules/session/mod_session.c
-+++ b/modules/session/mod_session.c
-@@ -317,7 +317,7 @@ static apr_status_t ap_session_set(request_rec * r, session_rec * z,
- static int identity_count(void *v, const char *key, const char *val)
- {
-     int *count = v;
--    *count += strlen(key) * 3 + strlen(val) * 3 + 1;
-+    *count += strlen(key) * 3 + strlen(val) * 3 + 2;
-     return 1;
- }
- 
--- 
-2.7.4
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
deleted file mode 100644
index 7f74c85e33..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 6141d5aa3f5cf8f1b89472e7fdb66578810d0ae3 Mon Sep 17 00:00:00 2001
-From: Eric Covener <covener@apache.org>
-Date: Wed, 21 Apr 2021 01:02:11 +0000
-Subject: [PATCH] legacy default slash-matching behavior w/ 'MergeSlashes OFF'
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1889036 13f79535-47bb-0310-9956-ffa450edef68
-
-Upstream-Status: Backport
-CVE: CVE-2021-30641
-
-Reference to upstream patch:
-https://httpd.apache.org/security/vulnerabilities_24.html#CVE-2021-30641
-https://github.com/apache/httpd/commit/6141d5aa3f5cf8f1b89472e7fdb66578810d0ae3
-
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- server/request.c | 19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/server/request.c b/server/request.c
-index d5c558a..18625af 100644
---- a/server/request.c
-+++ b/server/request.c
-@@ -1419,7 +1419,20 @@ AP_DECLARE(int) ap_location_walk(request_rec *r)
- 
-     cache = prep_walk_cache(AP_NOTE_LOCATION_WALK, r);
-     cached = (cache->cached != NULL);
--    entry_uri = r->uri;
-+
-+   /*
-+    * When merge_slashes is set to AP_CORE_CONFIG_OFF the slashes in r->uri
-+    * have not been merged. But for Location walks we always go with merged
-+    * slashes no matter what merge_slashes is set to.
-+    */
-+    if (sconf->merge_slashes != AP_CORE_CONFIG_OFF) {
-+        entry_uri = r->uri;
-+    }
-+    else {
-+        char *uri = apr_pstrdup(r->pool, r->uri);
-+        ap_no2slash(uri);
-+        entry_uri = uri;
-+    }
- 
-     /* If we have an cache->cached location that matches r->uri,
-      * and the vhost's list of locations hasn't changed, we can skip
-@@ -1486,7 +1499,7 @@ AP_DECLARE(int) ap_location_walk(request_rec *r)
-                     pmatch = apr_palloc(rxpool, nmatch*sizeof(ap_regmatch_t));
-                 }
- 
--                if (ap_regexec(entry_core->r, entry_uri, nmatch, pmatch, 0)) {
-+                if (ap_regexec(entry_core->r, r->uri, nmatch, pmatch, 0)) {
-                     continue;
-                 }
- 
-@@ -1496,7 +1509,7 @@ AP_DECLARE(int) ap_location_walk(request_rec *r)
-                         apr_table_setn(r->subprocess_env,
-                                        ((const char **)entry_core->refs->elts)[i],
-                                        apr_pstrndup(r->pool,
--                                       entry_uri + pmatch[i].rm_so,
-+                                       r->uri + pmatch[i].rm_so,
-                                        pmatch[i].rm_eo - pmatch[i].rm_so));
-                     }
-                 }
--- 
-2.7.4
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
index 4fc1f16317..7af824dd16 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
@@ -15,11 +15,6 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://apache-configure_perlbin.patch \
            file://0001-support-apxs.in-force-destdir-to-be-empty-string.patch \
-           file://CVE-2020-13950.patch \
-           file://CVE-2020-35452.patch \
-           file://CVE-2021-26690.patch \
-           file://CVE-2021-26691.patch \
-           file://CVE-2021-30641.patch \
           "
 
 SRC_URI_append_class-target = " \
@@ -31,8 +26,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[md5sum] = "7d661ea5e736dac5e2761d9f49fe8361"
-SRC_URI[sha256sum] = "740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea"
+SRC_URI[md5sum] = "a7088cec171b0d00bf43394ce64d3909"
+SRC_URI[sha256sum] = "1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1

