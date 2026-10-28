Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36210.1793161521315687566
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QEXvC+Qc;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so397331a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161521; x=1793766321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63591MtrLhccxHSSW3kPTqnL4L0Z1tQ/v8jipDncExs=;
        b=QEXvC+QcP0WBacr8eSrPOKNkPO7Au2LTWGothdkopbldPH3OACp62HE5NueN7tv/Qo
         ggDFiliDVSFSBtz4HH9A7nBt2WSctb4fOg3Kb7PleVTQTQBwN6Up4gUBXt355SP0t4/z
         yErvAv1fFxOy8f2oDwWoXtySXepnbVxkG/4809A2XoD3DYJKmERQyreWqHT/cW6DFT3m
         LCxDf6/zEnhjUunMKzJ61ko56dHOOFsYDA7VhXiuMKEy9Fk+Tor/H0enKfbttoG5zrG4
         q6P6VKfjxW1HNFltcmzQYMcsjWpIqfwjIBGgHWJinFWjSucpHt50T37SHKCZ/oM6Julp
         udOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161521; x=1793766321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=63591MtrLhccxHSSW3kPTqnL4L0Z1tQ/v8jipDncExs=;
        b=y32fyyRuuXJGc9LVZcUhpNjZaAc2l4G/iZuLy1ORJTrR58fTX3DhNjCOGByebQe3JE
         t/M9VnjfwnB9H3ETECrrEZWXqmXM54fiNSLLEnA7J34DDB+97FFFMMhI4FfGaKikqneu
         z7QhBWISQrTij4Xr6JjUK2F0/g/dAKv3dwSkOSGpsNxRw2dV5d1Gk9Ot/pXUSID9rc61
         SWcXwd/hxR3l96//xrGGn3hiF7fMG3MznyKQEYne94ZlsprduX8/5CATpGRWWp1kI3Fk
         5bbbwOy3yzSIbPhqERPTLurYOUavGpBoYYMyJE51+wqdT3mkKbyGff9HM1uD5zgx2VSP
         TZeA==
X-Gm-Message-State: AFq9FYIK23+YmimPOaP300vNUTDnS2lrzVmsyu5OriIH/C3AaD+UBGWk
	1c1RRWyMl1WOZd1Ah7/1WltAeEMvbVQ6IDw95ye6o40Eq930BWv1YOgCXemplg==
X-Gm-Gg: AYBFou0M0nygJoQj/+5N5uiIWruCNWIG7S+2MgWdMqOQeV5uts0ZQsI0NMMXMtv1hZE
	cdm+0LqFYbOzzW/DhpItg3TMwxnlg7ak/ogbhVBckGFYVu7gVY59omIssyt6MFdVXOf0msmXUK1
	cXoL7LmqRO4bmPlJGYRFSrUVrnykJw8J9qJmKlU81RjNUIKYNznMtbPH1/2aQdSCN8vaU8g2yIF
	Rus0NbTDg+qHfUJ8TXO1BOkYdBv+eMCrizhXbXMUuXusfhLaozF3pUzUO97A1rq4w15Do4eHUnT
	5x2txMbFIraD1dIx3/PpmOK62m7JvKoJjSTr1tE3h04hE/d69KzePj7ghQVfvhZFMYZJjWk/Ue4
	uVRcU8+Zj3xLdw26xeckj6DFVb1YZVXA9Xc/tjg92kixt3QKkO540ySqI1ZARyFq/q6TOZb24VS
	DqLXD8lonXO2AMTB35mU2jwvcENV4zLYMzeKOm0HjaU5NMqtMZMXcZj0ygM1WwODokdnWCa6gWA
	JvkF3t/XsJVT8z1d9BcTwejmZ8Gn2t5F/S29U0JetbJ/HqQga1q+KDfUXt6DjPezpqheCQjeKRI
	pv6/tr78x0o5MV7sbhSDcDdXURWut/viQ67Su+ZpA0r9KJcKqlppmlTrErXBsA==
X-Received: by 2002:a17:90b:4fc2:b0:3ac:403d:6232 with SMTP id 98e67ed59e1d1-3ae583142f1mr870429a91.55.1793161520619;
        Tue, 27 Oct 2026 21:25:20 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 32/60] pjproject: patch CVE-2026-84975
Date: Wed, 28 Oct 2026 17:23:30 +1300
Message-ID: <7629323ae333315b84a95f6a17756e53c9dd726f.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131584
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
 
