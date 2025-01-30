Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9212FC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 14:30:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.16419.1738247391625774724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 06:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DOCdGkWL;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283d48so6854755e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 06:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738247390; x=1738852190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NO6jhcOwNC9/eLDMwxmz9IyW+PLDNnxAclQABOu+DTg=;
        b=DOCdGkWL8QD5wZPyyu779XFeC8MkJaasb3Gtdn5mHFPebqn7vSDSt+ESW1KefNl2Cr
         IRcFiHxZ9T5jyFwUI5a3/6Kpc6kxwh6rgffM+NglyQa5Oq1EjtADagQjn0qOwQLaqZNx
         H+WdpQdtlXiVXVOWRZGPMkhzAkK+K1tjx2Sy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247390; x=1738852190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NO6jhcOwNC9/eLDMwxmz9IyW+PLDNnxAclQABOu+DTg=;
        b=rCRlERWOmi6JhSWopyQPBl7KL8a43HuSA4qHkVC8jMEn5S5aRBnr7doPEW1c4O6VYP
         besPOkUxdnv+AHjrbZk/Vh146CYwk1/iVUoKhxdQ1Qz3bHBFkSE03Sk2CXzxqTrJlkwV
         Z63AqGoRW5LAtoPrkKNrujgS1TMFatuJSQxiF2tuZI0nNk3J1K6s4Upwud38cH/5NUWU
         YfQAs2iiBSSyf/KfNFRa7kjzXQz6DcE67DZnWCH3m4YBmkl90dAS34oTiMHON/BLrFsH
         qcbJ0SlyoA2LAGeHl3Zdfbjw6XMfTjQY7NKaVrNuimzIcdBwaZejvbgG52/Mbv9nFgwP
         pGug==
X-Gm-Message-State: AOJu0YyZUQLUQb9XkcHAb1o4pZ99sVJ9ZUhvherN6/k/As9QZTKiZk52
	Uo1Hnj6XqKBW8lRPJgGfOET6eDu90BNLmRbpgZIjtTFrkLwJ+MkSJjsb7KRnzvvPSMqaM17fa8I
	/
X-Gm-Gg: ASbGncvZD5w07XL84yG6bQxyhTesw4+E+zAMahTI5ALL3xo9hkDdKCopLn/3EPo/2A/
	cop/0vnpbWVOR3kDAM2Vfac1DCD8mQHibT7Euzc8W+ZtHLxDIUlUo4lwoHpU5X0eQ8Vh+a1Lh2n
	YpA8zm8b6eaHBUfYGkPRz73D2Y5SpKJF5L9jGwzwbrYn34cZODhzrMgh8AVUS2E0420ebIlHIbc
	zfj2qiDhKX/FGCNnCuhWMqXiPgAY4hiHHldmxtg9oJGbGe/Aco0Noa8eudtbt2Xw8yNvUOih76b
	7hmc0mH1aOu0lN1QYbbKFs7g0Ede9w==
X-Google-Smtp-Source: AGHT+IEhD+ZFhLvefptUrTA60op4lkrwGvxpjYSWBD0CFpfO/qUAhMa9bya0ZdObzP3X7saPxHEB+g==
X-Received: by 2002:a05:6000:1faa:b0:385:e879:45cc with SMTP id ffacd0b85a97d-38c5194b78bmr6004704f8f.19.1738247389588;
        Thu, 30 Jan 2025 06:29:49 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b57b6sm2139422f8f.72.2025.01.30.06.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:29:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][styhead][PATCH] sip: Upgrade 6.8.3 -> 6.8.6
Date: Thu, 30 Jan 2025 16:29:40 +0200
Message-Id: <20250130142940.2771682-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 14:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115152

Upgrade to version 6.8.6:

- Handle single number macOS deployment targets
- Support for architectures where `char` is unsigned
- Support for building from git archives
- Run the tests using the current Python version

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: sip-6.8.6-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

The work was sponsored by GOVCERT.LU.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb}   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} (64%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
similarity index 64%
rename from meta-oe/recipes-devtools/sip/sip_6.8.3.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.6.bb
index d12130af43..157e404515 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
@@ -6,12 +6,14 @@ SUMMARY = "A Python bindings generator for C/C++ libraries"
 HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 
-inherit pypi setuptools3 python3native
+inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "888547b018bb24c36aded519e93d3e513d4c6aa0ba55b7cc1affbd45cf10762c"
+SRC_URI[sha256sum] = "7fc959e48e6ec5d5af8bd026f69f5e24d08b3cb8abb342176f5ab8030cc07d7a"
+
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} = " \
     python3-core \
-- 
2.39.5


