Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BA8CCD18E
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:44 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.5220.1760206422991536274
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ajZiEfGy;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b4c89df6145so500878966b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206421; x=1760811221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8rXraw0/GJaftEuGCQyJFkXR0D0mua3aBvduYMk99Q=;
        b=ajZiEfGyBApTykxoqZKK62VEJkPKEjku1TL1ICPIHt7C1BkPGZDB7dvGRZFwLHqMa6
         SlMZ3+/TFGgNkMXVMtx64SwMQRaMuQr8clH4ePvRyvPGEh3vVcEEKUYUZwzMaqz72men
         RPNvWKmQywlkfouuNreM9pa2jCMGjakEPiTiTi2nLuzRXiEoIUplNoIV1zj1ALzUamHb
         QAgfo2xSRniYWyT4aZl3F6FHyMKW1Opq2CiTVV2ARIbAgmGHtmwVvCvN9RtcM2eXhyRA
         HXz6wn6FmNNPebVucv9XQ5XHDZKoh7zmD5zaEpSqrFZpvho9r1QZM0Kd9q8jFQ7gLdy1
         FmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206421; x=1760811221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8rXraw0/GJaftEuGCQyJFkXR0D0mua3aBvduYMk99Q=;
        b=XvZCkt4KGlHfcwt15k02oWbGBCurSjrF+ivnKRBEjJC1+bs5cXo+0I976AK7eaIlq5
         5cARqNes5ik6lTN1I4f2yUe+gnYRnwgEZrwL6Cf8wIFvSeax/1U//Hj3/2eJkUz4DHXL
         IVkiCy3XkHuQH9ErCRWzBgavOujYzDgNa0hOhOyRGl7n1KRCS3Rbfc/TCBgLk9E0iZDR
         zCshjz5Q00hA8xb8ImfU0PHrwq8a/eOAlLwY2HvIdOHCCw5VupWTNr81HxF9WD0NpTOg
         6d2p6s1DM1l4Nhu8LvboU0QacyVKy26/W9SuaDCDdu+1Q/QIu8MnCVGU0tHV+6GEAqEi
         uobw==
X-Gm-Message-State: AOJu0Ywotoiapg0m/YRObAXHipOnnLidwAtvrlWKcdBaA8RCE8gunwNR
	8VJU0hAo+K1i8scChiXJZ3Wi1bJRtjGwrmEGhyIb/WaLK9UfRwqNtRVAra5pVw==
X-Gm-Gg: ASbGncttIh5PYysbEMv265++js+/P/emCqrly5YNKq1mF29jhj9tQ9V4nk11jRGhBtQ
	ci66hqFVyv7mTAYNDF3/VlCh2yQoO/Tp34L4gWc9L6nE8Q3nultyPy8LgoWwzs+NcPoAKczBJhI
	OrspSA1JQ5wQmPPdAfRIqW583paaXh/V/ZZAZn+eKltcHb//tzlcu6H0hAm7+PwDuve4WC9Gu+4
	ewMsJpXop/JJEQZD+G25gD6/pVpb3gdlp4KGJTxvogVH41XLoAW8WcoMQO2S8e1NkamVNYps1Da
	yJfNprvv9zPyP5DFgppl1jx5rq5ypsyl6+2ZLNuINyETZzH7n8s0gpwwfeJnzubVCJ6tjdL8vj6
	YPzssvyc3Pobt1Fe4MYIjrOXw2Wpe7U7Deh3Bo5o=
X-Google-Smtp-Source: AGHT+IFTgYO9b0Rd6dKZdjkqmKDS/e3eLT2iB7xJzs8D9l9xr/UrXhLYgpLHhkHktu8qow7fihN4lg==
X-Received: by 2002:a17:907:d06:b0:b2d:830a:8c09 with SMTP id a640c23a62f3a-b50ac6d0efamr1438992466b.44.1760206421280;
        Sat, 11 Oct 2025 11:13:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 02/10] freerdp3: patch CVE-2024-32040
Date: Sat, 11 Oct 2025 20:13:31 +0200
Message-ID: <20251011181339.2127670-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120501

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32040

Pick the patch that is marked to resolve the related github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32040.patch     | 29 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32040.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32040.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32040.patch
new file mode 100644
index 0000000000..10b89e577f
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32040.patch
@@ -0,0 +1,29 @@
+From f29088d17903aa8e58073b9811dc8a72f94cf4fb Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:26:37 +0200
+Subject: [PATCH] fix missing check
+
+in nsc_rle_decode abort if there are more bytes to be read then there
+are left.
+
+CVE: CVE-2024-32040
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/d58cbc96aced4d082abf92b41a415a891c7ea309]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/nsc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/nsc.c b/libfreerdp/codec/nsc.c
+index 049b541f1..c2d92e48c 100644
+--- a/libfreerdp/codec/nsc.c
++++ b/libfreerdp/codec/nsc.c
+@@ -160,7 +160,7 @@ static BOOL nsc_rle_decode(const BYTE* in, size_t inSize, BYTE* out, UINT32 outS
+ 				len |= ((UINT32)(*in++)) << 24U;
+ 			}
+ 
+-			if (outSize < len)
++			if ((outSize < len) || (left < len))
+ 				return FALSE;
+ 
+ 			outSize -= len;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index b07d7d139b..19ba893724 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -10,6 +10,7 @@ inherit pkgconfig cmake
 SRCREV = "708f3764897e06297469a7b0507b3c9ecc041ad7"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32039.patch \
+           file://CVE-2024-32040.patch \
            "
 
 S = "${WORKDIR}/git"

