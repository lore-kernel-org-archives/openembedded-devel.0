Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11785.1795762916910345663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KEDGE7oo;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso3827700a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762916; x=1796367716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNs383siFElpQGhMk367xPg1fiahaEIvSp7fkzRQEuw=;
        b=KEDGE7oo763TtSiTPADxqvVba3I+OXMu4o6dEYMJvNFRRv0k3poHpen+nF5Gmx/mBx
         N8JeqNBIDTzLkAULOuuYkDuOKBDVKqYeqyH6xEjaJuJ3+a4G7hDbwklnFGK7aGn691Zm
         mfgaISu9VkNdpE4LjoAlsb8V0Sp86E4NZzWphqs5DhCW40OlQJGyX5mmzy7t820QZ78l
         L8XwcSe8FDjSmne1OLRUpslNvat2WtsbDPPUDl6XBa+FrmUvABgAZnOHKZvbQTBobO9D
         F9EWgCQ7ZAhXuuBZd13k3JG7Vqwvk83XqV5i+xwvuBChSgmsExxQwUtdpaMqDPqRd8D7
         uVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762916; x=1796367716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNs383siFElpQGhMk367xPg1fiahaEIvSp7fkzRQEuw=;
        b=yzjcdISNS4kGPTqQvZK7gxn3umCMiGmVKl7OFlzZK2X2qffHANzxBi2ZwZYCOyIERh
         c1Ub4+Om0UBi5HhtxILoJxss5OS4N/EqKLU59I37SzFfiD7jF1/LRLWcc7OVvT8Ey3Nq
         tYN9DFQckzA0qMn7NVgtDNoptWYrEDLX1aCK0TLQdpvEy2/I9PXhqGHsA7R1I1fnGCEb
         8uUfl4tV6O+3uB4IS23EgEQs4SHZPS2heZvIEAQhqBshNjFXJHCfGveyObM9aiClea7P
         teVVOTPB8sHY9lG+xmFDt7Ky8CUZXgn5SojfSpGwcdJ6g3zE70emnpU/vg1GPJhrqJhd
         LymQ==
X-Gm-Message-State: APuU4Z8K/3Vuu9P9WAghYy1Wt+2XwB7WjwRVY4x2830lUAqrMFC01yZs
	Glk2EPU7KzOV2kIgyI694yAnjDDMYTbQhLqRhK1Ppy8DJO1oqd/D+guwBu0oyehN
X-Gm-Gg: AZFdTZfFqO5DejWLWoyp15TjEgbBMryM6YViFqtYOn/65iENTNoRntMtcG/cNWLFA9Y
	IN7NtVssNpgJFHu1m4N5l72sNOcJg7cEo7itofwzaaLTu5IlmYGsIrs1n1yDB3iwTu+Y6ZekHsN
	oeOB0/rVVVO1tYYroT9ExQiCFDzOCttUMyh6/xQNUcjpV3nc40o+llmaox/daZClDlLnmQ5T9JG
	2Z/wpjUTMkgNGZcMUYOdbGulrOShQTIC46XZonja23DJTRFZRltfqxbG4rLVaPo6yKdCRuzWS3S
	X1we8uaPWJYtIdgYZfeSk3KnQcnpagSRCwsmuMsa3v0KigbyI4mrbZxwVOiCaTtBKd9UC171XC5
	2Q+5V6L6UOlS0GfAKsNZsg0TWGNlk8+QgajlVw+EeQ6Ci8+Pj87ulz75rVqYLIxtYloHu2queHZ
	mqQ1XL+XS0q2mCT2YWCG+ywjHlOXQTe3e5C4EzVOEmF3/RtVyxne9NDfMRqQyybn7eYz73iFtDv
	RzWeXn2JMNf0SZdyVe3N9rgO2Mj0VMrIjZyyyQHEYxg3kZ7gY4sinovoEDfGLxnidZlpnLhcL3R
	sVOifqIHgJL1Ff3NsJB/VjWvx6pD5Affw3IX48l83HK2m8/CbayOcinH51RCChqRtKXPKQZQaP/
	0vnmpxGcVTuJxi9UBVY4v+qFuleZqCFoOS71bXa32V+IttO81ge2Y2NMt6RBiDoLGMa/J5C7Oje
	pInjJFbIQMUUG84Q2jib0ko1yJsU06kQxViywK4gL+GIFvLaCVFnpVZXVUzvICLmwJGQWOxp2Kb
	Tu7loGKIVD81zObFUagtT1PG8WPcbvjv5KmwxpauNP7YB5+8FpSYL7A8trTr3YPoFRBkAGGvOo1
	fw0q
X-Received: by 2002:a17:90a:d2c6:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b41c57565emr23761192a91.0.1795762915379;
        Thu, 26 Nov 2026 23:01:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm6385312a91.4.2026.11.26.23.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 4/6] pjproject: upgrade 2.17 -> 2.18
Date: Thu, 26 Nov 2026 23:01:43 -0800
Message-ID: <20261127070145.2286713-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
References: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133324
Content-Type: text/plain; charset="utf-8"

- TLS: OCSP stapling, TLS 1.3 session resumption, Mbed TLS 4.x support
  and TURN TLS server certificate verification
