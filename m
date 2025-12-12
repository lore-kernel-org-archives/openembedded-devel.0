Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD60D49212
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:14 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11039.1765540689396446635
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2VYGHJn;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso1178922b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540689; x=1766145489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38MmH9yy3T9+85ySO13dupJqa6go2XqoK3GHpjZV6ZM=;
        b=V2VYGHJnpazRqL9Rq2APymsoZWP9ynms39LOwdyhxFWB51FF8wUX3+FRJND1ZKZOuK
         h52Yvtx+YncBYfPPcPYmv3uV8P0Vr6Gg14pySuKlnhyd+/GpxwIsHsp2u2qZx3emfLKi
         3w8XlYGoW7g7yPn/Dg9btw4NY7MkG1zCBloQKm7DkrURovXeRFO5ZxWLjNY9DW4z50hi
         cxwXEZ5zUH7kpxwp2pJXecaLYpgbhR/1Olc3t7TDut/klsI6J82mD5uzKQaBi7wO54sb
         gdkNMroEBadC1rnQ+D2P2ofGcBMHNB+PPxdMN5xdlDVQwjB9LS7s7Z2iJiCcn6syeYuD
         NshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540689; x=1766145489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38MmH9yy3T9+85ySO13dupJqa6go2XqoK3GHpjZV6ZM=;
        b=PG8ahu/TS/BKPX2fyujaNkUbdhiqW69AoPen+HhvJUgUhZo7yPdTbOWPOga49aFfes
         RQFw7w3RT86a42XmWs0uMqEOebXtGk9zXiUWnopfaKf2Q9vR/AX/Vb09HPgM6rIq66MF
         wMWKo+MvghXwRwyaVzRMFGNY4x4Hx7IiGasBY/NSd2AzbrpOwNLp5KevdaaYJEy5R3LD
         NkoxNMli1aoM7z33C+YZl1UVyPgmwsg6nbfCO9qfsy0UAcRQBlQ+z7A5qvUkHXItazm2
         qCit2sVU+5nkgO78gRjaFRrgZ1VyZcDOniL4axH/oKX5zFZNcPwhgn//MlTKpIwUM9E7
         JEmA==
X-Gm-Message-State: AOJu0YyUq4/px1r7xKPgQcBv0IF+dXgA2oAPZX/UBsGYy+5wdLLs5m4/
	kmui1dbZQFP9BRw2/n2qTigsZojh4UzKXfFjLtX5zV0KdqxC1Qimye/MxijBoQ==
X-Gm-Gg: AY/fxX6aNHB+kWrXGq+Mxr65za5qiFekpoJsXJ2c/hHm1sbslwC5mToeUzmIv2CS5ay
	3o5EFx/YNq85OuiLmx8fZ/ty2cknxK06VQTrkWRWe6vv/tlkzWeGnvSQmSdh+A/c4nqn66Gbzcv
	nOj3wS8y8cXpVOvCIaXYBdWrRmNQwUmR3CXwi63hs3oXERA/QStyGFSWwEO5CBVQ3qToBXFWtu+
	siGY7SDMkTofee8tuqD6zhXBQn8vuw4nZNrUob4Vta9PcnJfqJAwqPV4dz0Yb5T6ateLiUsVHR5
	TRtIfyTOp0X4WDr7IJr0mWC755hye1Rpto6Xd/gJE5Lw9jyxB8gHWR2xf6NlOcUOuy+Thgwa+jj
	1lrBCWpjrRQGUSbDc+Fg4vjXYDVkdIRGhUN5aecWjvtAMYv0cXjq9IZFNoN+Ttglo7p6NfAD+oF
	tWAUNuBLNM8AG0jauG9RaubLA=
X-Google-Smtp-Source: AGHT+IFkvlKqQrb8D7hFGcX87OSn5/s4Fw4R5wWEOp///XGK2GxD7NajJZy+ClWseBymUUCoVGdNmA==
X-Received: by 2002:a05:6a00:2884:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7f667e16cd3mr1850592b3a.30.1765540688657;
        Fri, 12 Dec 2025 03:58:08 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 09/15] python3-pybcj: upgrade 1.0.6 -> 1.0.7
Date: Fri, 12 Dec 2025 17:27:38 +0530
Message-ID: <20251212115744.569676-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122609

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support for python 3.14
- ci: fix test and release workflows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 797e29ed4222dad9539f72c846e3435c92d50604)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pybcj_1.0.6.bb => python3-pybcj_1.0.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybcj_1.0.6.bb => python3-pybcj_1.0.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
index 1d3d0ee245..299677b072 100644
--- a/meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "70bbe2dc185993351955bfe8f61395038f96f5de92bb3a436acb01505781f8f2"
+SRC_URI[sha256sum] = "72d64574069ffb0a800020668376b7ebd7adea159adbf4d35f8effc62f0daa67"
 
 inherit pypi python_setuptools_build_meta pypi
 

