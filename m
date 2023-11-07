Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF9CC4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:09:03 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.8050.1699355333176400348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IB86V4rH;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5440f25dcc7so7212857a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 03:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699355331; x=1699960131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVvMPqeGIdip8dUHf+Kk0mbKpe8WcqtZdAEgDsxUP9s=;
        b=IB86V4rHBIRSQtOLt51MNRZd5BFp0uzf6WYULZuIeqTy4n3BFNCA4/vIBtNAxeiTHG
         PHYYEAjz1anP4TkPmWzfZBcvt+qw6t7PTp6oCyMT7onm7bfAzCyDxsHceVa7S3eF3hYJ
         apgAIWyLhiTV5JEFoiNQVDdO9Ev0oTB4o03Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355331; x=1699960131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVvMPqeGIdip8dUHf+Kk0mbKpe8WcqtZdAEgDsxUP9s=;
        b=sL2B3AV3T6Ee7xJB+WKRsH/VH7SoTWKtX4fdW2TInSZmSVt+gxhHYgmB+CFGcwBffx
         bwMIpDkxtwnm/qSTV/LggCU8bsK89BR4qFk9JdtcEQY5peD0zGEFEKQx5/Xr9x7tkTCU
         TvrP2dl4GODqzuqyWtIN1dhV+PwORqBVWeM+5MqB8i6iKMENHe5KthQyQ1oVsrn7UMxU
         +LqjwTlm115SvUI+Uz6Pm+nNdVfVTLRjHkzplJM6H3vijFEppLFcA+qw7Xd/kUXc2JMJ
         vVFhaNSUmSpVG84AlysX8LPEKTB+uKzOY45RuAcXXQxTUtaj/eLLhWRxt6WK9B7m+LmZ
         kG7A==
X-Gm-Message-State: AOJu0Yx/f+ZYVeT31OuuCdlgoFGbB1chwN2f/jKRU2wUVjKGauc2hKSZ
	prr3Spsa+yaZpKXP/ka/CH6oJn2HDKGRuPBqBWk=
X-Google-Smtp-Source: AGHT+IEfb+H/Lvg8ElLrixIyvTFF93zWU68sfCBozZeHd5ZZQ+JC0YwHQ/Xj09cB13zyzgyTYwg1Uw==
X-Received: by 2002:a50:bb2f:0:b0:542:f28e:2947 with SMTP id y44-20020a50bb2f000000b00542f28e2947mr20933358ede.26.1699355331164;
        Tue, 07 Nov 2023 03:08:51 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 29-20020a508e5d000000b0052ffc2e82f1sm5515763edx.4.2023.11.07.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 03:08:50 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-wand: add recipe
Date: Tue,  7 Nov 2023 13:08:45 +0200
Message-Id: <20231107110848.1610779-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 11:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106446

Add Wand, a ctypes-based simple MagickWand API binding for Python.
Versions 0.6.13 and 0.6.12 provide:

- Hotfix release to remove a "work-in-progress" pyproject.toml
- Fixed behavior when passing zero to Image.chop()
- Fixed libmagick yield MagickCore library on Linux
- Fixed removing mask when passing None to Image.write_mask() method
- Added new COMPOSITE_OPERATORS operators

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-wand_0.6.13.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wand_0.6.13.bb

diff --git a/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb b/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
new file mode 100644
index 000000000..85e05ad97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Ctypes-based simple MagickWand API binding for Python"
+HOMEPAGE = "https://docs.wand-py.org/"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bf19e5c00d047fee994ae332db3aab6"
+
+SRC_URI[sha256sum] = "f5013484eaf7a20eb22d1821aaefe60b50cc329722372b5f8565d46d4aaafcca"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE="Wand"
+
+FILES:${PN}-doc += "${datadir}/README.rst"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


