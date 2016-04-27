Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE4760232
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:01:14 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id y69so21887621pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=YxY4BgxILR70OcHJXm10LQNQql/ropfu+8vO/inR/1Y=;
	b=F9pxr0ixJssJdlgDkV/hnzGJmp3quT8TvqdnETsoO7SG2r0M6lkMQyUnokOvidcdHv
	yEtPI0h2XYooS9URoU083nwk6VK8ig6YLKH3vJnClRszL53JtjZjhalmL+Mv3CGw2fnU
	+ciQtjSfJ1kZiy5mZYn8HOG2vlFo10tYowqi6kAl1pSfFQEhanfvn48yywuO9VnraD8b
	sC3nh/Sao7ZfsiFac/1QI3/BfdEeKZdBMOVsYwvx5I9HrDpnFuaQbXpNc9C0Bt0zwxjV
	URAxi4Le9TfbXDrLlqHzAdmXipOY6e7o4AVCCahbzCUS1J6etbq4slJulaGb3jel2Anh
	La/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YxY4BgxILR70OcHJXm10LQNQql/ropfu+8vO/inR/1Y=;
	b=j2DGOTCiqPMufrfqOgugRBC3F2lvpEHq97fDt0Enw9t5UOXdoKu+EeA+oxoiUIpFmW
	Vjxz9r6XRmjbowKwTAM9M6Bg70w478Rg5Jk+hWAKkWmFiMgEYXloozNXrDPL/iRkrLtK
	B623SpjJxP1kWYiN0ULU5CgkpdRT/QAoLwNyOyEbtI01QhpHf1VTjDfTavU4NVWH+MSp
	U6ipG6IklqbpSqXM/uHE9tUcpveNQfjsDJ0zABXij8S3IEX2ogR1hqq7BNnuBf+T82eN
	gJKVZewWmH9bf5pZihnPcIWr48JZJ1eyIWYpuYKRw/Ob+1rTVcYgzWlsC6VlIjo6S1jj
	LDjg==
X-Gm-Message-State: AOPr4FWOeSyUWcr8EGAHDeJjKsQQd0k4Fj0svzWdvcgpf/PIlVhdWDY5dfwCGnIJF/2SCg==
X-Received: by 10.98.52.195 with SMTP id b186mr13096754pfa.9.1461772875495;
	Wed, 27 Apr 2016 09:01:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:c5c3:5d7a:4a1a:74b0?
	([2601:202:4000:1239:c5c3:5d7a:4a1a:74b0])
	by smtp.googlemail.com with ESMTPSA id
	l88sm7587413pfb.79.2016.04.27.09.01.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Apr 2016 09:01:13 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1461765477-16228-1-git-send-email-catalin.enache@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5720E248.2020004@gmail.com>
Date: Wed, 27 Apr 2016 09:01:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1461765477-16228-1-git-send-email-catalin.enache@windriver.com>
Subject: Re: [PATCH] proftpd: CVE-2016-3125
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2016 16:01:15 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

If I am not mistaken, this will apply to Krogoth, jethro and Fido.
- armin

