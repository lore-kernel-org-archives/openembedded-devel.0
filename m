Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF7AC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 16:25:26 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.12478.1676132721439946997
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 08:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IQxdT1un;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-16346330067so10471286fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K1nYxxn+fzNfT2laMO9R4ZEMOXW9V5fxw2LDWit9MHI=;
        b=IQxdT1unwfpPWjlPQxHdZtduFnOf0fp/S1rszoZfS4tUoawWbwZVJVxJkez8OPlDIR
         uoNg1I3z+Vef+sWAQq+MRPoccaiM6NKATK78Fujv2ClSKR6NnsVZ7Z4WxXYHwQj84AHl
         GvPrFLqUk/dLbWr4YEfmvATIIVraMImRvRhJGAxNJ9pV1q5eLQfYGAjUWhwJdxEkSFiA
         ugWPrewNlMkkB5dS1gayV5yVmyrApDfmMBJVh7cFYrQgs33It7cVfhBBfde+P93YSUCf
         n+9Cz1pl+0gjo7n+r86Fh7BdDA9mmfF89msvuDeBwOVqsEw21P/XXODk3VmAgoFBtGp3
         UarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1nYxxn+fzNfT2laMO9R4ZEMOXW9V5fxw2LDWit9MHI=;
        b=fAicY5DGGCpf4pVrHHNhBhoZNnMWV6j1ap/apHNKNvmpfolO7fqbIYjdhMo1xCjigY
         kMtARRUPhx9ZbNLT2EfA4T/7ZK/M2XoL2nQc+fR4h3k8QvyjbflHf0JgpO7MyVQ2y6Zr
         eq2ZSOfedMxlYw44jhaRI8/YBbFTvb2VmxhT2BXMgCT989tf+/Mn7FtBAfB4vwiATnfN
         0Cb0tTsHrf9aoEqZCJjL0jtny5V5TJho/WwVO22pHfWShVi9vSEcn7kIPIU3wy6b3peW
         I0Bp5lgCrN00ENe4bgn4nQuC201IEAchJdg/mfgOZ+yf6VKV7IfS2+Uj/uA3Y0FHEyFD
         0n/g==
X-Gm-Message-State: AO0yUKU4iM705BQgzmmStznycrhaY+oEtZeU3TBuZ4/b/5LPIDpNFHzT
	0mZ30N0v43GUkl9G/EWmHjZiD7P7diA=
X-Google-Smtp-Source: AK7set9KntLf5+UoB1Uk7tOY+AFjurdHjBVPvBfVmvT9YTnmna4aGELsZuStIvc5w3qj27UdjTOoCg==
X-Received: by 2002:a05:6870:7093:b0:163:7d08:849d with SMTP id v19-20020a056870709300b001637d08849dmr13510876oae.31.1676132720678;
        Sat, 11 Feb 2023 08:25:20 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:6c32:d739:9179:1de7? ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id p1-20020a056870a54100b0015f83e16a10sm3067386oal.44.2023.02.11.08.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 08:25:20 -0800 (PST)
Message-ID: <368acc53-4684-356e-4620-141b8b8893f8@gmail.com>
Date: Sat, 11 Feb 2023 11:25:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-webserver][kirkstone][PATCH] httpd: CVE-2022-37436
 mod_proxy: HTTP response splitting
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20230210043508.6793-1-hprajapati@mvista.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230210043508.6793-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 16:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101034



On 2/9/23 11:35 PM, Hitendra Prajapati wrote:
> Upstream-Status: Backport from https://github.com/apache/httpd/commit/8b6d55f6a047acf62675e32606b037f5eea8ccc7
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../apache2/apache2/CVE-2022-37436.patch      | 138 ++++++++++++++++++
>   .../recipes-httpd/apache2/apache2_2.4.54.bb   |   1 +

Thanks for the patch but I am going with the update to 2.4.55 which 
includes this fix.

