Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8FDC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:19 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31922.1788776655748392840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AVoCAOpq;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b8ef7de4bdso645341eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776655; x=1789381455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvZ3KPmnIjghgdLR/tfGlDwOykvlEnyivhXa/nkEc5M=;
        b=AVoCAOpqCe3r2iEtNhOy6tWqnOZbGl+FbM5o1YzS3N2HVcF3+g+I72ESKe43auNWaM
         gCYzgJcNtTRocsOzGb/zJya7QR0TP+yYU2sOJWiG01grubuj/Y/MKw/cRexVOP53PM+l
         GcqFowcINPfooSt0qDjhajtOEmqVAJC/EZPUR0tOAtjkIXwqVvndyOx01zv2R965307O
         dqq9vyPmDCNCFMB+DOmZgjj7y6Z4wqd/wNhIqUxk3XulEeWhR32PpzlLD0Fw5w8jRojn
         tFKPWpQBawYdm0rlbUxUIAY84H4EVg5cgRT3xrzHD9wOS9Txm9iZdZLpNuczIdPo7iZ9
         84og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776655; x=1789381455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QvZ3KPmnIjghgdLR/tfGlDwOykvlEnyivhXa/nkEc5M=;
        b=VqA/NOzHWh0YaKDTl/2PVqB8tp3eDiNwcc9VZIYNVdtzEcuDWjdjgWA76nhJnPnLRi
         +8wfgSUdaY2DlFx6VyjP6ziVrmTN0KY657m1FN3GPJ8OG4dSn4qlbZqNq3U8pV5AJG9r
         11CUN6HTG6elTNliP/Lu9XWviObl02vGmV4GqmaVw9/qwe/uWQ7szMXFWkyghchR8mOE
         lIBh43GF9jyiaaepmZBlqxdaOpo11fwNT8yKO+HUIcVCYlfe7dbI3FRuWpPQxglniV59
         Bh169TiB+NqDNv2XxTXcr/VrBQn7laXdV7ofTscHZZNcDI6mzn4gCby9LuDZdy52/WRt
         rgPw==
X-Gm-Message-State: AFuF++n+tyF/8+HMLzcRZIHC98bN/RNFnJELdoCFyAvN7tbnnNwVkLMW
	PDB5yl9n9YOq25eSWzmQ6AtHxl4siHYlmLCA+PIRWqR8cEirRNN6+4AHfT1j7lBS
X-Gm-Gg: AYBFou1ZMoKPNWzHBUysLFrUDs0KMlgnr2WaJwUKB9FxvpT6aRm122IbX/LwEy3mIkr
	KWngr3XY4dFedtXpSJgvOFMnlaU/yCd21uxsLuQTKS34ObMDPTnUSteq9CBxbnyOHhHjcjfTRoy
	KsIBxGx8TG8CHv6OHt0MzjhGBt5lbzTVJb1NZTJUVEhHTzx4e9bDW+EK8i8Gy0FQmo5O4DQY3QZ
	NWsWsSWKxpYSg89nWWUZCSFI9tTnKOzUWdl57K3JsvsqBHw9+wCVlhL3A++hvbjFpuDNTfl9i2P
	oNK+oAb9tyP7TMaXHulk2Ayv0di4zyiAqLKn6B+ChEpSi++Gy3AQGDX1LgAGJbXzF+YepXGXSVi
	esXdEhgXAUbhdrB15m/qTeJm2+nx/bbEKkG3j7f8+yrXTJNrL6ieB4jgeJSuoRoYrvoNXp9bCGm
	6TpWrFl8YiSUJrBAWJv0ao/Gl5DOGypsX2xFMCCjoxAwOv3YiFPHrXfTeMx5yPKGpFDPmd9r0A
X-Received: by 2002:a05:6820:f02c:b0:6b7:8396:f3c4 with SMTP id 006d021491bc7-6b78396f8b9mr12562022eaf.38.1788776654824;
        Mon, 07 Sep 2026 03:24:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 17/33] smarty: mark CVEs patched
Date: Mon,  7 Sep 2026 22:23:01 +1200
Message-ID: <20260907102318.2459883-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129829

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2024-35226[1], CVE-2026-62992[2], CVE-2026-62996[3] are patched in
current version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-35226
https://nvd.nist.gov/vuln/detail/cve-2026-62992
https://nvd.nist.gov/vuln/detail/cve-2026-62996

[1]https://github.com/smarty-php/smarty/commit/0be92bc8a6fb83e6e0d883946f7e7c09ba4e857a
[2]https://github.com/smarty-php/smarty/commit/99c048ce7a590c519b79fbd38ad0143a08183a1f
[3]https://github.com/smarty-php/smarty/commit/3c9f77a2e06ce319ae0092496af32cc8f3adc52e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_5.8.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
index dcb7c85a80..cf6c42345c 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
@@ -35,3 +35,7 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 RDEPENDS:${PN} = "php"
 
 CVE_PRODUCT = "smarty:smarty smarty-php:smarty"
+
+CVE_STATUS[CVE-2024-35226] = "fixed-version: fixed since v5.2.0"
+CVE_STATUS[CVE-2026-62992] = "fixed-version: fixed since v5.8.2"
+CVE_STATUS[CVE-2024-62996] = "fixed-version: fixed in v5.8.4"

