Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37960.1795594134865926798
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CZIeEgw3;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380c28f9e35so6624345eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594134; x=1796198934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGrfS1FJ06Gy5GwEb+OXnAC+zyj75co67xkM31tJx1U=;
        b=CZIeEgw3JpWS03d5H7uSFcGBTFAzAeMl0Y56uJg/P6EiS9x0Y0diGFtTM+GFsuApLg
         fE/14GOkBc4OEC8vLeurHDEwhoVjh8QmX58SlymO0+jPkYm/scdC0klWtkCDKmrYSFuy
         U3rT0g57yfveOrOk/AQDC2x2DEP3iNY8xICzcCUqAwlDlgc9cdoNcFDLgDEaEmVt1bEg
         ycCblCaumsGMaZCp3iPYVZzwOCsk4momgwghge7uZF5r3sf85OyeBMTH1nztdVr5iuvS
         hUkj1zP/c4NsL325XL8Uy3ttEnz5bAeJdEpYeA1pPlweb0EItdbmcAUaXgqNjmYK9E2g
         fmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594134; x=1796198934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGrfS1FJ06Gy5GwEb+OXnAC+zyj75co67xkM31tJx1U=;
        b=fpqWtQo415zmjSyCNSK2Ot4Q89OQpyAlEPXyslzRb2dmqccuxVJW0FGwD9/5wSaqGS
         NeY78jBTKd7yYq8Lyhilxlpl5CYfSdVAjjvNph/254QWUz4vuxNrA5aJsCdDfrVmigY9
         4HTOFp6Ej0KteeSY6NWui2uZj2Nz7NjTUNmFXQBESYydOHdsKPJfQyxbHC8opB4m3dMt
         p2tvOc7tz1i2mZtLpXsu4edP39qaIGLU68izQiuSxfsN4Sn99VqxnzuTrlUaj6o7oEnI
         XYBmqSJXxW3aSsfJFHyiNgm8iacXJ0p68pOFCaA0n24TgzVfuxOvVEFehYWH+3Cr4Sl+
         gV7A==
X-Gm-Message-State: APuU4Z+XU4fO7BSR/lRlJ+MQzGCgF1UbKoEBSO5XfkdTNAsWECV2AzGR
	1Ev4KCsB1nNN25XXVFy/HdMpUl1FiKzJJyilulGK0dXjmn41nG4DVcs7ioV8s7oI
X-Gm-Gg: AZFdTZc0Xs/+K6NYtDcG99/MkfUDc7TPCbb6kO+wbeXViww60wPyTocixlYoILt3Ynt
	jie+t3N5wMm3Gcmyj9HfaghZfXUFg8kzX1fkbfHdGi5+ftoSNUr3+Z0glbxYrnUWz5DtG9iJg69
	2i5YFO9ao+dcBlY3e91vd8UsGC3g/WE6wh+RHsnP6GMTMOGm7DMgpWwpbTfSUu5rmts38BTHrKR
	I44ukeXLb70YtCQUBq4oSGzlAdymNrPVi/6pHtHRhdDPxR8H5aaRS3stSkHxQpyocas6PP+DF58
	FgKfzdUTwgf0m1dsYb/K552fVOrBU5rPgfvn04Ig8b2qyS/Fv2aUzvwyyDQZH3p3k6HLjI5n2JO
	oIohiDNBI5IdAK4KVXBEyQh23QJXO4WEoOKTptiOtoH4+UbSKqzfZF3X9x5Vn1lcmJDqseTP6js
	oXu86TefHeal8QHlM9iNPZP4ChrJXYNjGRTXloV3H3pCKJMgFjO7ztmN24eIO/7Xx+ynDV0uqa0
	l+Vhk4cnuHTmhu5GSgyRKq49kY4ZmdpeSl+d1y3VJC7ncAzBXBXtgPWIlYt2M4VKPNRxWRRTna4
	xp1eLI7RcMugPUfaMyWY89owDIqZMdVyzPLvD93XV0voKTWt5haDOdJxzUubxeiOhFScDCsoO94
	AxUoFQDGpY3ElIkl00uqclti5c+nYw1H4bp4qrak7y/ZlOzEO7FloK261+VY/3BysqCP20sUYIZ
	/u6lfdQ3rWJtq2FJqC5ifJTyAjHPHMxZ9MWtKvIEpS9UvuBnxlRuK7wrYPJvp+Foed1J67DjcZR
	lweLE7m61SFCI1Qeyh1ccW5NcXyk1arW6s2jJ+8z+8Sg6Kw6vx5Q1vTYM5wbCEYk9JSKiCz3gqY
	1PWY
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr19918379eec.25.1795594134218;
        Wed, 25 Nov 2026 00:08:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 03/14] python3-bitstring: upgrade 4.4.0 -> 5.0.0
Date: Wed, 25 Nov 2026 00:07:14 -0800
Message-ID: <20261125080732.2419614-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133061
Content-Type: text/plain; charset="utf-8"

Major release that moves the core to the Rust tibs library, about 4x
faster overall. It has breaking API changes:
- ConstBitStream/BitStream removed; use Reader(Bits(...))
- find()/rfind() return int | None; len/length properties removed
- Bits(n) construction removed; Dtype.build/parse renamed pack/unpack
- LSB0 mode and bitarray interop (tobitarray, bitarray=) removed
- Minimum Python is now 3.11

RDEPENDS python3-bitarray replaced by python3-tibs, which is the only
runtime dependency now. No recipe in the layers uses the bitstring
Python API.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-bitstring_4.4.0.bb => python3-bitstring_5.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.4.0.bb => python3-bitstring_5.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb b/meta-python/recipes-devtools/python/python3-bitstring_5.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_5.0.0.bb
index ee2e8807c4..73e45dca10 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_5.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=963a24c175e658fbf16a764135121ffa"
 
-SRC_URI[sha256sum] = "e682ac522bb63e041d16cbc9d0ca86a4f00194db16d0847c7efe066f836b2e37"
+SRC_URI[sha256sum] = "01d876b6e7bbd912bfa3ae1d028ed419ed2193245fe2337f21d30afaa391c053"
 
 inherit pypi python_setuptools_build_meta
 
@@ -12,7 +12,7 @@ RDEPENDS:${PN} = "\
     python3-io \
     python3-mmap \
     python3-numbers \
-    python3-bitarray \
+    python3-tibs \
 "
 
 BBCLASSEXTEND = "native nativesdk"
