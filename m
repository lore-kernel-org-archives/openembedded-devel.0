Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7523.1792575008729817734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SNIQJO58;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so1571939c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575008; x=1793179808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my3aHPQ+XKAsKwrHoA/J6cftaiRbxxhRGb8taRcnlyk=;
        b=SNIQJO58FmyD05WYqOMVVm8n3r3HDSKYjr/HY3lBvfR4Ds4wMVdngRiN+JoOLw/wHY
         DiUFZW6o+nDyzisOHlgOgMmJoZ0qQJ6YhmwXFSqbQYNFfNoB3MzpGTHKigPLIg2+OmY3
         Z1QZoMSJXJBzwCnxSX/ySwiwaGQpozcZGspVOId+X9II1r++UPEu5X60ZqBU9vPHnX2K
         isJtfISrNlwao6OTllHyCdUHu2vO/nLGAlQD47KEcOcrak00appTQmNQW27LNMW2J9Mg
         HUWW0L51gACSEI9/dSpX8jTAYGKz4FLypI3LQx8Pz4+u+HIThVpQa3VglZogiBaONfL5
         DxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575008; x=1793179808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=my3aHPQ+XKAsKwrHoA/J6cftaiRbxxhRGb8taRcnlyk=;
        b=YQ4QLThSj8I8/ueIASgRoh0u9vF6nh0TvrJ5YtqyXTRg502iHpJ4cqjCrGa4qsgQsl
         VY00sCmjrQHd7le55ItC0jH40eN32I6L91HWYDGdxvqLkGWSxmvuoh0NbbuEzRqWZRzU
         T8bfFdutO/eWtPzXGPkbHJFX+DhHFEbB1PKUNGJp55nmUQQJeT5T5IoGeLM7VxDk88Yh
         Xly7ll2N+cCZCg/6FGq9TquuaW7JkJ5h+uF70bynQbtysbloeOGdcWGaddXWVEqqEctn
         HpJcM3Sl6j9+SjBli7zUQBTzV3bk4DmKItxXHsCtxSMH7pb0eFSfdkqTGFZFAfKPRTl+
         IFNw==
X-Gm-Message-State: AFq9FYKcCaqUBcN1T+Yc2BA1TqGoNu5FrxErPgGlCc/N6XjabkE9eDMj
	mT/7iADnQhQQdjDbf2gzruvZs6GTZLKDN3F9JHdtRoLTVws9+Y/lRjShkpJ5TQ==
X-Gm-Gg: AYBFou3h9xgWWU4i2aGf7Og46N5yjgrjACYfDrgXaiDvBrhvf6ZHvz8kE+WXzo5+vbp
	x9U/yIWRxFR0JorTJQM+YZwvuOk5iVJYVN/VGw2wB2dFWq/VIHPebmVHgJGeMu0kYPr+KPVwBUg
	Yiq+CvVIbDuv5eq3ePPX4eqyDzOCz/sxnoDOJgecuIvNaHTJ8pfqM6cyTI4L6f/GKp1Lcx2ba2b
	HZAjjkq/CvgtqIsfowN8XKVcsrRj5zzS2Z1mlQCLqwIR4KFcmn0ZNJawwwS5uLlGtc/ssT8mKZS
	BP34xRSuKC0kItoJRospZRCsrnbpxbgrgoAWcGTcwqZfd15MUPen96FVLCu71g58X9ux2N1Ljv7
	qJrbjQFxEDYlpKdQdzdjwxwKE2FfLRP/pWZhmdSkMVELobiQMvbcD0dg3DFfGmhLcGCI1gTBG3g
	hQBA8zDfR/ImSIrd40wsfezOZgmpJzJPMYNUDZf42IJGSkVqwuTC37ukMXTROJslo4cnPtR5RP0
	pmEQMx4ElFY5XlTH13eKjo/IeDXVyn0M/OaEvguLGhSvmhlVy44y+MuXjaw2v+/7chqNLzERtZf
	8G1pZBSc3xyXI4ZG0mU7wAFe4EXKvIIaNjzni8gH3/T8umQOIx4K
X-Received: by 2002:a05:7022:43:b0:189:f7f6:38f3 with SMTP id a92af1059eb24-190a465c132mr2416186c88.13.1792575007636;
        Wed, 21 Oct 2026 02:30:07 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 28/44] pjproject: patch CVE-2026-57164
Date: Wed, 21 Oct 2026 22:28:41 +1300
Message-ID: <20261021092857.3585453-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131215
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
 
