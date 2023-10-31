Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE50C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 17:51:43 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.2386.1698774699126833209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 10:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nUv+lfeT;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso9566712a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 10:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698774697; x=1699379497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cl9Tk2PHHS6RZcD6wWSNMSv3ahPOnyAfY0YbgVHy98c=;
        b=nUv+lfeTM0PJtiRVbjjCiyJLGJeSMP8W51HYWXMf1yR+6kZqx1wlo3BB6Tc4Ydjvvu
         H0VxOjtKwtgDRwxtew644Xx0IJmTdGpfdMjfJV9943rtqY8thhy6Q9cPEnAEWGQRHBKG
         XlJEcrNe/j/mpIZAylKMhNXtEhe/MqBkc/YVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698774697; x=1699379497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cl9Tk2PHHS6RZcD6wWSNMSv3ahPOnyAfY0YbgVHy98c=;
        b=Zlheq51Pv5hKO4sKMvXFH26VWLYsE8M8JkO7BURI+p7jujdz0pcbZdn7TA2pCLImP6
         IvnWufUCcNuDoYLg5ynQZcrKGfzzUl4ajI4VTjgEg5tvYd91PCY+w9pnbairqblbRaZ4
         zqkq6hq3Y3v9OS8T0O5Ue6hkOL9Ca1SUDPS2JSU+aXjX2DsILavGLNXs8oo+wEDPltBl
         NZ7MLGHdTC1TAswCHTIsUax7E2nnBaSvLlHPgfyWMB51r3Px+9B8/lHyd/QbY+wjFu8V
         kX6L0SdQCkr69TYOFP8g9w6W4saFZQu8wWquTjgljGBOIvYKmq/0QJRFF8oQ49xdDkt/
         TWSA==
X-Gm-Message-State: AOJu0YwpwrvAZX80srX1A7qkgLIqxrt/Ak88vyHc/T4RYM+JdRj6vgO4
	F0wEnNN2CELoQhjXaPSZVazpWJ/PXlkmOlHTSuo=
X-Google-Smtp-Source: AGHT+IHDl2mp0GwGbuHHCJOOxtbHNu9/e+E5ysQsDcSJu06axJh1ivd9+TkCw7i/w0gDyArw6I6C0A==
X-Received: by 2002:a17:907:3181:b0:9d2:b968:9ddf with SMTP id xe1-20020a170907318100b009d2b9689ddfmr49239ejb.25.1698774696977;
        Tue, 31 Oct 2023 10:51:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id i1-20020a1709064ec100b009d2eb40ff9dsm1316642ejv.33.2023.10.31.10.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 10:51:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-rarfile: add recipe
Date: Tue, 31 Oct 2023 19:51:33 +0200
Message-Id: <20231031175133.2902962-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 17:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105807

Add rarfile, a Python module for RAR archive reading. Version 4.1
brings:

- Support 7zip/p7zip as decompression backend
- RAR5: check password before trying to read file
- Make get_rar_version a public function
- New option: part_only for RarFile, to read only single file and
  allow it to be middle-part of multi-volume archive
- Add RarFile.printdir, use it in dumprar. Needed to examine
  FILE_COPY or HARD_LINK entries that do not contain data

Add run-time dependencies on p7zip as it is one of the supported
backend as well as to other required Python libraries.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-rarfile_4.1.bb             | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rarfile_4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb
new file mode 100644
index 000000000..ece92ee3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "RAR archive reader for Python"
+HOMEPAGE = "https://github.com/markokr/rarfile"
+LICENSE = "ISC"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2f31e224cbf0c29cb6c55f2bae0e165f"
+
+inherit setuptools3
+
+SRC_URI[sha256sum] = "db60b3b5bc1c4bdeb941427d50b606d51df677353385255583847639473eda48"
+
+inherit pypi
+
+PYPI_PACKAGE="rarfile"
+
+RDEPENDS:${PN} += "\
+    p7zip \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-io \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


