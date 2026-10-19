Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1756.1792434870856309478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OPih8tUj;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06c60065fso865172b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434870; x=1793039670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5vxbbBiG3MDcZW0+nEsjLP6+j2Jhona/nfMZvKXZYE=;
        b=OPih8tUj9p+CD/dTWQJB6D6OX+WJplyezyWAwSFZ378o4eYPNU55Pp9KP2xrDN5if5
         mTFPU+mO8GcGLSD6hUdTUrBewJZUEip5+iGvCGGNyv4cUn2gsEEGYorP01x6Zy8liJKU
         xUva0nAF8uMLpcMpDwtkyHOH4Gg+awZjKl/whpY3VM1aBdhASNhHNF1NI3OCnrR/zn7j
         oopvY7k7I59OkQu+G42G/AyvCeluljkGFhlTKF4DC2z06aQPmPakWNfMiKXOqh6YFrd2
         AsCPMeb4mPp84+Xw6XYdOyqd3vngXizCdm36gn1lEqrXP/KcFLyz7ZqwBieSJUbgzMIo
         T6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434870; x=1793039670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5vxbbBiG3MDcZW0+nEsjLP6+j2Jhona/nfMZvKXZYE=;
        b=g0SG58HCv4Qq8sMAp7Q/NHzNwPXI9BOIkSOLTHbvvGPrqK5Z9KXOt9DIMU8Vxt1Xue
         qOKAH/gyvBBTAgMh0BM6hyEuUfsJqpNyVHuyrHdD0ucVCo1Maevm9KzjLFmfX5C+hL0E
         sLhQnEWH+De1hfuu/mIaV/fviU7R03imEqxaOx6u/wdoUtKeeaZF4M38DU3sYMAhzINx
         CPTd5JusEfoZEC8NdV7W7AaYCZDzh837j+ann4R0dHR1YvxouDS/K7T+ycuK/tskqoQ+
         +Twp1rnmH7/hi8tbUhzVieUljEgeGpCfBgRB9Nn1tUaq7eaC80EjvwOJrMl4IpYseN9v
         KXbw==
X-Gm-Message-State: AFq9FYJ/jGfvjW+DCnhKAUiB3NXxalSH8OXurc78EW+oF+eIvSY8k7kh
	wTEU+ZzDNiDU0Q3xFZfFfvPxi2u/0NBgxsyCDF839o1i5Ttp98hav84hPM+Qeg==
X-Gm-Gg: AYBFou1W8yFIcx6cBp+Wz5pe/pTOAfB3z8zjDCZ/zPWabdBAqxDwSy8YaprfuOUTVf0
	DRxACQSi75ZmDtxp436x+L9nqCP8D3aHsGrQ+ty1hwOQYoLUX8mzDBhZm4on8LNI8Ck3LJrKU+D
	i/eXzEz4A3fuPvsg1Mi3TNRC0leFUhWjhQaZ3q3SJyoeV46nZyek/UjIK2jkiiI9T0/tdY8Qnfw
	F5dPzxNS+JLTWrJsmMbIHVj9Ha3s2413xz+DWGhqjB0XqV5KRYcN9Zr+HkRpFWdcmn+R691kwfB
	LMAGO+MKtPn9SHhP3Ohp0AtR+lf3oJYrKIQdS7dKaAX+gfY9aLgpwybzM6kHneGGU9SdC09kSrf
	WJcIYf6OlOkjxB1DQsLPUpa9i10pV0W2QAC2kQeWZFJ5djmlIT93xjTP8TR738oBFI2SHEGLgzS
	yJ7zgLPMRzN1tchZJPwdpWhaVOhfVErLzVb6LCpGn/AFGg5vw/HStdVyf6QJ4M0DabApXKbyrj4
	uI6SQlY0g1fnu4zAeeLcPGGXqZ20Lnj0c7J2BBhlCTy25SVzw==
X-Received: by 2002:a05:6a21:2c11:b0:3e0:c346:734c with SMTP id adf61e73a8af0-3e2260e58cbmr6017975637.89.1792434870205;
        Mon, 19 Oct 2026 11:34:30 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 7/20] pjproject: patch CVE-2026-57164
Date: Tue, 20 Oct 2026 07:33:53 +1300
Message-ID: <20261019183407.1037972-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131133
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57164

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 274e935099c034192a6815a660b6e8ce0ea9ab92)
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
 
