Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14867.1793092896937853982
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tWtH3Wrb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27271755e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092895; x=1793697695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhIsRpRuffP+M5JyEYAFJy6KGmcFpnb9mjzy30EF+Z4=;
        b=tWtH3WrbNeOF3zFafZKChJs7v7XZP4/YmRsygNXrMMJVoRDECdDjq5zD117M6Xs9sP
         KHMkPvIwcYge7xkthkkeHZ0xjUnRjJeHlxmnK2QtZR9Rd0ca+22cXM26wAENFudMeG2Q
         /cjlSftKRu1mnKpTQaTT4ClLI+TSBDMKlbqSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092895; x=1793697695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhIsRpRuffP+M5JyEYAFJy6KGmcFpnb9mjzy30EF+Z4=;
        b=aunO0Vg/X0JmJBlwnaJ8E6UqUlyo8LenSLBy3rW9cnflq+j7KECOSL3Wo54bhwnH1+
         jGUdtAZA5BfTfod4YNnRr42gGktTmssP5Vt0CoVEp8Rlmz5OnR9xIiltaXmCwwl9SfR/
         7/aJRGABb7Vc4PaCbCJ96oGxUw6hEXCKI4rdcUCAPX360URPVF+Vb02PseicoplWtvLo
         DL9rw/T17f2LvdNcQ86kh3+ykzUdor6sUkQIYFYjaXhCLW58wDR9i91u60W1o+gUYdiv
         Fv0ITkyZ2XitHC092FNd2+XIWYHidr1VuLhmzAaH7HYgH06TI6eFyXTQJneBGPiWkkQ+
         FiPg==
X-Gm-Message-State: AFq9FYKr+xYyHNLdnELAEeomgi4ChqK2iTmK1eAg0LMpVZ1jvjWworGZ
	m3KpsVqAIDxvw2MlIiOvSHT15HStaIqvnXQUjcrYt24T7DnxqyVUDyFsoeeSbNrSNUHWYc7OZzr
	ELLuu
X-Gm-Gg: AYBFou1RdN4cAFi9YReQ+0FVS5x7649PcOW8LSctoW9oauJg7jUFLhUIcK6HKyhRi2Y
	vG9iHuIZWqsdOpttfV6ngg1kKFyIWenHbQDfKL8DgIwcqPqfxSH/18QJzikNLV3RalVtfB4Ppc6
	YOSatIQMDE0JgiNt1XXg2Xll+Gmll7KRwE+qmmwlKbQW7M4dmlXD8lLF2yPb9ECxhtjU5aUB9+O
	mmfi6CTtMit/HdVp7nXQlPt1sisdKYLAVOSwuiswnIku+np+6zQrIgHKzGTxdvRTjXOUN4p9MqK
	xdxtf7OjX9STQTZRevQOEXiVFmrwRhZTQn0sJjJG9lBHd4eC5QOvS+hXv9HUcjuVAwewM8J0UAu
	LHoMGozWqemmFDtC62WgUH8NDIFLYmWqdvpB4CweLHCePtjnLL3cgHWsye7A1d/xsJQz3RAOng3
	5Q/UPrS5SepTvVG8at9cwICv7/k0TCVdWVjMst0csSygbzpnYjMVvowqIKobMdgWyabQ8+ghawc
	4E68VMDGJveW8w+74+5nEdjO2D0zFr55nLWYSNbgq/mcMG5V4BiYUYE54nXcuSsbDW206f2Gucb
	L4bf/hwy7bngkGxWn1DqL/oU92kfiQtbGKH8Nw/juVssoeV9HwVARZTt3Vpe3S5T0b+vaM7ZcSF
	HejaO
X-Received: by 2002:a05:600c:1988:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4a35ac3caa5mr167438545e9.3.1793092895149;
        Tue, 27 Oct 2026 02:21:35 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 53/61] python3-ujson: Upgrade 5.13.0 -> 6.0.0
Date: Tue, 27 Oct 2026 11:20:20 +0200
Message-ID: <20261027092028.782979-53-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131517
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.0.0:

Changed:

- Assorted cleanup refactors

Removed:

- Reduce bytes-like support to only bytes and bytearray

Fixed:

- Allow default handler to handle bytes
- Update build dependencies to avoid warning about missing
  [tool.setuptools_scm] section
- Tighten UTF-8 validation for ujson.loads()-ing strings from bytes
- Fix memory leak when the default() handler returns
  non-serialisable objects until its recursion limit is hit

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_5.13.0.bb => python3-ujson_6.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.13.0.bb => python3-ujson_6.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb b/meta-python/recipes-devtools/python/python3-ujson_6.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_6.0.0.bb
index 3a9b581f9a..ece408e60d 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_6.0.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause AND TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "d62e3d7625384c08082abad81a077af587fdef2761bb14c3822f4234b8d07d75"
+SRC_URI[sha256sum] = "80e23393feb707582e0ad495c397a4477b646d08094d2df64f7316f9fafd8aae"
 
 CVE_PRODUCT = "ultrajson:ultrajson ultrajson_project:ultrajson"
 
-- 
2.47.3

