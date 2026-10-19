Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1753.1792434878468957009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aDkcOwZJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1559856a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434878; x=1793039678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvGCFxApCXtnKKMFftNNWF+BbhWNNdxvvkqXIiNog3E=;
        b=aDkcOwZJ0AocEYxrwAprF7yjJx+mkYJNEeaTzJ7ChCHElU995n7Qfb8l560RMCBHRu
         z+jW+QlsUUmrIuaDgzXmv5bmVifcjPXPn+x3fjNx37a3nc1OveEkucMvFS/qjcxetKq4
         AbUEfpQN0mx8diVLVPvFntcoTxaIZpiL0KTkGb+QD1cQByZOBGkH/XITqnCfEhEhQnbU
         q4pTunpP9c2FRceUmb82ZahY7rbkgZcDmlzcfLa2rAcfxWhYjvtb5sVNPQ4YJtdrOdc6
         k7FgmJJ/+Tq+hbNBRgTMBF8nuKzRgySAakNaO5ADJaCLrAHAa6609PNeIog/tZRhVnic
         E4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434878; x=1793039678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvGCFxApCXtnKKMFftNNWF+BbhWNNdxvvkqXIiNog3E=;
        b=PJggRI9JNdOf/6HWkPaNE4O5wrT4QpnlLc63AYn6V9TAYQfAlvGwn4mRgEpGrRt39Q
         IAYVAxFwCdCvLEpLIqijPgTZP/JpXDTSzM+ggfLLmKB47TWSIH34j+vVb+7Kr3ndz+0R
         1QI+hDIQJ9JFSkkC15Wnoab6cBo84ITNX9sIxo81UGaffCqaGKQbNrxS7q1VbQkbIjUd
         ZxTyr35H1cUamb98FjPOtng2IzJery7x4MGPXH3MkPJ50avwYJNeMiJjemded+4UOXr7
         xb+W9JU0ho2VT1xjY9d/6e3HPhCPYFf6gVwpOa2AOi4OQeook71DoRn4dzbRg/iksRn4
         J7mg==
X-Gm-Message-State: AFq9FYLnduwAziWEywjuGBCD6ftT23HJfcvE9KTQaLR+1lH1mUSP8cur
	DH4loLg4Im1NsrcoVUJM+RrUk7QAOpzuiPWK8GwPguLoTyzYBk3AYRA03uEcTw==
X-Gm-Gg: AYBFou2EuYktJyccgc31zHqHL0WEWtDt8GNzUz+BYMFws1vSoAD8GntZqRsGdt2D9Fb
	kNhJkFAx6w0go05zlDwuTthYEcdm0VPhjkBtch8eAERTClCbgJ0ja+R31+4qZL4s2jLfZZCOttm
	yzLfyEVAj3uwSPx3n/Jj2mXSjSpZn0peUtPSXAxlxFdcJaaduIEVMitEFnGALvfud0EhztEk8h+
	YmcxcnZTj4Z0PgAnrbrQWU/R/f1OQtssS0ewN3hucwJBRZpn6OPv5yawxdxiNVyDgy9Vx/mEMGX
	RDWCfcheZPJIsMqVOFygNSosh+1AEGLcEzmNwuv2PAePHjrUIDxajYvezqp0Fx8Rl6sQjr60PVi
	c+m6HtB7L4xGXcxbWeDDzjjAI3Z3i5JbG3qnt3P26LRZgqSSJYSNeR5yBixlMAGI+kJYdBo6GjH
	GOrSDQU0TjIfjLq7oHEwPrJX2U8iEPhEjUoFKAp2mH1SnxCluUx0D+9KWWPbnxuJmQ6ybwHiPzx
	lg3fPV2HOZ6k8VsTrVU72hNct4w2eL+aHRx78ngUHv8sZdIYd0sGY8ypn1S+kOFvwKluM495uSH
	f2OFPwu4ZfkmBCYqvbDF2rjXb2LIIa0=
