Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB151CCD18A
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:54 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.5223.1760206424972253561
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aF6ttEP8;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso1752381a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206423; x=1760811223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOu0IFgr8wsPcr4FClSO6XSmTAbfNX/0W076nxx1/bg=;
        b=aF6ttEP8lHtGtBqbiAvotuN75/NnqHQHf7kaB0Fc4CG6inSTJxeJXlhks4+2CrER6c
         F4EnCnseQ3Yss+0QOOKutsUya85wffHYtBQQDBusecadRuFPnOw7VSV68PXLgXlfS2S+
         kPC7ksHIiLEmW02a/Itze9w2KrR010RDw80NSrbeHmo/GC0yxezgiRoAMgKg01+/F1Wf
         rHi+KLGVBwLhOdk0q9/UCZXcxl1EYfyaq97wpaNCuRfsX4LKeg63NGVCTY5lUebTNWua
         SyVpif4AYLP0jwY6pBXyg/ovyzcVXgRqqM2h6lFUFRYz+h0nk4lYyn0mdfc1a5zvJit+
         196A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206423; x=1760811223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOu0IFgr8wsPcr4FClSO6XSmTAbfNX/0W076nxx1/bg=;
        b=prnO5hZZwfI5BlfikQZF+E0NaaU1vB0sSpG1eDz6DdB4hhR8AcZ1N/D2zkIcFxMly5
         1Wy23i/eff0bE5n3Jhp7wihUUd5U4ZGfYiz6DNXbGq+t5hAgQ2S2G3UYk0TkItKdEs1j
         qw2/7E98k2vO59Q9gyZpJnLDBM+BjWZ0rfdNogIfcP0ozelsvecog5PK5ehrQGQz0nzJ
         xujhr9E9chB2tG0WthPTft08vcYgPbd7Fq+E4VlF7TFyMAqVpFUNZHLm9JoHak80kBXr
         XjcNIOiVVQ/FPq7NwAQ1o4V9+Ws7JYztMfnFQedxbvb0ugM3qy6VU3xXuaepNNx0Ce9w
         SD2A==
X-Gm-Message-State: AOJu0Yy49XDIU5wwFKElRDlRt2W8oVR1jhw7TvCa3Lvq+rJvUbD2xG2d
	1v+4b1+dz7RXRZK4XsHU6XU65Jt9aLafMEQgEVOL4gDC2YV7kWRk7AcvnQc/iQ==
X-Gm-Gg: ASbGncsq4TA7CIu86vReW98DoDbxNm1CD1XvVVTV5wgn6B9v8G6xLOFIHOv3ApS2QYj
	LtNmn/W817y2Tt6V+3Bqq4OkIvwIq1EQZd7YksXws4w5Ex4JwUzSHu7Fl9Xm5coby6ZKfMQRSFL
	AEMz1F8pIXayYHeQgozv6gllXwnfJRZ4pFZBA/kxepD1ZYCXb79QFauieyoiAlOd+bWiwaquzAk
	WFHAo4eNFZag0Wk6r+eqwt1XDtcq701yyFtn0ji76xr62ZTivEOLwaGDePI0E58MkTCBXeFB2Sc
	6FMkS4+Kc0kstKEcUUmFI/2/xMBgJ+wQUN5qy084doxq66OqsQuBKIgG+j8oM9TiYzA6MUnvt8C
	OT9bytGma/AfCzonfDNzAPysvaaEWoZmXW5vfrfl9wqZG8k8Pbw==
X-Google-Smtp-Source: AGHT+IEP4CukSK3CMJdaxk7d9LEuI5sKRP57uDtz28HXnhmEcXN8zq8mXAQCrE/3Q933F8WEJKvLCg==
X-Received: by 2002:a17:907:86a6:b0:b41:b5df:89bd with SMTP id a640c23a62f3a-b50a9d59b0amr1473509566b.6.1760206423149;
        Sat, 11 Oct 2025 11:13:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 05/10] freerdp3: patch CVE-2024-32460
Date: Sat, 11 Oct 2025 20:13:34 +0200
Message-ID: <20251011181339.2127670-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120504

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32460

Pick the commit that marked as a solution for the related github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32460.patch     | 26 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32460.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32460.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32460.patch
new file mode 100644
index 0000000000..95eb8cd076
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32460.patch
@@ -0,0 +1,26 @@
+From 4e64b3356b155835d991bcb70a9aa914252fece7 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:47:31 +0200
+Subject: [PATCH] fix off by one length check
+
+CVE: CVE-2024-32460
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/ecfafe4ad054435d84cb7b111ea73ebd46832fb6]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/interleaved.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/interleaved.c b/libfreerdp/codec/interleaved.c
+index 75b2e2775..df148b667 100644
+--- a/libfreerdp/codec/interleaved.c
++++ b/libfreerdp/codec/interleaved.c
+@@ -237,7 +237,7 @@ static UINT ExtractRunLengthLiteFgBg(const BYTE* pbOrderHdr, const BYTE* pbEnd,
+ 	runLength = *pbOrderHdr & g_MaskLiteRunLength;
+ 	if (runLength == 0)
+ 	{
+-		if (!buffer_within_range(pbOrderHdr, 1, pbEnd))
++		if (!buffer_within_range(pbOrderHdr, 2, pbEnd))
+ 		{
+ 			*advance = 0;
+ 			return 0;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index ede4551a87..fd9df18b43 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32040.patch \
            file://CVE-2024-32458.patch \
            file://CVE-2024-32459.patch \
+           file://CVE-2024-32460.patch \
            "
 
 S = "${WORKDIR}/git"

