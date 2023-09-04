Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4F8C83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 11:09:22 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.45851.1693825753979321984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 04:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qoV5iNc6;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9a603159f33so192438766b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693825752; x=1694430552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1rFuH9r81L1ez9eU+VxC9FGORuABiSNP5l0pBNiFJQ=;
        b=qoV5iNc6WgmSRCYXJL35gIvEJZ2iqyn+I95rvuTexaNkxABt/DESMHQx3WC1KLAQZb
         5uNB//nepLUf44YBU/R8eWiLmG3wOYazltrkaZkVwcj42tDroltoXOMHPUMpym+RRMon
         Fm5TShiIHmroxyOgUZRhvq1SJmB6vwqUpnCZWLWH1uYlI9mkT5BBFmpAo+3W0A279PtZ
         NbU37tBNC3+OM2AAfLnpiEiy9zyMc2K2SL2p9DqTfwzuEFkPhMOj9ZY/fOHhNHLsnyH6
         J9tINVRA23GSificLhVq0tqtoGiUIo6urdASzUPZHUiz9Y0KdBXYvk8JeWASBgNwq+PK
         EKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693825752; x=1694430552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1rFuH9r81L1ez9eU+VxC9FGORuABiSNP5l0pBNiFJQ=;
        b=Vhv/q+Z+mNTRP2dA4vVu2rikHDTAhqyJLtSpBUqd3QfGslV3urdU7+3JzncUTu2qc+
         m9nhigvXbJzeMwMzJ84zmF5ygK8dAIacfIE79K4SXOx95Y/h/i2fVebhRJKGk9QesjPG
         w1Gn6I3gCdGES3Ap1mWr4oVqRu01Udj57+zCqgE0O5AP+5JQfYG8ptZv6aFJxUlw1ZlC
         DUJF/zofvDhOo81I6Dg6mwA953jIQObELz9lPAri1n/nDcaMIW67dnoU2PmcS6vM3IEA
         ijVWJ/oZUlSM5dIBvWsgofM0F4lYP34kTznDjbYe2nic7y/epn1uii27lBw/VsDgGT5s
         aQLA==
X-Gm-Message-State: AOJu0YzLbsXBKyjfK5AlKmeGDGPrJLDXPgAnD+P/WEH3jsEKG/RAkSW+
	UzB8oy1dtmq8GrUmfEjDGDnZGajFm7c=
X-Google-Smtp-Source: AGHT+IEN49gnff2kSagc32xpPltD8Z+gvbTcVfzeW4JsNDgEfCmYlHIydgMACDcO3yc6GUQbyfTiAA==
X-Received: by 2002:a17:906:2219:b0:9a5:8269:2c94 with SMTP id s25-20020a170906221900b009a582692c94mr7399491ejs.57.1693825752314;
        Mon, 04 Sep 2023 04:09:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906495600b0098e2eaec395sm6009350ejt.130.2023.09.04.04.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 04:09:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] libiio: use main branch instead of master
Date: Mon,  4 Sep 2023 13:08:50 +0200
Message-ID: <20230904110850.1944288-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 11:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104710

* the branch was renamed upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index bb253f421a..612dd897be 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 SRCREV = "92d6a35f3d8d721cda7d6fe664b435311dd368b4"
 PV = "0.23"
 
-SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=main \
            file://0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch \
 "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.42.0


