Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D479C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 07:50:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.9423.1706687397491180835
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 23:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UctzSgOc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40fb63c40c0so65785e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 23:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706687395; x=1707292195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HICDGWqhS2GPDGQoyQChvljKWJL5dXsqEHv11XpWfbI=;
        b=UctzSgOcMWt8vJ57uqSnaDhH4HIgkzbcBdVXAVc5n4wV7YafwHcwfykyusniVut+L7
         F0sJGiLTYSROHTL4I2DTnAj2fUQHCfN762V63SVlFZnH+Cr2t1vmoA3SdefWFS/z5s/9
         ZS/ldr5VDu7gnWIA+w5HkCOJuC05lXtzoecruGpD1sAYLLIjkcnCUv0eciMP1ye8I2JX
         hsRat7akWnVnF4+wU8n8F8N62jIheEypA6v+JtOiFhIFMHyzem9nmkk0R7H3q7pbEGbl
         ulqFk3npjxaC/KZBXQvZ+D5Aoo5NXmxV/6JIjq2Qs22quKvwAktglr4mzKa9VLevyDkA
         GjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706687395; x=1707292195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HICDGWqhS2GPDGQoyQChvljKWJL5dXsqEHv11XpWfbI=;
        b=EhrHsm+m0JLLa5A2Sy0DZW+qjvA1BOCj8h2e06sFzUqcRVvxmFOpywnJSDCodjFYnv
         zEfT3obbwaCn3v9rPRbFOv4A9CS1tqQnLt2OJdG/nwO5SaiOaUrgld69vZ+7NILuibLz
         0v40Hhaq8o3Jzb+4DjNSjGLX76XWkiv4HRENehExObJejpuQXYrh3yKF0noMxoAEk5GA
         GosrvOs/OFcxdJR4q+cRG4RpozZ+cq9GJIkoQUwrrcGsri9Sv7LNuKv4p4KeM49Jp0mV
         OfRNisbQSDpYyJJm6WzU3pk0mt/57jl4c9jUc/oMHcYPH/5q4tnAe5NsWzGcoHImN8+a
         36KQ==
X-Gm-Message-State: AOJu0Yyhi2KygLw3/gMOcrt26Y4c9D2FwEeX+Ss9jA8hJJkS7xkt3nHg
	JDHjg681utB7lMxFprZYhUEYt0PrEUKthOne0FO9Ksn8w34b77k0KXTwYucPQZg=
X-Google-Smtp-Source: AGHT+IHMd7O56qKmdOCNeC9LKnYCcg2VnvjI2NIGpY1siWRI8wAYXtj2YHOX+hl8T90dIQfTVV7NmQ==
X-Received: by 2002:a05:600c:5254:b0:40e:f4f0:23be with SMTP id fc20-20020a05600c525400b0040ef4f023bemr784958wmb.0.1706687395162;
        Tue, 30 Jan 2024 23:49:55 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b0040efcec0a6asm740165wmo.42.2024.01.30.23.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:49:54 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-google-auth-oauthlib: add recipe
Date: Wed, 31 Jan 2024 10:49:48 +0300
Message-Id: <20240131074948.18462-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 07:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108505

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-google-auth-oauthlib_1.2.0.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
new file mode 100644
index 000000000..b1e89e4b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-auth-oauthlib_1.2.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Google Authentication Library"
+DESCRIPTION = "This library provides oauthlib integration with google-auth"
+HOMEPAGE = "https://github.com/googleapis/google-auth-library-python-oauthlib"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "292d2d3783349f2b0734a0a0207b1e1e322ac193c2c09d8f7c613fb7cc501ea8"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = " \
+    ${PYTHON_PN}-google-auth \
+    ${PYTHON_PN}-requests-oauthlib \
+"
-- 
2.25.1


