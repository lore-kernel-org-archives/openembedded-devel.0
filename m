Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36206.1793161509650831289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=x4JZg1Pd;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so397239a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161509; x=1793766309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR3efk9V945RF1Ehnif5g2/34jpUaH2DQHCr2HZ0CKM=;
        b=x4JZg1PdGe7K40RVABtXY7lXQjTyM8UW7SWi0X1XjGb9rVREHgbJUx8zUaBhMtOdaE
         5SMlrP09fmrHnBJCtXb9PJI3V3tthAhZhP8Buud2HgsJ93NBdNC+p8AR5vLAfYfipAwy
         s6avgRBkElRNH3XnFWcXMBqdIBGw8JB5pVlEPlgAYFXA/XZ4/CiQ+Mr/2yDmTpX4SgTz
         S4LbUbspErouniPaMJrIFpN5zMv/79Ce3i71IhxhTlbyYqBd/r5owTudmslb2OtvMf2z
         moQpUwgzSvlCMkIOQoQHWqYBXp0tuUcCfhhyYVJeETsD2mVyfdSYN+5DtgVdyUEj9Q0e
         9Fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161509; x=1793766309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pR3efk9V945RF1Ehnif5g2/34jpUaH2DQHCr2HZ0CKM=;
        b=UgpSwrfUH4riYWMcWvpk2WNul3Z+L3h7nSm55L/B+rkTAh2io3dVGyNaD3IhsrMbxJ
         8VfzjLuJc0Z3Pw/YxnrxiqK85ZM6cwn1az8ag8DWDjrDRzX2LtkElucTDJILib4qg7em
         ONG2qkC3ID/0/29U2aoPfksl1Kpyi9wWjX9S/EYeRpCoc5EgHhaHZ0VttiFmZnG3xlIr
         KzZ6t17GkumHZqTg1nZAXaUsmGCxuO+XNAXaffzEpE+2POt3QrrN/Dc1teMbS+wqPOL0
         R7a9qHtt188QYbqLIixfWtNFbKoW1APZQHyG2V2saU0m+8IPbKKUXa05U3s5RIBez8Aj
         uM2Q==
X-Gm-Message-State: AFq9FYLC5gpBcNQq6h/0lzRGtyhOMaOwUY0AyRgOvzmu5QtVujCjhY96
	GeU0n360RkddYDCjmMChrIPc3sUrVWgNTDMch2vb6Vb7C/UqlNw53ISdS/Ik3Q==
X-Gm-Gg: AYBFou1Ko88orN0Yl7uxiEuZZ1EfXBj7KXvbD6HXUwFcjg6lVQUqTVc5VLpYmZG3zNh
	WxIx0doTi95f150nQzosRquZUzS/yw3zwAVlTHRKHvnHq5ErzIJwJPV4uFJ+dd5UNl0s0TND6IY
	IsFKjYwxGxjHhKqiQGzQWxARVEtBNai62o9FdVMHO0CkNCcW0HGR2aHL58+0GDRpJeB6idk2qx3
	zN/VIjaHm6IyIxnyvy6wdqOw/dUFfYCBYEuhFjLlWSwjBFNh+Jdh1cXR51oDlsehsgBvcsvoliz
	vHpqJg+66pC8WPVGJQaNYXZljFC9RydWw/0cPqK9tKb3xlj0zKc0fqk7IStKbr4bgg/FN3tW434
	1FcASzgLZBNZlNQBxa1hwgmmPR2RIEUfbhRiyk1aN9Rf2aeN6bvdOsZX2FIlbs8uza/cWFKa3tM
	zvCIjE4xDbNlLPNiGJQEnpSZhVSM+pqqikruw8irBNZkSL0ah2AvI98Z78K/iy4vbhlST9K221f
	2OPUDK5qfSUxsPVLYJDbPSRcnwDd9smE4CC2ethHjfTbukF2dOP1xdeaEomrs+oMvcq1caGemYt
	mMEatxIWOwIwMHpqoJQtH7I3AUQ+lmxE4olmy67QF4kgNDE+ZOVoZ9uiA43WFA==
X-Received: by 2002:a17:90b:4c87:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ae5836f031mr899396a91.66.1793161508776;
        Tue, 27 Oct 2026 21:25:08 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 27/60] pjproject: patch CVE-2026-57163
Date: Wed, 28 Oct 2026 17:23:25 +1300
Message-ID: <3cc8b60359265c8c6a34242f6c9eb8c3b3c50108.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131579
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57163

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 
