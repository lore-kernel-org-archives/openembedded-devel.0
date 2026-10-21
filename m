Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7550.1792575006048973012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jo6JsCBG;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1517bda04a0so521882c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575005; x=1793179805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR3efk9V945RF1Ehnif5g2/34jpUaH2DQHCr2HZ0CKM=;
        b=Jo6JsCBGX+CgdD4jb9W1FdzUhPRh47WV+/kZP7BcwnlPzwbOe2dodftAWbHbQ3rTq+
         niEwF4G6Gy1UVqktqjQAxBZQc9Qgh2NFVsaACEz2yx/1qqOobOH/pcHTRijFuA0SIexf
         52iwMsBWfmXvKTvcN8uThXteXpsm7Vlmi9HuVu07DCqRPaRRgwkGk4qzkzOoC5aIBUx7
         6LRZh5Pn99Ailf3uEh0x4jS56kHM5mMTMYzEqHDi7Ip8yIt8Ghmg/w/DhtR6M1nRCCFO
         sBMd72VrMJnVEIliWVT8qKEmeb2AKvYKhPBkEFIg9hIjqq+Qlaf09ljctikyyAZ21Xa2
         UUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575005; x=1793179805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pR3efk9V945RF1Ehnif5g2/34jpUaH2DQHCr2HZ0CKM=;
        b=pUIPxhyKK25ff2W13zRU/CW83nB7DIndcAIVwu8m7hfae8XBk5/KWhRmtxwFKZhfY3
         8SwiAgGuzEBnnXJ6HiA/GKBzqcXBSUdxOQN11cldRoEKh2taojR7MhSZBstDQvXdToen
         HDTyRS5E6oNXXIqJ8q1+B8uf8rldwq/xxJIPNnMTP8sFFIz21niI8xvjsRrB+SCWO+SD
         bhXc/7EQOExifpN36dDsgqlurVQdtooV70cRfxGNns3NLFhx+Bh3CLqKvEdPhcJldxwV
         DVQS+OIWhw9vb8EByAmmj8/coBn5cjsLBUkRxj2GR+Tys3/5nzoKjwqU/DJ3V6LXEWBX
         8Pjw==
X-Gm-Message-State: AFq9FYKe+nZDkiyZ4bNzIesrgIV4md/E83ay3npN1rlxCIItOKvBXnEQ
	ZA3ZN202aJNS9dKvEizQbBUgXZSMIV5wd6LLk1jOnsfI6h2VE7I8KB/9wb1v3w==
X-Gm-Gg: AYBFou0PNgI5hQ6gppQ5vocdrsm8Zi8R/uwXnrScLqFgU/WhF9c9mt5CHulHI72tZ37
	xX3NEGnY0x9RktSdnCPfaiM6qwFCLkiluGoB9kRbHWsMoNlOBR+tXl5Lx6Vj7jW64e+n5FdflJe
	SkRmGZlcfjhanFK3N1sJTDMRt2pyN1pkLOfadfFCvNN4849GuqztzL/qiDHND/pO1UWffT0Bsit
	fylx054aLNuxuVN9wvNkc1RGbxGOpr0WHEF3Hucw2pJS8tUdPPDOT2JPdoRlFkNMLiVquj6ioyA
	oKsBnRYDIMnm9OCibY4QzkKKtayPyZAcCGA3NNY7hbemWC0IsKsRL9nANET31k4pTwL+Daae3fO
	d/9iZ6VzwI3/95vcww64mIaMXBFaaItngjNAuhV9usHaBgk06cr0+bb9i8RMHzWOqBwC10yveQU
	Yg1HjM6qKk/4ulcnxA3mpmoRrYvVu5Vjs00XQ/aiYCnwJNzsPl8FCLtFpynKUdk0bypVMAcfTmQ
	vniSPcXqFiX/vdV2nWsNxMp4aE8OzT1YLfuuHjqPGEsoJ+mCKftDsAQu2j9bfdo3D8C5tCa7j9a
	BXuXQTY96J41KQjP6SI/DtsB9fsmid4=
X-Received: by 2002:a05:701b:4551:20b0:144:fb87:5b91 with SMTP id a92af1059eb24-190a7c21caemr1733807c88.44.1792575005228;
        Wed, 21 Oct 2026 02:30:05 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 27/44] pjproject: patch CVE-2026-57163
Date: Wed, 21 Oct 2026 22:28:40 +1300
Message-ID: <20261021092857.3585453-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131214
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
 
