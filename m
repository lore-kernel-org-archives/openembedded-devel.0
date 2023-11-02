Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C51FC41535
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 14:05:38 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.32025.1698933929619659558
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 07:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JZVbLiok;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso4054554a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 07:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698933928; x=1699538728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eiJ7jCNmGUdNMMGTOYQIAEqXKV5KoLx6utA/GJmXVY=;
        b=JZVbLiokDod03uqNzp69l0MVlkv9EadeAV77ffdrzAbWVjk0NlgV7rnkfa37TIRstT
         ++twAW9d+RQn2J4c0LItKntj4SRVkooDr//Gm8V04L6hpvvaQs1DCWwgXnHe/BOhgApn
         6GcONNvo7nBW8Z/xuK51mIHDSOkGxZjiRjtfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933928; x=1699538728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eiJ7jCNmGUdNMMGTOYQIAEqXKV5KoLx6utA/GJmXVY=;
        b=DsORbHqjxQbDsIr2eZ3XElTDF+ASjl4HQ0zj313ZK4tD26TNNPa0xvZvWpK/NRv+vi
         RtQpFCwL48w0lKRb+DF26RxAoVaEqw5asdC7Am0eR4EQ7NgUhn4dyGrGZu2lqDRzv6hw
         7V65iXfwToC5e/00GYpYnaXFxlel0nAJMnU9SQsE9xURFYZqmNFUSo9ehV+apHi8IEw7
         HnCHMqPT8ZRChKhQGW3ssf7rfSE6AFM1+nMH4Zpg/zciOcS5s5e2M45Jrkg+/0VYmstw
         yHSIJfEPrVaTcKLI+X0EZMG1XnAUS0yb501lq1btVB+8yfioOooln/YM0Ls7Uc9GiJqd
         gz4Q==
X-Gm-Message-State: AOJu0YzY5BqrhHj+uONvqbDsI3oE9TXZnuqZ698eXoDAStJVlt2gtJBW
	bLr7DqiOfGgGuUzdCrtPzTrSZ4a+QLT3Tq2dYU8=
X-Google-Smtp-Source: AGHT+IEUNMGFacKU9WkHv4Raxr4L+47PJaq11fa9O/aXuOSrBgADFAdpQ9z90HWF/vZbzqYwmvTHQQ==
X-Received: by 2002:a50:9e05:0:b0:543:92cc:620a with SMTP id z5-20020a509e05000000b0054392cc620amr5251396ede.0.1698933927995;
        Thu, 02 Nov 2023 07:05:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d5-20020a50f685000000b005401a4184ddsm2401763edn.27.2023.11.02.07.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:05:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-olefile: add recipe
Date: Thu,  2 Nov 2023 16:05:22 +0200
Message-Id: <20231102140523.3337713-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102140523.3337713-1-leon.anavi@konsulko.com>
References: <20231102140523.3337713-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 14:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105840

Add olefile, a package to parse, read and write Microsoft OLE2
files. Version 0.46 changelog:

- OleFileIO can now be used as a context manager (with...as), to
  close the file automatically (see doc).
- Improved handling of malformed files.
- Fixed several bugs.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-olefile_0.46.bb              | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-olefile_0.46.bb

diff --git a/meta-python/recipes-devtools/python/python3-olefile_0.46.bb b/meta-python/recipes-devtools/python/python3-olefile_0.46.bb
new file mode 100644
index 000000000..e29f30f6f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-olefile_0.46.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python package to parse, read and write Microsoft OLE2 files"
+HOMEPAGE = "https://github.com/decalage2/olefile"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e21a06208415d5eb2001555d37851362"
+
+SRC_URI[sha256sum] = "133b031eaf8fd2c9399b78b8bc5b8fcbe4c31e85295749bb17a87cba8f3c3964"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "olefile"
+PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+"
-- 
2.39.2


