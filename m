Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B48EA3C59
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129834.1775733754246481001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fH0Hpn4P;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso359122a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733753; x=1776338553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey6SSs+dx5KDutut6Dzgvfl1ss9qEGlGIhKKHHHTfig=;
        b=fH0Hpn4PAPjJYFbrhNYoMmIAe78DOY7tVtF2eAsh2FNcvK2BbbAuEI4HdS+0czfP+i
         izvlfvGF/q/Y1ScPkfFEP1v7l+trX0fbcIPPm6v5pYqPeSIyGcGm7KhaQ6/1Im8lHSH/
         QAm0g6rO4LPOCzbyCJDtFX2cE33eL0wxWRuMLpfbRBSBSTdFyDH8WWEBZxa1n7gDjjle
         Jv3V2juTDFaT7pOtJ9IkDtCp3y28w36KYT99ekttJ4VfszY2kiFQ1YvuYeDf4KonMNbD
         FGZQ+0LKsyW8JD9OgzCM8jrn97/5pi6zfcTEn0RfCUUzTL+LAJJOOPxUz7b8Xx0u21kF
         rZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733753; x=1776338553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ey6SSs+dx5KDutut6Dzgvfl1ss9qEGlGIhKKHHHTfig=;
        b=e8cJ+zvfXh5+j1lSNBsF8QTlQPZOQns6Gq/ZZgHgmlBlfOr4pcnWdA41wlIRdyeyGY
         YNf7qhf+HGw1aAgNY1lLNFo7p8lMuCa5U/15gQz44hXnE15MIR7mwCgdbNHYnYxEaZTo
         EzGc//XOlX4Pz/4SJoFgp2Y52b4pdzDJm9PmgxXnGKfjaRjl3XP8o3LqH8OJwgWZtorj
         /tehxp2orOSwkLFM8fOqjSSfpnvT2v8T2jjsm2MgLct6EgiR23ULb2q/T52Bv+GJscKd
         XfOt65wSZZivLvYkj23yw16psaYgZjjnw9uPUWlsKpvLFkJr1LJcm6b5S7l9gotzxLKV
         HNyA==
X-Gm-Message-State: AOJu0Yz8MCvGivOg3MdUhTaC2W1KlZIq5EUTs8UGReMMlrHBCJzl/ZVM
	R17hbewWp+ggc5ugzjDkpWyc2KdtEpacDKqXBQG6sLO7eNSuHy9QxjY6Du2t1OQD
X-Gm-Gg: AeBDieu0SuprpwA0SuKlI/0GVknAenBexC4O9Gomb1r3TfBIPvt3xSK6oMxS36URmQn
	f8tE4qFOu5WdDAwBwGFnM/HglX0B0eqyIP8zfJEpM5C2d4Rz04U1Jt4sJUx6K+oMm3F1Q+vRaJo
	qRqfnZ1x3cRuONFjhw0Ha2owY5jPss1T+tl0wfJwlypRa8jKr9sWARLP3ohunNpqGxT+z9GmB4f
	NDyzfnkQUk0XYcouRYhVbhTXlV6IZMg92xR5fFtfcSm+89qCI9gSx88yXiyF27mYZjhEhA46KRQ
	rtW+BdzmzkDZxq2nQ3jikqeL8HiA4deNlSkNQardtoo+pNcAQMS7em/PFZDweIoe7938vv5lMWI
	nt1HlFeaERtRhvD3wxgE6WgHn7wbvrZK8QJF0A5bpupOy/eMdDQ/ismGpPrq/dF9VKZB9WaddWA
	NEx8+X87wWuLiklhPXORPJCNmiW4JT8FVBEJA=
X-Received: by 2002:a05:6a21:3399:b0:398:c351:aa0e with SMTP id adf61e73a8af0-39fc81c29dcmr3800880637.25.1775733753411;
        Thu, 09 Apr 2026 04:22:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 6/8] nginx: fix CVE-2026-27654
Date: Thu,  9 Apr 2026 23:22:06 +1200
Message-ID: <20260409112208.1119823-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126193

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As per the advisory[1] mentioned in NVD[2], version 1.28.3 contains the fix.
Backport the commit[3] from 1.28.3 changelog matching the description.

