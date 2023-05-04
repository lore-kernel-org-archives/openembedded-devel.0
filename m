Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D58DC77B75
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 00:43:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.38844.1683160976199587506
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 17:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XzYH01Cx;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6434e65d808so1180923b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683160975; x=1685752975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4CQuRISMPkDDW5EUVsgvt4e2o7OHUbzqJaCtneQP3j8=;
        b=XzYH01CxW6nJB6qHv/st14SsaayazRN1C4fpsFnzLLwh0FDQnhSoTIVAWOai10VZF7
         Hz2raF3sw4CP5PO3iIurS0FV+iKI9ccKKamjYDOKUkPiBbOsGX9/LxIne/sYFKB94k0t
         WuZK2QjBbq2IapgJpAnnzs/9Cndk9QWKrlN5gdlUBeOH/UpDQ2ijVBC9NHFszvV27aAE
         6YINzfm5j5eijkBrnu5UymMYBmlGq5gwtMivWQUnD8bk/YnEC1KPN0izG8rxTwcYbyEh
         Y7dRsAS9xYUML9XYO7IZwlTV09Im5LBHCMDqDlKAenEa8QWkTjmVqIsLYvlt13cs8gD5
         EmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683160975; x=1685752975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CQuRISMPkDDW5EUVsgvt4e2o7OHUbzqJaCtneQP3j8=;
        b=ImswW2jf4CBGKFevC/1IkL9JnfeEp9WOQnW7UMl7USBZjbTG7PkuzZMQF5PWavgyLp
         WqO1T7VIhRLXp6A7vfbzs8MrPeqOJNnCxvtkEmoNjKFUpinlR73Zmp71DudIPJ6oz7Mt
         fGKdabu6BwsWUNFYmObdpsOZ8tYUcDaqF5WwVsB30wzpRK//XyPvEy/GGQIX44nqPHcp
         ivP/XcviGI+WBf+F2RNsJg4qdFHX+rDVSzJjF2bt69sWqAZV2XZZMlXi2pzbvlSlVuX/
         2MsAeIz5uqBD+mZmp62Gn6EcpJirPcr3cXkNn5NGNHgEl+H8DnfyweLkxcbFKXqEti3W
         3ixA==
X-Gm-Message-State: AC+VfDwXNzlA/6p6QR12araxFvMcGLM7eoz1HHK8GS+XdWKYD9bpvrol
	EXpLK0sApm461ovZA5X1ifVXB6k7KHNp0g==
X-Google-Smtp-Source: ACHHUZ7TbMoQ+RmB7vnqtrMDbbNEDKPBIRGKnEw5mQqXGwLZVUTDiLM8B1XnBfA/gm2CoByMAPis/w==
X-Received: by 2002:a05:6a00:13a5:b0:62a:d752:acc5 with SMTP id t37-20020a056a0013a500b0062ad752acc5mr353295pfg.32.1683160975260;
        Wed, 03 May 2023 17:42:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7860f000000b00634b91326a9sm176005pfn.143.2023.05.03.17.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 17:42:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pyzstd: Disable LTO on clang+arm
Date: Wed,  3 May 2023 17:42:52 -0700
Message-Id: <20230504004252.2475637-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 00:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102300

clang-16 segfaults on arm while compiling with -flto

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb
index e7a6c21085..f132d91a69 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.15.7.bb
@@ -11,3 +11,8 @@ PYPI_PACKAGE = "pyzstd"
 SRC_URI[sha256sum] = "55e503f28f5a9d225ce9d0639e3f5b1801bacace5aea926ec2998e73c5150fe7"
 
 inherit pypi setuptools3
+
+# clang-16 with -flto segfaults on arm, therefore ignore flto for now
+do_configure:append:arm:toolchain-clang() {
+    sed -i -e "s|'-flto'|''|" ${S}/setup.py
+}
-- 
2.40.1


