Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14680.1793092894878696757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bQcUpk/f;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso20888465e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092893; x=1793697693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqd9vF2cFmTICtJ8zogaEJkZszq6wSOVOLlKqbLsDwA=;
        b=bQcUpk/fPnSh/1HTkD9Y6wyUWoCJYEdzmim4wgiDtEi4qCoMwXh5yQ3DHDQ52NWNdq
         DQ0XZU//AfqTUS67qLCI03f7ojIZeLXQISwCsEV+/yNcIAXn0/GfLrzk7ehlartTryjV
         Ha0aBR54nsMYYr9N2QoQNZC+j1nELVkqNX/SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092893; x=1793697693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqd9vF2cFmTICtJ8zogaEJkZszq6wSOVOLlKqbLsDwA=;
        b=zU9NjPQWks//d3sYk4YLq6uIyyevfKN6VITT0hxru3QG+6RHGXBfho8HTF/vpQ1zDG
         hUQYAATx3Nsxf0s0S7dVgA0Q2p2Lvli/PgFTGiRyFdo3m7HPK1DjabnA+2xe6J/76Nao
         mMv2jn0sWK7DX3aeXU/7Ne9NFyXVuWRHa7tojXyWGcB8azcnGFT4wsjmC476uRVZ5h5t
         qeEs9KziuRdg1SKlGlCE6bM1+P9R6Av3fn/AB+bHTf1fa/pImZPxwNwzZQYb4J0JZU08
         o8cccv5lWsMrMb58GoeQp0UIeqTaVJIJlDn30wqcuoPNmnp2iw4I8sbmx1oB46R1u/8U
         E5xg==
X-Gm-Message-State: AFq9FYLIrTLv0lXShCJbo0KMYNrF7DW2pXSunUfQbA4gth76R554UFRI
	Gz2Q9EGt9pfPLSmeXZ4oUqTL8W7NfxdCpgWbebB5eY42QyV2FSn1xxrlLF2ZsKlFL2s09Fm7OqH
	V+Z8d
X-Gm-Gg: AYBFou0bfQ+bt9lLK7OiBX36Gj67TiU7kCTN3VKRWsetbfugkkWmhfhnfkIYprEUAVk
	t7r2Qg/WB0j4JeJkuGrHw/M7SzYYX86GWlsqWsprJsnJ9KphwTMMmYNfdbcZfSIuqUJatDo7aCQ
	a4aq1cbYgIrFy1JOljUxxJMlth394XkfBXCnjCjVmZTRByxOtGJ72yPUAiSptsN81Awpe2PY//G
	uNdFFgWbjReQy6gRKo31DjwpUWW/53pPSopvJZXZBbWjeyItf2VF7Ce19TD5+V005svK5rwKtLO
	1hH4fdRFTdjpvUtR5LtYXjQdGrw569k7G68U0vcoZIZIlc5XNs0kEuhOO2FdNLsOkFsh4oUmFm4
	d4f3D2ThWmLq3AdCi00MoHY1WuYZDSpiBuHWUVHotvPCOfq7jNeYMuA2DU5CxnuXvxaK10zWiKx
	tq25XeS9kMBrCivLSZOEa9cVTrcawoEI7kON2tIgNCq3jn0NFdyGeqkYpbijjLUaJEb/QJGcEVS
	06NkKyoojage19OKKbaFoD4NJoQ452Xja6VI9mhZrBFIKNZ3DRGZtoTeYNize5cHwqtLXIKIIUw
	I7ET3x8OambWYrpp/+K43qqi4CzzE0H+VU4Ck5A9O2eNjdTs9CUB2WIX8fsECnzKKh2amjFOszm
	zVWN7
X-Received: by 2002:a05:600c:a04:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a7555d89c5mr65061985e9.12.1793092893249;
        Tue, 27 Oct 2026 02:21:33 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:32 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 52/61] python3-typer: Upgrade 0.27.2 -> 0.27.3
Date: Tue, 27 Oct 2026 11:20:19 +0200
Message-ID: <20261027092028.782979-52-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131516
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.27.3:

- Escape terminal control characters in error messages.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-typer_0.27.2.bb => python3-typer_0.27.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.27.2.bb => python3-typer_0.27.3.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.27.2.bb b/meta-python/recipes-devtools/python/python3-typer_0.27.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-typer_0.27.2.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.27.3.bb
index 90ec5c750a..a334ad78e6 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.27.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "269b7eb9d3c202ca84b4bc9618cb04ebb43d3d4d1e567e4c768607232c05f945"
+SRC_URI[sha256sum] = "d0396f770a560ab1b0a8504e13b5f254b728cedb05c61cf0359e944e50ce8901"
 
 inherit pypi python_pdm ptest
 
-- 
2.47.3

