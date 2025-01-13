Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51CDC02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:49:56 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.16911.1736776181123686187
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P2QvRKC3;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so836822066b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 05:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736776179; x=1737380979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOg9DwG3bF4zaE8n9JVdHjXN9XPn27NNDkQoxI1gDFo=;
        b=P2QvRKC35spE4yJY3k/UQVc4ydcDNJdCb1UV8sNMioIfJQH00DtEXGReO6bQT+bPZC
         by+Wbc0R94nXr/hfBec72r8OcPM5K8/CZ1ChGbuDgbb8QBM45fggudCmbN4jQvakNt1I
         CzmeuGyCVBzTrxdamD6tAoacgaPpd3BuaMe38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776179; x=1737380979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOg9DwG3bF4zaE8n9JVdHjXN9XPn27NNDkQoxI1gDFo=;
        b=OizbiR0KMGUH4x+2k1dGQmBL17kT5htJDX1VcwMYkNFYPE95TS1zy2nIqMfK6zCwsb
         gHRu8qyIJpOEX/dxbLbllPKh3dLHTQH599l8Sa0HtWFaMHZW35/S8id9mv1ECBUl4E2A
         XPH7Nuc+xCgO52WMFV/vcCJZR/QrBfdhDV4gM+Pp0VVZ6ShgGI/ljjCSotZ+luccDJZX
         X81seszCvQdDI3Ikw7SXnlAyp0/PAxOlBXvYrdWz03aqsixki1ThA4LUJSzoSM+I+XQP
         Ll3XE88MprAo2W02zkj5vnwIoKyOoqTZxFKfOhBk/2h26od+Pm7RUQdD5Jd3Xl3qj+1e
         sBUw==
X-Gm-Message-State: AOJu0YwsqPexanSHjhhF5ZFmoxA7hHbVn7Nvvc1FzxzFuI5yZLX/f9Il
	pVMYRopubiLDx73IWNT92O6m0L6fmEBdHN7yx9s6q7DJYSYzcgr+wChgFZXarXSkNUTrdZeJ3/G
	/
X-Gm-Gg: ASbGncsKQtqy8NDnnwV8+isIPkNWOHyvcYO0qRns6RdXFU4uWE3TqkiOhankntUy9MD
	KaLHpCZ8gtUMxfBaotHzsM6nj2FSP1kVvscOtFTNSgsW7fi5zBLgYXVfra/+sU39iJeOQJNJqo5
	UmoONbgQ7WEhTzsT1+Z/b9PFpyAROQ3GmlSUKd4l7y9dbL84kJzNBlwg4Dpx9Uq7+ktyQjD1z1S
	MZiFHvLCR4LH7PTYMA0dqRR1LczW8smEUIUuBmisrST2PFzXrUiOPYsGH4gdQjwHQMM2ZU=
X-Google-Smtp-Source: AGHT+IFK8F/mpTe1VIZw60n52Wrw6QXtrYF8ZzT/aJeRtif5ZkJbbG2ZIgeGTKh0cxFv8uwn7shuDQ==
X-Received: by 2002:a17:906:6a04:b0:aa6:800a:128c with SMTP id a640c23a62f3a-ab2ab6a8dc8mr2116344566b.11.1736776179318;
        Mon, 13 Jan 2025 05:49:39 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dad57sm509938366b.66.2025.01.13.05.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:49:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-dbus-fast: Upgrade 2.24.4 -> 2.28.0
Date: Mon, 13 Jan 2025 15:49:32 +0200
Message-Id: <20250113134936.3594358-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113134936.3594358-1-leon.anavi@konsulko.com>
References: <20250113134936.3594358-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 13:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114832

Upgrade to release 2.28.0:

- Improve performance of unmarshalling variants
- Improve performance of marshalling message headers
- Revert avoid building wheels if a release is not made

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-dbus-fast_2.24.4.bb => python3-dbus-fast_2.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.24.4.bb => python3-dbus-fast_2.28.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.28.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.28.0.bb
index 0652c186da..0a08feb27f 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.28.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "58f97e8342d6cd11ebb2c8ac959c5bb342eb83e29180528690b323a5a5def41c"
+SRC_URI[sha256sum] = "ed2612392a7df775256c67bfad8727607e8862541b3984585b016e464b020b23"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.39.5


