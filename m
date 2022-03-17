Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54A4C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 03:49:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.6288.1647488997942856739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 20:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ResdYCqy;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so1950737pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 20:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QWYadhfAf5E4+mPzcsfaW5GkkK8IaCjkRr0lIqZD1bI=;
        b=ResdYCqyjaCjpithm60t0HVMRw0DpL6NtXjVmF1hOL1BYy/YTf3ZhDYYVq8e1wo1Xy
         tCBsPp4Ts2RnsIXwuKN6GVikZrIHLjQ/EZr5kxlxqPjDbn9M/yWpMqzWsn0aCGwMyrjS
         CXiJZ3FN/jXXJTD7NViHQIjk9KHpxI+zaesSr1ohMJcvddoA46JEOLwr6/+dPqo7vxms
         4TYX34TG13vFWfhhJ9f8DqviZSNKrNwYaFJVGIDQDcfMAGqIJ52fV4aQsHqKlcjjbZy7
         7OtwLJf7TBeb9/9FsSQomYemafQ1DnPt2DF4Ji72XqRy/WLHPD1MCvX6a7XOhI6Ilgff
         ykzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QWYadhfAf5E4+mPzcsfaW5GkkK8IaCjkRr0lIqZD1bI=;
        b=gdL1Udcy/k17OMHcPbfxuxp6S0O8lUXYlC1jn8KQ3cAt78j5a4JHxWQktbN9qHFRwn
         g+SaBbzKyV6MUj+F5Km4dCSCNqdV1FjgnExJV7aEyt2aR/0nuozjgy0OVQzV4nOs1Hqh
         LI/AIbR5Nau+3Y2kljluL5vNSsYP4gOT2fev2AIhM1jccYcPzWrCtmKAXU7axLgv41VQ
         Qffv/7FYcTD0pZu2CN21QaN/nUXjB4BgNLxcd2IY9yAOlUgYox7a7IOv1Is9QwJTBeZe
         2kcDjhZJH6ZGsA6uY6JbwZLbWFPmAUNNE4nJpdSYHeCwQ8Fk9HvWYnYfxHORxKHrgPSZ
         IeBQ==
X-Gm-Message-State: AOAM5334tJ7yRHRgGRQn2kWXqwLoHmiXT1QLEHifa/Q3If7/JdMYE2cF
	fYKnowSaVAf9bVKyaiGnJCXpa3IekQ72ag==
X-Google-Smtp-Source: 
 ABdhPJyVN/zhE1c7LYDxMY0DBmEtdCV70Deg1iu9BuR6L7cLMKaTDOuZe75THhUW+QsobJ8SpU/jGA==
X-Received: by 2002:a17:903:2291:b0:153:be61:dfb1 with SMTP id
 b17-20020a170903229100b00153be61dfb1mr3191171plh.64.1647488997161;
        Wed, 16 Mar 2022 20:49:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a056a0014cc00b004f790cdbf9dsm5262665pfu.183.2022.03.16.20.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:49:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-chardet: Remove
Date: Wed, 16 Mar 2022 20:49:52 -0700
Message-Id: <20220317034953.2517843-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 03:49:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96032

Its moved to oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-chardet_4.0.0.bb           | 23 -------------------
 2 files changed, 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d770014203..e285692f47 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -62,7 +62,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-cantools \
     python3-cassandra-driver \
     python3-cbor2 \
-    python3-cchardet \
     python3-cerberus \
     python3-certifi \
     python3-chardet \
diff --git a/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
deleted file mode 100644
index 75fe4df8d7..0000000000
--- a/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Universal encoding detector for Python 2 and 3"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI[sha256sum] = "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
-
-# setup.py of chardet needs this.
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
-inherit pypi setuptools3
-
-PACKAGES =+ "${PN}-cli"
-FILES:${PN}-cli += " \
-    ${PYTHON_SITEPACKAGES_DIR}/chardet/cli \
-"
-
-RDEPENDS:${PN}-cli = "${PN} "
-
-RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-logging \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


