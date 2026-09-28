Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026F2CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:57 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46626.1790553827474860751
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aKuUJe+/;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso9727635ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553827; x=1791158627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUdwZEekv0MFPTQxwNKtwROnn6cY8Gkyii0l0suKDsM=;
        b=aKuUJe+/P7eyFPNDdcEPmVNdBuizk8WKbMfNblcCB51kEeJwdnBPBNl8Fqz1KnJYTB
         z1pPmzz7foQk4rtf8SpvGEb1xHIfptq2FPL5LotUekQ2bhXS9cPRqwiIhG4k7eGAyy96
         F1BFBVBRoWxl6b/4iumW8Q3M5PSvQPtJJU4WLPbistKyQey5KvFg5BLuKxosMoL+90om
         ZrsTh0MUNCAbccSabYom2Mc0Q4qWMXN3Zou+B16bMYQack4sOuc0T1doWOsGzvQthdC7
         wg7O01MAZ3NzLJqJvwKvbYQ3eWhbWnqAJN9FPt41sav6Qs1TmxNnTwb8aMRwPopoejYU
         SsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553827; x=1791158627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUdwZEekv0MFPTQxwNKtwROnn6cY8Gkyii0l0suKDsM=;
        b=vlf5TFMSpjQfh7L184fO/ZZQyNCKDEFIyqjEwyZYTnW1BFIDlNm1SvuOjOzl/TzNb6
         zZ2BqXhNuf7aZ1wnedg0HZi8M0Dj89o75SubkyX9ZaAluP/kuZWpZ76cYO+S81b0oVyf
         /KPmV0C+G13iTFw/qSj2IWfevoLHSPwyRL7FQxwQe0vrKEC5hLxXNkVGETHmaJH8aGvn
         KemMwK4pNgfVqoJyil0t4SuO1yn1VuXSfu1ezidmst9vSA4Gtgddns1eH2soVpRpvpXK
         T+zhq4ccvp6vh3TgGTCx711JuoFOypAVmZTgtW/9FnIriQNaFZmrCW5AE2jDoqqGOa03
         U14g==
X-Gm-Message-State: AFq9FYIGP1f/afx1FE3MCUeiG0E0HmdFUpLvpjZ4BovUn5aOFkPJ48j/
	WBQUiKeAyjdtoPp3YRgtCP1RG9DV1QZy1PvEQezFPLClRhjOXFSyX9ljwhSkjg==
X-Gm-Gg: AYBFou2377IAAQlq/Oe4TOSb2rBKNCxgsGjIXL0Gai2iHomDwie0DgwQrrq4Ib8TADl
	ubiyJQjZZgkBzncACb/e1OHQ/TgANj09JjUKq3VH+uytLtq1djeyjHswWVgt9nvyNtjUI+875Bu
	w0c02XqRLiAknaON1vvuXjjAikf5GdHDtuGLLI/yqVQi0b5WbUVGcy0Vwxz0SkJohs4kGv5uDrv
	ek5lTps4mZbqbJGaB9sBtieah3xIlc8HcvfjwBsyqu2FRP2HuyZTqzaSg2cr7I48BOqlmCH9FzY
	mF3rZQtEC9b8A1sMLmUy10uzzsgvNahXFfCyMCZK0miEk6WyswHpWyeWye11s0iiigsNO1GmvJy
	9VkSNeOt4SQqoP8nui2Tzq9wCFodgwGNZkjXwO6hYjobJYVStlomwMhUoXjA+dSPZeq/wR1BpLk
	TRa/taUN9mjHz1PXJKKMwHCK14wvnAuKsq5noxHt87eQwhKdu58RsFnEVQOTFKRgLDxo/P/9Xfj
	H+mHdexG9Lg2y0m41NvzYA=
X-Received: by 2002:a17:902:d4c5:b0:2df:9d04:404e with SMTP id d9443c01a7336-2df9d044313mr47324395ad.41.1790553826702;
        Sun, 27 Sep 2026 17:03:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 18/30] python3-gnupg: upgrade 0.5.5 -> 0.5.6
Date: Mon, 28 Sep 2026 13:02:50 +1300
Message-ID: <20260928000302.2528437-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130405

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The 0.5.6 source tarball on PyPI now uses the PEP 625 name
python_gnupg-0.5.6.tar.gz.

- Set PYPI_PACKAGE to "python_gnupg"
- Set S explicitly, since the archive still unpacks to
  python-gnupg-${PV}
- Set CVE_PRODUCT to "python:python-gnupg" so CVE matching still
  works after the PYPI_PACKAGE change

Changelog:
https://github.com/vsajip/python-gnupg/releases/tag/0.5.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-gnupg_0.5.5.bb => python3-gnupg_0.5.6.bb}    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.5.5.bb => python3-gnupg_0.5.6.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
index 2f2738ce9a..e9fe3c78b1 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
@@ -3,11 +3,15 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
-PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "3fdcaf76f60a1b948ff8e37dc398d03cf9ce7427065d583082b92da7a4ff5a63"
+PYPI_PACKAGE = "python_gnupg"
+SRC_URI[sha256sum] = "5743e96212d38923fc19083812dc127907e44dbd3bcf0db4d657e291d3c21eac"
+
+CVE_PRODUCT = "python:python-gnupg"
 
 inherit pypi python_setuptools_build_meta
 
+S = "${UNPACKDIR}/python-gnupg-${PV}"
+
 DEPENDS += "python3-wheel-native"
 
 RDEPENDS:${PN} +=  " \

