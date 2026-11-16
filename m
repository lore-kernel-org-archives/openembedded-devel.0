Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4.1794851753195530907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=z3JhPLcm;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37986eb6fa2so4831982eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851752; x=1795456552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkiqLsAXJBaXp7XXjkYBiaLFeLxs6pAPbo5B38FPiQY=;
        b=z3JhPLcmd5sic1s+GxtFbBZ3Aw9gtA3IhrdmXEEmhQeQ+rh1g7ECq4u+2knjUflMk4
         t+crjdflHcOD9htYx+0cX5qKetcf2jTic0xHZc7GQ/rmhHWDASX/FMRpy9gc5cMcPkEx
         LCoabnYaa8Hc300TMP9NjSf2qTdMIquwwUTVB0CnbI5cshIStbbYyIQsakbdQMNvAZLL
         X3BsXLGKVJ7qCfuYD+ZtFbmYYE8xGDNogvkaxmphpgKxuWK+gmU/mAXSZujPvGKsqYwK
         GOSBp2LEQDqXzujCA6qoiDUlTbNvIyQTwkvBJoxecNWWVHcVRfyBl1cP5rqMELC3FpQC
         LUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851752; x=1795456552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vkiqLsAXJBaXp7XXjkYBiaLFeLxs6pAPbo5B38FPiQY=;
        b=Y7pVsKNUvOH8019itaSZ0wLA2ZZ/kOdOoZxaXNI2mSPR7uFzcp9Shz7KE3B24w5OYo
         KvaYwmke6XxXSvkxMGSmgB7qdiNHylI1V0rKESKG5YjzFEkzkTXVXuKt21/4O5JPHU6p
         Z6xF9FvxSf9eGvlgTXRoXJKmv2Bg2ZmhAPNKLXsCkgj2DCIHWxGN4rt7POH/NEtDVWXo
         r3+t8dGM6KlW9V3aSCADagp9awgYeciKiZX4Xv15YtnDN8JR3sFYEn8oBDoHVtKvnqbg
         ICJ1HUn1oru/MsAq9gBl1c2NBHOSxQUmWeZroLAL4JDrcA6LR2Axfx9999l0UTb5+Sgc
         DICA==
X-Gm-Message-State: APuU4Z83MOhciramia6bcYHzlGaA/qT2p75G5YC+MiG2J1VcvZlpbMam
	B95HPIQvGwYbLO3+8EdQabl8rQ5UvZENnlvjDt7zahyCDUea85WrKUYE0ATmPABA
X-Gm-Gg: AZFdTZe+1CsYLTnosXSETixhZozxwFe3H9k5ua1zuWRb/QNv+yauOxPmtsomyco3xrY
	97/3cOY2LkOaDlWPVRwVYulgDcr9qXcvg8mJEQsBsCu+krdPLj0TFyMw+5vXsOX5C4PyzUZ5Rem
	QWlgSOVuEZbwl1GKcqPOwb/SXdGoMJ7+z1OE7g4LodeoaYyHaj9a91N+/w0t9ldIuD61ZcwAvwc
	ZXRzWLtWGhCvACfuBjpOtPS+jKjZvjc2cyFLwckrk+Dq6G4Ep6IkcKlTAf7m3mYPTGpxr7AxLw1
	FuZ2qPnHq8DWd66NyNaqy4n6TZosDq+pAYP4Hm3lmmFh7Vda7r2qow9JQTVAedWNrn8ybxoL9c1
	zYrsxd/+th2shpli0CFaFHxO4B/s37yffr2JIf2XXc0bLfaws5piVq8ViFNQFdBpP0T2seUHFog
	qCAb4Q+PWXei/XZoETjdBYRnYatt6sQQRDkJPlHcBRfQpw2oz3f8LKrSAc6fi/Keo/dRdi2MIro
	XuIrxRNDmP/zLbHB/JgmjBJYDHnNe9Vfg2+LrGAbIpSBL8xHVTh5pBT06UBXGFjxUiWKXD0sQW5
	qCMmrsNuhilQ3vLSsv3CFmpnNh6Fo7XvVgX0H7H4xN1i1vvtKCewQkcv7TmQAlrnhMyX2FFY4Xv
	CtmmadAUm54HEpkZhSAiujIPtx0k4KHQN2wpqY3DpRuSBdHSskcVipmOFWQiWV2JwX5HVsFvl+d
	wPC0Z1IcOe+rWXjs/rj2IAcBNFj91JzkX61ad/1x4PmmBQJd47z/DR3nragASRIN5zgFuIDH2cG
	OPfK6oPtoNYf2MixMAiLZ9l8u7id6tg+PyB5fJPaJo+zTZ/M1ht6vr8lOsbbo64hMijmikCVas+
	wTWc+RB7pTgmf74SOVWwuaaEuQ==
X-Received: by 2002:a05:7300:c8c5:b0:379:e0a2:1a1 with SMTP id 5a478bee46e88-379e0a20687mr10854768eec.35.1794851752467;
        Mon, 16 Nov 2026 09:55:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 081/105] python3-rapidjson: upgrade 1.19 -> 1.26
Date: Mon, 16 Nov 2026 09:53:33 -0800
Message-ID: <20261116175359.342679-81-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132536
Content-Type: text/plain; charset="utf-8"

Changes:
- Breaking (1.24): drop Python < 3.10; Python 3.15 wheels.
- Robustness fixes: error handling after PyList_SetItem/PyList_Append,
  crash serializing a list modified on the fly, RawJSON constructor
  memory leak, MM_COERCE_KEYS_TO_STRINGS with sort_keys=True.
- 1.26: reject JSON input truncated at an embedded NUL (also in
  Validator), validate number_mode, reject oversized datetime/UUID/
  parse mode values, normalize Decimal NaN variants, Windows ARM64
  build.
- Bundled rapidjson updated to current upstream master (1.21).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-rapidjson_1.19.bb => python3-rapidjson_1.26.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.19.bb => python3-rapidjson_1.26.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.26.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.26.bb
index 357a4c8f3c..a9f7a2974c 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.26.bb
@@ -4,13 +4,12 @@ HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6fe0b2465366662d7cfa6793ccbab563"
 
-SRC_URI[sha256sum] = "81e7260f6297cad564389b700783c0a33de71310b9eb01fd013faec5e7ed4eff"
+SRC_URI[sha256sum] = "db95af0b5ed5f89d4f91480477a0ea8c7646283e489dd9046e28503e85e08f98"
 
 # Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
 inherit setuptools3 pypi ptest-python-pytest
 
 PYPI_PACKAGE = "python-rapidjson"
-PYPI_PACKAGE_SDIST = "python-rapidjson"
 
 SETUPTOOLS_BUILD_ARGS += " --rj-include-dir=${RECIPE_SYSROOT}${includedir}"
 
