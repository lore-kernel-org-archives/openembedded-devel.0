Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DD4D1D899
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38235.1764835003378415823
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/xMi0Ek;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2e50c233so243740f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835002; x=1765439802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5ahqTLCIMHRTL8XM93qAszSpvOcOiEPB44Te1a3TTw=;
        b=P/xMi0EkTlPOiJ4yVEQLUTXMBxH1w439SBSqpE8hI2jz7tC6kHOE2LHrKb4Bpb3qXH
         y3cuMZC6p+19Q6DOx2uk6k4cpLatPrt8nVtYoR7Jidb9vu/ObkN6mhAKFCqPkMghyFQo
         FUbKfzBjQIZ9gOSEyCJlGbXOwM4oFpf2wVZw4KfTo5JznZGSb8oLQcepTVlum5OtcW/O
         xfgZRGuMuIr4xWIuCidHllB6yjz+IVZ2z4V3bUq8UbUse13gXwz94lzgl45avfhhXcBj
         j+hjTIIiPE2xyEe3ffohO7q+BRe3Hsr2pMh4hpPxrfsbkz4orLeIu+zL7YEL8gB4bBrB
         pY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835002; x=1765439802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W5ahqTLCIMHRTL8XM93qAszSpvOcOiEPB44Te1a3TTw=;
        b=rGLhIscDaMTPHTePimaDxb2t1LA2WDJN/fRUR8+KTXAoezkHftP2UlIHANm+LKlCOW
         wj4CoXuqaCrq5Y3Atet4k5N8bmK2oLaT1UcV7w8e3jj0AlKl6ET5Tifx44E5aekkVqxb
         c0IU6aG8Vi4UdiuBOhvROgzBet9fycTkpnYc9FARg8D5I1I+A5oF2SWB4beaXLlR/+nj
         sbP4YQEtzB3MFoUKCWjnwQZQQPHE5fIz1lgMKoRnVt15/0eErkojHsBK/AxTo13HfvTG
         PxmTgb1hOjpexYEUTe1V6BL3XlrERKhzmc3/YnRWPrGT/pB+DeFcXIV0a7mdkJlbd0p2
         FYhA==
X-Gm-Message-State: AOJu0YyevPcYeA24AdbZn3Uu6/0qirsy692yzUv7at5zkAqzONa7TfK2
	I9f8sIEx8y+fI6rEvh/Gb4CnJnLRmyui0u5JF3jhPfjVyEv0PYSr5fxlUygYZA==
X-Gm-Gg: ASbGnctxdyJuYgUcthmQ9C7X57rCCSRZlo3fOXZ/9XoPbrIeylB6kykuqdBUwyfA9GM
	NwVngwxORdBUstRQgzL2TutaAiM/tJUkq5/+rUGmKHjlCxLunW2eDtBAyRQHutOzFd2AgUqqNkS
	bWN2i78cWcb81007/XHXdPyYhzCNWyHTpnkPbuBEHDzA2YDJ7/XR2vSjXWaaoJwr53FUQmbw6Nf
	qd9+kK3qr2EJHSrZW7oCq2kPBNDivakFpgVFTaQPmNiu6/gaAz5JPBJhWES1Qx97xw9LbkQLbp/
	8TE4souVn44Bn4gdx/j0eqjirGWyg6aUfGB6/zq6nFW05Niizt1qw9pRHAdJcouccI2ibefvwUc
	zwcZtJs48ShttLg+hGqqSUqv4ESxGOsb3NJgiBgh9jkRoqCRDzUCwlxs9c1k19MAn6Qp574007L
	hfZqWC8AJo
X-Google-Smtp-Source: AGHT+IH//0aVW5xd33eH0pC//nTWkqIkknMSrJoZb044t89QQ1tN4sEstGZLMbJvS8lgx3MD3MoqsQ==
X-Received: by 2002:a05:6000:4011:b0:42f:760a:764e with SMTP id ffacd0b85a97d-42f760a79b7mr4685539f8f.32.1764835001636;
        Wed, 03 Dec 2025 23:56:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 09/12] xrdp: patch CVE-2022-23484
Date: Thu,  4 Dec 2025 08:56:32 +0100
Message-ID: <20251204075635.1088007-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122311

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23484

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

 .../xrdp/xrdp/CVE-2022-23484.patch            | 31 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
new file mode 100644
index 0000000000..af27c50376
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
@@ -0,0 +1,31 @@
+From c2c6efb1d377be6baaa4acbc9d3700490fe92887 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:03:24 +0000
+Subject: [PATCH] CVE-2022-23484
+
+Add check for RAIL window text size
+
+CVE: CVE-2022-23484
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/c2c6efb1d377be6baaa4acbc9d3700490fe92887]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..4352625874 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -929,6 +929,12 @@ xrdp_mm_process_rail_update_window_text(struct xrdp_mm *self, struct stream *s)
+ 
+     g_memset(&rwso, 0, sizeof(rwso));
+     in_uint32_le(s, size); /* title size */
++    if (size < 0 || !s_check_rem(s, size))
++    {
++        LOG(LOG_LEVEL_ERROR, "%s : invalid window text size %d",
++            __func__, size);
++        return 1;
++    }
+     rwso.title_info = g_new(char, size + 1);
+     in_uint8a(s, rwso.title_info, size);
+     rwso.title_info[size] = 0;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index f9e2105500..a9107a0e26 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23481.patch \
            file://CVE-2022-23482.patch \
            file://CVE-2022-23483.patch \
+           file://CVE-2022-23484.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

