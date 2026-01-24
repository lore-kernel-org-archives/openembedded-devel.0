Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91760D715DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14298.1769236214768805045
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CT6K+ObO;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso24142625e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236213; x=1769841013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11ISxnbPruBEBQDpjfDdqTY0ANE6canDdRC19CS/CYo=;
        b=CT6K+ObOs5XxTQ0A8//FUsswZuuwKnsuAIxDlhgRT8BLLrVxc953lhHFhlVkXDqKXL
         /vCT0xaMXAkkkeBWaHu1ECpE9e8dEbm2K4SoPlsRxpRSM9LgOTm7S/R6QR97gwhpYpI0
         TF5q5tpESgNsFi5ZttczLh8+pwtz1i6bQca1QYZ9Y0sqLyhbdkFfO3VJ8rhUUjSXYv2w
         5qzfgUVgvkVr9ZscYbNntUccsBwV0kw23A6Oyf9q8+leOWZC9iYwGog1TkgP/m48fVZN
         d6Na9I+QIVfyyop3uMoeJs1lIV20KL5dsJsCoJ5bs4xxJvRy534F97Qa6Y0D3b48ByvH
         +zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236213; x=1769841013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11ISxnbPruBEBQDpjfDdqTY0ANE6canDdRC19CS/CYo=;
        b=Z9dzmMSNe3A3a61FISvKrWNUbQ7uTBlG0LehZagCLuGNHHVa8259x9JV2FBFWQsW6f
         XGuMYSj2Tud2bpC5LaxmBTUYGt3A83NI6MjGiaBQlFh6cW2lXb64DZ0SgM8u6p+gEkrn
         1w6BW287F7QV1/DJyBS2D5imuOtiG9LitcgWNQIB/UXKvvCIDDn7UwvlwLTxZ6B3RKYF
         xArSJiNYHHrDEMVFGhinzXNuIjt71vb0Coze/Hp9EveA6eQVH1sFc0M4GXKwyjxRzCH2
         CYAT/4fHKdFSxBrPTJquh2xqiX80iA0ekofLyARBYxUPboXiFgP3GoDbJmbw65LkqChb
         BJRg==
X-Gm-Message-State: AOJu0Yxgw4UafovAquX1KqlVK1PAWlldFrq9RjK3AXW9TUm9GttqPm2n
	SrwwWB3+HOkeQfFRHC3WSxzTjm0uLQrnpxMgj3kHi61LV3PNpzEVClJP2Hvl1Q==
X-Gm-Gg: AZuq6aIe9iRh9zWaQE2Hv427evCckabutjFEpKT6eQSJ3QAL4ISyM7+kiJ9RpMe4Mw3
	szTzOTEOzKGRo3QPM4YP/ghAp5MvRi/+PL6HRqC64VWHaBrYOgSCEx5cmIwKaTGsoJufrWRzj4z
	4m4mk7cZkPjGBBAGEwNbcA0PFAiy+o4qgfM0Ua+q+REOhRnd5as/uumVPPJ7szhl1nrU48cH2SO
	+So2wx1/FeXqzEuaVtp04F+jmnOLIr6HAKmjgRlxPiMA3/xl+XnxRlfAwkba8+eZUQVhHZYgU9c
	vdhX+wK2OPSP8mVBI/A6CsCHJVmbDtYM1QpcejWZkNJZq40fl8nnXP1RyjYTIHaY2ApbqQzkEeu
	CgBUdGbMqd6QnD9XttWK3ruvW1hcYnTEoFb+juKdIzjgUojagmbslkeFdpjk5ZiO/lBroc+UxHr
	8l5f02NqRN
X-Received: by 2002:a05:600c:6d03:b0:477:a53c:8ca1 with SMTP id 5b1f17b1804b1-480470c7671mr83697745e9.14.1769236213058;
        Fri, 23 Jan 2026 22:30:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 08/13] xrdp: patch CVE-2022-23482
Date: Sat, 24 Jan 2026 07:30:02 +0100
Message-ID: <20260124063007.28313-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123814

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23482

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 31694c82e3269855fe6a9cc3614f66c4e1067589)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23482.patch            | 69 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
new file mode 100644
index 0000000000..ef99baa8cf
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
@@ -0,0 +1,69 @@
+From bb9766c79f24a0238644e273bbcdcb2c9d2df1bf Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 11:05:46 +0000
+Subject: [PATCH] CVE-2022-23482
+
+Check minimum length of TS_UD_CS_CORE message
+
+CVE: CVE-2022-23482
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/bb9766c79f24a0238644e273bbcdcb2c9d2df1bf]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libxrdp/xrdp_sec.c | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/libxrdp/xrdp_sec.c b/libxrdp/xrdp_sec.c
+index 691d4f04f3..084fca6b8d 100644
+--- a/libxrdp/xrdp_sec.c
++++ b/libxrdp/xrdp_sec.c
+@@ -1946,6 +1946,17 @@ xrdp_sec_send_fastpath(struct xrdp_sec *self, struct stream *s)
+ static int
+ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+ {
++#define CS_CORE_MIN_LENGTH \
++    (\
++     4 +            /* Version */ \
++     2 + 2 +        /* desktopWidth + desktopHeight */ \
++     2 + 2 +        /* colorDepth + SASSequence */ \
++     4 +            /* keyboardLayout */ \
++     4 + 32 +       /* clientBuild + clientName */ \
++     4 + 4 + 4 +    /* keyboardType + keyboardSubType + keyboardFunctionKey */ \
++     64 +           /* imeFileName */ \
++     0)
++
+     int version;
+     int colorDepth;
+     int postBeta2ColorDepth;
+@@ -1956,7 +1967,12 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+ 
+     UNUSED_VAR(version);
+ 
+-    /* TS_UD_CS_CORE requiered fields */
++    /* TS_UD_CS_CORE required fields */
++    if (!s_check_rem_and_log(s, CS_CORE_MIN_LENGTH,
++                             "Parsing [MS-RDPBCGR] TS_UD_CS_CORE"))
++    {
++        return 1;
++    }
+     in_uint32_le(s, version);
+     in_uint16_le(s, self->rdp_layer->client_info.width);
+     in_uint16_le(s, self->rdp_layer->client_info.height);
+@@ -1994,6 +2010,10 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+               clientName);
+ 
+     /* TS_UD_CS_CORE optional fields */
++    if (!s_check_rem(s, 2))
++    {
++        return 0;
++    }
+     in_uint16_le(s, postBeta2ColorDepth);
+     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_UD_CS_CORE "
+               "<Optional Field> postBeta2ColorDepth %s",
+@@ -2138,6 +2158,7 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+               "<Optional Field> desktopOrientation (ignored)");
+ 
+     return 0;
++#undef CS_CORE_MIN_LENGTH
+ }
+ 
+ /*****************************************************************************/
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 308822e8f5..0faf664f61 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
+           file://CVE-2022-23482.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

