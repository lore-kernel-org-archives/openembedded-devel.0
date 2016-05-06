Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 92AA673CF7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:15 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id j68so47125186qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=tOvgxAm7JLq1frg5UvcQBYEBwZDSowM9PSYQ/pPf3vk=;
	b=kfehTBN22wJUTDSXYK+FXQs7xYIlIa1QBHMthMfDJXsti9oMjsfNtpUvr3Rbuc1cq/
	q1JooNgqsIeWtUGGVrIJUqkW1b9cSmdT5A4UByRY/bVVkbHdf+BGwuAeLwkQwQlMiQ3+
	SJVI8z+zABnJaseDUi3SeSkidwmPFr/3ZQFksMDVI8Qga1tr8SIxU02XdK3/6zYz1WFI
	jjR9K3OTzR52XYNSZl2zNxL2BhAsOyxL3EJVstdHZUbx65D+Cgcr3Kp7QWiR9dgAVpOL
	pqJgD0EZ+H/6M25EBKVtec9+wvDlaolANP+eqUfvCIE7GsXorxazXzpUCBBuoDlx2IUu
	ye5Q==
X-Gm-Message-State: AOPr4FWFJC2BxRW0Ps3cCaQS83AsHY/gYCRlkBW24XA/vj+0ZcNXAXQA2mfSFFVgS420Gw==
X-Received: by 10.55.114.71 with SMTP id n68mr21337845qkc.37.1462543276046;
	Fri, 06 May 2016 07:01:16 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 66sm4681605qhi.39.2016.05.06.07.01.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:14 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:10 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:40 -0300
Message-Id: <1462543259-7206-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 03/22] proftpd: CVE-2016-3125
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
X-List-Received-Date: Fri, 06 May 2016 14:01:15 -0000

From: Catalin Enache <catalin.enache@windriver.com>

The mod_tls module in ProFTPD before 1.3.5b and 1.3.6 before
1.3.6rc2 does not properly handle the TLSDHParamFile directive,
which might cause a weaker than intended Diffie-Hellman (DH) key
to be used and consequently allow attackers to have unspecified
impact via unknown vectors.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3125

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../proftpd/files/CVE-2016-3125.patch              | 247 +++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.5a.bb      |   1 +
 2 files changed, 248 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
