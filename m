Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F44CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:54:07 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.30468.1759744446334888812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hCl52cep;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso8847720a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759744444; x=1760349244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoxzuJGxxQO3KKY/HFQh1P7+RJ32nfEsAOFU754qbOk=;
        b=hCl52cepqQsfVnJNCT0KEpFYKN4J74QqyIVS6Mu33pbbXR7ocF+yhhVsUifH4WY4WT
         5LE00T9NEqX/UX8zUdWhVGTMrDv6ke1WnIP8ZHkzKjiyS7UDG3s1DDW6650M4iYAw+1K
         wUk+/Fjdp27+p6LKlxgklR2BqWUReGEiKB5ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744444; x=1760349244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoxzuJGxxQO3KKY/HFQh1P7+RJ32nfEsAOFU754qbOk=;
        b=XeClF8Zd0EWzTrd1Ra3QpsIzEBNtt6x1qB5CiNRbHXhcw3CtLM/Vl5OjD1yZj+lGAB
         wUn9/hXOLdEbVZ7gHeePBwkQLiTkh+PrjZOcCO62EV0NHWYMnSk1rSerS6cmwbp9oOWR
         3hgU/eTIA/+4YAmMKRvlFKOZnBxdJ7RLs8G8O/cfxCWYdacfxDJjAMhF08EzUx1At15c
         zwC5YiCMhJ4JhGaOyTjS8AG4dGYj7iOigHKKk/sXw+dLJvHoG7mvC8AUgL0ZVybAbRI7
         Bfc1vknmC4pFuHVQ1kZ1cbc3dVPL1fMRfCXeRWMxqb01PPkKh2rH+qpRssdL8ULT/ZPl
         L8rg==
X-Gm-Message-State: AOJu0Yy7DZRMCPjKS2crnVh3vXaZ843qszRrQ9YLQrtBLXKmtQxhfPeG
	Xeb7KF1N53pSz9oFHwkuhLV92f4Ftj1jVY+Zd9eRm6V85ukxUY/Yp9Gv3iUsgilv4b5tC6PCnqn
	KtBBf
X-Gm-Gg: ASbGncumv/zKkYfIfpqfQdHAVq9kg6mQiFJMnwwDT4o3/MzeeY2Ys6gNYIMKq+EEQ2e
	ROsEnOqKJYiqei4syNlJ2r1lRRj4Lg43Oxd9tvGmYcAnX5DnhdVsNy3FkH2S+nit/Jlu+WizzaZ
	9tcm1unjPdJLXZFD8lcutLr4RsHEnLTv1CekS8Wc2KN1KoCPhK/Y0qvnMsofoo32MyuSkCEb0Qi
	yw7EqwXNe3gctbVESYcuimsC4c2I+YlV5zZiufIYzkM1CnCfMrk2mpjjnRna6ESS3ZhzKqoblBh
	LKV4wi1hgzbLTWo4ShTvfaxbpBV1vgoDd4kfvfn0w5MFFU7GB1bVIADlRugtV/M+Epudz2CFB7K
	tJ5tN1/kaY4b4nXo3sX02dEJyb+p3dxHrlQTeqSUe1FDLPjxBAPUlyXFYNDZX
X-Google-Smtp-Source: AGHT+IFfnxGRIpppg8KqEu33u1BWt8FtMxlU01NO90J5yIgcs7v4lJeIYMF6oeqzmgLJoZQEwcSmPQ==
X-Received: by 2002:a17:907:868c:b0:afe:87bd:da59 with SMTP id a640c23a62f3a-b49c34474abmr1364601766b.42.1759744444453;
        Mon, 06 Oct 2025 02:54:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1094493466b.45.2025.10.06.02.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:54:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-pint: Upgrade 0.24.4 -> 0.25
Date: Mon,  6 Oct 2025 12:53:58 +0300
Message-ID: <20251006095358.532479-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251006095358.532479-1-leon.anavi@konsulko.com>
References: <20251006095358.532479-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 09:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120276

Upgrade to release 0.25:

- Bump minimum Python version to 3.11
- Upgrade code to Python 3.11
- Move to pixi/uv/ruff
- Refactor compat to make it easier to test
- Implemented several pixi environment and tasks to simplify
  development
- Add docs to the functions in pint.testing
- Fix round function returning float instead of int
- Fix return type of PlainQuantity.to
- Update constants to CODATA 2022 recommended values
- Fixed issue with .to_compact and Magnitudes with uncertainties
  / Quantities with units
- Fixed issue in unit conversion which led to loss of precision
  when using decimal
- Add conductivity dimension
- Add absorbance unit and dimension
- Add membrane filtration flux and permeability dimensionality,
  and shorthand "LMH"
- Fix find_shortest_path to use breadth first search
- Fix typo in pyproject.toml: rename AS_MIP to HAS_MIP so that
  MIP support is correctly detected
- Fix handling of extra arguments in conversion with enabled
  contexts
- Fix swapped left and right arguments in interp
- Fix formatted scientific notation bug in Python 3.13
- Fix ability to add dB units, and to add dB (dimensionless) to
  referenced dB units, such as dBm or dBW
- Improve pressure unit definitions in default definition file
- Avoid and document known issues with MIP during install, testing
  and runtime
- Fix issue with Dask by restricting its version to < 2025.3.0
- Skip false xfail tests linked to a known numpy issue
- Improve Contributing documentation
- Add Quantity.to_unprefixed` and `ito_unprefixed methods that
  remove SI prefixes without converting to base units

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.24.4.bb => python3-pint_0.25.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.24.4.bb => python3-pint_0.25.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb b/meta-python/recipes-devtools/python/python3-pint_0.25.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.25.bb
index 1bf62ca729..c85805e1f4 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.25.bb
@@ -6,11 +6,11 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
-inherit pypi ptest-python-pytest python_setuptools_build_meta
+inherit pypi python_hatchling ptest-python-pytest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "35275439b574837a6cd3020a5a4a73645eb125ce4152a73a2f126bf164b91b80"
+SRC_URI[sha256sum] = "22911a30d682ee0540d656571c19a7b1806ce00b2be88a16f67218108b7b8cc2"
 
-DEPENDS += "python3-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native python3-hatch-vcs-native"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


