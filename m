Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13218.1794901984647510673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YkvXSIlj;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso25661135e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 23:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794901983; x=1795506783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yj8G8id6HpMoD6TXsAwB1lRdBXqmSpoSWu/LL4uZakA=;
        b=YkvXSIljmdl15EQXbjF6v80Jr8mV/THC52RegswGgYFbgQta3Ql8wMIB8N8/6DhEX1
         yjxyFmRwyZm+n4+ARb6Rkk7aqZ9VojOoq2b+A+YOJI0iKXV3nxv8RchsrnRBYDys/IIg
         zOhfEVu0pBi0JDHPdN4m3NYD2cADWkA4FkDpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901983; x=1795506783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yj8G8id6HpMoD6TXsAwB1lRdBXqmSpoSWu/LL4uZakA=;
        b=Gmh08qYdpn+kdyVObLAP294XHt394OrZWtbrCg+d2we7nwBGZMTaoXxUwHw4YV3QtD
         xOw48AtSNHsQfJXuGn/3io6w2jJCHYsYfBC7qzfmQ+sSqzBIevBCuMZg9FE1xSic37XG
         yLDwfF2ofm/elvcZhoukuKEc7CUgKz57fjfMIVJ34tSpmj9btcXwnZ3RlNBz41VCiP60
         uPbbMYdCMkTiwjRV44G6WU9Hf0rehgQy9Rfm+jK/yEd872dDAt/x+rCQJKmi3Cl2YU7q
         Rf+Aizp+Bf0b1rnFAY3ICEVvONUmSDfyEGQCs4B/ktNmwdrC41SYnoh/DJ3qJZCBPf1k
         BOOQ==
X-Gm-Message-State: APuU4Z8IX3SjDpgzIFwHQaXLQJeVGeRZdUdhM0BQSmc8X75p4H/O5woY
	WFDlALx+uSRHj947JgAONj4/BTmEW4dk+umiNdwBjTc8XwxVhwcSNaoefXHbo3lKtvbathKsPuR
	qCMgr
X-Gm-Gg: AYBFou3HGAtZqLKyXDpCj+CSCxoAS/SXZ8FLy4cXr7QwfIvYcmWEaoqPXouuxfk0TrR
	HYAk4d4TiemMR6GN2tpTmB8B8+8CvqNqLucN8OBBgHAxXf5pEHEycVBUVt6k3/3/WnIb2rhP9Xm
	7OXC3XP5dmIeVPkHzDlMSy+b8lXBIlUox1yWA7/pkXiffb4xHT12Ez34+qTnZ0LB6djEMijMPec
	Y9Xvee3lUjko51BK6+eeWLqUAFIOxDdC8nRpxH8aIb8ntIhfnBDLndm9Oo0B1VHP76ALWEKvcA9
	3Au6xg0OP0LNLmjrt2n8p/yxlBvvQFBIQV9su0MVETagO/Ho1ecddPYi+EfdopCT8qMEjCCx9Ve
	Zh6T9F9KOdxL46yudt1wntQlzLUyLqHboF+KqAbryVWKSBSMyRFVwRt01k9Ct0wZAcgB9igwZmO
	dmoBQum8pJWgOysVdaaHhiWBXxpcHQNBrQLYX6qg1J8VKBwA6R03WbX9aFtJ63iSNmTtu9IbKgw
	AvK9PwQhLoYj32otW71I7Sno0NUCxUssXOaVI1CKtbvBCps2KObZsurFYcseroDHEJS+zXcO0yG
	4//DpSk1o14VMaaVd4+JI3sUkM77n0kArq/ElNGAtEVvNPSg8M3dtPczfjy1Gu1z9q98q58wXHG
	6s2rk2GLgxC3OcGhWNk9Ln+S9odJcRD2AXKU556JS79XiFbmEDhYCFQ==
X-Received: by 2002:a05:600c:1f90:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4bb55a45050mr276978555e9.5.1794901983065;
        Mon, 16 Nov 2026 23:53:03 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c2650sm54072995e9.14.2026.11.16.23.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:53:02 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-httpx2: Upgrade 2.16.0 -> 2.16.2
Date: Tue, 17 Nov 2026 09:52:56 +0200
Message-ID: <20261117075259.3922364-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117075259.3922364-1-leon.anavi@konsulko.com>
References: <20261117075259.3922364-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 07:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132572
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.16.2:

Type aliases evaluate at runtime again:

httpx2 and httpcore2 2.16.2 are a patch release with one fix. You will
notice it if your code, or a library you depend on, uses the aliases in
httpx2._types inside a runtime typing construct. On 2.16.1, import
mistralai.client failed on Python 3.11 to 3.13.

- Optional[QueryParamTypes] and QueryParamTypes | None work again
  (#1346). In 2.16.1 URLTypes, QueryParamTypes, HeaderTypes,
  CookieTypes, TimeoutTypes, ProxyTypes and AuthTypes were strings.
  Optional[...] raised SyntaxError for QueryParamTypes and
  HeaderTypes, and | None raised TypeError for all seven. They are
  Union[...] objects again, as in 2.16.0.

httpcore2 has no changes. It is bumped to stay in lockstep with httpx2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httpx2_2.16.0.bb => python3-httpx2_2.16.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx2_2.16.0.bb => python3-httpx2_2.16.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.16.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
rename to meta-python/recipes-devtools/python/python3-httpx2_2.16.2.bb
index 5478522592..7469a914d2 100644
--- a/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.16.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "The next generation HTTP client."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=166cfc32dc0986f87a7e950553b52e5e"
 
-SRC_URI[sha256sum] = "0d54c98128e8f2ff7fbbde0fca8c359e5f032edeaaaac443cdb7f31f685bcd7f"
+SRC_URI[sha256sum] = "748b615678f07d8e3b183efe81ad13b655ca88bfc56ce4589219b2d442860574"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

