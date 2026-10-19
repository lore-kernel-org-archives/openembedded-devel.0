Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1743.1792434866571233398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WZ2pxknD;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1572263a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434866; x=1793039666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbFFBbpZhf6Ixs2g6yTVI2F6yuTe5/AlDRy9rlR/+RI=;
        b=WZ2pxknD5G8IyjZE17MJe++dwJ0znLG3cO8a4/N/Q+QLsvQ2wE+A5YdWMSr6hwt0un
         Es7EZWpTfSA8yDMFFyX4yrxi1KZL+bpGS6XQ+E6gEEaYpUfSzi6S7Euce0X0Fi0o6bLV
         H/+E3W4qo4HiE1Y7ttBbQmmEk+MpGhfMIotK3AVtBM7t3VqTRKovgdAG+N0CpTYrEGMM
         S7WaZx/fmyrFq+xoTIvPh8QrXQA8kkdtgn21uFder7cJJAkrBzyJs3FDgiRWKzC+5rZ9
         I8PWpdUe93QgySzTfWrurDC407H/+GZrIWTf90VM0885yhxORZ5YlvbNCJPjG3nA9XtG
         XEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434866; x=1793039666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbFFBbpZhf6Ixs2g6yTVI2F6yuTe5/AlDRy9rlR/+RI=;
        b=PWyot77q3KTV+JzCRUttSgtBRK6hykjdYnaKejLad9f670p55kEoW2niH+2UUCd1vC
         6bDSEj/o13QxCYzfZp8LwxJTme8MHnbjQEsYGGxOjgqmqWOrSKE0UcN3XDxetStdGI39
         76XRoWi548F2fDqmJGI8nfrdKiBDCNSUA0jYCZL2v5BvJL2qnU4gjdrgNtOo1Yvhy4Gt
         /zAtm/xqe62lSnXh/MeRbQKPBJOk5Ax01EwbX5zwG/DuRwv5lO5l/ctFa2GjBIxCdfUv
         qrDTAPgQnfmViLuOyMJiIt3/zkUs4fthIxCiRl9J93NLSG8Dbs2OtKIA3sM6ZakXfJHW
         DlAA==
X-Gm-Message-State: AFq9FYLLrq5Mk7MKa+zRfPx5uM1qmdkPOj0NESlVrxQyXZWOpfJ3Zj2Z
	R/y65zhwXQ7jo1q64x5MPhsL6UJCItZMxp4mwX2q5nsLui0N3He6ozTt1ECJfA==
X-Gm-Gg: AYBFou00hwW46SPFENACPGbbEwQZsHW9uMT6KRRrWsyiy/sL8QwN3zotu5hw50r8MnD
	gLaVgpHUeiLEL211UPNOwSHm3vkivKMynB0R8mBVKzoSVhJk8mVoLXzxt/pS500nZNXJjzAQLuO
	nbmm4aF6D4VzvOIuD2GF90xpY7vxzDZ37zuFojaIWU/ZyKHB0w4kYRThh77XcSNME6fdUlg4IzN
	SMzjx+f3f2ugpELcFOy9KllcSUmXCpNP/iQZrdhf/GY5bkG0Y2OopL91PUEx2gCgF8HlcSq3jT1
	Fo8d3VDs35Lq/X+UHw60dxQOX8rPGLabhohG3JcnsaN9Fqdb2FQMmlEVzw/57H4mONsq1HUDmnG
	Mj5gUwgZc2zU/8zuBEc/VOaBBpRYTaXy4JnzC9uSUnv9He4IxSkbXg0sU4v8KnAdSjoH9PgOiD2
	L7hU+8NjtRtoKmA+QQ9OCBqiS3c9g9MPnqkppAqrlkz3Q+7jY4ZjGp2LYaapdvnkwwDLXHsjlAE
	5qa/wRo1Iiq+pBoV+rdD9qUcB1ocnLWoyOhdMc=
X-Received: by 2002:a17:90b:164c:b0:3a8:23eb:d1d0 with SMTP id 98e67ed59e1d1-3acbb976cf0mr8100164a91.52.1792434865727;
        Mon, 19 Oct 2026 11:34:25 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 6/20] pjproject: patch CVE-2026-57163
Date: Tue, 20 Oct 2026 07:33:52 +1300
Message-ID: <20261019183407.1037972-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131132
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57163

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 3cc8b60359265c8c6a34242f6c9eb8c3b3c50108)
---
 .../pjproject/pjproject/CVE-2026-57163.patch  | 52 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch
new file mode 100644
index 0000000000..7b3c681cb9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch
@@ -0,0 +1,52 @@
+From 2276d5ff1fe185a6bb51ab741dd5d88e45dbaa47 Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:46:16 +0700
+Subject: [PATCH] Merge commit from fork
+
+The SAN-counting loop in tls_cert_get_info() (ssl_sock_gtls.c) called
+gnutls_x509_crt_get_subject_alt_name() with len still holding
+sizeof(buf) (512) from an earlier getter, while the output buffer is
+only 256 bytes, so an oversized SAN entry overflowed the stack. Set len
+to the true capacity (sizeof(out) - 1, matching the populate loop) on
+every iteration.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit c4a151af86fadd16d9480b2603eeb2abf4fb4f78)
+
+CVE: CVE-2026-57163
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/c4a151af86fadd16d9480b2603eeb2abf4fb4f78]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjlib/src/pj/ssl_sock_gtls.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/pjlib/src/pj/ssl_sock_gtls.c b/pjlib/src/pj/ssl_sock_gtls.c
+index de3d5e99e..68ceea3f3 100644
+--- a/pjlib/src/pj/ssl_sock_gtls.c
++++ b/pjlib/src/pj/ssl_sock_gtls.c
+@@ -1018,12 +1018,22 @@ static void tls_cert_get_info(pj_pool_t *pool, pj_ssl_cert_info *ci,
+     if (ci->version >= 3) {
+         char out[256] = { 0 };
+         /* Get the number of all alternate names so that we can allocate
+-         * the correct number of bytes in subj_alt_name */
++         * the correct number of bytes in subj_alt_name.
++         *
++         * Pass the true capacity of 'out' as the in/out size argument on
++         * every iteration. 'len' otherwise still holds sizeof(buf) (512)
++         * from an earlier getter, which would let GnuTLS copy an oversized
++         * SubjectAltName entry past the end of the 256-byte 'out' buffer.
++         * Use sizeof(out) - 1 to match the populate loop below, leaving
++         * room for the NUL terminator GnuTLS appends to string names.
++         */
++        len = sizeof(out) - 1;
+         while (gnutls_x509_crt_get_subject_alt_name(cert, seq, out, &len,
+                                                     NULL) !=
+                GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE)
+         {
+             seq++;
++            len = sizeof(out) - 1;
+         }
+ 
+         ci->subj_alt_name.entry = pj_pool_calloc(pool, seq,
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index f47d661400..de8c847271 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://CVE-2026-57160.patch \
            file://CVE-2026-57161.patch \
            file://CVE-2026-57162.patch \
+           file://CVE-2026-57163.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
