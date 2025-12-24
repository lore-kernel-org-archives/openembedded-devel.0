Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9190E75424
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 07:49:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.116516.1766562589255153052
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 23:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGEsleyE;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f1243792f2so3957586b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 23:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766562588; x=1767167388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUWD4GjDcwTxcJNf9OL3RflQyK9NKSsGngnbrAzgLYA=;
        b=HGEsleyEzrJnMSHM5fc83PJg12hhvBLs58jv43bAx6Yho5aZtXN41idm30Y/KMrmev
         xLfOEumO9YmI+L5tKbzeNipnpKCJAlRSsPx0RH4Ev/dR3Y2kKIU9ViSVEHQhU6X4zZ8u
         Q/5BseSvwL0NBUPqdSc5j7dO8qDSa2a3N9Xqw/IZfani+JcyKeztNaZpbK0x78VVCyGg
         qyWLANuWpnXawPRtCzWArG47F8riKyien+5XXPvYz95qBHDIP5V8HlKP3aC9zxrsnhkX
         L8xUSXRdoiY6e5Q17l8eto3JACXHjLfyEYeplAMyEIrbMn4XMAZdnRy4cfCf1q2yvmfh
         bExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766562588; x=1767167388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUWD4GjDcwTxcJNf9OL3RflQyK9NKSsGngnbrAzgLYA=;
        b=unlOJ5U7vLgI/Vd3sgu/GeQOLukcFdKFszODwavcYbPI8Ye506DKaQq6lSNVwOoodp
         +n6aucGCeaPP1Hk2wsX1zvok7vuq0KUs8u2A6Pj/RC8r8yerhwkJ+NHT90hXLrZoMy1R
         Fsydv2yHGP/q/eK/eAVNvKSq4WWnnhzPaq0V96n28/hVzxZg5NGeaeVzTGoz1SjBP3f3
         J+Ouy7ovb8/wt49cpxxw+QSra0JIUR6nnX4FFHDnJjCysmasrsLsByLcq65ix9KT0cqo
         xY7CXOnOBXqvUOV3IFjfJMrlx2jVrerI+DTWPbRG7khciNV69ONSDpX0iWX1CWmBGT6/
         HDxA==
X-Gm-Message-State: AOJu0YysPXZWer/OBL823hTQq++9awH+VilrnQ+olCjLkzFjY6IsF9tU
	ol8nRK50TUgQJrqMzV1teV7rH9BXAfly+GZTe170c1B7H04/COmlVJlMbys+oQ==
X-Gm-Gg: AY/fxX7PydpKtvQRO77GcrTuMZvrBFGiIk3+1qHzIh0uUr6ST8Vp2Cxq9rvXUzztxe9
	XZo89qxkng0E30siUVPTwZ6JasfaBw68p2Css45ovF1PemkeNxoQ/wnoo7yCtOyiQfwBuValyrd
	QXNulk8Xg4Nu/JOUVFB8aLJgQzVzTOD/ZfcCofEqEbJFVjzwpGVj3WfE5GnLGWOR+mywSFCYadZ
	0VqS/AznRH63GtYKDu/tdywTyhmVz4xnCKSqZqRSZn/tx3v6IKlTkpZKeMduJTXCfW8e/Mw0RH4
	q5oHMiEsfj/uvtEyog3nFJ15GJuyYfelUXCXKdsiYbht0H7KkWJhNy0hYyqJfHmUZNjgxxzc7x7
	+z4oZ1CGMGWsrldiIGLi2XcDYhV02lL/MsX3F9khQ6GjtZtdexG1OAbnD+mPyxNLnT8OaHKxlMv
	QpoeVKUDFZn3c6agjhQiztxbkA
X-Google-Smtp-Source: AGHT+IGHSKR+/URya8Cms5hnyayzTWZQ//tGrCT7XMA/d84uYrFlogTHBC+E0IWrdZfIQ7gTQqG6fQ==
X-Received: by 2002:a05:6a20:e290:b0:35f:6e12:184c with SMTP id adf61e73a8af0-376a9ace741mr16079997637.60.1766562588472;
        Tue, 23 Dec 2025 23:49:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0b587sm13847084a12.33.2025.12.23.23.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:49:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 5/6] libcoap: ignore CVE-2023-51847
Date: Wed, 24 Dec 2025 13:19:31 +0530
Message-ID: <20251224074932.1379914-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
References: <20251224074932.1379914-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 07:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122849

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2023-51847

The vulnerability exists in coap_threadsafe.c but thread safe support was
added in version v4.5.3 [1]

[1] https://github.com/obgm/libcoap/commit/c69c5d5af0a30859e90756f535e2ca21cdeda0b2

$ git tag --contains c69c5d5
v4.3.5
v4.3.5-rc1
v4.3.5-rc2
v4.3.5-rc3
v4.3.5a

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 4f5a986858..9c45cd248e 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -64,3 +64,4 @@ FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
 
 CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"
+CVE_STATUS[CVE-2023-51847] = "not-applicable-config: Doesn't apply to our configuration so we can safely ignore it."

