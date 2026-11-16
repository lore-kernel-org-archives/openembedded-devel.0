Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33644.1794851676931110138
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U5J/gIF/;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37628596783so6269933eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851676; x=1795456476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTJXywXh0z6S7inFOtRIBDTLcIRJY54ab0P0aMChqYA=;
        b=U5J/gIF/z8KZ9ePe9GZEiJDciwTTbckkvAft4qYp4xEQks65kmVrOumVcv9l23sV5s
         rvXgfxYp4Eu8GUOCyWk1J4sU09uPvnfeXTo4W1msAVhFNTDNrkiQvAoY+M1tom3YqPWY
         8DtzMqRyXHMY3w2COit/xhryvGlNV+MIfTzdNKMYTuMNU4o7dumJfvd1LJ+xONEiECT3
         sGYF63wU/ORFlezc5gsFs/yZWkHjs9Swx9SXdi1I8C/GRVTw98luTb3knv0OuA41JlfW
         dghImPK7pTj/N68Wsthw2iGErsJGR5UsipV76onXxOfeSnh+WYh9V19xVqypiTcIBFEi
         +9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851676; x=1795456476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sTJXywXh0z6S7inFOtRIBDTLcIRJY54ab0P0aMChqYA=;
        b=tITosuO8QrJhu68WFnY4Fn8alzkpTrNntU18nSI9xPYymnvJDc+prnRFb5hV5zxWWp
         Dzb29cN8XgxMIPrCKSz6xjFgQKwm9gEAPLQLMWmHNTN93JSHwVW/BbDqUihLOiHdlZ++
         yd0lxiNvZ/xZd0AxyMMWeo3XuHdHVQjKMWhy9IjFcvDDjAKXWBp1zcOSn2BZPy6ql/BD
         NUx0Mv2rJb305ItoeSehe6Uw5hrb/YJOBRLm8N46CCT0d7pvc/Op/NMmAPq+RKudDhuO
         2eQNaDgKfJpI3FZoxMRbrnklTexg0S0IRR01GK0kVoiXb0bJQMTJAmEbEwJ9EUDR+qA2
         XGmQ==
X-Gm-Message-State: APuU4Z/pZoHPQziEhO1gcLOuPGFqqeej4tXt62vCwCnVRDfNSXsZTF9R
	hpw1cllqPWchvA23E6/irgExvQshwXQhcmX9QCxWRybdpFmvP7VLt9fy1w7Mv0SF
X-Gm-Gg: AYBFou1Ty7WjZTg8cRcPJF8q1CZaQemcNzQGdybZDuiNcwhwYMqQJXvdxZA4gx1sEqi
	9FoyoRb7kRUZ7eAgE78dKBAp+/VJA4Dh9cXG9eKHJOPjaLEX3ETSJsDRYnTVHn6lMMpB7KjAZap
	AfYshN+Es5EUNCHVIpNv4n9s9oBE2l52KINet5zDmhGPYSYyeHjqj1BU8rKx8g8NG7bwoKUvTf1
	dzQ5GBVt6JCxcdOn2cL97PmWkrCJCii8rk7wtQMJwfDv8JdL4gQFlzqZoJKYk6xMl43xP/CTJ/9
	6O6K9cg5m+G5ajC0lD07Ovj3NHTOAc2XDWt1ryibIMbuwQZ3E1uw0UjcvNZlkHrrNHSFAshxaQA
	SlZIg28t+RATdkQwPgtnoTyPb4rmter2BjbghvruYMxae4iTM9s+BpT91cWuZf3qnt0SIxPcDmc
	Fsqmhs7Uco6v2qJ/jSnZycYvVecAZL8CB+KhqKaG/JzcNZsEnsTzFuEWhdHC2+22uZMfN0t56Hg
	ek8YkiCYarO4p3YF3OVnzj7Vr7heQ8UZ37Gw7UupxDHEuaTMOGX8t9QFR4Jwsd5OCtZDPi6M9qZ
	v6rylhxp4Gr5K3oP0Hj9LuSGtNEYofV+cqjgiNs0EORLaDW1Qyhvdw7EIEoxVQkn55+R7fvHIBD
	YqIC7B8yuH2P6HOhzGa/bZTgxjiwx28HzDIbOggNlEm1FihRaorXX7N5ZO0H7t0CNUKhAr5hyrZ
	oSFkrwFwPl/3cpnKxZCbvitMNTA7Zjqq/m7YRcBr1kDOTdZWHoQBj/DZ1467axSVDMqbYwvLAv0
	P0o55OiEaOqzsh+3zrRAvnsuK/2t4YpWwjNG8sEA6Y5br9jX/VkIIHO6lIiSFkauX4ESmSsQAyv
	C8Px
X-Received: by 2002:a05:7300:4306:b0:374:c5cd:42cf with SMTP id 5a478bee46e88-3796721cfe4mr14807080eec.35.1794851676044;
        Mon, 16 Nov 2026 09:54:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 021/105] python3-devtools: upgrade 0.12.2 -> 0.13.0
Date: Mon, 16 Nov 2026 09:52:33 -0800
Message-ID: <20261116175359.342679-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132477
Content-Type: text/plain; charset="utf-8"

Upstream moved from hatchling to uv_build; inherit python_uv_build.

Changes:
- Requires Python 3.10+ (was 3.7); add Python 3.15 support.
- Remove the pytest plugin (upstream recommends inline-snapshot).
- Add IPython debugger support to breakpoint; respect NO_COLOR for
  automatic debug and pprint highlighting.
- Restore PrettyFormat streams after reentrant calls.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-devtools_0.12.2.bb => python3-devtools_0.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-devtools_0.12.2.bb => python3-devtools_0.13.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-devtools_0.12.2.bb b/meta-python/recipes-devtools/python/python3-devtools_0.13.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-devtools_0.12.2.bb
rename to meta-python/recipes-devtools/python/python3-devtools_0.13.0.bb
index 25ea7cd11c..cd43882fb0 100644
--- a/meta-python/recipes-devtools/python/python3-devtools_0.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-devtools_0.13.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/samuelcolvin/python-devtools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3c69d58fa5f4ff0b4244368d39546751"
 
-SRC_URI[sha256sum] = "efceab184cb35e3a11fa8e602cc4fadacaa2e859e920fc6f87bf130b69885507"
+SRC_URI[sha256sum] = "e3a848080404bd4e10dbf535fe016c6b593fccf24a8edac863048b8cbab3d92f"
 
-inherit pypi python_hatchling ptest-python-pytest
+inherit pypi python_uv_build ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += "\
     python3-core \
