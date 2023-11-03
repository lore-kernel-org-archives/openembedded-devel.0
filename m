Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17FBC4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:25:05 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.51749.1699017900450552515
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=p5frHIZE;
 spf=pass (domain: konsulko.com, ip: 209.85.167.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507d1cc0538so2656168e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699017898; x=1699622698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu5ykAvqsRvzHdCPom+GFk9ZqF32DDPYnn/BYtOh/rM=;
        b=p5frHIZEhqaMyr69hP3sbeh3HkisWvG2vHR+QbYWgIn6l76ZeAXQh1FiDgIAvIjJO9
         fwZxPrWAUR0Q9/IBXE5cQlzFrWd8GYaAXPJnAuYSyxZo/GhcZ8kwkJiKRdE4NmG7t8KB
         alGIGwjyEjeQl12cH0IkWm3vvRkqkwN4cHxJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699017898; x=1699622698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu5ykAvqsRvzHdCPom+GFk9ZqF32DDPYnn/BYtOh/rM=;
        b=vz+j2PsJnrxzrtJCpmcN1FkY0IgBYWhR2mkHxRE0N/nTdoUniepa/2LtjcjcdrD6sE
         LYnMo9S/hF1o+rK2wVc9Ra4U/LspDeXwJMWpZ1rPbzAVI7stPrkIqZdkuZi6z5qxZqJB
         nQ+EAnx91H7WwJsyef1fg77KVyM2TzB1RVh8HHyety1UPdcoVEohagItttY3q6spjP4h
         1vauseQd9f9WdNE1Plb1gG+mcbuEpsyLJ5X1A2tsDTzH594hsNFVNsXupiUV6Jd4hA0l
         M1zRiDzSYxtfA0KyvXhkcZEJNoa+emANZIzr6qjm9tF3YmO5uB/o9AD/UcWKP22FD0oF
         chrQ==
X-Gm-Message-State: AOJu0Yz2WhjSfCiQKloGiftQe/VIOSgQqjvn3ymSH7BDauXp0lQcnEg5
	CuTNEkf5W5fIBQiJdgN2dvdU4UMtn1Gfhztj1ls=
X-Google-Smtp-Source: AGHT+IGPmnwIqIl3UsWgIANor/amBC8YpIpoj/K4pLdHPnsSgZ49x/m6S+EJfjTy2sqjtfZJUsx+lQ==
X-Received: by 2002:ac2:4555:0:b0:509:4a55:f189 with SMTP id j21-20020ac24555000000b005094a55f189mr3643364lfm.11.1699017898108;
        Fri, 03 Nov 2023 06:24:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0032f79e55eb8sm1869754wrv.16.2023.11.03.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:24:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-unoconv: add recipe
Date: Fri,  3 Nov 2023 15:24:53 +0200
Message-Id: <20231103132453.3853904-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103132453.3853904-1-leon.anavi@konsulko.com>
References: <20231103132453.3853904-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105862

Add unoconv version 0.9.0, an universal office converter - convert
between any document format supported by LibreOffice/OpenOffice.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-unoconv_0.9.0.bb           | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
new file mode 100644
index 000000000..3c944b4f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Universal Office Converter - Office document conversion"
+HOMEPAGE = "https://github.com/unoconv/unoconv"
+LICENSE = "GPL-2.0-only"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI[sha256sum] = "308ebfd98e67d898834876348b27caf41470cd853fbe2681cc7dacd8fd5e6031"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE="unoconv"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-shell \
+"
+
+do_install:append() {
+  sed -i -e 's:^#!/usr/bin/env python$:#!/usr/bin/env python3:' ${D}/usr/bin/unoconv
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