- Signaling-only B2BUA / third-party call control with app-supplied SDP
- CMake as a full build system (Linux, Mac, iOS, Android, MSVC)
- Fixes 49 security issues, including all CVEs previously patched here
- Incompatible: DTLS-SRTP self-signed cert now uses an EC P-256 key
  (define PJMEDIA_SRTP_DTLS_USE_EC_KEY 0 for RSA); SSL cert serial_no
  is right-aligned with zero padding; pj_ssl_cert_load_direct() now
  takes its own references; VS2005/eVC4/VC6 projects removed.

Recipe: drop the OpenSSL 4.0 compatibility patch and the nine CVE
backports (CVE-2026-57160 .. 57166, CVE-2026-77396, CVE-2026-84975),
all of which are contained in 2.18. Add UPSTREAM_CHECK_GITTAGREGEX so
only release tags are seen.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...k_ossl-fix-OpenSSL-4.0-compatibility.patch |  40 ---
 .../pjproject/pjproject/CVE-2026-57160.patch  |  42 ----
 .../pjproject/pjproject/CVE-2026-57161.patch  |  49 ----
 .../pjproject/pjproject/CVE-2026-57162.patch  |  43 ----
 .../pjproject/pjproject/CVE-2026-57163.patch  |  52 ----
 .../pjproject/pjproject/CVE-2026-57164.patch  |  66 -----
 .../pjproject/pjproject/CVE-2026-57165.patch  |  85 -------
 .../pjproject/pjproject/CVE-2026-57166.patch  | 228 ------------------
 .../pjproject/pjproject/CVE-2026-77396.patch  |  74 ------
 .../pjproject/pjproject/CVE-2026-84975.patch  |  87 -------
 .../{pjproject_2.17.bb => pjproject_2.18.bb}  |  16 +-
 11 files changed, 3 insertions(+), 779 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch
 rename meta-multimedia/recipes-multimedia/pjproject/{pjproject_2.17.bb => pjproject_2.18.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch
deleted file mode 100644
index 938eb6620f..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
-From: Ravi Kant Sharma <rks1986@gmail.com>
-Date: Wed, 24 Jun 2026 11:30:40 +0200
-Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
-
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/3923fad2e4f6]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
- 1 file changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
-index 000aabad61..93fcf10f14 100644
---- a/pjlib/src/pj/ssl_sock_ossl.c
-+++ b/pjlib/src/pj/ssl_sock_ossl.c
-@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
-                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
-                         break;
- 
--                    if ((xn = X509_get_subject_name(x)) == NULL)
--                        break;
--
--                    if ((xn = X509_NAME_dup(xn)) == NULL )
-+                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
-                         break;
- 
- #if !USING_BORINGSSL
-@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
-     pj_parsed_time pt;
-     int i;
- 
--    utc = tm->type == V_ASN1_UTCTIME;
--    p = (char*)tm->data;
--    len = tm->length;
-+    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
-+    p = (char*)M_ASN1_STRING_data(tm);
-+    len = M_ASN1_STRING_length(tm);
-     end = p + len - 1;
- 
-     /* GMT */
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
deleted file mode 100644
index a25ed5a28e..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b14ebbccf5c228ca298ad11ecae2cedde792edae Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Wed, 17 Jun 2026 15:43:46 +0700
-Subject: [PATCH] Merge commit from fork
-
-When printing a generic array header (e.g. Allow, Require, Supported,
-Unsupported), the ": " delimiter following the header name was written
-with two unchecked stores. copy_advance() only guarantees that the
-header name itself fits, leaving as little as one byte before the end
-of the buffer. The colon then consumed the last byte and the trailing
-space was written one byte past the buffer end.
-
-Use copy_advance_char_check() for both delimiter bytes, matching the
-boundary-checked pattern already used by every other header printer in
-this file.
-
-Co-Authored-By Claude Code
-
-(cherry picked from commit d6a0e7f76611c3a6f530ee051e3e7a622bb1748c)
-
-CVE: CVE-2026-57160
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/d6a0e7f76611c3a6f530ee051e3e7a622bb1748c]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjsip/src/pjsip/sip_msg.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pjsip/src/pjsip/sip_msg.c b/pjsip/src/pjsip/sip_msg.c
-index 06c8cce86..cdc99ff9e 100644
---- a/pjsip/src/pjsip/sip_msg.c
-+++ b/pjsip/src/pjsip/sip_msg.c
-@@ -964,8 +964,8 @@ static int pjsip_generic_array_hdr_print( pjsip_generic_array_hdr *hdr,
-                             &hdr->sname : &hdr->name;
- 
-     copy_advance(p, (*hname));
--    *p++ = ':';
--    *p++ = ' ';
-+    copy_advance_char_check(p, ':');
-+    copy_advance_char_check(p, ' ');
- 
-     if (hdr->count > 0) {
-         unsigned i;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch
deleted file mode 100644
index 3296013efd..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 656cd5ec76f0178448053a9ca44ce075cd7a27f9 Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Wed, 17 Jun 2026 15:44:40 +0700
-Subject: [PATCH] Merge commit from fork
-
-Bound the number of Service-Route URIs stored in the fixed-size uri[]
-array by checking uri_cnt against PJ_ARRAY_SIZE(uri) before each write.
-Previously the count was only checked as the do/while continuation
-condition, which does not catch accumulation across multiple
-single-URI Service-Route headers, allowing a registrar response with
-more than PJSUA_ACC_MAX_PROXIES headers to write past the array.
-
-Co-Authored-By Claude Code
-
-(cherry picked from commit acc03b57cef7a7d31b8e1f5b9117437d7e87c591)
-
-CVE: CVE-2026-57161
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/acc03b57cef7a7d31b8e1f5b9117437d7e87c591]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjsip/src/pjsua-lib/pjsua_acc.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/pjsip/src/pjsua-lib/pjsua_acc.c b/pjsip/src/pjsua-lib/pjsua_acc.c
-index f52518a2a..08c5efced 100644
---- a/pjsip/src/pjsua-lib/pjsua_acc.c
-+++ b/pjsip/src/pjsua-lib/pjsua_acc.c
-@@ -2278,14 +2278,14 @@ static void update_service_route(pjsua_acc *acc, pjsip_rx_data *rdata)
-                 return;
-             }
- 
-+            if (uri_cnt >= PJ_ARRAY_SIZE(uri)) {
-+                PJ_LOG(1,(THIS_FILE, "Error: too many Service-Route headers"));
-+                return;
-+            }
-+
-             uri[uri_cnt++] = h->name_addr.uri;
-             h = h->next;
--        } while (h != hr && uri_cnt != PJ_ARRAY_SIZE(uri));
--
--        if (h != hr) {
--            PJ_LOG(1,(THIS_FILE, "Error: too many Service-Route headers"));
--            return;
--        }
-+        } while (h != hr);
- 
-         /* Prepare to find next Service-Route header */
-         hsr = hsr->next;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch
deleted file mode 100644
index 85a9394e25..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1b64bfb240731bbf0fc194dec68bb9d9b08a20b2 Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Wed, 17 Jun 2026 15:45:33 +0700
-Subject: [PATCH] Merge commit from fork
-
-sdes_encode_sdp() in transport_srtp_sdes.c wrote each parsed crypto tag
-into the fixed int tags[64] array without bounding the count, while the
-SDP parser allows up to PJMEDIA_MAX_SDP_ATTR (68) attributes. Reject
-the SDP with PJMEDIA_SRTP_ESDPINCRYPTO once the array capacity is
-reached, before the out-of-bounds write.
-
-Co-Authored-By Claude Code
-
-(cherry picked from commit a1b707c0c9b0506faf2a8a438b60f11ffd6a6fd9)
-
-CVE: CVE-2026-57162
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/a1b707c0c9b0506faf2a8a438b60f11ffd6a6fd9]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjmedia/src/pjmedia/transport_srtp_sdes.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/pjmedia/src/pjmedia/transport_srtp_sdes.c b/pjmedia/src/pjmedia/transport_srtp_sdes.c
-index 8f98292ba..45038e585 100644
---- a/pjmedia/src/pjmedia/transport_srtp_sdes.c
-+++ b/pjmedia/src/pjmedia/transport_srtp_sdes.c
-@@ -478,6 +478,15 @@ static pj_status_t sdes_encode_sdp( pjmedia_transport *tp,
- 
-                 has_crypto_attr = PJ_TRUE;
- 
-+                /* Bound writes to tags[] by its capacity. m_rem->attr_count
-+                 * is capped by the SDP parser at PJMEDIA_MAX_SDP_ATTR, which
-+                 * can exceed PJ_ARRAY_SIZE(tags); without this guard a remote
-+                 * peer can overflow the stack array by sending more than
-+                 * PJ_ARRAY_SIZE(tags) a=crypto attributes.
-+                 */
-+                if (cr_attr_count >= PJ_ARRAY_SIZE(tags))
-+                    return PJMEDIA_SRTP_ESDPINCRYPTO;
-+
-                 status = parse_attr_crypto(srtp->pool, m_rem->attr[i],
-                                            &tmp_rx_crypto,
-                                            &tags[cr_attr_count]);
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch
deleted file mode 100644
index 7b3c681cb9..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 2276d5ff1fe185a6bb51ab741dd5d88e45dbaa47 Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Wed, 17 Jun 2026 15:46:16 +0700
-Subject: [PATCH] Merge commit from fork
-
-The SAN-counting loop in tls_cert_get_info() (ssl_sock_gtls.c) called
-gnutls_x509_crt_get_subject_alt_name() with len still holding
-sizeof(buf) (512) from an earlier getter, while the output buffer is
-only 256 bytes, so an oversized SAN entry overflowed the stack. Set len
-to the true capacity (sizeof(out) - 1, matching the populate loop) on
-every iteration.
-
-Co-Authored-By Claude Code
-
-(cherry picked from commit c4a151af86fadd16d9480b2603eeb2abf4fb4f78)
-
-CVE: CVE-2026-57163
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/c4a151af86fadd16d9480b2603eeb2abf4fb4f78]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjlib/src/pj/ssl_sock_gtls.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/pjlib/src/pj/ssl_sock_gtls.c b/pjlib/src/pj/ssl_sock_gtls.c
-index de3d5e99e..68ceea3f3 100644
---- a/pjlib/src/pj/ssl_sock_gtls.c
-+++ b/pjlib/src/pj/ssl_sock_gtls.c
-@@ -1018,12 +1018,22 @@ static void tls_cert_get_info(pj_pool_t *pool, pj_ssl_cert_info *ci,
-     if (ci->version >= 3) {
-         char out[256] = { 0 };
-         /* Get the number of all alternate names so that we can allocate
--         * the correct number of bytes in subj_alt_name */
-+         * the correct number of bytes in subj_alt_name.
-+         *
-+         * Pass the true capacity of 'out' as the in/out size argument on
-+         * every iteration. 'len' otherwise still holds sizeof(buf) (512)
-+         * from an earlier getter, which would let GnuTLS copy an oversized
-+         * SubjectAltName entry past the end of the 256-byte 'out' buffer.
-+         * Use sizeof(out) - 1 to match the populate loop below, leaving
-+         * room for the NUL terminator GnuTLS appends to string names.
-+         */
-+        len = sizeof(out) - 1;
-         while (gnutls_x509_crt_get_subject_alt_name(cert, seq, out, &len,
-                                                     NULL) !=
-                GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE)
-         {
-             seq++;
-+            len = sizeof(out) - 1;
-         }
- 
-         ci->subj_alt_name.entry = pj_pool_calloc(pool, seq,
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch
deleted file mode 100644
index 0686d681c3..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 1160ff3c15cfa79f50d4bc6ce8066854f656066c Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Wed, 17 Jun 2026 15:46:48 +0700
-Subject: [PATCH] Merge commit from fork
-
-http_on_data_read() in http_client.c grew the response buffer by a
-single doubling, which is insufficient when the server sends a body
-larger than twice the (attacker-supplied) Content-Length used for the
-initial allocation. Loop the doubling until the buffer fits, with a
-floor for the size==0 case to avoid an infinite loop.
-
-Co-Authored-By Claude Code
-
-(cherry picked from commit 8d5956afab2ede95ddb199078dc19a8ac0114f3d)
-
-CVE: CVE-2026-57164
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/8d5956afab2ede95ddb199078dc19a8ac0114f3d]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjlib-util/src/pjlib-util/http_client.c | 27 ++++++++++++++++++-------
- 1 file changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/pjlib-util/src/pjlib-util/http_client.c b/pjlib-util/src/pjlib-util/http_client.c
-index bd441acb9..d2771d240 100644
---- a/pjlib-util/src/pjlib-util/http_client.c
-+++ b/pjlib-util/src/pjlib-util/http_client.c
-@@ -432,18 +432,31 @@ static pj_bool_t http_on_data_read(pj_activesock_t *asock,
-                                                 hreq->response.size);
-         }
- 
--        /* If the size of data received exceeds its current size,
--         * grow the buffer by a factor of 2.
-+        /* If the size of data received exceeds its current size, grow the
-+         * buffer by a factor of 2 repeatedly, until it can actually hold
-+         * everything received so far. A single doubling is not sufficient
-+         * when the server delivers a body chunk larger than twice the
-+         * (possibly undersized) Content-Length used for the initial
-+         * allocation, which would otherwise overflow the buffer in the
-+         * pj_memcpy() below.
-          */
--        if (hreq->tcp_state.current_read_size + size > 
--            hreq->response.size) 
-+        if (hreq->tcp_state.current_read_size + size >
-+            hreq->response.size)
-         {
-             void *olddata = hreq->response.data;
-+            pj_size_t new_size = hreq->response.size;
- 
--            hreq->response.data = pj_pool_alloc(hreq->pool, 
--                                                hreq->response.size << 1);
-+            /* Guard against size==0 (Content-Length: 0 with a body), which
-+             * would make the doubling loop below spin forever.
-+             */
-+            if (new_size == 0)
-+                new_size = INITIAL_DATA_BUF_SIZE;
-+            while (hreq->tcp_state.current_read_size + size > new_size)
-+                new_size <<= 1;
-+
-+            hreq->response.data = pj_pool_alloc(hreq->pool, new_size);
-             pj_memcpy(hreq->response.data, olddata, hreq->response.size);
--            hreq->response.size <<= 1;
-+            hreq->response.size = new_size;
-         }
- 
-         /* Append the response data. */
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch
deleted file mode 100644
index e2d62b0eef..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 5776ee452296d5277d71e2bb011709adec80a533 Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Wed, 17 Jun 2026 15:47:29 +0700
-Subject: [PATCH] Merge commit from fork
-
-handle_up_down() in cli_telnet.c accumulated cur_pos + 2*rcmd->len +
-history->slen bytes into a fixed PJ_CLI_MAX_CMDBUF stack buffer with no
-bound check. Size the buffer for the worst case, clamp each term to
-PJ_CLI_MAX_CMDBUF, and replace the trailing unchecked pj_strcat with a
-bounded pj_memcpy.
-
-Co-Authored-By Claude Code
-
-(cherry picked from commit 628b71638465bacf66e767959e6acbab822eccd6)
-
-CVE: CVE-2026-57165
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/628b71638465bacf66e767959e6acbab822eccd6]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjlib-util/src/pjlib-util/cli_telnet.c | 33 ++++++++++++++++++++------
- 1 file changed, 26 insertions(+), 7 deletions(-)
-
-diff --git a/pjlib-util/src/pjlib-util/cli_telnet.c b/pjlib-util/src/pjlib-util/cli_telnet.c
-index 150727bb5..0a2954bd4 100644
---- a/pjlib-util/src/pjlib-util/cli_telnet.c
-+++ b/pjlib-util/src/pjlib-util/cli_telnet.c
-@@ -1141,7 +1141,14 @@ static pj_bool_t handle_up_down(cli_telnet_sess *sess, pj_bool_t is_up)
-     history = get_prev_history(sess, is_up);
-     if (history) {
-         pj_str_t send_data;
--        char str[PJ_CLI_MAX_CMDBUF];
-+        /* The redraw sequence can accumulate up to
-+         *   cur_pos + 2 * rcmd->len + history->slen
-+         * bytes, each term bounded by PJ_CLI_MAX_CMDBUF, so size the
-+         * local buffer for the worst case and clamp each term below.
-+         */
-+        char str[PJ_CLI_MAX_CMDBUF * 4];
-+        unsigned cur_pos, buf_len;
-+        pj_size_t hist_len;
-         enum {
-             MOVE_CURSOR_LEFT = 0x08,
-             CLEAR_CHAR = 0x20
-@@ -1149,15 +1156,24 @@ static pj_bool_t handle_up_down(cli_telnet_sess *sess, pj_bool_t is_up)
-         send_data.ptr = str;
-         send_data.slen = 0;
- 
-+        cur_pos = sess->rcmd->cur_pos;
-+        buf_len = sess->rcmd->len;
-+        hist_len = history->slen;
-+        if (cur_pos > PJ_CLI_MAX_CMDBUF)
-+            cur_pos = PJ_CLI_MAX_CMDBUF;
-+        if (buf_len > PJ_CLI_MAX_CMDBUF)
-+            buf_len = PJ_CLI_MAX_CMDBUF;
-+        if (hist_len > PJ_CLI_MAX_CMDBUF)
-+            hist_len = PJ_CLI_MAX_CMDBUF;
-+
-         /* Move cursor position to the beginning of line */
--        if (sess->rcmd->cur_pos > 0) {
--            pj_memset(send_data.ptr, MOVE_CURSOR_LEFT, sess->rcmd->cur_pos);
--            send_data.slen = sess->rcmd->cur_pos;
-+        if (cur_pos > 0) {
-+            pj_memset(send_data.ptr, MOVE_CURSOR_LEFT, cur_pos);
-+            send_data.slen = cur_pos;
-         }
- 
--        if (sess->rcmd->len > (unsigned)history->slen) {
-+        if (buf_len > (unsigned)hist_len) {
-             /* Clear the command currently shown*/
--            unsigned buf_len = sess->rcmd->len;
-             pj_memset(&send_data.ptr[send_data.slen], CLEAR_CHAR, buf_len);
-             send_data.slen += buf_len;
- 
-@@ -1167,7 +1183,10 @@ static pj_bool_t handle_up_down(cli_telnet_sess *sess, pj_bool_t is_up)
-             send_data.slen += buf_len;
-         }
-         /* Send data */
--        pj_strcat(&send_data, history);
-+        if (hist_len > 0) {
-+            pj_memcpy(&send_data.ptr[send_data.slen], history->ptr, hist_len);
-+            send_data.slen += hist_len;
-+        }
-         telnet_sess_send(sess, &send_data);
-         pj_ansi_strxcpy2((char*)sess->rcmd->rbuf, history, 
-                          sizeof(sess->rcmd->rbuf));
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch
deleted file mode 100644
index 8311d4c36d..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From d0b42b902bb6ca8a0a1393799db487642d3bf8ae Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Wed, 17 Jun 2026 15:55:53 +0700
-Subject: [PATCH] Merge commit from fork
-
-* Fix pre-auth stack overflow formatting telnet CLI error indicator
-
-send_err_arg() in cli_telnet.c rendered the error caret into a fixed
-256-byte stack buffer using unchecked pj_strcat2; info->err_pos is
-bounded only by PJ_CLI_MAX_CMDBUF, so a long command line overflowed
-the buffer. Stream the spaces in bounded chunks via telnet_sess_send2,
-clamp the caret offset to PJ_CLI_MAX_CMDBUF, and send the message,
-prompt and echoed command separately, removing the stack buffer.
-
-Co-Authored-By Claude Code
-
-* Apply the same overflow fix to send_ambi_arg()
-
-Per review, send_ambi_arg() has the same issue as send_err_arg(): it
-renders an attacker-influenced number of caret spaces and appends the
-last command into a fixed 1028-byte stack buffer with unchecked
-pj_strcat2. info->err_pos and sess->rcmd->rbuf are bounded only by
-PJ_CLI_MAX_CMDBUF, so a long ambiguous command line could overflow it.
-
-Stream the caret offset in bounded chunks (clamped to PJ_CLI_MAX_CMDBUF)
-and stream the clamped last command separately, mirroring the
-send_err_arg() fix, instead of writing them into the fixed buffer. The
-shared SPACES constant is hoisted to file scope.
-
-Co-Authored-By Claude Code
-
-* Bound completion append in handle_tab()
-
-handle_tab() appended the matched command name into the fixed-size
-sess->rcmd->rbuf at offset len (the current command length) without
-checking that len + name length fits the buffer. len is bounded by the
-receive path, but the completion suffix is added on top, so a long
-completable command line could write past rbuf and its NUL terminator.
-
-Clamp the appended length to the space remaining in rbuf, leaving room
-for the terminator. Found while auditing the telnet CLI for the same
-fixed-buffer overflow pattern as send_err_arg()/send_ambi_arg().
-
-Co-Authored-By Claude Code
-
-(cherry picked from commit 4472a31d77a7506ff175dad5abef490f4e31bed1)
-
-CVE: CVE-2026-57166
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/4472a31d77a7506ff175dad5abef490f4e31bed1]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjlib-util/src/pjlib-util/cli_telnet.c | 116 ++++++++++++++++++-------
- 1 file changed, 84 insertions(+), 32 deletions(-)
-
-diff --git a/pjlib-util/src/pjlib-util/cli_telnet.c b/pjlib-util/src/pjlib-util/cli_telnet.c
-index 0a2954bd4..67898fdd8 100644
---- a/pjlib-util/src/pjlib-util/cli_telnet.c
-+++ b/pjlib-util/src/pjlib-util/cli_telnet.c
-@@ -680,6 +680,13 @@ static void send_prompt_str(cli_telnet_sess *sess)
-     telnet_sess_send(sess, &send_data);
- }
- 
-+/* Buffer of spaces, used to stream the caret offset in bounded chunks
-+ * instead of writing an attacker-influenced number of spaces into a
-+ * fixed-size stack buffer. Shared by send_err_arg() and send_ambi_arg().
-+ */
-+static const unsigned char SPACES[64] =
-+    "                                                                ";
-+
- /*
-  * This method is used to send error message to client, including
-  * the error position of the source command.
-@@ -690,32 +697,45 @@ static void send_err_arg(cli_telnet_sess *sess,
-                          pj_bool_t with_return,
-                          pj_bool_t with_last_cmd)
- {
--    pj_str_t send_data;
--    char data_str[256];
--    pj_size_t len;
--    unsigned i;
-+    pj_size_t len, remaining;
-     cli_telnet_fe *fe = (cli_telnet_fe *)sess->base.fe;
- 
--    send_data.ptr = data_str;
--    send_data.slen = 0;
--
-     if (with_return)
--        pj_strcat2(&send_data, "\r\n");
-+        telnet_sess_send2(sess, (const unsigned char*)"\r\n", 2);
- 
-+    /* Compute the caret offset. info->err_pos is derived from
-+     * attacker-supplied input (pj_cli_sess_parse) and is bounded only by
-+     * PJ_CLI_MAX_CMDBUF, so clamp it before emitting spaces. Otherwise a
-+     * ~500-byte command line would overflow the fixed-size stack buffer
-+     * this function previously used.
-+     */
-     len = fe->cfg.prompt_str.slen + info->err_pos;
--
--    /* Set the error pointer mark */
--    for (i=0;i<len;++i) {
--        pj_strcat2(&send_data, " ");
-+    if (len > PJ_CLI_MAX_CMDBUF)
-+        len = PJ_CLI_MAX_CMDBUF;
-+
-+    remaining = len;
-+    while (remaining > 0) {
-+        pj_size_t chunk = (remaining > sizeof(SPACES)) ? sizeof(SPACES)
-+                                                       : remaining;
-+        telnet_sess_send2(sess, SPACES, (int)chunk);
-+        remaining -= chunk;
-     }
--    pj_strcat2(&send_data, "^");
--    pj_strcat2(&send_data, "\r\n");
--    pj_strcat(&send_data, msg);
--    pj_strcat(&send_data, &fe->cfg.prompt_str);
--    if (with_last_cmd)
--        pj_strcat2(&send_data, (char *)sess->rcmd->rbuf);
- 
--    telnet_sess_send(sess, &send_data);
-+    telnet_sess_send2(sess, (const unsigned char*)"^\r\n", 3);
-+
-+    if (msg && msg->slen > 0)
-+        telnet_sess_send(sess, msg);
-+    if (fe->cfg.prompt_str.slen > 0)
-+        telnet_sess_send(sess, &fe->cfg.prompt_str);
-+    if (with_last_cmd) {
-+        pj_str_t last;
-+        last.ptr = (char *)sess->rcmd->rbuf;
-+        last.slen = (pj_ssize_t)pj_ansi_strlen((const char *)sess->rcmd->rbuf);
-+        if (last.slen > PJ_CLI_MAX_CMDBUF)
-+            last.slen = PJ_CLI_MAX_CMDBUF;
-+        if (last.slen > 0)
-+            telnet_sess_send(sess, &last);
-+    }
- }
- 
- static void send_inv_arg(cli_telnet_sess *sess,
-@@ -765,7 +785,7 @@ static void send_ambi_arg(cli_telnet_sess *sess,
-                           pj_bool_t with_last_cmd)
- {
-     unsigned i;
--    pj_size_t len;
-+    pj_size_t len, remaining;
-     pj_str_t send_data;
-     char data[1028];
-     cli_telnet_fe *fe = (cli_telnet_fe *)sess->base.fe;
-@@ -779,14 +799,25 @@ static void send_ambi_arg(cli_telnet_sess *sess,
-     send_data.slen = 0;
- 
-     if (with_return)
--        pj_strcat2(&send_data, "\r\n");
-+        telnet_sess_send2(sess, (const unsigned char*)"\r\n", 2);
- 
-+    /* Compute and clamp the caret offset, then stream the spaces, like
-+     * send_err_arg(). info->err_pos is attacker-bounded only by
-+     * PJ_CLI_MAX_CMDBUF, so it must not drive writes into data[].
-+     */
-     len = fe->cfg.prompt_str.slen + info->err_pos;
--
--    for (i=0;i<len;++i) {
--        pj_strcat2(&send_data, " ");
-+    if (len > PJ_CLI_MAX_CMDBUF)
-+        len = PJ_CLI_MAX_CMDBUF;
-+
-+    remaining = len;
-+    while (remaining > 0) {
-+        pj_size_t chunk = (remaining > sizeof(SPACES)) ? sizeof(SPACES)
-+                                                       : remaining;
-+        telnet_sess_send2(sess, SPACES, (int)chunk);
-+        remaining -= chunk;
-     }
--    pj_strcat2(&send_data, "^");
-+    telnet_sess_send2(sess, (const unsigned char*)"^", 1);
-+
-     /* Get the max length of the command name */
-     for (i=0;i<info->hint_cnt;++i) {
-         if (hint[i].type.slen > 0) {
-@@ -874,10 +905,21 @@ static void send_ambi_arg(cli_telnet_sess *sess,
-     }
-     pj_strcat2(&send_data, "\r\n");
-     pj_strcat(&send_data, &fe->cfg.prompt_str);
--    if (with_last_cmd)
--        pj_strcat2(&send_data, (char *)sess->rcmd->rbuf);
--
-     telnet_sess_send(sess, &send_data);
-+
-+    /* Stream the last command separately with a clamp; sess->rcmd->rbuf
-+     * is attacker-bounded only by PJ_CLI_MAX_CMDBUF, so appending it into
-+     * data[] could overflow the fixed-size buffer.
-+     */
-+    if (with_last_cmd) {
-+        pj_str_t last;
-+        last.ptr = (char *)sess->rcmd->rbuf;
-+        last.slen = (pj_ssize_t)pj_ansi_strlen((const char *)sess->rcmd->rbuf);
-+        if (last.slen > PJ_CLI_MAX_CMDBUF)
-+            last.slen = PJ_CLI_MAX_CMDBUF;
-+        if (last.slen > 0)
-+            telnet_sess_send(sess, &last);
-+    }
- }
- 
- /*
-@@ -1035,10 +1077,20 @@ static pj_bool_t handle_tab(cli_telnet_sess *sess)
-                 }
-                 send_comp_arg(sess, &info);
- 
--                pj_memcpy(&sess->rcmd->rbuf[len], info.hint[0].name.ptr,
--                          info.hint[0].name.slen);
--
--                len += (unsigned)info.hint[0].name.slen;
-+                /* Append the matched name into the fixed-size rbuf. len is
-+                 * attacker-influenced (the typed command length), so clamp
-+                 * the copy to leave room for the NUL terminator and avoid
-+                 * overflowing rbuf.
-+                 */
-+                if (len < sizeof(sess->rcmd->rbuf) - 1) {
-+                    pj_size_t avail = sizeof(sess->rcmd->rbuf) - 1 - len;
-+                    pj_size_t cplen = (pj_size_t)info.hint[0].name.slen;
-+                    if (cplen > avail)
-+                        cplen = avail;
-+                    pj_memcpy(&sess->rcmd->rbuf[len],
-+                              info.hint[0].name.ptr, cplen);
-+                    len += (unsigned)cplen;
-+                }
-                 sess->rcmd->rbuf[len] = 0;
-             }
-         } else {
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
deleted file mode 100644
index a02268bf11..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From a927a964d462e9966864b7b2c432942b61038d6b Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Mon, 13 Jul 2026 09:27:02 +0700
-Subject: [PATCH] Merge commit from fork
-
-The AVI player used a chunk length taken from the input file as the
-number of bytes to read into the video frame buffer, whose capacity is
-derived from the (also file-supplied) declared dimensions, without
-reconciling the two. A crafted file could therefore cause a write past
-the end of the buffer. The only guard was an assertion, which is a
-no-op in release builds.
-
-Clamp the read to the frame buffer capacity, skip any remaining chunk
-bytes so the file position stays aligned, and remove the reliance on
-the assertion for validating a file-supplied length.
-
-Ref: GHSA-6p2p-5wf8-h5hr
-(cherry picked from commit 7ecc6584969a923c4190b6912afbf5952b5a4b9f)
-
-CVE: CVE-2026-77396
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/7ecc6584969a923c4190b6912afbf5952b5a4b9f]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjmedia/src/pjmedia/avi_player.c | 34 +++++++++++++++++++++++++++++---
- 1 file changed, 31 insertions(+), 3 deletions(-)
-
-diff --git a/pjmedia/src/pjmedia/avi_player.c b/pjmedia/src/pjmedia/avi_player.c
-index dc87b8a41..8b4b94d16 100644
---- a/pjmedia/src/pjmedia/avi_player.c
-+++ b/pjmedia/src/pjmedia/avi_player.c
-@@ -1199,12 +1199,40 @@ static pj_status_t avi_get_frame(pjmedia_port *this_port,
-                 goto on_error2;
-             fport->size_left -= size_to_read;
-         } else {
--            pj_assert(frame->size >= ch.len);
--            status = file_read3(fport->fd, frame->buf, ch.len,
-+            pj_uint32_t read_len = ch.len;
-+
-+            /* Clamp the read to the frame buffer capacity. A crafted
-+             * file may declare a chunk larger than the buffer, whose
-+             * size is derived from the (also file-supplied) video
-+             * dimensions; never write past frame->buf (frame->size
-+             * bytes). Do not rely on pj_assert() here, as it is a no-op
-+             * in release builds.
-+             */
-+            if (read_len > frame->size) {
-+                PJ_LOG(3, (THIS_FILE,
-+                           "AVI video chunk (%u) exceeds frame buffer "
-+                           "(%u), truncating",
-+                           (unsigned)ch.len, (unsigned)frame->size));
-+                read_len = (pj_uint32_t)frame->size;
-+            }
-+
-+            status = file_read3(fport->fd, frame->buf, read_len,
-                                 0, &size_read);
-             if (status != PJ_SUCCESS)
-                 goto on_error2;
--            frame->size = ch.len;
-+
-+            /* Skip any remaining chunk bytes that did not fit, so the
-+             * file position stays aligned to the next chunk.
-+             */
-+            if (ch.len > read_len) {
-+                status = pj_file_setpos(fport->fd,
-+                                        (pj_off_t)ch.len - read_len,
-+                                        PJ_SEEK_CUR);
-+                if (status != PJ_SUCCESS)
-+                    goto on_error2;
-+            }
-+
-+            frame->size = read_len;
-             fport->size_left = 0;
-         }
- 
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch
deleted file mode 100644
index 007096a6ff..0000000000
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From f00f023079d0f9a74477da47056bfce76374b2a7 Mon Sep 17 00:00:00 2001
-From: sauwming <ming@teluu.com>
-Date: Fri, 17 Jul 2026 16:46:33 +0800
-Subject: [PATCH] Merge commit from fork
-
-SubjectAltName entries from the OpenSSL and GnuTLS backends were copied
-with pj_strdup2(), which re-derives the length with strlen() and thus
-discards the length already returned by ASN1_STRING_to_UTF8() /
-gnutls_x509_crt_get_subject_alt_name(). A DNS SAN such as
-"victim.example\0.attacker" was therefore truncated to "victim.example".
-
-sip_transport_tls.c disables socket-layer verification and performs its
-own length-aware identity match against subj_alt_name, so the truncated
-prefix compared equal to the target host and a crafted certificate was
-accepted for the prefix hostname (server identity / hostname verification
-bypass; OpenSSL's own X509_check_host() rejects the same certificate).
-
-Copy the SAN using its explicit length via pj_strset()/pj_strdup_with_null()
-so embedded NULs are preserved and no longer truncated. The mbedTLS backend
-already copied with a length-bearing pj_str_t and was not affected.
-
-Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
-(cherry picked from commit 43d3bd77bb6833eab4c493503b8d564a754ddfdd)
-
-CVE: CVE-2026-84975
-Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/43d3bd77bb6833eab4c493503b8d564a754ddfdd]
-
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- pjlib/src/pj/ssl_sock_gtls.c | 17 +++++++++++++++--
- pjlib/src/pj/ssl_sock_ossl.c | 14 +++++++++++---
- 2 files changed, 26 insertions(+), 5 deletions(-)
-
-diff --git a/pjlib/src/pj/ssl_sock_gtls.c b/pjlib/src/pj/ssl_sock_gtls.c
-index 68ceea3f3..ee977116b 100644
---- a/pjlib/src/pj/ssl_sock_gtls.c
-+++ b/pjlib/src/pj/ssl_sock_gtls.c
-@@ -1072,9 +1072,22 @@ static void tls_cert_get_info(pj_pool_t *pool, pj_ssl_cert_info *ci,
- 
-             if (len && type != PJ_SSL_CERT_NAME_UNKNOWN) {
-                 ci->subj_alt_name.entry[ci->subj_alt_name.cnt].type = type;
--                pj_strdup2(pool,
-+                if (type == PJ_SSL_CERT_NAME_IP) {
-+                    pj_strdup2(pool,
-                         &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
--                        type == PJ_SSL_CERT_NAME_IP ? buf : out);
-+                        buf);
-+                } else {
-+                    /* Preserve the reported length instead of using strlen(),
-+                     * so a DNS SAN containing an embedded NUL is not truncated
-+                     * at the NUL (which would allow a crafted cert to be
-+                     * accepted for the prefix hostname; identity bypass).
-+                     */
-+                    pj_str_t tmp;
-+                    pj_strset(&tmp, out, len);
-+                    pj_strdup_with_null(pool,
-+                        &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
-+                        &tmp);
-+                }
-                 ci->subj_alt_name.cnt++;
-             }
-         }
-diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
-index 30b4eeaee..ceb6bca5b 100644
---- a/pjlib/src/pj/ssl_sock_ossl.c
-+++ b/pjlib/src/pj/ssl_sock_ossl.c
-@@ -2270,9 +2270,17 @@ static void get_cert_info(pj_pool_t *pool, pj_ssl_cert_info *ci, X509 *x,
-                           &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
-                           buf);
-                 } else {
--                    pj_strdup2(pool, 
--                          &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name, 
--                          (char*)p);
-+                    /* Preserve the explicit ASN.1 string length instead of
-+                     * treating the data as a NUL-terminated C string. A DNS
-+                     * SAN such as "host.example\0.attacker" would otherwise be
-+                     * truncated at the embedded NUL, letting a crafted cert be
-+                     * accepted for the prefix hostname (identity bypass).
-+                     */
-+                    pj_str_t tmp;
-+                    pj_strset(&tmp, (char*)p, len);
-+                    pj_strdup_with_null(pool,
-+                          &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
-+                          &tmp);
-                     OPENSSL_free(p);
-                 }
-                 ci->subj_alt_name.cnt++;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.18.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
rename to meta-multimedia/recipes-multimedia/pjproject/pjproject_2.18.bb
index 893559090f..833d717dda 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.18.bb
@@ -12,19 +12,9 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV} \
-           file://0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch \
-           file://CVE-2026-57160.patch \
-           file://CVE-2026-57161.patch \
-           file://CVE-2026-57162.patch \
-           file://CVE-2026-57163.patch \
-           file://CVE-2026-57164.patch \
-           file://CVE-2026-57165.patch \
-           file://CVE-2026-57166.patch \
-           file://CVE-2026-77396.patch \
-           file://CVE-2026-84975.patch \
-           "
-SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
+SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "bd4a7189d83d94237b6f42f3b8274664dbe6ff94"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS = "swig-native python3-setuptools-native"
 
