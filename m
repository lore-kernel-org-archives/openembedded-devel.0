Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4208EC0018A
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 14:05:38 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.32024.1698933928887511587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 07:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pe7pvjsC;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so1611538a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698933927; x=1699538727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aG/iQsuQdzTOykuNwXanH8RefAqSscpfq9TFqk0YuEE=;
        b=pe7pvjsC8RGfb8Q280abaaz5alnUykzrf5E00EpdpatRSC4as47w+Y33woK0lRoWzR
         B3Tls7ITOnrZvknluc8lqfmizxXzo/lEccOEbjMZpblMmQaUqYYO2C6+qScOIm1ZuwNP
         TC+ex1Wziy+OiRipkUwljP6sfhjoCKdlXZhYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933927; x=1699538727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG/iQsuQdzTOykuNwXanH8RefAqSscpfq9TFqk0YuEE=;
        b=JujQulZzqQc3VBq5BA442pi84mvXUFq2gaN4DJ5lUnplrHXWTN74xWlYW9hKSKzpPN
         +Og8KjP2wIRDTvff01i/WTGVH5c6HDd95E6Jz8tuNSvbyFRvw6iq0VnGczYVQZlckHZQ
         FiccUY3zrWhCryV2MnYtZmG0L8QCCg1eNQ1+54vD0cFb+Zy5cQwGwCZZGl12tKIwx7Et
         vBnNss956GI+R+Cq1Qj/y2N7Td4F4er/MCX17pmRD0VkKs3st8nJG0j3Ph4uQ1QHqSD4
         E0cBpOCJm773P9VfmtCodji2z4TMpMdA5STBYlUiDLyhm7vMvuIGadtYZh4tmTv0E1M7
         i8eA==
X-Gm-Message-State: AOJu0Yxu3nkKkmrUfJQki9rkhNY1P4ExZBe0iK2jJ5qqgWcG2OnE7ggL
	U7P1bzIWL+UY4A5gVM+Uj7Ox8sTQlzDRYexFusM=
X-Google-Smtp-Source: AGHT+IFQoO43xDyG0O0VL9cioMauJohvhbRM6sTf34nBYqY5DB28j0/JbR29rJrLY3Y+J6U7+rKjbg==
X-Received: by 2002:a05:6402:1bc4:b0:53e:3b8f:8a58 with SMTP id ch4-20020a0564021bc400b0053e3b8f8a58mr14670456edb.11.1698933927113;
        Thu, 02 Nov 2023 07:05:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d5-20020a50f685000000b005401a4184ddsm2401763edn.27.2023.11.02.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:05:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-oletools: add recipe
Date: Thu,  2 Nov 2023 16:05:21 +0200
Message-Id: <20231102140523.3337713-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102140523.3337713-1-leon.anavi@konsulko.com>
References: <20231102140523.3337713-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 14:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105839

Add oletools, Python tools to analyze security characteristics of
MS Office and OLE files. Version 0.60.1 changelog:

- olevba:
  fixed a bug when calling XLMMacroDeobfuscator
  removed keyword "sample" causing false positives
- oleid: fixed OleID init issue
- oleobj:
  added simple detection of CVE-2021-40444 initial stage
  added detection for customUI onLoad
  improved handling of incorrect filenames in OLE package
- rtfobj: fixed code to find URLs in OLE2Link objects for Py3
- ftguess:
  added PowerPoint and XPS formats
  fixed issue with XPS and malformed documents
  added XLSB format
- improved logging with common module log_helper

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-oletools_0.60.1.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-oletools_0.60.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-oletools_0.60.1.bb b/meta-python/recipes-devtools/python/python3-oletools_0.60.1.bb
new file mode 100644
index 000000000..fbb7955d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-oletools_0.60.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Python tools to analyze security characteristics of MS Office and OLE files"
+HOMEPAGE = "https://github.com/decalage2/olefile"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
+
+SRC_URI[sha256sum] = "67a796da4c4b8e2feb9a6b2495bef8798a3323a75512de4e5669d9dc9d1fae31"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "oletools"
+PYPI_PACKAGE_EXT = "zip"
-- 
2.39.2