On 04/27/2016 06:57 AM, Catalin Enache wrote:
> The mod_tls module in ProFTPD before 1.3.5b and 1.3.6 before
> 1.3.6rc2 does not properly handle the TLSDHParamFile directive,
> which might cause a weaker than intended Diffie-Hellman (DH) key
> to be used and consequently allow attackers to have unspecified
> impact via unknown vectors.
> 
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3125
> 
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>  .../proftpd/files/CVE-2016-3125.patch              | 247 +++++++++++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.5a.bb      |   1 +
>  2 files changed, 248 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
> 
> diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
> new file mode 100644
> index 0000000..69c9be0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
> @@ -0,0 +1,247 @@
> +From 7a8f683cedf9b0d1024a80362693c9f8b93a0f2b Mon Sep 17 00:00:00 2001
> +From: TJ Saunders <tj@castaglia.org>
> +Date: Thu, 10 Mar 2016 15:07:58 -0800
> +Subject: [PATCH] Backport of fix for Bug#4230 to 1.3.5 branch.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-3125
> +
> +Author: TJ Saunders <tj@castaglia.org>
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + contrib/mod_tls.c | 167 +++++++++++++++++++++++++++++++++++++++++++++++-------
> + 1 file changed, 147 insertions(+), 20 deletions(-)
> +
> +diff --git a/contrib/mod_tls.c b/contrib/mod_tls.c
> +index df92658..5883cc7 100644
> +--- a/contrib/mod_tls.c
> ++++ b/contrib/mod_tls.c
> +@@ -411,6 +411,13 @@ static int tls_required_on_ctrl = 0;
> + static int tls_required_on_data = 0;
> + static unsigned char *tls_authenticated = NULL;
> + 
> ++/* Define the minimum DH group length we allow (unless the AllowWeakDH
> ++ * TLSOption is used).  Ideally this would be 2048, per https://weakdh.org,
> ++ * but for compatibility with older Java versions, which only support up to
> ++ * 1024, we'll use 1024.  For now.
> ++ */
> ++#define TLS_DH_MIN_LEN				1024
> ++
> + /* mod_tls session flags */
> + #define	TLS_SESS_ON_CTRL			0x0001
> + #define TLS_SESS_ON_DATA			0x0002
> +@@ -438,6 +445,7 @@ static unsigned char *tls_authenticated = NULL;
> + #define TLS_OPT_USE_IMPLICIT_SSL			0x0200
> + #define TLS_OPT_ALLOW_CLIENT_RENEGOTIATIONS		0x0400
> + #define TLS_OPT_VERIFY_CERT_CN				0x0800
> ++#define TLS_OPT_ALLOW_WEAK_DH				0x1000
> + 
> + /* mod_tls SSCN modes */
> + #define TLS_SSCN_MODE_SERVER				0
> +@@ -2417,24 +2425,139 @@ static int tls_ctrl_renegotiate_cb(CALLBACK_FRAME) {
> + 
> + static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
> +   DH *dh = NULL;
> ++  EVP_PKEY *pkey;
> ++  int pkeylen = 0, use_pkeylen = FALSE;
> ++
> ++  /* OpenSSL will only ever call us (currently) with a keylen of 512 or 1024;
> ++   * see the SSL_EXPORT_PKEYLENGTH macro in ssl_locl.h.  Sigh.
> ++   *
> ++   * Thus we adjust the DH parameter length according to the size of the
> ++   * RSA/DSA private key used for the current connection.
> ++   *
> ++   * NOTE: This MAY cause interoperability issues with some clients, notably
> ++   * Java 7 (and earlier) clients, since Java 7 and earlier supports
> ++   * Diffie-Hellman only up to 1024 bits.  More sighs.  To deal with these
> ++   * clients, then, you need to configure a certificate/key of 1024 bits.
> ++   */
> ++  pkey = SSL_get_privatekey(ssl);
> ++  if (pkey != NULL) {
> ++    if (EVP_PKEY_type(pkey->type) == EVP_PKEY_RSA ||
> ++        EVP_PKEY_type(pkey->type) == EVP_PKEY_DSA) {
> ++      pkeylen = EVP_PKEY_bits(pkey);
> ++
> ++      if (pkeylen < TLS_DH_MIN_LEN) {
> ++        if (!(tls_opts & TLS_OPT_ALLOW_WEAK_DH)) {
> ++          pr_trace_msg(trace_channel, 11,
> ++            "certificate private key length %d less than %d bits, using %d "
> ++            "(see AllowWeakDH TLSOption)", pkeylen, TLS_DH_MIN_LEN,
> ++            TLS_DH_MIN_LEN);
> ++          pkeylen = TLS_DH_MIN_LEN;
> ++        }
> ++      }
> ++
> ++      if (pkeylen != keylen) {
> ++        pr_trace_msg(trace_channel, 13,
> ++          "adjusted DH parameter length from %d to %d bits", keylen, pkeylen);
> ++        use_pkeylen = TRUE;
> ++      }
> ++    }
> ++  }
> + 
> +   if (tls_tmp_dhs != NULL &&
> +       tls_tmp_dhs->nelts > 0) {
> +     register unsigned int i;
> +-    DH **dhs;
> ++    DH *best_dh = NULL, **dhs;
> ++    int best_dhlen = 0;
> + 
> +     dhs = tls_tmp_dhs->elts;
> ++
> ++    /* Search the configured list of DH parameters twice: once for any sizes
> ++     * matching the actual requested size (usually 1024), and once for any
> ++     * matching the certificate private key size (pkeylen).
> ++     *
> ++     * This behavior allows site admins to configure a TLSDHParamFile that
> ++     * contains 1024-bit parameters, for e.g. Java 7 (and earlier) clients.
> ++     */
> ++
> ++    /* Note: the keylen argument is in BITS, but DH_size() returns the number
> ++     * of BYTES.
> ++     */
> +     for (i = 0; i < tls_tmp_dhs->nelts; i++) {
> +-      /* Note: the keylength argument is in BITS, but DH_size() returns
> +-       * the number of BYTES.
> ++      int dhlen;
> ++
> ++      dhlen = DH_size(dhs[i]) * 8;
> ++      if (dhlen == keylen) {
> ++        pr_trace_msg(trace_channel, 11,
> ++          "found matching DH parameter for key length %d", keylen);
> ++        return dhs[i];
> ++      }
> ++
> ++      /* Try to find the next "best" DH to use, where "best" means
> ++       * the smallest DH that is larger than the necessary keylen.
> +        */
> +-      if (DH_size(dhs[i]) == (keylength / 8)) {
> ++      if (dhlen > keylen) {
> ++        if (best_dh != NULL) {
> ++          if (dhlen < best_dhlen) {
> ++            best_dh = dhs[i];
> ++            best_dhlen = dhlen;
> ++          }
> ++
> ++        } else {
> ++          best_dh = dhs[i];
> ++          best_dhlen = dhlen;
> ++        }
> ++      }
> ++    }
> ++
> ++    for (i = 0; i < tls_tmp_dhs->nelts; i++) {
> ++      int dhlen;
> ++
> ++      dhlen = DH_size(dhs[i]) * 8;
> ++      if (dhlen == pkeylen) {
> ++        pr_trace_msg(trace_channel, 11,
> ++          "found matching DH parameter for certificate private key length %d",
> ++          pkeylen);
> +         return dhs[i];
> +       }
> ++
> ++      if (dhlen > pkeylen) {
> ++        if (best_dh != NULL) {
> ++          if (dhlen < best_dhlen) {
> ++            best_dh = dhs[i];
> ++            best_dhlen = dhlen;
> ++          }
> ++
> ++        } else {
> ++          best_dh = dhs[i];
> ++          best_dhlen = dhlen;
> ++        }
> ++      }
> ++    }
> ++
> ++    if (best_dh != NULL) {
> ++      pr_trace_msg(trace_channel, 11,
> ++        "using best DH parameter for key length %d (length %d)", keylen,
> ++        best_dhlen);
> ++      return best_dh;
> +     }
> +   }
> + 
> +-  switch (keylength) {
> ++  /* Still no DH parameters found?  Use the built-in ones. */
> ++
> ++  if (keylen < TLS_DH_MIN_LEN) {
> ++    if (!(tls_opts & TLS_OPT_ALLOW_WEAK_DH)) {
> ++      pr_trace_msg(trace_channel, 11,
> ++        "requested key length %d less than %d bits, using %d "
> ++        "(see AllowWeakDH TLSOption)", keylen, TLS_DH_MIN_LEN, TLS_DH_MIN_LEN);
> ++      keylen = TLS_DH_MIN_LEN;
> ++    }
> ++  }
> ++
> ++  if (use_pkeylen) {
> ++    keylen = pkeylen;
> ++  }
> ++
> ++  switch (keylen) {
> +     case 512:
> +       dh = get_dh512();
> +       break;
> +@@ -2443,32 +2566,33 @@ static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
> +       dh = get_dh768();
> +       break;
> + 
> +-     case 1024:
> +-       dh = get_dh1024();
> +-       break;
> ++    case 1024:
> ++      dh = get_dh1024();
> ++      break;
> + 
> +-     case 1536:
> +-       dh = get_dh1536();
> +-       break;
> ++    case 1536:
> ++      dh = get_dh1536();
> ++      break;
> + 
> +-     case 2048:
> +-       dh = get_dh2048();
> +-       break;
> ++    case 2048:
> ++      dh = get_dh2048();
> ++      break;
> + 
> +-     default:
> +-       tls_log("unsupported DH key length %d requested, returning 1024 bits",
> +-         keylength);
> +-       dh = get_dh1024();
> +-       break;
> ++    default:
> ++      tls_log("unsupported DH key length %d requested, returning 1024 bits",
> ++        keylen);
> ++      dh = get_dh1024();
> ++      break;
> +   }
> + 
> ++  pr_trace_msg(trace_channel, 11, "using builtin DH for %d bits", keylen);
> ++
> +   /* Add this DH to the list, so that it can be freed properly later. */
> +   if (tls_tmp_dhs == NULL) {
> +     tls_tmp_dhs = make_array(session.pool, 1, sizeof(DH *));
> +   }
> + 
> +   *((DH **) push_array(tls_tmp_dhs)) = dh;
> +-
> +   return dh;
> + }
> + 
> +@@ -8445,6 +8569,9 @@ MODRET set_tlsoptions(cmd_rec *cmd) {
> +                strcmp(cmd->argv[i], "AllowClientRenegotiations") == 0) {
> +       opts |= TLS_OPT_ALLOW_CLIENT_RENEGOTIATIONS;
> + 
> ++    } else if (strcmp(cmd->argv[i], "AllowWeakDH") == 0) {
> ++      opts |= TLS_OPT_ALLOW_WEAK_DH;
> ++
> +     } else if (strcmp(cmd->argv[i], "EnableDiags") == 0) {
> +       opts |= TLS_OPT_ENABLE_DIAGS;
> + 
> +-- 
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
> index 8197ff8..cdf71e7 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
> @@ -12,6 +12,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
>             file://contrib.patch  \
>             file://build_fixup.patch \
>             file://proftpd.service \
> +           file://CVE-2016-3125.patch \
>             "
>  
>  SRC_URI[md5sum] = "b9d3092411478415b31d435f8e26d173"
> 

