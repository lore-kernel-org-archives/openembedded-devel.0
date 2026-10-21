Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7527.1792575019279345677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W4mBrsoQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-17bc533fda3so634115c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575019; x=1793179819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63591MtrLhccxHSSW3kPTqnL4L0Z1tQ/v8jipDncExs=;
        b=W4mBrsoQrq7hpaqC55TEAGhqR9ToGdhqp1MZGV53QQrAV/qct0A32iw2QSRMdpQHNp
         WCvCQYopIxCq8HoZUhBC81F7s55k2de1b34yt1zmwePdtBIB+PkBeI0GJA6On4DqctoE
         vwVxPVcvJbjJ/Dv+sC0v9FWhPn6uZgOwodsPRvY7IIVsZrjcBcNB14oWLPQC2KDONFP2
         Ud11wrwOr7AJTavMbzHXy8XqdGWjkBoo64KZln4K/vViYhbJPRnW1WgxYM6hAeUVlG0D
         clxH5xt7cEbiaydtHxNo/GFN+HytGhpSJZ6b8YUNiGXsdaS58mmxBbGfmPhumopEukFf
         VWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575019; x=1793179819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=63591MtrLhccxHSSW3kPTqnL4L0Z1tQ/v8jipDncExs=;
        b=qYxFFfmA/kJK20JUdbZokElBCDeq/2FzEljI8ejAe8m6uxplqDNzHBaTetl1lVhSy8
         sjWJJoT1ilVrVtIZmQFN8GJxkStyLOJQJyqppqzYZFCVWWCOp0z7U0YrdK5KJNQoyPKU
         Q8HxWBZhUHQ5kaH3JL87JnoqYMaw0Cm0QGzPS7u1IFAiEaDB8FGPnkgJBTX3Zsb2sIfu
         HwMiASJt7JtzA0XQ85q424xWRV2NMWoKd0xGOOSwUJu3SAAYZwh31EZMkuzCm75MUNb+
         gmY+4xpD0NAc5v0upx78HUucC9uiiWt9nldQb/rzlkP/gS8y4PIqzTnWiveC3uFLKlJy
         Npeg==
X-Gm-Message-State: AFq9FYJJ+AQWsahGEFHSjxOCRucr9Xq7jNGFaGL82EylXKIJRYh94/Hk
	WgnqAerrGrwyKP1atiU+XWkqLZ7+84Mz9goWiewvWpuT9ycheIfTuNKJyICQzw==
X-Gm-Gg: AYBFou2bSyFndEhDXeOs5e3uzt1TqTLgMQ9OazZhh9f+KzWe0vZuYFaOzIrEvn9fPci
	twz2hOjFFJy0WU80mNjEjhlNdSTAZub8pt7GwRn2/Cz947KrpYutmneaxh+iDR3dKGGp4sGrw6z
	PQJYVq7UrFi9E1NTCngk7Txo7/XpfUY1XG2Rd1ca7bcs6z1XrNnaRupJ37LGD8GktS0UCDtk/ix
	QECLg77+riwSz27OUpfOVJZD21brFYRTkUuiMRJyqvRFN4hjUTtl9KzbpIUMJ/7P3YcDR/5kieF
	uuyGp/dN89fMR6SHA9vb44pUK0tJNim427pF8t9SpTjs04VRNAgRkkOm32DZqT/PfI0ypzanHct
	BXcZE5/AAPH5WQnZJUrvr0Cmt3zqYILlyFcAQbcYCZMV09UUiKOVqmZOJqxwDkDHyO8uqbI2p+I
	tCtHmwbWU4yuWDIWuMoP7yku3yGBC5adrBDflYH/NdU5qUeuaiEqozQHjE+iVzFIqztRpoNQ5Lb
	f+gEogH0GOlH1PloFpRIIm3VU+/EgDRjsDORDrSkk9MwKbufHLTaDUD1N868jtIn018ZsNTMhq1
	PPmMhe0N3Zgd5lF+MEe3n9vRi0FWPHc=
X-Received: by 2002:a05:701b:4283:10b0:15f:28e1:7c7d with SMTP id a92af1059eb24-190a86ade90mr1920155c88.42.1792575018237;
        Wed, 21 Oct 2026 02:30:18 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 32/44] pjproject: patch CVE-2026-84975
Date: Wed, 21 Oct 2026 22:28:45 +1300
Message-ID: <20261021092857.3585453-32-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131219
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84975

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 