-armin
>   2 files changed, 139 insertions(+)
>   create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch
> new file mode 100644
> index 0000000000..62a6a3844e
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/CVE-2022-37436.patch
> @@ -0,0 +1,138 @@
> +From 8b6d55f6a047acf62675e32606b037f5eea8ccc7 Mon Sep 17 00:00:00 2001
> +From: Eric Covener <covener@apache.org>
> +Date: Tue, 10 Jan 2023 13:20:09 +0000
> +Subject: [PATCH] CVE-2022-37436
> +
> +SECURITY: CVE-2022-37436 (cve.mitre.org)
> +
> +Prior to Apache HTTP Server 2.4.55, a malicious backend can
> +cause the response headers to be truncated early, resulting in
> +some headers being incorporated into the response body. If the
> +later headers have any security purpose, they will not be
> +interpreted by the client.
> +
> +git-svn-id: git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x@1906541 13f79535-47bb-0310-9956-ffa450edef68
> +
> +Upstream-Status: Backport [https://github.com/apache/httpd/commit/8b6d55f6a047acf62675e32606b037f5eea8ccc7]
> +CVE: CVE-2022-37436
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + modules/proxy/mod_proxy_http.c | 46 ++++++++++++++++++++--------------
> + server/protocol.c              |  2 ++
> + 2 files changed, 29 insertions(+), 19 deletions(-)
> +
> +diff --git a/modules/proxy/mod_proxy_http.c b/modules/proxy/mod_proxy_http.c
> +index d74ae05..04dd221 100644
> +--- a/modules/proxy/mod_proxy_http.c
> ++++ b/modules/proxy/mod_proxy_http.c
> +@@ -788,7 +788,7 @@ static void process_proxy_header(request_rec *r, proxy_dir_conf *c,
> +  * any sense at all, since we depend on buffer still containing
> +  * what was read by ap_getline() upon return.
> +  */
> +-static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
> ++static apr_status_t ap_proxy_read_headers(request_rec *r, request_rec *rr,
> +                                   char *buffer, int size,
> +                                   conn_rec *c, int *pread_len)
> + {
> +@@ -820,19 +820,26 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
> +         rc = ap_proxygetline(tmp_bb, buffer, size, rr,
> +                              AP_GETLINE_FOLD | AP_GETLINE_NOSPC_EOL, &len);
> +
> +-        if (len <= 0)
> +-            break;
> +
> +-        if (APR_STATUS_IS_ENOSPC(rc)) {
> +-            /* The header could not fit in the provided buffer, warn.
> +-             * XXX: falls through with the truncated header, 5xx instead?
> +-             */
> +-            int trunc = (len > 128 ? 128 : len) / 2;
> +-            ap_log_rerror(APLOG_MARK, APLOG_WARNING, rc, r, APLOGNO(10124)
> +-                    "header size is over the limit allowed by "
> +-                    "ResponseFieldSize (%d bytes). "
> +-                    "Bad response header: '%.*s[...]%s'",
> +-                    size, trunc, buffer, buffer + len - trunc);
> ++        if (rc != APR_SUCCESS) {
> ++            if (APR_STATUS_IS_ENOSPC(rc)) {
> ++                int trunc = (len > 128 ? 128 : len) / 2;
> ++                ap_log_rerror(APLOG_MARK, APLOG_WARNING, rc, r, APLOGNO(10124)
> ++                        "header size is over the limit allowed by "
> ++                        "ResponseFieldSize (%d bytes). "
> ++                        "Bad response header: '%.*s[...]%s'",
> ++                        size, trunc, buffer, buffer + len - trunc);
> ++            }
> ++            else {
> ++                ap_log_rerror(APLOG_MARK, APLOG_WARNING, rc, r, APLOGNO(10404)
> ++                              "Error reading headers from backend");
> ++            }
> ++            r->headers_out = NULL;
> ++            return rc;
> ++        }
> ++
> ++        if (len <= 0) {
> ++            break;
> +         }
> +         else {
> +             ap_log_rerror(APLOG_MARK, APLOG_TRACE4, 0, r, "%s", buffer);
> +@@ -855,7 +862,7 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
> +                 if (psc->badopt == bad_error) {
> +                     /* Nope, it wasn't even an extra HTTP header. Give up. */
> +                     r->headers_out = NULL;
> +-                    return;
> ++                    return APR_EINVAL;
> +                 }
> +                 else if (psc->badopt == bad_body) {
> +                     /* if we've already started loading headers_out, then
> +@@ -869,13 +876,13 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
> +                                       "in headers returned by %s (%s)",
> +                                       r->uri, r->method);
> +                         *pread_len = len;
> +-                        return;
> ++                        return APR_SUCCESS;
> +                     }
> +                     else {
> +                         ap_log_rerror(APLOG_MARK, APLOG_WARNING, 0, r, APLOGNO(01099)
> +                                       "No HTTP headers returned by %s (%s)",
> +                                       r->uri, r->method);
> +-                        return;
> ++                        return APR_SUCCESS;
> +                     }
> +                 }
> +             }
> +@@ -905,6 +912,7 @@ static void ap_proxy_read_headers(request_rec *r, request_rec *rr,
> +         process_proxy_header(r, dconf, buffer, value);
> +         saw_headers = 1;
> +     }
> ++    return APR_SUCCESS;
> + }
> +
> +
> +@@ -1218,10 +1226,10 @@ int ap_proxy_http_process_response(proxy_http_req_t *req)
> +                          "Set-Cookie", NULL);
> +
> +             /* shove the headers direct into r->headers_out */
> +-            ap_proxy_read_headers(r, backend->r, buffer, response_field_size,
> +-                                  origin, &pread_len);
> ++            rc = ap_proxy_read_headers(r, backend->r, buffer, response_field_size,
> ++                                       origin, &pread_len);
> +
> +-            if (r->headers_out == NULL) {
> ++            if (rc != APR_SUCCESS || r->headers_out == NULL) {
> +                 ap_log_rerror(APLOG_MARK, APLOG_WARNING, 0, r, APLOGNO(01106)
> +                               "bad HTTP/%d.%d header returned by %s (%s)",
> +                               major, minor, r->uri, r->method);
> +diff --git a/server/protocol.c b/server/protocol.c
> +index 7adc7f7..6f9540a 100644
> +--- a/server/protocol.c
> ++++ b/server/protocol.c
> +@@ -508,6 +508,8 @@ cleanup:
> +         /* PR#43039: We shouldn't accept NULL bytes within the line */
> +         bytes_handled = strlen(*s);
> +         if (bytes_handled < *read) {
> ++            ap_log_data(APLOG_MARK, APLOG_DEBUG, ap_server_conf,
> ++                        "NULL bytes in header", *s, *read, 0);
> +             *read = bytes_handled;
> +             if (rv == APR_SUCCESS) {
> +                 rv = APR_EINVAL;
> +--
> +2.25.1
> +
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
> index 37d498f52e..429b1e5dd0 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
> @@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
>              file://0008-Fix-perl-install-directory-to-usr-bin.patch \
>              file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
>              file://0001-make_exports.awk-not-expose-the-path.patch \
> +           file://CVE-2022-37436.patch \
>             "
>   
>   SRC_URI:append:class-target = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101015): https://lists.openembedded.org/g/openembedded-devel/message/101015
> Mute This Topic: https://lists.openembedded.org/mt/96870415/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


