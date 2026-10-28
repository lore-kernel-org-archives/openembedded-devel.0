Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36207.1793161511733583497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xY3s9D3T;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so856746a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161511; x=1793766311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my3aHPQ+XKAsKwrHoA/J6cftaiRbxxhRGb8taRcnlyk=;
        b=xY3s9D3TEpu/vO0iZ7BIJ1lEH9iCH6s5gxjVgHwQjGdWtHOemAn63V5hyJW5USCB/5
         wJqSZcP88aPgoHVB+dDGcHjUTWKEPa/v3z55TIcY2vQkMg91XWGEV7Hiav4WIxLgRNcO
         4h6n51MIdrvEit7SVgxvNpzGhGcAfVW7EBr7xTcwB/wkw+NjCk7CuQ8JNZiZNqb1BaKK
         rNbYJzBTehjP8kUxWcPa4yBTuzXhcEjgx+ZK3gnVeIwnOqq8gYoTWeslkq3jIW8wLSLm
         nM1DFjAwh9hlf1amBN0VNK1HKrIqVWQv5DWK63Bto5jwE+qE/8FB4C2mlYtHr7P+Q5D/
         z03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161511; x=1793766311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=my3aHPQ+XKAsKwrHoA/J6cftaiRbxxhRGb8taRcnlyk=;
        b=xZeYg7x1lo/qNkwMVlUd1NZB7fzVrDlu7Qa8coxG7I+0/mE/Ar6lVuyllWSNzmBNI2
         OQy+61aixcwjphhVg4OLh76YzVdSoulm31KBv6Gp2sTGU7Qd1nesmiqYu9z6646qVFeU
         AQWOc1Qix2EgExs/ySArnRDf7WTONBcO+Mrn/gBMD4/fNC5IVRoAzIxIBq7PukgkxXIp
         g+eMfF60/wgHXFZY3t/dkwP9KmBRwLNSq19PFxQmojv8yzsD8v+k8V3bKWJzsf51L9ft
         FC75F2v0S6s8pBSw6g6b+lpWD6mKwtuT1iynzaQYvyJSWzpUNsPS/Ah7kitArnleq9w2
         BxHQ==
X-Gm-Message-State: AFq9FYJzylJIHJtjy7icn8Aiq0/EYtVhoFt/7nwQiuQBUObEGuNhD7Bq
	Ydm8otNi7AKsmyOx9ht598P4iAjavUHiFywHFDf6pAB3/G6O44giQ1ncr4Vtyw==
X-Gm-Gg: AYBFou0B1J1/BfayNT1/70lCLG0XHb+LmhBKC8CazlEk+eZQ4vTvOj7zSNj+gdEwc9c
	6h1NjPtdGvavOGRO4WYsH62QT3JV5gfYxARkaPkeQplk/WVCY9paL9u25wPZ4oS7N/BgkuDk4m6
	1M5ljhlOq75q5WCmX7gk1mF2brV+jJNFfFO7l/O53sm6mblpBMpK6O9Jwp4Q9QpE+UudhOjMCua
	v3UrLK4RwicKZYI5UFqEvr/9DM0pgzlT4Lw7ZkXRBXcK9J4y55lLov6hFYqNGEGNg+YpGXgLIuA
	n1D8DqhQLJG75VQZmV9RGwrkXJmJTSeDklBEzNvYxLKyyG9IlpYvLiZbkfzaAaFPxDsfg3dVyk1
	1VwTvq1ai/rYEH4pKM8p303V0HxlvJkYvFDdXQHh9hPbldH6kzMnXu9NcZEXzvxI51AqJXdyvgb
	N17Vh6+gCStalm2hw81Gu8flr/ln5vayEetF5Zm0HXmeB+EDT6mm7bm7c4Lumrd+klKkbdbbc7R
	8/myF/pR29Mamj+4HC2YovanFV+qQsw7FzH2yZrEuQ1Qt3IVLuEnbKtfa3km+mnm1jwF9TxW4+j
	qx9Cf0Ja4zaL2lqOFFwQrVRqxtp/EbYePjfBWYikzMSglnu6elJNTw58J3/GrA==
