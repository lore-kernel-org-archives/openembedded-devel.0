Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BE4CD4853
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 19:11:15 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.6028.1695409867819481131
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 12:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59c26aa19b7so31632327b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695409866; x=1696014666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHdaXvCdfD6rydTxmt8h1oGJAHi5us3v+NmMIrgRRZE=;
        b=jIL9Rrp0yYWq4aoP3ZQvjzmFokfrdZDrNSMM7eeR/VYEkRg1CGev+c4QgsL8L1c5yB
         k3YdT934g71Xoy+H+sX77IkuYXyfQp1lz5F8cWtmF375yBoDYj4cwkArxfcasFW3FgiL
         YHIP0dSsRhzwdsRsc/i6qMeOE0xJOVwyjS743EgQqGf2Q2LBHZdAM5nCKV1id8wla8RG
         m7WRnTKYMdRpmQEAx2sS6RwODa78x/FInVgBO/29nxvJcvqdhLnuFgHqjRVAFs/Kt/Ya
         0kylgf2oBtFAMvqaLWERwahiqjwPByomHideTiG75zDcHxbhJNBC49XmV9lDRoxG7EP0
         igfA==
X-Gm-Message-State: AOJu0YyzdySHWAN7UGxn7j6jLO6wNdkrDZkvyNEMdB2aVx1IqZvFWH2Q
	890fR0F5W8fMppGgSETTWqWETmuaEA7rfg==
X-Google-Smtp-Source: AGHT+IGL6uiKrMTQw/YlWa+/twIgWzYxZlYT5E5cUVu8dndnuXQhL3EvRMN8enAFQOzvxXCuiN5EaQ==
X-Received: by 2002:a0d:d64c:0:b0:59c:1880:18e0 with SMTP id y73-20020a0dd64c000000b0059c188018e0mr679688ywd.21.1695409866443;
        Fri, 22 Sep 2023 12:11:06 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f184-20020a0dc3c1000000b0059af121d0b8sm1045264ywd.52.2023.09.22.12.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 12:11:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-sqlalchemy: Upgrade 2.0.20 -> 2.0.21
Date: Fri, 22 Sep 2023 19:10:55 +0000
Message-Id: <20230922191055.3043360-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 19:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105073

Changelog
=========

Full changelog available here - https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.21

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-sqlalchemy_2.0.20.bb => python3-sqlalchemy_2.0.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.20.bb => python3-sqlalchemy_2.0.21.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.20.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.21.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.20.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.21.bb
index 414b2f667..92db5045c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.21.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "ca8a5ff2aa7f3ade6c498aaafce25b1eaeabe4e42b73e25519183e4566a16fc6"
+SRC_URI[sha256sum] = "05b971ab1ac2994a14c56b35eaaa91f86ba080e9ad481b20d99d77f381bb6258"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


