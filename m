Return-Path: <jun.nie@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E19AC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 06:58:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.25757.1683615528934851839
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 23:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=sJ9DraHB;
 spf=pass (domain: linaro.org, ip: 209.85.210.175, mailfrom: jun.nie@linaro.org)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64115eef620so40162943b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 23:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615528; x=1686207528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fa4hedSEyT37y9a4Aj1XNjuASTLDKxoOTIShXfiCvg=;
        b=sJ9DraHB5kErdH/OQUrC51EdPMWOR2u61GMR6oEYqTefyjMJF7q3rkIwg9sZc0qAq6
         b5nRPWCAe1nhpkeJ6R4xFa8wi/gwS9pFy3S4AKsxuiLl9oHCA5VIuWFgEYXB0mtAjFTZ
         xJL1l/C3vD60iDlIpPkrfi5Z7W9lpiE2FYgmJOkXdzvlcLv52noOiwlHHjwrULUMyGSI
         wzijH3FZi3WkryKmfiZYUCWkTOF4eMl+naOBmNMFgVrOgTDbV+YGWOS6L1ZLOcClyOAY
         YdOTjgXZq9QiatsvZLKMTAorRFgQPhzLDn1xgKd8l9d9cAW56XrtE9+aWwrMvatsXEFu
         g4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615528; x=1686207528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fa4hedSEyT37y9a4Aj1XNjuASTLDKxoOTIShXfiCvg=;
        b=k+5QtZFJY1B5Law/4G1diVmShJ2Gv0i0YwrIk9l8SVsEuAVaZyOpPwr/KNNVQmRJAI
         hgNsP48R7BIjOy0mzVeHwM1Ktu7hqYlov+dzjVMrJUoYrro7hW1Scr8ENnNT4VEmqCTH
         s6Cnt3QbRPyIIEn0IjKJI5YlQ7XLh4eccWrhIyzMw6/+4pEjIiV+J6upS0ml/LDVyOb8
         KywHulwE4d/8FCtNChjR0R9Eq/daEsxOuvuV0jg2g/kzV6yDNUCYuhUZt6wgBsMyBwnD
         Bs7Bd7EwaAbrjsBW2DXMRGof3BPaBAYOwn6BEtzZmGpqV7BC2S8rbkEFU/6nL/SQlhuJ
         WKLQ==
X-Gm-Message-State: AC+VfDxSaoqo9YyU/Ye/3m50B8z0/5igQy55Tc3QJMcw+hqQKNuqQ4ua
	G2EKnNZQEelaa79cjam9IiiGoQ==
X-Google-Smtp-Source: ACHHUZ5DmcP06lSFx9xYq4XQ6c3gbVQ6uNrYCYm04DONDu0IuAwH8ZXJKR+7nHwhLhjIy+0uTBwTow==
X-Received: by 2002:a17:902:e5c3:b0:1aa:d6ad:4eaa with SMTP id u3-20020a170902e5c300b001aad6ad4eaamr15937070plf.2.1683615528237;
        Mon, 08 May 2023 23:58:48 -0700 (PDT)
Received: from niej-dt-7B47.. (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm700038plr.190.2023.05.08.23.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:58:47 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard@hughsie.com,
	raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [meta-oe 2/3] python3-pefile: Add initial support
Date: Tue,  9 May 2023 14:59:39 +0800
Message-Id: <20230509065940.1584276-3-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509065940.1584276-1-jun.nie@linaro.org>
References: <20230509065940.1584276-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 06:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102466

To parse and work with Portable Executable (PE) files

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../python/python3-pefile_2023.2.7.bb               | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
new file mode 100644
index 0000000000..37e27b1a03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python PE parsing module"
+DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
+HOMEPAGE = "https://github.com/erocarrera/pefile"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+
+inherit setuptools3 pypi ptest
+SRC_URI[sha256sum] = "11cd7ed7082d5256e9741e8b98c654f061723fafb5b2719c01a0b4cc6f89e09d"
+
+PIP_INSTALL_PACKAGE = "pefile"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


