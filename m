Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.881.1626368448666639328
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LrM2tDp2;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u3so3722284plf.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=90ZLJ6Q1gyVqYi7n20d3clTq7bf4gHCm+gp5hoOLEEg=;
        b=LrM2tDp2qX+VQcds+IirJQs4IV2FRlSkeQlmHe4x7hDAasStqMRiGNi4o3VSai8FUt
         s85ERrYY31XDa5B+eLvGjsH++3nINKmilL9YwL7EvtbCuAh5Q6QKijrHqpsles7+XJnb
         gN7KdBu05lyrx6sOp2kdOpRZpBSbHzg0Ki2sKAQpkPHXWVv+Vlcu+XIWeLbOHWOntxss
         /7MAtL67guglX5ZucG+3opuJUq98rbwC8E+cDp2kdDqbP66FMHlBFP1aNBdoh8cmJsfB
         S3q034gtvVQMMu8uyPJkl7CelXLhZoY43CVcWDzRuyd3lFbUUNHZ5LVJM59ulIBAt+Pb
         V8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=90ZLJ6Q1gyVqYi7n20d3clTq7bf4gHCm+gp5hoOLEEg=;
        b=emkpAHNDKpKvUAjtwqree46pw5Jvv42UAxTboauzA/jp/hV6tGfCiFcQxja7SGFBgo
         B8aR5DAHIlLoDm/sqmCFXMvEpZOJPailALU+yRIMxBH5pLhY+AITAv4cuEbgFr/AVHny
         0Y7vjItHG77moARaXbz+sC5c7rNCC543gzYmOCZ9IThasw3McoIM7Jva4q58058yNwUa
         l7I46vGWUbHagla/n1U71OKXJ8S+8DRUjKct7kuHUormI2UfyPeXIHK7KJ1vSuYyfEwF
         RsOwcKj6VFhrfGjPTBgWz9L1KqjGwcSKL6QcCZORXk+5b0niJuckm3i3387LRcotpH+S
         gtEQ==
X-Gm-Message-State: AOAM5306oKZUHQ9iQPcThv8UNw8DnsggPsHT9DeNn968TSuJneA/f5K0
	CA0Xdn69/9w/R2ZdVqKBH7+nByEKZ8A=
X-Google-Smtp-Source: ABdhPJw2ifAR7DSZLguiPXnyZp8yv++vLnMUTvQrb/BVNSUqGf/wo3745go2b34BO/K/nQ8Edyg2zw==
X-Received: by 2002:a17:902:bd82:b029:129:2e87:9946 with SMTP id q2-20020a170902bd82b02901292e879946mr4127305pls.53.1626368447992;
        Thu, 15 Jul 2021 10:00:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:47 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 2/7] apache2: fix CVE-2020-13950 CVE-2020-35452 CVE-2021-26690 CVE-2021-26691 CVE-2021-30641
Date: Thu, 15 Jul 2021 10:00:37 -0700
Message-Id: <70b1aa0a4cd4bfd08b6c8d36a76f9b7cf20d61a6.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626359076.git.akuster808@gmail.com>
References: <cover.1626359076.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

CVE-2020-13950:
Apache HTTP Server versions 2.4.41 to 2.4.46 mod_proxy_http can be
made to crash (NULL pointer dereference) with specially crafted
requests using both Content-Length and Transfer-Encoding headers,
leading to a Denial of Service

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-13950

Upstream patches:
https://bugzilla.redhat.com/show_bug.cgi?id=1966738
https://github.com/apache/httpd/commit/8c162db8b65b2193e622b780e8c6516d4265f68b

CVE-2020-35452:
Apache HTTP Server versions 2.4.0 to 2.4.46 A specially
crafted Digest nonce can cause a stack overflow in
mod_auth_digest. There is no report of this overflow
being exploitable, nor the Apache HTTP Server team could
create one, though some particular compiler and/or
compilation option might make it possible, with limited
consequences anyway due to the size (a single byte) and
the value (zero byte) of the overflow

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-35452

