Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A4FD339A0
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26.1764954701653933121
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9kZO/hz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso26008935e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954700; x=1765559500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQyCkJEsaBx1RHlVqB/24Og4Tg3xFFDzhpJonchUeyU=;
        b=R9kZO/hzwxo9dezpBGbJuD7k1qM+JfIpIWhW7hMkifim2GIJZt8M5v1n4x2ZRl34ZP
         j7K9dDooqlKC7R2mQ3Hi/zgzL5i6V8fTcGDGNtVfvZ2NsDKssg7yST597yoZqx+dQ0Ra
         bxc7B69WSgVIp3YTIzLvT6GEWd3he2NhHr+J0pVpFXjTBF8DmE1R5NUkVYczDJTls5yq
         nkhT0vuOK1AsmR+8Um8xPJ/57DKx9GdXvY/pw7OsYc7ifogTed/5gBJhwx4u0vsh+Yp6
         dh6aDybQ1cD1xoNFKxKj80ewbyMFuaG2pSyhfvya5YFRlC23rOJFA+6g4YGdc6M73CMn
         jbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954700; x=1765559500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQyCkJEsaBx1RHlVqB/24Og4Tg3xFFDzhpJonchUeyU=;
        b=aM3eX/E3GmtgqiQvu3w3Q5DFv16GuFxnOxq959zMPZoDCoG+45yXxm5Iyh2OkV35fu
         ZnC9qS4u2rv4i6LV7ZAWBWy2qWs4QF8gji2JZdn4LIlEOfcpJq0GrttoxRqzU3AJu6e9
         1P1Bh7saMYW08bZrAFeL22D5vth/S0fLI29TaelUb47u9ypC6s8MqUQPA2QLOggErO+V
         rtNPHxQDPXfdMvIbyfJ+fW25Ov5Gh9HR4BFTI59O9KBHzVq8CVcjezt4Xr6g0HDU90T/
         UJ7ThkflmaxIJ55n+PLXbUL6mVszHfp/3b8OdoV4esIugJDZiWkPJHFa5DGNozwTrxfN
         Kb/A==
X-Gm-Message-State: AOJu0YzFGdM3L2OyWZBbCcj+rpdOz54gOIoHvPlhwpyVfHHbOYwnWd+G
	ovqoXI7+d6vj3gkisQKjnT2uIyB53EOLQuAtXnxlr1mxEbrJy+Copn9mmF1aMQ==
X-Gm-Gg: ASbGncszdVLIf9BFbBWYkqhuQnlt5ZaBo/DBGy72VC4AX7zLiwxBB8SNz6BLxQMJuX3
	ltQgCEteJMPNTrQ5j5jSZLJYKJe8pqq1Noa5kUJp6enWk9KffhPwagDGO3ZL+ijVl69VcJX9/kL
	v9quZZzKUmKwPq2/bch4psQGrDlWTg9BuDicNX7jVjcDpLvnfHFATWbKVkLQY4CWP2yfe/nTpdq
	fS5QVS2VVAMKHddBDuMB/fMBqb9vFgKkl9GoLkmtSKD3/IKDD74nvPtjwUJLSxBONgPK/jJd3EL
	XkQPa6QLFI/4noC5yRkD8lrpFlGPKrGLF2cEuH27TNmjzrkuYlBRy37vC2bfvGVc6mTpOSI1o9Y
	/VX2FMkznKxLUGQRfiafHtusuRFgqlAExZaDHAI+rKbx21JjUEY/OeHvHzJqruUpm4NaT5a080j
	h8Vw9ZgIQr
X-Google-Smtp-Source: AGHT+IHogebjz4Bb4xRkX63XePVbQNz8s62zrk8fATqZ1QQVvHeX1nn8OlGatlZVrfAYUtefLKyFqQ==
X-Received: by 2002:a05:600c:1393:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-4792af43957mr111869505e9.30.1764954699908;
        Fri, 05 Dec 2025 09:11:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/10] xrdp: patch CVE-2022-23481
Date: Fri,  5 Dec 2025 18:11:31 +0100
Message-ID: <20251205171134.1346494-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122353

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23481

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23481.patch            | 46 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
new file mode 100644
index 0000000000..bb2d3c8cfa
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
@@ -0,0 +1,46 @@
+From c77e974080da8267d902f99ca5ab7d22ea02d98c Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:40:25 +0000
+Subject: [PATCH] CVE-2022-23481
+
+Add length checks to client confirm active PDU parsing
+
+CVE: CVE-2022-23481
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/c77e974080da8267d902f99ca5ab7d22ea02d98c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libxrdp/xrdp_caps.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/libxrdp/xrdp_caps.c b/libxrdp/xrdp_caps.c
+index 5c5e74a579..ac21cc0a18 100644
+--- a/libxrdp/xrdp_caps.c
++++ b/libxrdp/xrdp_caps.c
+@@ -667,13 +667,27 @@ xrdp_caps_process_confirm_active(struct xrdp_rdp *self, struct stream *s)
+     int len;
+     char *p;
+ 
++    if (!s_check_rem_and_log(s, 10,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header"))
++    {
++        return 1;
++    }
+     in_uint8s(s, 4); /* rdp_shareid */
+     in_uint8s(s, 2); /* userid */
+     in_uint16_le(s, source_len); /* sizeof RDP_SOURCE */
+     in_uint16_le(s, cap_len);
++
++    if (!s_check_rem_and_log(s, source_len + 2 + 2,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header2"))
++    {
++        return 1;
++    }
+     in_uint8s(s, source_len);
+     in_uint16_le(s, num_caps);
+     in_uint8s(s, 2); /* pad */
++
+     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU "
+               "shareID (ignored), originatorID (ignored), lengthSourceDescriptor %d, "
+               "lengthCombinedCapabilities  %d, sourceDescriptor (ignored), "
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 012a70ef73..db191d5645 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23479.patch \
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
+           file://CVE-2022-23481.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