new file mode 100644
index 0000000..69c9be0
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
@@ -0,0 +1,247 @@
+From 7a8f683cedf9b0d1024a80362693c9f8b93a0f2b Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Thu, 10 Mar 2016 15:07:58 -0800
+Subject: [PATCH] Backport of fix for Bug#4230 to 1.3.5 branch.
+
+Upstream-Status: Backport
+CVE: CVE-2016-3125
+
+Author: TJ Saunders <tj@castaglia.org>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ contrib/mod_tls.c | 167 +++++++++++++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 147 insertions(+), 20 deletions(-)
+
+diff --git a/contrib/mod_tls.c b/contrib/mod_tls.c
+index df92658..5883cc7 100644
+--- a/contrib/mod_tls.c
++++ b/contrib/mod_tls.c
+@@ -411,6 +411,13 @@ static int tls_required_on_ctrl = 0;
+ static int tls_required_on_data = 0;
+ static unsigned char *tls_authenticated = NULL;
+ 
++/* Define the minimum DH group length we allow (unless the AllowWeakDH
++ * TLSOption is used).  Ideally this would be 2048, per https://weakdh.org,
++ * but for compatibility with older Java versions, which only support up to
++ * 1024, we'll use 1024.  For now.
++ */
++#define TLS_DH_MIN_LEN				1024
++
+ /* mod_tls session flags */
+ #define	TLS_SESS_ON_CTRL			0x0001
+ #define TLS_SESS_ON_DATA			0x0002
+@@ -438,6 +445,7 @@ static unsigned char *tls_authenticated = NULL;
+ #define TLS_OPT_USE_IMPLICIT_SSL			0x0200
+ #define TLS_OPT_ALLOW_CLIENT_RENEGOTIATIONS		0x0400
+ #define TLS_OPT_VERIFY_CERT_CN				0x0800
++#define TLS_OPT_ALLOW_WEAK_DH				0x1000
+ 
+ /* mod_tls SSCN modes */
+ #define TLS_SSCN_MODE_SERVER				0
+@@ -2417,24 +2425,139 @@ static int tls_ctrl_renegotiate_cb(CALLBACK_FRAME) {
+ 
+ static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
+   DH *dh = NULL;
++  EVP_PKEY *pkey;
++  int pkeylen = 0, use_pkeylen = FALSE;
++
++  /* OpenSSL will only ever call us (currently) with a keylen of 512 or 1024;
++   * see the SSL_EXPORT_PKEYLENGTH macro in ssl_locl.h.  Sigh.
++   *
++   * Thus we adjust the DH parameter length according to the size of the
++   * RSA/DSA private key used for the current connection.
++   *
++   * NOTE: This MAY cause interoperability issues with some clients, notably
++   * Java 7 (and earlier) clients, since Java 7 and earlier supports
++   * Diffie-Hellman only up to 1024 bits.  More sighs.  To deal with these
++   * clients, then, you need to configure a certificate/key of 1024 bits.
++   */
++  pkey = SSL_get_privatekey(ssl);
++  if (pkey != NULL) {
++    if (EVP_PKEY_type(pkey->type) == EVP_PKEY_RSA ||
++        EVP_PKEY_type(pkey->type) == EVP_PKEY_DSA) {
++      pkeylen = EVP_PKEY_bits(pkey);
++
++      if (pkeylen < TLS_DH_MIN_LEN) {
++        if (!(tls_opts & TLS_OPT_ALLOW_WEAK_DH)) {
++          pr_trace_msg(trace_channel, 11,
++            "certificate private key length %d less than %d bits, using %d "
++            "(see AllowWeakDH TLSOption)", pkeylen, TLS_DH_MIN_LEN,
++            TLS_DH_MIN_LEN);
++          pkeylen = TLS_DH_MIN_LEN;
++        }
++      }
++
++      if (pkeylen != keylen) {
++        pr_trace_msg(trace_channel, 13,
++          "adjusted DH parameter length from %d to %d bits", keylen, pkeylen);
++        use_pkeylen = TRUE;
++      }
++    }
++  }
+ 
+   if (tls_tmp_dhs != NULL &&
+       tls_tmp_dhs->nelts > 0) {
+     register unsigned int i;
+-    DH **dhs;
++    DH *best_dh = NULL, **dhs;
++    int best_dhlen = 0;
+ 
+     dhs = tls_tmp_dhs->elts;
++
++    /* Search the configured list of DH parameters twice: once for any sizes
++     * matching the actual requested size (usually 1024), and once for any
++     * matching the certificate private key size (pkeylen).
++     *
++     * This behavior allows site admins to configure a TLSDHParamFile that
++     * contains 1024-bit parameters, for e.g. Java 7 (and earlier) clients.
++     */
++
++    /* Note: the keylen argument is in BITS, but DH_size() returns the number
++     * of BYTES.
++     */
+     for (i = 0; i < tls_tmp_dhs->nelts; i++) {
+-      /* Note: the keylength argument is in BITS, but DH_size() returns
+-       * the number of BYTES.
++      int dhlen;
++
++      dhlen = DH_size(dhs[i]) * 8;
++      if (dhlen == keylen) {
++        pr_trace_msg(trace_channel, 11,
++          "found matching DH parameter for key length %d", keylen);
++        return dhs[i];
++      }
++
++      /* Try to find the next "best" DH to use, where "best" means
++       * the smallest DH that is larger than the necessary keylen.
+        */
+-      if (DH_size(dhs[i]) == (keylength / 8)) {
++      if (dhlen > keylen) {
++        if (best_dh != NULL) {
++          if (dhlen < best_dhlen) {
++            best_dh = dhs[i];
++            best_dhlen = dhlen;
++          }
++
++        } else {
++          best_dh = dhs[i];
++          best_dhlen = dhlen;
++        }
++      }
++    }
++
++    for (i = 0; i < tls_tmp_dhs->nelts; i++) {
++      int dhlen;
++
++      dhlen = DH_size(dhs[i]) * 8;
++      if (dhlen == pkeylen) {
++        pr_trace_msg(trace_channel, 11,
++          "found matching DH parameter for certificate private key length %d",
++          pkeylen);
+         return dhs[i];
+       }
++
++      if (dhlen > pkeylen) {
++        if (best_dh != NULL) {
++          if (dhlen < best_dhlen) {
++            best_dh = dhs[i];
++            best_dhlen = dhlen;
++          }
++
++        } else {
++          best_dh = dhs[i];
++          best_dhlen = dhlen;
++        }
++      }
++    }
++
++    if (best_dh != NULL) {
++      pr_trace_msg(trace_channel, 11,
++        "using best DH parameter for key length %d (length %d)", keylen,
++        best_dhlen);
++      return best_dh;
+     }
+   }
+ 
+-  switch (keylength) {
++  /* Still no DH parameters found?  Use the built-in ones. */
++
++  if (keylen < TLS_DH_MIN_LEN) {
++    if (!(tls_opts & TLS_OPT_ALLOW_WEAK_DH)) {
++      pr_trace_msg(trace_channel, 11,
++        "requested key length %d less than %d bits, using %d "
++        "(see AllowWeakDH TLSOption)", keylen, TLS_DH_MIN_LEN, TLS_DH_MIN_LEN);
++      keylen = TLS_DH_MIN_LEN;
++    }
++  }
++
++  if (use_pkeylen) {
++    keylen = pkeylen;
++  }
++
++  switch (keylen) {
+     case 512:
+       dh = get_dh512();
+       break;
+@@ -2443,32 +2566,33 @@ static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
+       dh = get_dh768();
+       break;
+ 
+-     case 1024:
+-       dh = get_dh1024();
+-       break;
++    case 1024:
++      dh = get_dh1024();
++      break;
+ 
+-     case 1536:
+-       dh = get_dh1536();
+-       break;
++    case 1536:
++      dh = get_dh1536();
++      break;
+ 
+-     case 2048:
+-       dh = get_dh2048();
+-       break;
++    case 2048:
++      dh = get_dh2048();
++      break;
+ 
+-     default:
+-       tls_log("unsupported DH key length %d requested, returning 1024 bits",
+-         keylength);
+-       dh = get_dh1024();
+-       break;
++    default:
++      tls_log("unsupported DH key length %d requested, returning 1024 bits",
++        keylen);
++      dh = get_dh1024();
++      break;
+   }
+ 
++  pr_trace_msg(trace_channel, 11, "using builtin DH for %d bits", keylen);
++
+   /* Add this DH to the list, so that it can be freed properly later. */
+   if (tls_tmp_dhs == NULL) {
+     tls_tmp_dhs = make_array(session.pool, 1, sizeof(DH *));
+   }
+ 
+   *((DH **) push_array(tls_tmp_dhs)) = dh;
+-
+   return dh;
+ }
+ 
+@@ -8445,6 +8569,9 @@ MODRET set_tlsoptions(cmd_rec *cmd) {
+                strcmp(cmd->argv[i], "AllowClientRenegotiations") == 0) {
+       opts |= TLS_OPT_ALLOW_CLIENT_RENEGOTIATIONS;
+ 
++    } else if (strcmp(cmd->argv[i], "AllowWeakDH") == 0) {
++      opts |= TLS_OPT_ALLOW_WEAK_DH;
++
+     } else if (strcmp(cmd->argv[i], "EnableDiags") == 0) {
+       opts |= TLS_OPT_ENABLE_DIAGS;
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
index 5bed85b..57d4984 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
@@ -12,6 +12,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://contrib.patch  \
            file://build_fixup.patch \
            file://proftpd.service \
+           file://CVE-2016-3125.patch \
            "
 
 SRC_URI[md5sum] = "b9d3092411478415b31d435f8e26d173"
-- 
2.8.2


