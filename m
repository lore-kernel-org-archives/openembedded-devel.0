Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD27C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31928.1788776675262656263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zp7cTd5s;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so3691654a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776675; x=1789381475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuBhiL2fLTIddje9rQ5MiwRSJdwzNTSYWjBUVmncH2s=;
        b=Zp7cTd5sjt7upYA3I+FMeb0lv1kRG9jGa2iB6jQLqqqt3vrAaEzjr+8C0VtEIlnDtD
         scPfWURt2np74HWxonGXJyPuqEa8DIlxN808Qm87BgDY/s4GqystoAvi9KfEAqjuDcHh
         xdbQX7FgQQY37QVwFVryfp5rdTtW/0VT0RU/DWO4P6QtKcNqpRfrNVBmLQlNBcw0jzZY
         ihWDp1d2HWMJBmsjMnHZbvK7bBnxUXf9uGnX5UKub926nKX6MLVfYGvehcdn9gfKnHQU
         DB3dG5oYkM6hp6jN65y+xwUXfu/81gSU0MuoUFWGfMkcKTqQo8Wm6DXu63So3KX+lzwN
         CFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776675; x=1789381475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuBhiL2fLTIddje9rQ5MiwRSJdwzNTSYWjBUVmncH2s=;
        b=BMafR9e9DLwATFAMvB/U4bFNhdFD6iYpExSU1eGoIP7/zkeW2VRqIwM40G1g590iz+
         c1yvA7zfuuZoPO/dKtbLlc50qpNVKN03mocZOmylPOk2qJWmlAk8V3pueV2AuGUaZw4z
         tC6jQePAzjReVpo5NZX7miztVLGg32qxOHP+7Jhypq/6SA60ZckJ6SYwgWvV2Pu6+5kX
         lXRs9AtYdDg2HFebkNVoLKSGpyLRq8FsQKec/oJInlbUDV+8AMfMrOjM9ggQFZAhuGyR
         Ab/jIEOTv9M8Uk/D7us1lPL+8M8XKdOGkrENowkT2J2ph/CJ3OAdrCqYwxf4kLG3wxHQ
         acfw==
X-Gm-Message-State: AFuF++nHhLLXdI3SRWRzhowB3X44MlB9Zh13AbYZd2tXgvi5NVUNusMl
	yneBwHBkybRpdow5LLhhEZ8ZyK4NCUOJ00eHCmYh/0nHpYkFnwXzhEUp50U5xPxh
X-Gm-Gg: AYBFou14nLY/8seT+fwbeJE552anOzIi0quTNbAivZyreU6UPN5nTQlmAxm+n2i+IV/
	mRIDz8x1S4ZLWCZzWpQq6eAkuUgZtNhAdBtkedSrsf0m4w7osFtvQSxBs0SC3K62ggULKNhjRnl
	uAFmTezC4TVa/i+ZXrQi5I/n4Vl8ioWV+8DhC/yFzgObiERVVXMbc+uPm7F/YzVbe4dXMlz3TaW
	QGuFrG+kqNGbjyvs7+nUIWt+7skGwW/VhAc3M5DD6RMrW8FPe6IGP69G8UuEYT4BfyQ0hbB/NMM
	QqKUcnZIra8EV+L72dpvR0sjlP/BQXUkMN8Mgskg5m23O/fbYkDWEIJgrCyRo5JWgZ1CNUV358r
	zY400qizCx7int1DepiiiYFHwGNstdsTTdXFu3kLQYhT96bb0nsTtx6lYKG/BpWUr/+ZHIXOC7s
	XwEll/XV7176nECn3vQepplpzTsH3Pf8GDmENqsFn61C20AFg0hqjIBvgFnxw340yaLXlahMUh
X-Received: by 2002:a05:6a20:2d26:b0:3d3:adad:f174 with SMTP id adf61e73a8af0-3da3a0a918dmr36395210637.22.1788776674516;
        Mon, 07 Sep 2026 03:24:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 24/33] wolfssl: patch CVE-2026-55958
Date: Mon,  7 Sep 2026 22:23:08 +1200
Message-ID: <20260907102318.2459883-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129836

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55958

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-55958.patch        | 36 +++++++++++++++++++
 .../wolfssl/wolfssl_5.9.1.bb                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-55958.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-55958.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-55958.patch
new file mode 100644
index 0000000000..a1f77eb40f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-55958.patch
@@ -0,0 +1,36 @@
+From ea7c289d463c506fe3eb856c5d128b7d0e1799b7 Mon Sep 17 00:00:00 2001
+From: Chris Conlon <chris@wolfssl.com>
+Date: Tue, 16 Jun 2026 13:58:52 -0600
+Subject: [PATCH] Renesas TSIP: skip XMEMCPY on MEMORY_E from
+ tsip_StoreMessage()
+
+(cherry picked from commit 6ebc379f313769ac49a84be0221c626162ffcfab)
+
+CVE: CVE-2026-55958
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/6ebc379f313769ac49a84be0221c626162ffcfab]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/port/Renesas/renesas_tsip_sha.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/wolfcrypt/src/port/Renesas/renesas_tsip_sha.c b/wolfcrypt/src/port/Renesas/renesas_tsip_sha.c
+index 0d5957744..d04072397 100644
+--- a/wolfcrypt/src/port/Renesas/renesas_tsip_sha.c
++++ b/wolfcrypt/src/port/Renesas/renesas_tsip_sha.c
+@@ -203,10 +203,11 @@ WOLFSSL_LOCAL int tsip_StoreMessage(struct WOLFSSL* ssl, const byte* data,
+             WOLFSSL_MSG("Capacity over error in tsip_StoreMessage");
+             ret = MEMORY_E;
+         }
+-
+-        XMEMCPY(bag->buff + bag->buffIdx, data, sz);
+-        bag->msgTypes[bag->msgIdx++] = *data;   /* store message type */
+-        bag->buffIdx += sz;
++        else {
++            XMEMCPY(bag->buff + bag->buffIdx, data, sz);
++            bag->msgTypes[bag->msgIdx++] = *data;   /* store message type */
++            bag->buffIdx += sz;
++        }
+     }
+ 
+     WOLFSSL_LEAVE("tsip_StoreMessage", ret);
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index f69497a80c..e2bb53a646 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2026-10098-1.patch \
     file://CVE-2026-10098-2.patch \
     file://CVE-2026-10512.patch \
+    file://CVE-2026-55958.patch \
 "
 
 SRCREV = "1d363f3adceba9d1478230ede476a37b0dcdef24"