[1] https://my.f5.com/manage/s/article/K000160382
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-27654
[3] https://github.com/nginx/nginx/commit/a1d18284e0a173c4ef2b28425535d0f640ae0a82

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-27654.patch   | 81 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
new file mode 100644
index 0000000000..b85c6621e9
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
@@ -0,0 +1,81 @@
+From be39034fa93a4d44b52de9b7a463754eda56e712 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Mon, 16 Mar 2026 20:13:03 +0400
+Subject: [PATCH] Dav: destination length validation for COPY and MOVE.
+
+Previously, when alias was used in a location with Dav COPY or MOVE
+enabled, and the destination URI was shorter than the alias, integer
+underflow could happen in ngx_http_map_uri_to_path(), which could
+result in heap buffer overwrite, followed by a possible segfault.
+With some implementations of memcpy(), the segfault could be avoided
+and the overwrite could result in a change of the source or destination
+file names to be outside of the location root.
+
+Reported by Calif.io in collaboration with Claude and Anthropic Research.
+
+(cherry picked from commit a1d18284e0a173c4ef2b28425535d0f640ae0a82)
+
+CVE: CVE-2026-27654
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a1d18284e0a173c4ef2b28425535d0f640ae0a82]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/http/modules/ngx_http_dav_module.c | 39 +++++++++++++++++---------
+ 1 file changed, 26 insertions(+), 13 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_dav_module.c b/src/http/modules/ngx_http_dav_module.c
+index cfb98929e..4619b139a 100644
+--- a/src/http/modules/ngx_http_dav_module.c
++++ b/src/http/modules/ngx_http_dav_module.c
+@@ -535,19 +535,20 @@ ngx_http_dav_mkcol_handler(ngx_http_request_t *r, ngx_http_dav_loc_conf_t *dlcf)
+ static ngx_int_t
+ ngx_http_dav_copy_move_handler(ngx_http_request_t *r)
+ {
+-    u_char                   *p, *host, *last, ch;
+-    size_t                    len, root;
+-    ngx_err_t                 err;
+-    ngx_int_t                 rc, depth;
+-    ngx_uint_t                overwrite, slash, dir, flags;
+-    ngx_str_t                 path, uri, duri, args;
+-    ngx_tree_ctx_t            tree;
+-    ngx_copy_file_t           cf;
+-    ngx_file_info_t           fi;
+-    ngx_table_elt_t          *dest, *over;
+-    ngx_ext_rename_file_t     ext;
+-    ngx_http_dav_copy_ctx_t   copy;
+-    ngx_http_dav_loc_conf_t  *dlcf;
++    u_char                    *p, *host, *last, ch;
++    size_t                     len, root;
++    ngx_err_t                  err;
++    ngx_int_t                  rc, depth;
++    ngx_uint_t                 overwrite, slash, dir, flags;
++    ngx_str_t                  path, uri, duri, args;
++    ngx_tree_ctx_t             tree;
++    ngx_copy_file_t            cf;
++    ngx_file_info_t            fi;
++    ngx_table_elt_t           *dest, *over;
++    ngx_ext_rename_file_t      ext;
++    ngx_http_dav_copy_ctx_t    copy;
++    ngx_http_dav_loc_conf_t   *dlcf;
++    ngx_http_core_loc_conf_t  *clcf;
+ 
+     if (r->headers_in.content_length_n > 0 || r->headers_in.chunked) {
+         ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
+@@ -644,6 +645,18 @@ destination_done:
+         return NGX_HTTP_CONFLICT;
+     }
+ 
++    clcf = ngx_http_get_module_loc_conf(r, ngx_http_core_module);
++
++    if (clcf->alias
++        && clcf->alias != NGX_MAX_SIZE_T_VALUE
++        && duri.len < clcf->alias)
++    {
++        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                      "client sent invalid \"Destination\" header: \"%V\"",
++                      &dest->value);
++        return NGX_HTTP_BAD_REQUEST;
++    }
++
+     depth = ngx_http_dav_depth(r, NGX_HTTP_DAV_INFINITY_DEPTH);
+ 
+     if (depth != NGX_HTTP_DAV_INFINITY_DEPTH) {
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index d99dd873c6..b1f4f8d009 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
 SRC_URI:append = " file://CVE-2023-44487.patch \
                    file://CVE-2026-27651.patch \
+                   file://CVE-2026-27654.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"