X-Received: by 2002:a17:90b:1c12:b0:3ae:1593:c1b7 with SMTP id 98e67ed59e1d1-3ae5c8e81efmr215813a91.42.1793161511061;
        Tue, 27 Oct 2026 21:25:11 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 28/60] pjproject: patch CVE-2026-57164
Date: Wed, 28 Oct 2026 17:23:26 +1300
Message-ID: <274e935099c034192a6815a660b6e8ce0ea9ab92.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131580
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57164

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pjproject/pjproject/CVE-2026-57164.patch  | 66 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch
new file mode 100644
index 0000000000..0686d681c3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch
@@ -0,0 +1,66 @@
+From 1160ff3c15cfa79f50d4bc6ce8066854f656066c Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:46:48 +0700
+Subject: [PATCH] Merge commit from fork
+
+http_on_data_read() in http_client.c grew the response buffer by a
+single doubling, which is insufficient when the server sends a body
+larger than twice the (attacker-supplied) Content-Length used for the
+initial allocation. Loop the doubling until the buffer fits, with a
+floor for the size==0 case to avoid an infinite loop.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit 8d5956afab2ede95ddb199078dc19a8ac0114f3d)
+
+CVE: CVE-2026-57164
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/8d5956afab2ede95ddb199078dc19a8ac0114f3d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjlib-util/src/pjlib-util/http_client.c | 27 ++++++++++++++++++-------
+ 1 file changed, 20 insertions(+), 7 deletions(-)
+
+diff --git a/pjlib-util/src/pjlib-util/http_client.c b/pjlib-util/src/pjlib-util/http_client.c
+index bd441acb9..d2771d240 100644
+--- a/pjlib-util/src/pjlib-util/http_client.c
++++ b/pjlib-util/src/pjlib-util/http_client.c
+@@ -432,18 +432,31 @@ static pj_bool_t http_on_data_read(pj_activesock_t *asock,
+                                                 hreq->response.size);
+         }
+ 
+-        /* If the size of data received exceeds its current size,
+-         * grow the buffer by a factor of 2.
++        /* If the size of data received exceeds its current size, grow the
++         * buffer by a factor of 2 repeatedly, until it can actually hold
++         * everything received so far. A single doubling is not sufficient
++         * when the server delivers a body chunk larger than twice the
++         * (possibly undersized) Content-Length used for the initial
++         * allocation, which would otherwise overflow the buffer in the
++         * pj_memcpy() below.
+          */
+-        if (hreq->tcp_state.current_read_size + size > 
+-            hreq->response.size) 
++        if (hreq->tcp_state.current_read_size + size >
++            hreq->response.size)
+         {
+             void *olddata = hreq->response.data;
++            pj_size_t new_size = hreq->response.size;
+ 
+-            hreq->response.data = pj_pool_alloc(hreq->pool, 
+-                                                hreq->response.size << 1);
++            /* Guard against size==0 (Content-Length: 0 with a body), which
++             * would make the doubling loop below spin forever.
++             */
++            if (new_size == 0)
++                new_size = INITIAL_DATA_BUF_SIZE;
++            while (hreq->tcp_state.current_read_size + size > new_size)
++                new_size <<= 1;
++
++            hreq->response.data = pj_pool_alloc(hreq->pool, new_size);
+             pj_memcpy(hreq->response.data, olddata, hreq->response.size);
+-            hreq->response.size <<= 1;
++            hreq->response.size = new_size;
+         }
+ 
+         /* Append the response data. */
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index de8c847271..8e0b358ffe 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag
            file://CVE-2026-57161.patch \
            file://CVE-2026-57162.patch \
            file://CVE-2026-57163.patch \
+           file://CVE-2026-57164.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
