Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 854A56B7A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 19:08:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1RJ816m007668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Feb 2014 11:08:01 -0800 (PST)
Received: from [128.224.147.243] (128.224.147.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 27 Feb 2014 11:08:01 -0800
Message-ID: <530F8D10.3020302@windriver.com>
Date: Thu, 27 Feb 2014 14:08:00 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <cover.1393470790.git.hongxu.jia@windriver.com>
	<a72ac6d3c23badba74f4a042cb5d17b24cfc7549.1393470790.git.hongxu.jia@windriver.com>
In-Reply-To: <a72ac6d3c23badba74f4a042cb5d17b24cfc7549.1393470790.git.hongxu.jia@windriver.com>
X-Originating-IP: [128.224.147.243]
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 4/4][meta-webserver] apache2-2.4.7: added support for TLS Next Protocol Negotiation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 19:08:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-02-26 10:22 PM, Hongxu Jia wrote:
> The previous npn support patch (httpd-2.4.4-r1332643.patch) worked on
> apache2-2.4.6 and conflicted with apache2-2.4.7, this patch fixed the
> confliction with 2.4.7.

Hongxu,

Thanks, that's a good step. Even better would be to add the
apache module that supports SPDY and confirm that it works
with your desktop (google-chrome) browser.

See:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-January/093772.html

and

https://code.google.com/p/mod-spdy/wiki/GettingStarted

It doesn't seem to be a huge task but let us know what you find out.

../Randy

