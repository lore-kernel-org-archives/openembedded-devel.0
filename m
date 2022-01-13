Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AD7C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 08:02:10 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.6191.1642060929878735458
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 20D828T2010691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 00:02:08 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 13 Jan 2022 00:02:08 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 00:02:07 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 13 Jan 2022 00:02:07 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-webserver][PATCH] apache2: fix
 CVE-2021-44790,CVE-2021-44224
Date: Thu, 13 Jan 2022 16:02:06 +0800
Message-ID: <20220113080206.25750-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 08:02:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94800

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../apache2/apache2/CVE-2021-44224-1.patch    | 282 ++++++++++++++++++
 .../apache2/apache2/CVE-2021-44224-2.patch    | 110 +++++++
 .../apache2/apache2/CVE-2021-44790.patch      |  32 ++
 .../recipes-httpd/apache2/apache2_2.4.51.bb   |   3 +
 4 files changed, 427 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-1.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-2.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44790.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-1.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-1.patch
new file mode 100644
index 000000000..90efafb6a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-1.patch
@@ -0,0 +1,282 @@
+From 14e54221476e45a6a63c7c656bf967f1fe810b3f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 13 Jan 2022 14:37:50 +0800
+Subject: [PATCH] Merge r1895914, r1895921 from trunk:
+
+  *) http: Enforce that fully qualified uri-paths not to be forward-proxied
+     have an http(s) scheme, and that the ones to be forward proxied have a
+     hostname, per HTTP specifications.
+     trunk patch: http://svn.apache.org/r1895914
+                  http://svn.apache.org/r1895921
+     2.4.x patch: https://patch-diff.githubusercontent.com/raw/apache/httpd/pull/286.patch
+     backport PR: https://github.com/apache/httpd/pull/286
+     +1: ylavic, minfrin, gbechis
+
+mod_proxy: Detect unix: scheme syntax errors at load time.
+
+* modules/proxy/mod_proxy.c(add_pass, add_member, set_proxy_param,
+                            proxysection):
+  Check return value of ap_proxy_de_socketfy().
+
+* modules/proxy/proxy_util.c(ap_proxy_get_worker_ex):
+  Check return value of ap_proxy_de_socketfy().
+
+http: Enforce that fully qualified uri-paths not to be forward-proxied
+      have an http(s) scheme, and that the ones to be forward proxied have a
+      hostname, per HTTP specifications.
+
+The early checks avoid failing the request later on and thus save cycles
+for those invalid cases.
+
+Submitted by: ylavic
+Reviewed by: ylavic, minfrin, gbechis
+Closes #286
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1895955 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2021-44224
+Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1895955]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ include/ap_mmn.h            |  2 +-
+ include/http_protocol.h     |  7 ++++++
+ modules/http/http_request.c |  2 +-
+ modules/http2/h2_request.c  |  4 ++--
+ modules/proxy/mod_proxy.c   | 45 ++++++++++++++++++++++++++-----------
+ modules/proxy/proxy_util.c  |  3 +++
+ server/protocol.c           | 23 ++++++++++++++++++-
+ 7 files changed, 68 insertions(+), 18 deletions(-)
+
+diff --git a/include/ap_mmn.h b/include/ap_mmn.h
+index 942e6d4..f2eee7a 100644
+--- a/include/ap_mmn.h
++++ b/include/ap_mmn.h
+@@ -589,7 +589,7 @@
+ #ifndef MODULE_MAGIC_NUMBER_MAJOR
+ #define MODULE_MAGIC_NUMBER_MAJOR 20120211
+ #endif
+-#define MODULE_MAGIC_NUMBER_MINOR 118                 /* 0...n */
++#define MODULE_MAGIC_NUMBER_MINOR 119                 /* 0...n */
+ 
+ /**
+  * Determine if the server's current MODULE_MAGIC_NUMBER is at least a
+diff --git a/include/http_protocol.h b/include/http_protocol.h
+index 9ccac89..20bd202 100644
+--- a/include/http_protocol.h
++++ b/include/http_protocol.h
+@@ -96,6 +96,13 @@ AP_DECLARE(void) ap_get_mime_headers(request_rec *r);
+ AP_DECLARE(void) ap_get_mime_headers_core(request_rec *r,
+                                           apr_bucket_brigade *bb);
+ 
++/**
++ * Run post_read_request hook and validate.
++ * @param r The current request
++ * @return OK or HTTP_...
++ */
++AP_DECLARE(int) ap_post_read_request(request_rec *r);
++
+ /* Finish up stuff after a request */
+ 
+ /**
+diff --git a/modules/http/http_request.c b/modules/http/http_request.c
+index c9ae5af..d59cfe2 100644
+--- a/modules/http/http_request.c
++++ b/modules/http/http_request.c
+@@ -680,7 +680,7 @@ static request_rec *internal_internal_redirect(const char *new_uri,
+      * to do their thing on internal redirects as well.  Perhaps this is a
+      * misnamed function.
+      */
+-    if ((access_status = ap_run_post_read_request(new))) {
++    if ((access_status = ap_post_read_request(new))) {
+         ap_die(access_status, new);
+         return NULL;
+     }
+diff --git a/modules/http2/h2_request.c b/modules/http2/h2_request.c
+index 7c4fb95..900f050 100644
+--- a/modules/http2/h2_request.c
++++ b/modules/http2/h2_request.c
+@@ -369,8 +369,8 @@ request_rec *h2_request_create_rec(const h2_request *req, conn_rec *c)
+      */
+     ap_add_input_filter_handle(ap_http_input_filter_handle,
+                                NULL, r, r->connection);
+-    
+-    if ((access_status = ap_run_post_read_request(r))) {
++   
++    if ((access_status = ap_post_read_request(r))) { 
+         /* Request check post hooks failed. An example of this would be a
+          * request for a vhost where h2 is disabled --> 421.
+          */
+diff --git a/modules/proxy/mod_proxy.c b/modules/proxy/mod_proxy.c
+index 3fb84c8..b3aafcc 100644
+--- a/modules/proxy/mod_proxy.c
++++ b/modules/proxy/mod_proxy.c
+@@ -775,13 +775,13 @@ static int proxy_detect(request_rec *r)
+ 
+     /* Ick... msvc (perhaps others) promotes ternary short results to int */
+ 
+-    if (conf->req && r->parsed_uri.scheme) {
++    if (conf->req && r->parsed_uri.scheme && r->parsed_uri.hostname) {
+         /* but it might be something vhosted */
+-        if (!(r->parsed_uri.hostname
+-              && !ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_scheme(r))
+-              && ap_matches_request_vhost(r, r->parsed_uri.hostname,
+-                                          (apr_port_t)(r->parsed_uri.port_str ? r->parsed_uri.port
+-                                                       : ap_default_port(r))))) {
++        if (ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_scheme(r)) != 0
++            || !ap_matches_request_vhost(r, r->parsed_uri.hostname,
++                                         (apr_port_t)(r->parsed_uri.port_str
++                                                      ? r->parsed_uri.port
++                                                      : ap_default_port(r)))) {
+             r->proxyreq = PROXYREQ_PROXY;
+             r->uri = r->unparsed_uri;
+             r->filename = apr_pstrcat(r->pool, "proxy:", r->uri, NULL);
+@@ -2007,6 +2007,7 @@ static const char *
+     struct proxy_alias *new;
+     char *f = cmd->path;
+     char *r = NULL;
++    const char *real;
+     char *word;
+     apr_table_t *params = apr_table_make(cmd->pool, 5);
+     const apr_array_header_t *arr;
+@@ -2094,6 +2095,10 @@ static const char *
+         return "ProxyPass|ProxyPassMatch needs a path when not defined in a location";
+     }
+ 
++    if (!(real = ap_proxy_de_socketfy(cmd->temp_pool, r))) {
++        return "ProxyPass|ProxyPassMatch uses an invalid \"unix:\" URL";
++    }
++
+     /* if per directory, save away the single alias */
+     if (cmd->path) {
+         dconf->alias = apr_pcalloc(cmd->pool, sizeof(struct proxy_alias));
+@@ -2109,7 +2114,7 @@ static const char *
+     }
+ 
+     new->fake = apr_pstrdup(cmd->pool, f);
+-    new->real = apr_pstrdup(cmd->pool, ap_proxy_de_socketfy(cmd->pool, r));
++    new->real = apr_pstrdup(cmd->pool, real);
+     new->flags = flags;
+     if (worker_type & AP_PROXY_WORKER_IS_MATCH) {
+         new->regex = ap_pregcomp(cmd->pool, f, AP_REG_EXTENDED);
+@@ -2635,6 +2640,7 @@ static const char *add_member(cmd_parms *cmd, void *dummy, const char *arg)
+     proxy_worker *worker;
+     char *path = cmd->path;
+     char *name = NULL;
++    const char *real;
+     char *word;
+     apr_table_t *params = apr_table_make(cmd->pool, 5);
+     const apr_array_header_t *arr;
+@@ -2676,6 +2682,10 @@ static const char *add_member(cmd_parms *cmd, void *dummy, const char *arg)
+     if (!name)
+         return "BalancerMember must define remote proxy server";
+ 
++    if (!(real = ap_proxy_de_socketfy(cmd->temp_pool, name))) {
++        return "BalancerMember uses an invalid \"unix:\" URL";
++    }
++
+     ap_str_tolower(path);   /* lowercase scheme://hostname */
+ 
+     /* Try to find the balancer */
+@@ -2687,8 +2697,7 @@ static const char *add_member(cmd_parms *cmd, void *dummy, const char *arg)
+     }
+ 
+     /* Try to find existing worker */
+-    worker = ap_proxy_get_worker(cmd->temp_pool, balancer, conf,
+-                                 ap_proxy_de_socketfy(cmd->temp_pool, name));
++    worker = ap_proxy_get_worker(cmd->temp_pool, balancer, conf, real);
+     if (!worker) {
+         ap_log_error(APLOG_MARK, APLOG_DEBUG, 0, cmd->server, APLOGNO(01147)
+                      "Defining worker '%s' for balancer '%s'",
+@@ -2785,9 +2794,14 @@ static const char *
+         }
+     }
+     else {
++        const char *real;
++
++        if (!(real = ap_proxy_de_socketfy(cmd->temp_pool, name))) {
++            return "ProxySet uses an invalid \"unix:\" URL";
++        }
++
+         worker = ap_proxy_get_worker_ex(cmd->temp_pool, NULL, conf,
+-                                        ap_proxy_de_socketfy(cmd->temp_pool, name),
+-                                        worker_type);
++                                        real, worker_type);
+         if (!worker) {
+             if (in_proxy_section) {
+                 err = ap_proxy_define_worker_ex(cmd->pool, &worker, NULL,
+@@ -2930,9 +2944,14 @@ static const char *proxysection(cmd_parms *cmd, void *mconfig, const char *arg)
+             }
+         }
+         else {
++            const char *real;
++
++            if (!(real = ap_proxy_de_socketfy(cmd->temp_pool, conf->p))) {
++                return "<Proxy/ProxyMatch > uses an invalid \"unix:\" URL";
++            }
++
+             worker = ap_proxy_get_worker_ex(cmd->temp_pool, NULL, sconf,
+-                                            ap_proxy_de_socketfy(cmd->temp_pool, conf->p),
+-                                            worker_type);
++                                           real, worker_type);
+             if (!worker) {
+                 err = ap_proxy_define_worker_ex(cmd->pool, &worker, NULL, sconf,
+                                                 conf->p, worker_type);
+diff --git a/modules/proxy/proxy_util.c b/modules/proxy/proxy_util.c
+index f291a0d..3511688 100644
+--- a/modules/proxy/proxy_util.c
++++ b/modules/proxy/proxy_util.c
+@@ -1742,6 +1742,9 @@ PROXY_DECLARE(proxy_worker *) ap_proxy_get_worker_ex(apr_pool_t *p,
+     }
+ 
+     url = ap_proxy_de_socketfy(p, url);
++    if (!url) {
++        return NULL;
++    }
+ 
+     c = ap_strchr_c(url, ':');
+     if (c == NULL || c[1] != '/' || c[2] != '/' || c[3] == '\0') {
+diff --git a/server/protocol.c b/server/protocol.c
+index 3d74c5b..2214f72 100644
+--- a/server/protocol.c
++++ b/server/protocol.c
+@@ -1548,7 +1548,7 @@ request_rec *ap_read_request(conn_rec *conn)
+     /* we may have switched to another server */
+     apply_server_config(r);
+ 
+-    if ((access_status = ap_run_post_read_request(r))) {
++    if ((access_status = ap_post_read_request(r))) {
+         goto die;
+     }
+ 
+@@ -1603,6 +1603,27 @@ ignore:
+     return NULL;
+ }
+ 
++AP_DECLARE(int) ap_post_read_request(request_rec *r)
++{
++    int status;
++
++    if ((status = ap_run_post_read_request(r))) {
++        return status;
++    }
++
++    /* Enforce http(s) only scheme for non-forward-proxy requests */
++    if (!r->proxyreq
++            && r->parsed_uri.scheme
++            && (ap_cstr_casecmpn(r->parsed_uri.scheme, "http", 4) != 0
++                || (r->parsed_uri.scheme[4] != '\0'
++                    && (apr_tolower(r->parsed_uri.scheme[4]) != 's'
++                        || r->parsed_uri.scheme[5] != '\0')))) {
++        return HTTP_BAD_REQUEST;
++    }
++
++    return OK;
++}
++
+ /* if a request with a body creates a subrequest, remove original request's
+  * input headers which pertain to the body which has already been read.
+  * out-of-line helper function for ap_set_sub_req_protocol.
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-2.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-2.patch
new file mode 100644
index 000000000..b464a452b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44224-2.patch
@@ -0,0 +1,110 @@
+From 994610ea76b6e1b3f198101af31564e6c4e8fc0f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 13 Jan 2022 14:47:56 +0800
+Subject: [PATCH] Merge of r1895981,r1895986 from trunk:
+
+  *) mod_proxy: Don't prevent forwarding URIs w/ no hostname.
+                (fix for r1895955 already in 2.4.x)
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1896044 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2021-44224
+Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1896044]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ modules/proxy/mod_proxy.c  |  5 +++--
+ modules/proxy/mod_proxy.h  |  1 +
+ modules/proxy/proxy_util.c | 22 ++++++++++++----------
+ 3 files changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/modules/proxy/mod_proxy.c b/modules/proxy/mod_proxy.c
+index b3aafcc..a28bea4 100644
+--- a/modules/proxy/mod_proxy.c
++++ b/modules/proxy/mod_proxy.c
+@@ -775,9 +775,10 @@ static int proxy_detect(request_rec *r)
+ 
+     /* Ick... msvc (perhaps others) promotes ternary short results to int */
+ 
+-    if (conf->req && r->parsed_uri.scheme && r->parsed_uri.hostname) {
++    if (conf->req && r->parsed_uri.scheme) {
+         /* but it might be something vhosted */
+-        if (ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_scheme(r)) != 0
++        if (!r->parsed_uri.hostname
++            || ap_cstr_casecmp(r->parsed_uri.scheme, ap_http_scheme(r)) != 0
+             || !ap_matches_request_vhost(r, r->parsed_uri.hostname,
+                                          (apr_port_t)(r->parsed_uri.port_str
+                                                       ? r->parsed_uri.port
+diff --git a/modules/proxy/mod_proxy.h b/modules/proxy/mod_proxy.h
+index 1219e9f..47899d7 100644
+--- a/modules/proxy/mod_proxy.h
++++ b/modules/proxy/mod_proxy.h
+@@ -750,6 +750,7 @@ PROXY_DECLARE(int) ap_proxy_worker_can_upgrade(apr_pool_t *p,
+ #define AP_PROXY_WORKER_IS_PREFIX   (1u << 0)
+ #define AP_PROXY_WORKER_IS_MATCH    (1u << 1)
+ #define AP_PROXY_WORKER_IS_MALLOCED (1u << 2)
++#define AP_PROXY_WORKER_NO_UDS      (1u << 3)
+ 
+ /**
+  * Get the worker from proxy configuration, looking for either PREFIXED or
+diff --git a/modules/proxy/proxy_util.c b/modules/proxy/proxy_util.c
+index 3511688..d578452 100644
+--- a/modules/proxy/proxy_util.c
++++ b/modules/proxy/proxy_util.c
+@@ -1741,9 +1741,11 @@ PROXY_DECLARE(proxy_worker *) ap_proxy_get_worker_ex(apr_pool_t *p,
+         return NULL;
+     }
+ 
+-    url = ap_proxy_de_socketfy(p, url);
+-    if (!url) {
+-        return NULL;
++    if (!(mask & AP_PROXY_WORKER_NO_UDS)) {
++        url = ap_proxy_de_socketfy(p, url);
++        if (!url) {
++            return NULL;
++        }
+     }
+ 
+     c = ap_strchr_c(url, ':');
+@@ -2326,22 +2328,22 @@ PROXY_DECLARE(int) ap_proxy_pre_request(proxy_worker **worker,
+ 
+     access_status = proxy_run_pre_request(worker, balancer, r, conf, url);
+     if (access_status == DECLINED && *balancer == NULL) {
+-        *worker = ap_proxy_get_worker(r->pool, NULL, conf, *url);
++        const int forward = (r->proxyreq == PROXYREQ_PROXY);
++        *worker = ap_proxy_get_worker_ex(r->pool, NULL, conf, *url,
++                                         forward ? AP_PROXY_WORKER_NO_UDS : 0);
+         if (*worker) {
+             ap_log_rerror(APLOG_MARK, APLOG_TRACE2, 0, r,
+                           "%s: found worker %s for %s",
+                           (*worker)->s->scheme, (*worker)->s->name, *url);
+-            *balancer = NULL;
+-            if (!fix_uds_filename(r, url)) {
++            if (!forward && !fix_uds_filename(r, url)) {
+                 return HTTP_INTERNAL_SERVER_ERROR;
+             }
+             access_status = OK;
+         }
+-        else if (r->proxyreq == PROXYREQ_PROXY) {
++        else if (forward) {
+             if (conf->forward) {
+                 ap_log_rerror(APLOG_MARK, APLOG_TRACE2, 0, r,
+                               "*: found forward proxy worker for %s", *url);
+-                *balancer = NULL;
+                 *worker = conf->forward;
+                 access_status = OK;
+                 /*
+@@ -2355,8 +2357,8 @@ PROXY_DECLARE(int) ap_proxy_pre_request(proxy_worker **worker,
+         else if (r->proxyreq == PROXYREQ_REVERSE) {
+             if (conf->reverse) {
+                 ap_log_rerror(APLOG_MARK, APLOG_TRACE2, 0, r,
+-                              "*: using default reverse proxy worker for %s (no keepalive)", *url);
+-                *balancer = NULL;
++                              "*: using default reverse proxy worker for %s "
++                              "(no keepalive)", *url);
+                 *worker = conf->reverse;
+                 access_status = OK;
+                 /*
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44790.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44790.patch
new file mode 100644
index 000000000..4bef9519c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-44790.patch
@@ -0,0 +1,32 @@
+From 7e17af6bc469e9cdded01a3f076043892d9d9a58 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 13 Jan 2022 13:50:20 +0800
+Subject: [PATCH] Merge r1895970 from trunk:
+
+  *) mod_lua: Improve error handling
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1896039 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2021-44790
+Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1896039]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ modules/lua/lua_request.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/modules/lua/lua_request.c b/modules/lua/lua_request.c
+index 67ff432..493b2bb 100644
+--- a/modules/lua/lua_request.c
++++ b/modules/lua/lua_request.c
+@@ -410,6 +410,7 @@ static int req_parsebody(lua_State *L)
+             if (end == NULL) break;
+             key = (char *) apr_pcalloc(r->pool, 256);
+             filename = (char *) apr_pcalloc(r->pool, 256);
++            if (end - crlf <= 8) break;
+             vlen = end - crlf - 8;
+             buffer = (char *) apr_pcalloc(r->pool, vlen+1);
+             memcpy(buffer, crlf + 4, vlen);
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
index d6e736d31..233543af8 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
@@ -15,6 +15,9 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://apache-configure_perlbin.patch \
            file://0001-support-apxs.in-force-destdir-to-be-empty-string.patch \
+           file://CVE-2021-44790.patch \
+           file://CVE-2021-44224-1.patch \
+           file://CVE-2021-44224-2.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.17.1