Upstream patches:
https://security-tracker.debian.org/tracker/CVE-2020-35452
https://github.com/apache/httpd/commit/3b6431eb9c9dba603385f70a2131ab4a01bf0d3b

CVE-2021-26690:
Apache HTTP Server versions 2.4.0 to 2.4.46 A specially
crafted Cookie header handled by mod_session can cause
a NULL pointer dereference and crash, leading to a
possible Denial Of Service

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-26690

Upstream patches:
https://security-tracker.debian.org/tracker/CVE-2021-26690
https://github.com/apache/httpd/commit/67bd9bfe6c38831e14fe7122f1d84391472498f8

CVE-2021-26691:
In Apache HTTP Server versions 2.4.0 to 2.4.46 a
specially crafted SessionHeader sent by an origin server
could cause a heap overflow

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-26691

Upstream patches:
https://bugzilla.redhat.com/show_bug.cgi?id=1966732
https://github.com/apache/httpd/commit/7e09dd714fc62c08c5b0319ed7b9702594faf49b

CVE-2021-30641:
Apache HTTP Server versions 2.4.39 to 2.4.46 Unexpected
matching behavior with 'MergeSlashes OFF'

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-30641

Upstream patches:
https://httpd.apache.org/security/vulnerabilities_24.html#CVE-2021-30641
https://github.com/apache/httpd/commit/6141d5aa3f5cf8f1b89472e7fdb66578810d0ae3

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/apache2/CVE-2020-13950.patch      | 45 +++++++++++++
 .../apache2/apache2/CVE-2020-35452.patch      | 49 ++++++++++++++
 .../apache2/apache2/CVE-2021-26690.patch      | 39 +++++++++++
 .../apache2/apache2/CVE-2021-26691.patch      | 35 ++++++++++
 .../apache2/apache2/CVE-2021-30641.patch      | 66 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.46.bb   |  5 ++
 6 files changed, 239 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