X-Received: by 2002:a17:90b:45:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3aceeb9272dmr7962195a91.15.1792434877751;
        Mon, 19 Oct 2026 11:34:37 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 10/20] pjproject: patch CVE-2026-77396
Date: Tue, 20 Oct 2026 07:33:56 +1300
Message-ID: <20261019183407.1037972-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131136
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-77396

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 2f70c43972c254d1a949dd347f81c412bda92446)
---
 .../pjproject/pjproject/CVE-2026-77396.patch  | 74 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
new file mode 100644
index 0000000000..a02268bf11
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
@@ -0,0 +1,74 @@
+From a927a964d462e9966864b7b2c432942b61038d6b Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Mon, 13 Jul 2026 09:27:02 +0700
+Subject: [PATCH] Merge commit from fork
+
+The AVI player used a chunk length taken from the input file as the
+number of bytes to read into the video frame buffer, whose capacity is
+derived from the (also file-supplied) declared dimensions, without
+reconciling the two. A crafted file could therefore cause a write past
+the end of the buffer. The only guard was an assertion, which is a
+no-op in release builds.
+
+Clamp the read to the frame buffer capacity, skip any remaining chunk
+bytes so the file position stays aligned, and remove the reliance on
+the assertion for validating a file-supplied length.
+
+Ref: GHSA-6p2p-5wf8-h5hr
+(cherry picked from commit 7ecc6584969a923c4190b6912afbf5952b5a4b9f)
+
+CVE: CVE-2026-77396
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/7ecc6584969a923c4190b6912afbf5952b5a4b9f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjmedia/src/pjmedia/avi_player.c | 34 +++++++++++++++++++++++++++++---
+ 1 file changed, 31 insertions(+), 3 deletions(-)
+
+diff --git a/pjmedia/src/pjmedia/avi_player.c b/pjmedia/src/pjmedia/avi_player.c
+index dc87b8a41..8b4b94d16 100644
+--- a/pjmedia/src/pjmedia/avi_player.c
++++ b/pjmedia/src/pjmedia/avi_player.c
+@@ -1199,12 +1199,40 @@ static pj_status_t avi_get_frame(pjmedia_port *this_port,
+                 goto on_error2;
+             fport->size_left -= size_to_read;
+         } else {
+-            pj_assert(frame->size >= ch.len);
+-            status = file_read3(fport->fd, frame->buf, ch.len,
++            pj_uint32_t read_len = ch.len;
++
++            /* Clamp the read to the frame buffer capacity. A crafted
++             * file may declare a chunk larger than the buffer, whose
++             * size is derived from the (also file-supplied) video
++             * dimensions; never write past frame->buf (frame->size
++             * bytes). Do not rely on pj_assert() here, as it is a no-op
++             * in release builds.
++             */
++            if (read_len > frame->size) {
++                PJ_LOG(3, (THIS_FILE,
++                           "AVI video chunk (%u) exceeds frame buffer "
++                           "(%u), truncating",
++                           (unsigned)ch.len, (unsigned)frame->size));
++                read_len = (pj_uint32_t)frame->size;
++            }
++
++            status = file_read3(fport->fd, frame->buf, read_len,
+                                 0, &size_read);
+             if (status != PJ_SUCCESS)
+                 goto on_error2;
+-            frame->size = ch.len;
++
++            /* Skip any remaining chunk bytes that did not fit, so the
++             * file position stays aligned to the next chunk.
++             */
++            if (ch.len > read_len) {
++                status = pj_file_setpos(fport->fd,
++                                        (pj_off_t)ch.len - read_len,
++                                        PJ_SEEK_CUR);
++                if (status != PJ_SUCCESS)
++                    goto on_error2;
++            }
++
++            frame->size = read_len;
+             fport->size_left = 0;
+         }
+ 
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 9d1e6af253..89763b3011 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://CVE-2026-57164.patch \
            file://CVE-2026-57165.patch \
            file://CVE-2026-57166.patch \
+           file://CVE-2026-77396.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