>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../apache2/apache2/npn-patch-2.4.7.patch          | 289 +++++++++++++++++++++
>   .../recipes-httpd/apache2/apache2_2.4.7.bb         |   1 +
>   2 files changed, 290 insertions(+)
>   create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/npn-patch-2.4.7.patch
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/npn-patch-2.4.7.patch b/meta-webserver/recipes-httpd/apache2/apache2/npn-patch-2.4.7.patch
> new file mode 100644
> index 0000000..a4f1855
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/npn-patch-2.4.7.patch
> @@ -0,0 +1,289 @@
> +Add support for TLS Next Protocol Negotiation:
> +
> +* modules/ssl/mod_ssl.c, modules/ssl/mod_ssl.h: Add and implement new
> +  hooks for next protocol advertisement/discovery.
> +
> +* modules/ssl/ssl_engine_init.c (ssl_init_ctx_callbacks): Enable
> +  NPN advertisement callback in handshake.
> +
> +* modules/ssl/ssl_engine_io.c (ssl_io_filter_input): Invoke
> +  next-protocol discovery hook.
> +
> +* modules/ssl/ssl_engine_kernel.c (ssl_callback_AdvertiseNextProtos):
> +  New callback.
> +
> +* modules/ssl/ssl_private.h: Add prototype.
> +
> +Submitted by: Matthew Steele <mdsteele google.com>
> +  with slight tweaks by jorton
> +
> +http://svn.apache.org/viewvc?view=revision&revision=1332643
> +https://bugzilla.redhat.com//show_bug.cgi?id=809599
> +Upstream-Status: Backport
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + CHANGES                         |  2 +
> + modules/ssl/mod_ssl.c           | 12 ++++++
> + modules/ssl/mod_ssl.h           | 21 +++++++++++
> + modules/ssl/ssl_engine_init.c   |  5 +++
> + modules/ssl/ssl_engine_io.c     | 24 ++++++++++++
> + modules/ssl/ssl_engine_kernel.c | 82 +++++++++++++++++++++++++++++++++++++++++
> + modules/ssl/ssl_private.h       |  6 +++
> + 7 files changed, 152 insertions(+)
> +
> +diff --git a/CHANGES b/CHANGES
> +--- a/CHANGES
> ++++ b/CHANGES
> +@@ -1,6 +1,8 @@
> +                                                          -*- coding: utf-8 -*-
> +
> + Changes with Apache 2.4.7
> ++  *) mod_ssl: Add support for TLS Next Protocol Negotiation.  PR 52210.
> ++     [Matthew Steele <mdsteele google.com>]
> +
> +   *) APR 1.5.0 or later is now required for the event MPM.
> +
> +diff --git a/modules/ssl/mod_ssl.c b/modules/ssl/mod_ssl.c
> +--- a/modules/ssl/mod_ssl.c
> ++++ b/modules/ssl/mod_ssl.c
> +@@ -275,6 +275,18 @@ static const command_rec ssl_config_cmds[] = {
> +     AP_END_CMD
> + };
> +
> ++/* Implement 'modssl_run_npn_advertise_protos_hook'. */
> ++APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
> ++    modssl, AP, int, npn_advertise_protos_hook,
> ++    (conn_rec *connection, apr_array_header_t *protos),
> ++    (connection, protos), OK, DECLINED);
> ++
> ++/* Implement 'modssl_run_npn_proto_negotiated_hook'. */
> ++APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
> ++    modssl, AP, int, npn_proto_negotiated_hook,
> ++    (conn_rec *connection, const char *proto_name, apr_size_t proto_name_len),
> ++    (connection, proto_name, proto_name_len), OK, DECLINED);
> ++
> + /*
> +  *  the various processing hooks
> +  */
> +diff --git a/modules/ssl/mod_ssl.h b/modules/ssl/mod_ssl.h
> +--- a/modules/ssl/mod_ssl.h
> ++++ b/modules/ssl/mod_ssl.h
> +@@ -63,5 +63,26 @@ APR_DECLARE_OPTIONAL_FN(int, ssl_proxy_enable, (conn_rec *));
> +
> + APR_DECLARE_OPTIONAL_FN(int, ssl_engine_disable, (conn_rec *));
> +
> ++/** The npn_advertise_protos optional hook allows other modules to add entries
> ++ * to the list of protocol names advertised by the server during the Next
> ++ * Protocol Negotiation (NPN) portion of the SSL handshake.  The hook callee is
> ++ * given the connection and an APR array; it should push one or more char*'s
> ++ * pointing to null-terminated strings (such as "http/1.1" or "spdy/2") onto
> ++ * the array and return OK, or do nothing and return DECLINED. */
> ++APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_advertise_protos_hook,
> ++                          (conn_rec *connection, apr_array_header_t *protos));
> ++
> ++/** The npn_proto_negotiated optional hook allows other modules to discover the
> ++ * name of the protocol that was chosen during the Next Protocol Negotiation
> ++ * (NPN) portion of the SSL handshake.  Note that this may be the empty string
> ++ * (in which case modules should probably assume HTTP), or it may be a protocol
> ++ * that was never even advertised by the server.  The hook callee is given the
> ++ * connection, a non-null-terminated string containing the protocol name, and
> ++ * the length of the string; it should do something appropriate (i.e. insert or
> ++ * remove filters) and return OK, or do nothing and return DECLINED. */
> ++APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_proto_negotiated_hook,
> ++                          (conn_rec *connection, const char *proto_name,
> ++                           apr_size_t proto_name_len));
> ++
> + #endif /* __MOD_SSL_H__ */
> + /** @} */
> +diff --git a/modules/ssl/ssl_engine_init.c b/modules/ssl/ssl_engine_init.c
> +--- a/modules/ssl/ssl_engine_init.c
> ++++ b/modules/ssl/ssl_engine_init.c
> +@@ -546,6 +546,11 @@ static void ssl_init_ctx_callbacks(server_rec *s,
> +     SSL_CTX_set_tmp_dh_callback(ctx,  ssl_callback_TmpDH);
> +
> +     SSL_CTX_set_info_callback(ctx, ssl_callback_Info);
> ++
> ++#ifdef HAVE_TLS_NPN
> ++    SSL_CTX_set_next_protos_advertised_cb(
> ++        ctx, ssl_callback_AdvertiseNextProtos, NULL);
> ++#endif
> + }
> +
> + static void ssl_init_ctx_verify(server_rec *s,
> +diff --git a/modules/ssl/ssl_engine_io.c b/modules/ssl/ssl_engine_io.c
> +--- a/modules/ssl/ssl_engine_io.c
> ++++ b/modules/ssl/ssl_engine_io.c
> +@@ -28,6 +28,7 @@
> +                                   core keeps dumping.''
> +                                             -- Unknown    */
> + #include "ssl_private.h"
> ++#include "mod_ssl.h"
> + #include "apr_date.h"
> +
> + /*  _________________________________________________________________
> +@@ -297,6 +298,7 @@ typedef struct {
> +     apr_pool_t *pool;
> +     char buffer[AP_IOBUFSIZE];
> +     ssl_filter_ctx_t *filter_ctx;
> ++    int npn_finished;  /* 1 if NPN has finished, 0 otherwise */
> + } bio_filter_in_ctx_t;
> +
> + /*
> +@@ -1412,6 +1414,27 @@ static apr_status_t ssl_io_filter_input(ap_filter_t *f,
> +         APR_BRIGADE_INSERT_TAIL(bb, bucket);
> +     }
> +
> ++#ifdef HAVE_TLS_NPN
> ++    /* By this point, Next Protocol Negotiation (NPN) should be completed (if
> ++     * our version of OpenSSL supports it).  If we haven't already, find out
> ++     * which protocol was decided upon and inform other modules by calling
> ++     * npn_proto_negotiated_hook. */
> ++    if (!inctx->npn_finished) {
> ++        const unsigned char *next_proto = NULL;
> ++        unsigned next_proto_len = 0;
> ++
> ++        SSL_get0_next_proto_negotiated(
> ++            inctx->ssl, &next_proto, &next_proto_len);
> ++        ap_log_cerror(APLOG_MARK, APLOG_DEBUG, APR_SUCCESS, f->c,
> ++                      "SSL NPN negotiated protocol: '%s'",
> ++                      apr_pstrmemdup(f->c->pool, (const char*)next_proto,
> ++                                     next_proto_len));
> ++        modssl_run_npn_proto_negotiated_hook(
> ++            f->c, (const char*)next_proto, next_proto_len);
> ++        inctx->npn_finished = 1;
> ++    }
> ++#endif
> ++
> +     return APR_SUCCESS;
> + }
> +
> +@@ -1893,6 +1916,7 @@ static void ssl_io_input_add_filter(ssl_filter_ctx_t *filter_ctx, conn_rec *c,
> +     inctx->block = APR_BLOCK_READ;
> +     inctx->pool = c->pool;
> +     inctx->filter_ctx = filter_ctx;
> ++    inctx->npn_finished = 0;
> + }
> +
> + /* The request_rec pointer is passed in here only to ensure that the
> +diff --git a/modules/ssl/ssl_engine_kernel.c b/modules/ssl/ssl_engine_kernel.c
> +--- a/modules/ssl/ssl_engine_kernel.c
> ++++ b/modules/ssl/ssl_engine_kernel.c
> +@@ -29,6 +29,7 @@
> +                                   time I was too famous.''
> +                                             -- Unknown                */
> + #include "ssl_private.h"
> ++#include "mod_ssl.h"
> + #include "util_md5.h"
> +
> + static void ssl_configure_env(request_rec *r, SSLConnRec *sslconn);
> +@@ -2139,3 +2140,84 @@ int ssl_callback_SRPServerParams(SSL *ssl, int *ad, void *arg)
> + }
> +
> + #endif /* HAVE_SRP */
> ++
> ++#ifdef HAVE_TLS_NPN
> ++/*
> ++ * This callback function is executed when SSL needs to decide what protocols
> ++ * to advertise during Next Protocol Negotiation (NPN).  It must produce a
> ++ * string in wire format -- a sequence of length-prefixed strings -- indicating
> ++ * the advertised protocols.  Refer to SSL_CTX_set_next_protos_advertised_cb
> ++ * in OpenSSL for reference.
> ++ */
> ++int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **data_out,
> ++                                     unsigned int *size_out, void *arg)
> ++{
> ++    conn_rec *c = (conn_rec*)SSL_get_app_data(ssl);
> ++    apr_array_header_t *protos;
> ++    int num_protos;
> ++    unsigned int size;
> ++    int i;
> ++    unsigned char *data;
> ++    unsigned char *start;
> ++
> ++    *data_out = NULL;
> ++    *size_out = 0;
> ++
> ++    /* If the connection object is not available, then there's nothing for us
> ++     * to do. */
> ++    if (c == NULL) {
> ++        return SSL_TLSEXT_ERR_OK;
> ++    }
> ++
> ++    /* Invoke our npn_advertise_protos hook, giving other modules a chance to
> ++     * add alternate protocol names to advertise. */
> ++    protos = apr_array_make(c->pool, 0, sizeof(char*));
> ++    modssl_run_npn_advertise_protos_hook(c, protos);
> ++    num_protos = protos->nelts;
> ++
> ++    /* We now have a list of null-terminated strings; we need to concatenate
> ++     * them together into a single string, where each protocol name is prefixed
> ++     * by its length.  First, calculate how long that string will be. */
> ++    size = 0;
> ++    for (i = 0; i < num_protos; ++i) {
> ++        const char *string = APR_ARRAY_IDX(protos, i, const char*);
> ++        unsigned int length = strlen(string);
> ++        /* If the protocol name is too long (the length must fit in one byte),
> ++         * then log an error and skip it. */
> ++        if (length > 255) {
> ++            ap_log_cerror(APLOG_MARK, APLOG_ERR, 0, c,
> ++                          "SSL NPN protocol name too long (length=%u): %s",
> ++                          length, string);
> ++            continue;
> ++        }
> ++        /* Leave room for the length prefix (one byte) plus the protocol name
> ++         * itself. */
> ++        size += 1 + length;
> ++    }
> ++
> ++    /* If there is nothing to advertise (either because no modules added
> ++     * anything to the protos array, or because all strings added to the array
> ++     * were skipped), then we're done. */
> ++    if (size == 0) {
> ++        return SSL_TLSEXT_ERR_OK;
> ++    }
> ++
> ++    /* Now we can build the string.  Copy each protocol name string into the
> ++     * larger string, prefixed by its length. */
> ++    data = apr_palloc(c->pool, size * sizeof(unsigned char));
> ++    start = data;
> ++    for (i = 0; i < num_protos; ++i) {
> ++        const char *string = APR_ARRAY_IDX(protos, i, const char*);
> ++        apr_size_t length = strlen(string);
> ++        *start = (unsigned char)length;
> ++        ++start;
> ++        memcpy(start, string, length * sizeof(unsigned char));
> ++        start += length;
> ++    }
> ++
> ++    /* Success. */
> ++    *data_out = data;
> ++    *size_out = size;
> ++    return SSL_TLSEXT_ERR_OK;
> ++}
> ++#endif /* HAVE_TLS_NPN */
> +diff --git a/modules/ssl/ssl_private.h b/modules/ssl/ssl_private.h
> +--- a/modules/ssl/ssl_private.h
> ++++ b/modules/ssl/ssl_private.h
> +@@ -123,6 +123,11 @@
> + #define MODSSL_SSL_METHOD_CONST
> + #endif
> +
> ++#if OPENSSL_VERSION_NUMBER >= 0x10001000L && !defined(OPENSSL_NO_NEXTPROTONEG) \
> ++    && !defined(OPENSSL_NO_TLSEXT)
> ++#define HAVE_TLS_NPN
> ++#endif
> ++
> + #if defined(OPENSSL_FIPS)
> + #define HAVE_FIPS
> + #endif
> +@@ -800,6 +805,7 @@ int          ssl_callback_ServerNameIndication(SSL *, int *, modssl_ctx_t *);
> + int         ssl_callback_SessionTicket(SSL *, unsigned char *, unsigned char *,
> +                                        EVP_CIPHER_CTX *, HMAC_CTX *, int);
> + #endif
> ++int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **data, unsigned int *len, void *arg);
> +
> + /**  Session Cache Support  */
> + void         ssl_scache_init(server_rec *, apr_pool_t *);
> +--
> +1.8.1.2
> +
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
> index f23776f..3c038a9 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
> @@ -15,6 +15,7 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>              file://replace-lynx-to-curl-in-apachectl-script.patch \
>              file://apache-ssl-ltmain-rpath.patch \
>              file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
> +           file://npn-patch-2.4.7.patch \
>              file://init \
>              file://apache2-volatile.conf"
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