new file mode 100644
index 0000000000..4eb6b85b1a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
@@ -0,0 +1,45 @@
+From 8c162db8b65b2193e622b780e8c6516d4265f68b Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Mon, 11 May 2015 15:48:58 +0000
+Subject: [PATCH] mod_proxy_http: follow up to r1656259. The proxy connection
+ may be NULL during prefetch, don't try to dereference it! Still
+ origin->keepalive will be set according to p_conn->close by the caller
+ (proxy_http_handler).
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1678771 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream-Status: Backport
+CVE: CVE-2020-35504
+
+Reference to upstream patch:
+https://bugzilla.redhat.com/show_bug.cgi?id=1966738
+https://github.com/apache/httpd/commit/8c162db8b65b2193e622b780e8c6516d4265f68b
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ modules/proxy/mod_proxy_http.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/modules/proxy/mod_proxy_http.c b/modules/proxy/mod_proxy_http.c
+index ec1e042..5f507d5 100644
+--- a/modules/proxy/mod_proxy_http.c
++++ b/modules/proxy/mod_proxy_http.c
+@@ -570,7 +570,6 @@ static int ap_proxy_http_prefetch(proxy_http_req_t *req,
+     apr_off_t bytes;
+     int force10, rv;
+     apr_read_type_e block;
+-    conn_rec *origin = p_conn->connection;
+ 
+     if (apr_table_get(r->subprocess_env, "force-proxy-request-1.0")) {
+         if (req->expecting_100) {
+@@ -630,7 +629,6 @@ static int ap_proxy_http_prefetch(proxy_http_req_t *req,
+                       "chunked body with Content-Length (C-L ignored)",
+                       c->client_ip, c->remote_host ? c->remote_host: "");
+         req->old_cl_val = NULL;
+-        origin->keepalive = AP_CONN_CLOSE;
+         p_conn->close = 1;
+     }
+ 
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
new file mode 100644
index 0000000000..001ca9252d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
@@ -0,0 +1,49 @@
+From 3b6431eb9c9dba603385f70a2131ab4a01bf0d3b Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Mon, 18 Jan 2021 17:39:12 +0000
+Subject: [PATCH] Merge r1885659 from trunk:
+
+mod_auth_digest: Fast validation of the nonce's base64 to fail early if
+                 the format can't match anyway.
+
+Submitted by: ylavic
+Reviewed by: ylavic, covener, jailletc36
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1885666 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream-Status: Backport
+CVE: CVE-2020-35452
+
+Reference to upstream patch:
+https://security-tracker.debian.org/tracker/CVE-2020-35452
+https://github.com/apache/httpd/commit/3b6431eb9c9dba603385f70a2131ab4a01bf0d3b
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ modules/aaa/mod_auth_digest.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/modules/aaa/mod_auth_digest.c b/modules/aaa/mod_auth_digest.c
+index b760941..0825b1b 100644
+--- a/modules/aaa/mod_auth_digest.c
++++ b/modules/aaa/mod_auth_digest.c
+@@ -1422,9 +1422,14 @@ static int check_nonce(request_rec *r, digest_header_rec *resp,
+     time_rec nonce_time;
+     char tmp, hash[NONCE_HASH_LEN+1];
+ 
+-    if (strlen(resp->nonce) != NONCE_LEN) {
++    /* Since the time part of the nonce is a base64 encoding of an
++     * apr_time_t (8 bytes), it should end with a '=', fail early otherwise.
++     */
++    if (strlen(resp->nonce) != NONCE_LEN
++            || resp->nonce[NONCE_TIME_LEN - 1] != '=') {
+         ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, r, APLOGNO(01775)
+-                      "invalid nonce %s received - length is not %d",
++                      "invalid nonce '%s' received - length is not %d "
++                      "or time encoding is incorrect",
+                       resp->nonce, NONCE_LEN);
+         note_digest_auth_failure(r, conf, resp, 1);
+         return HTTP_UNAUTHORIZED;
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
new file mode 100644
index 0000000000..d3aea9e122
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
@@ -0,0 +1,39 @@
+From 67bd9bfe6c38831e14fe7122f1d84391472498f8 Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Mon, 1 Mar 2021 20:07:08 +0000
+Subject: [PATCH] mod_session: save one apr_strtok() in
+ session_identity_decode().
+
+When the encoding is invalid (missing '='), no need to parse further.
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1887050 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream-Status: Backport
+CVE: CVE-2021-26690
+
+Reference to upstream patch:
+https://security-tracker.debian.org/tracker/CVE-2021-26690
+https://github.com/apache/httpd/commit/67bd9bfe6c38831e14fe7122f1d84391472498f8
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ modules/session/mod_session.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/session/mod_session.c b/modules/session/mod_session.c
+index ebd05b0..af70f6b 100644
+--- a/modules/session/mod_session.c
++++ b/modules/session/mod_session.c
+@@ -404,8 +404,8 @@ static apr_status_t session_identity_decode(request_rec * r, session_rec * z)
+         char *plast = NULL;
+         const char *psep = "=";
+         char *key = apr_strtok(pair, psep, &plast);
+-        char *val = apr_strtok(NULL, psep, &plast);
+         if (key && *key) {
++            char *val = apr_strtok(NULL, sep, &plast);
+             if (!val || !*val) {
+                 apr_table_unset(z->entries, key);
+             }
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
new file mode 100644
index 0000000000..f9cf868d01
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
@@ -0,0 +1,35 @@
+From 7e09dd714fc62c08c5b0319ed7b9702594faf49b Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Mon, 1 Mar 2021 20:13:54 +0000
+Subject: [PATCH] mod_session: account for the '&' in identity_concat().
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1887052 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream-Status: Backport
+CVE: CVE-2021-26691
+
+Reference to upstream patch:
+https://bugzilla.redhat.com/show_bug.cgi?id=1966732
+https://github.com/apache/httpd/commit/7e09dd714fc62c08c5b0319ed7b9702594faf49b
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ modules/session/mod_session.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/session/mod_session.c b/modules/session/mod_session.c
+index 7ee477c..ebd05b0 100644
+--- a/modules/session/mod_session.c
++++ b/modules/session/mod_session.c
+@@ -317,7 +317,7 @@ static apr_status_t ap_session_set(request_rec * r, session_rec * z,
+ static int identity_count(void *v, const char *key, const char *val)
+ {
+     int *count = v;
+-    *count += strlen(key) * 3 + strlen(val) * 3 + 1;
++    *count += strlen(key) * 3 + strlen(val) * 3 + 2;
+     return 1;
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
new file mode 100644
index 0000000000..7f74c85e33
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
@@ -0,0 +1,66 @@
+From 6141d5aa3f5cf8f1b89472e7fdb66578810d0ae3 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Wed, 21 Apr 2021 01:02:11 +0000
+Subject: [PATCH] legacy default slash-matching behavior w/ 'MergeSlashes OFF'
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1889036 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream-Status: Backport
+CVE: CVE-2021-30641
+
+Reference to upstream patch:
+https://httpd.apache.org/security/vulnerabilities_24.html#CVE-2021-30641
+https://github.com/apache/httpd/commit/6141d5aa3f5cf8f1b89472e7fdb66578810d0ae3
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ server/request.c | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/server/request.c b/server/request.c
+index d5c558a..18625af 100644
+--- a/server/request.c
++++ b/server/request.c
+@@ -1419,7 +1419,20 @@ AP_DECLARE(int) ap_location_walk(request_rec *r)
+ 
+     cache = prep_walk_cache(AP_NOTE_LOCATION_WALK, r);
+     cached = (cache->cached != NULL);
+-    entry_uri = r->uri;
++
++   /*
++    * When merge_slashes is set to AP_CORE_CONFIG_OFF the slashes in r->uri
++    * have not been merged. But for Location walks we always go with merged
++    * slashes no matter what merge_slashes is set to.
++    */
++    if (sconf->merge_slashes != AP_CORE_CONFIG_OFF) {
++        entry_uri = r->uri;
++    }
++    else {
++        char *uri = apr_pstrdup(r->pool, r->uri);
++        ap_no2slash(uri);
++        entry_uri = uri;
++    }
+ 
+     /* If we have an cache->cached location that matches r->uri,
+      * and the vhost's list of locations hasn't changed, we can skip
+@@ -1486,7 +1499,7 @@ AP_DECLARE(int) ap_location_walk(request_rec *r)
+                     pmatch = apr_palloc(rxpool, nmatch*sizeof(ap_regmatch_t));
+                 }
+ 
+-                if (ap_regexec(entry_core->r, entry_uri, nmatch, pmatch, 0)) {
++                if (ap_regexec(entry_core->r, r->uri, nmatch, pmatch, 0)) {
+                     continue;
+                 }
+ 
+@@ -1496,7 +1509,7 @@ AP_DECLARE(int) ap_location_walk(request_rec *r)
+                         apr_table_setn(r->subprocess_env,
+                                        ((const char **)entry_core->refs->elts)[i],
+                                        apr_pstrndup(r->pool,
+-                                       entry_uri + pmatch[i].rm_so,
++                                       r->uri + pmatch[i].rm_so,
+                                        pmatch[i].rm_eo - pmatch[i].rm_so));
+                     }
+                 }
+-- 
+2.7.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
index 197cb83e64..4fc1f16317 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
@@ -15,6 +15,11 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://apache-configure_perlbin.patch \
            file://0001-support-apxs.in-force-destdir-to-be-empty-string.patch \
+           file://CVE-2020-13950.patch \
+           file://CVE-2020-35452.patch \
+           file://CVE-2021-26690.patch \
+           file://CVE-2021-26691.patch \
+           file://CVE-2021-30641.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.25.1

