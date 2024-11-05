Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4C1D2C116
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:01 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.19619.1730817420727411481
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GiJc2N28;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5cec98cceso44059027b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817420; x=1731422220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ez+xSg8+QBJkOuEm0vJ6MdQ0fSQ6nrTWd5Qavia46f0=;
        b=GiJc2N28igi9QJ5ZQ07gr71honVxrRtSfwPbQGIMs4KGLm9IHXXnAc193B2qHjq4nY
         0r57DYnVpZGXT9spEvX+2UmC9hO2T0NprqTQ8ZAREu1oCXMPp3xbn4oB0BGUa28l0Va9
         YK/XBOHfquVIIqLZ7X+emax4EOmP+sw1pgRT7bt67dlfFiXJ76PrXGElP7cyjC+Suhhl
         hOI/VzzQXIJOBwiTbyvxk2qM4a07bGD4zVPhKc1i2c/sajWJF/PbDx6fGp3BP7avKRCz
         WKUIEFBL/bYwrlcTLBfAAflgH/rfWnxS+eQW0iiD66ODl4N3+pFeDGbsUv81YhHMW2Hs
         f73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817420; x=1731422220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ez+xSg8+QBJkOuEm0vJ6MdQ0fSQ6nrTWd5Qavia46f0=;
        b=pqkSRgz3xx5SguzWDTx/zlHYORoFCbikxbDkvgPhALlLwSjmjxKeg6SNS+nfY54+jS
         TYksWMKhlzpV/vKj8qf4G7mNYfaONcuc1Qrc30AJR9aLdaoFG4Z3xx86meVW+6jr6VMo
         Ht4rggCOg84w/pWiVadlIero5PmwX6TY8I5wn78HuxSWZpiKQW+qvf2aeqe/WgeAPt2e
         svZIcYSeeOPJWUoIFLooqYLTscU1e68ufxxuAsTU/C/mAxxTygkbSSwy8/xXExVkKEwz
         SPXGKdakWuSmJdUx08Fig5Ts8ie/kSjIBfYdtmvUXu/p9+XM0Dx0uiWXl4BlUI4I1IiX
         wCVA==
X-Gm-Message-State: AOJu0Yzr61Q804MFaIODCbH5/biuMj7yJx1S80JR6wHcDKxBZT6sO1IS
	cDf1VUgXRnpcB8xuzHt/m41n1cAoQ4f3jUfBUZHlKfPjgbc4WPDxoKmllw==
X-Google-Smtp-Source: AGHT+IGWfOTLaAmAMQX9uoJn3gv+41/hta9fqq5dvwoCOPppoIbSHJHVFplhoGVtb9bIP37n3i+XPQ==
X-Received: by 2002:a05:690c:7445:b0:6e2:4c7b:e379 with SMTP id 00721157ae682-6ea523d1ae7mr208378357b3.19.1730817419735;
        Tue, 05 Nov 2024 06:36:59 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 45/90] python3-eth-hash: Add packageconfigs and switch to pep517-backend
Date: Tue,  5 Nov 2024 09:35:10 -0500
Message-ID: <20241105143638.2301245-46-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113463

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-eth-hash_0.7.0.bb          | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
index 0f548cf86f..1137e744cf 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
@@ -1,14 +1,20 @@
-SUMMARY = "The Ethereum hashing function, keccak256, sometimes (erroneously) called sha3."
+SUMMARY = "eth-hash: The Ethereum hashing function, keccak256, sometimes (erroneously) called sha3"
 HOMEPAGE = "https://github.com/ethereum/eth-hash"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
 SRC_URI[sha256sum] = "bacdc705bfd85dadd055ecd35fd1b4f846b671add101427e089a4ca2e8db310a"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} = "\
-	python3-logging \
-	python3-pycryptodome \
-"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[dev] = ",,,python3-build python3-bumpversion python3-ipython python3-pre-commit python3-pytest python3-pytest-xdist python3-sphinx python3-sphinx_rtd_theme python3-towncrier python3-tox python3-twine python3-wheel"
+PACKAGECONFIG[docs] = ",,,python3-sphinx python3-sphinx_rtd_theme python3-towncrier"
+PACKAGECONFIG[pycryptodome] = ",,,python3-pycryptodome"
+PACKAGECONFIG[pysha3python-version-smaller-3-dot-9] = ",,,python3-pysha3"
+PACKAGECONFIG[pysha3python-version-bigger--equals-3-dot-9] = ",,,python3-safe-pysha3"
+PACKAGECONFIG[test] = ",,,python3-pytest python3-pytest-xdist"
+
+RDEPENDS:${PN} += "python3-core python3-logging python3-pycryptodome"
+
+PYPI_PACKAGE = "eth-hash"
-- 
2.43.0


