Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1761.1792434881335667863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ve2QIF6H;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1706284a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434881; x=1793039681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yUn16UbxI6ZGujrzODHrRzJGBCFTF6ReH+awZ++GGU=;
        b=Ve2QIF6HqPhspprssQiIR1SsS3AhEtxGcwIwD+QM3BVCg7SsXjTEgu5uw9Rxqs+I0D
         DcH3eu47crHyxpgZnWvijyq/j9E9Rm+Haj23758tdMkhAGwFlC2K9UR2clxNJn2AsIEs
         AkfZArl2cylKnMY1lxY60YgJzuKCcTZowNTlpTDS3MrzonG0nwdHXObjP0PS2+Oe7EUl
         42UAnnhQGKXIG+aegBMhkSP3Ge3o7VgR+/4VdbuoZYFPJ3DEGf0Wpw/CkHkL+/x08fno
         gg9DCDFCn9anN7T0/+pVzkRiQaxV5e/Bs5ojNBgjH/TNLT16LIUihqvh0McciLFpfif7
         oKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434881; x=1793039681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yUn16UbxI6ZGujrzODHrRzJGBCFTF6ReH+awZ++GGU=;
        b=w1LIWqRqrNqy/VrSbEcpizV6mhebvq7HUumJMuSUxPfVUi31k17pcBeJCkKrkzKab5
         YiTJjo+1H5M8k+YaMxu3Bx9ENrLi/HadFbYuCSNOROgpXEZXlspmaty0ldx+8OfNlV9Q
         y2wTbDPblyVBdJYgTZs7UNg56g1qtNNz/KWxvp1ac/kvab9EKddG4w6NzeEgWEYSBCmW
         PdVQOM57g8CVlXYSyED6ebh/hgp8mLHsYz6uL2YxsLoItp9PZq9ri8GyE0y9QSWY2jmx
         28tIbcHBKkD9OsGXIdNB1+U++RnumkBUri5FvcxROySYBwjziiS5zjALbhkKoRpQZgor
         hFkw==
X-Gm-Message-State: AFq9FYKlpSRQVFIMucMW5y32EddvF+Fm6z3rIshoQd37lKtwT9/nZmvH
	pf2d5IlzY/Tbdz0VVVFdrlMTla+C89EKmoBsyeMhaJkxwNNtbibK9nVSfzyZHA==
X-Gm-Gg: AYBFou0kYtdX7k/WnFEsutUqONiMS997Myn7GzKyJlAC1qDzrONaHrdkG+uDWiApDy9
	isbLSk2JcaxQ8SKkIrFwmW9mruRjEZJN1MKiwqxzXwQb6Y1iWne4KpYzbIwIuQXSSGZ6UOMsOxG
	7dCuDMnBUTwP+YPM+vTzu2/OvuaxB07YLcWX6WZ4XhqalsJHzT9B598W+GCJsvUcwhXj8QFcZFp
	k1Sqi7cYfC6rYnibKRe6JxBOcPhIiulySPwbskDED8D9KjiJX1d7NFhDMF4mIUYz3Wthxbc4AH+
	DsTQOWfqRbVLlMhhUl0b2jnYr4YGXtmTeyinuZqscwz7GVCCqNor04fTSv/dgO/8aHSld/J0JMH
	FNRzu7tcUSgfU2EmfNk6SY0npkgfk9N5HzcxjxfZZqxTve4YxEzEin6BeSQ4Obz4HzJSkICbj9i
	LTgMqoVSd6rF8mV4Ous4WRG+uStuzbe41htb6b+3X7hPxiWRiF9Y9jXgXFde8MPuOgrvEdjY0U5
	lphPtF82RTcMTnNZibnN21+rDI12wOZIGemLq+qfZD8iBk/HA==
X-Received: by 2002:a05:6a21:7318:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3e225d72bd2mr7550163637.9.1792434880432;
        Mon, 19 Oct 2026 11:34:40 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 11/20] pjproject: patch CVE-2026-84975
Date: Tue, 20 Oct 2026 07:33:57 +1300
Message-ID: <20261019183407.1037972-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131137
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84975

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit a003f0bb5accff83fdd52df110360fae360a2272)
---
 .../pjproject/pjproject/CVE-2026-84975.patch  | 87 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch
new file mode 100644
index 0000000000..007096a6ff
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch
@@ -0,0 +1,87 @@
+From f00f023079d0f9a74477da47056bfce76374b2a7 Mon Sep 17 00:00:00 2001
+From: sauwming <ming@teluu.com>
+Date: Fri, 17 Jul 2026 16:46:33 +0800
+Subject: [PATCH] Merge commit from fork
+
+SubjectAltName entries from the OpenSSL and GnuTLS backends were copied
+with pj_strdup2(), which re-derives the length with strlen() and thus
+discards the length already returned by ASN1_STRING_to_UTF8() /
+gnutls_x509_crt_get_subject_alt_name(). A DNS SAN such as
+"victim.example\0.attacker" was therefore truncated to "victim.example".
+
+sip_transport_tls.c disables socket-layer verification and performs its
+own length-aware identity match against subj_alt_name, so the truncated
+prefix compared equal to the target host and a crafted certificate was
+accepted for the prefix hostname (server identity / hostname verification
+bypass; OpenSSL's own X509_check_host() rejects the same certificate).
+
+Copy the SAN using its explicit length via pj_strset()/pj_strdup_with_null()
+so embedded NULs are preserved and no longer truncated. The mbedTLS backend
+already copied with a length-bearing pj_str_t and was not affected.
+
+Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
+(cherry picked from commit 43d3bd77bb6833eab4c493503b8d564a754ddfdd)
+
+CVE: CVE-2026-84975
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/43d3bd77bb6833eab4c493503b8d564a754ddfdd]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjlib/src/pj/ssl_sock_gtls.c | 17 +++++++++++++++--
+ pjlib/src/pj/ssl_sock_ossl.c | 14 +++++++++++---
+ 2 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/pjlib/src/pj/ssl_sock_gtls.c b/pjlib/src/pj/ssl_sock_gtls.c
+index 68ceea3f3..ee977116b 100644
+--- a/pjlib/src/pj/ssl_sock_gtls.c
++++ b/pjlib/src/pj/ssl_sock_gtls.c
+@@ -1072,9 +1072,22 @@ static void tls_cert_get_info(pj_pool_t *pool, pj_ssl_cert_info *ci,
+ 
+             if (len && type != PJ_SSL_CERT_NAME_UNKNOWN) {
+                 ci->subj_alt_name.entry[ci->subj_alt_name.cnt].type = type;
+-                pj_strdup2(pool,
++                if (type == PJ_SSL_CERT_NAME_IP) {
++                    pj_strdup2(pool,
+                         &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
+-                        type == PJ_SSL_CERT_NAME_IP ? buf : out);
++                        buf);
++                } else {
++                    /* Preserve the reported length instead of using strlen(),
++                     * so a DNS SAN containing an embedded NUL is not truncated
++                     * at the NUL (which would allow a crafted cert to be
++                     * accepted for the prefix hostname; identity bypass).
++                     */
++                    pj_str_t tmp;
++                    pj_strset(&tmp, out, len);
++                    pj_strdup_with_null(pool,
++                        &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
++                        &tmp);
++                }
+                 ci->subj_alt_name.cnt++;
+             }
+         }
+diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
+index 30b4eeaee..ceb6bca5b 100644
+--- a/pjlib/src/pj/ssl_sock_ossl.c
++++ b/pjlib/src/pj/ssl_sock_ossl.c
+@@ -2270,9 +2270,17 @@ static void get_cert_info(pj_pool_t *pool, pj_ssl_cert_info *ci, X509 *x,
+                           &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
+                           buf);
+                 } else {
+-                    pj_strdup2(pool, 
+-                          &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name, 
+-                          (char*)p);
++                    /* Preserve the explicit ASN.1 string length instead of
++                     * treating the data as a NUL-terminated C string. A DNS
++                     * SAN such as "host.example\0.attacker" would otherwise be
++                     * truncated at the embedded NUL, letting a crafted cert be
++                     * accepted for the prefix hostname (identity bypass).
++                     */
++                    pj_str_t tmp;
++                    pj_strset(&tmp, (char*)p, len);
++                    pj_strdup_with_null(pool,
++                          &ci->subj_alt_name.entry[ci->subj_alt_name.cnt].name,
++                          &tmp);
+                     OPENSSL_free(p);
+                 }
+                 ci->subj_alt_name.cnt++;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 89763b3011..893559090f 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://CVE-2026-57165.patch \
            file://CVE-2026-57166.patch \
            file://CVE-2026-77396.patch \
+           file://CVE-2026-84975.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
