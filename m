Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621F9E936F7
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 02:35:11 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.6996.1696473309560079846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 19:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGp6sq+O;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso401573b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 19:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696473309; x=1697078109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JPdYQCvCOBFOrh5zJYrfIj6Epesq6l3QOHGGYhjiis=;
        b=hGp6sq+OwjHoq7IAU4vFA7E4rg7HqvHyZPVjpxBMmJH3iBZSFrgjlzpvH5ZIeZm+SS
         jIbIfHtZjqnGX2lu2lUR1QpzHB0Ggq7DDPHIHE6J4DN50qWb5KyMlzRkNwmy0HjBVaDQ
         F2/rQdeJXyoI4fX4RuAdHKugsNWSK7zGTWk0RFdHJ5SO8BEui9iAaretBD1aLQspm1S6
         a2kvadwPcMaj40dbi4+lojN/lMFufRKm52EsVUl1UXGTdut7bO1ojC4TshAEpMbfCJfy
         DWuXIrW95UmNC0uK7nsSrXjDrzpTXTcz/Cf88GQvI45xDEz9QhtNAgqhpoOL/XKXE8lW
         O8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696473309; x=1697078109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JPdYQCvCOBFOrh5zJYrfIj6Epesq6l3QOHGGYhjiis=;
        b=IonD00/nhPffBvTNB8j1wcpa532zrU80yb9cuN7pXx1l8Rz4A4bU0EaXQ2PXiSkKBP
         VV1J7gGrALP4+MzRjLDue+V5kDnqsaf2bXkFjd+roUHxnn7KrbF9N3+Lxf9TxND8NaEt
         S7nZbrgWqy4UAV7ZgYUXOiBt0zb2WXlwGzodnHO7zO/UZUIjgUIg1VjmOjDlAm8Bc39h
         ma6atRRn577wls2+JtPAoNLtNgfuR2kGAMDkUF5WXzbhrMiJN3F+85Y3VkJkd04CI2B/
         DR9dB0f34pQJ8z+kp37Ro12Y3enacYQ+9oUfa0X2RzO12aRUVF9CRU9TnQU19jzel+vM
         0MdA==
X-Gm-Message-State: AOJu0YzxCC4d/7vtanpOFXr91/RTdAaJakK+aO2m2B/H47vOJuTywDSk
	rvr41MBzMxqKCzvUdUZUWBymLXrjLe+EyA==
X-Google-Smtp-Source: AGHT+IE48/RDrunVm7FzMOU3Wr7PMes8oLxnud/o5LuQ/CPCJVDXHsLDbAxnBYfOtAfhk+vQcS87jg==
X-Received: by 2002:a05:6a21:7748:b0:14c:d5e9:21b8 with SMTP id bc8-20020a056a21774800b0014cd5e921b8mr4136679pzc.30.1696473308609;
        Wed, 04 Oct 2023 19:35:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id i8-20020aa787c8000000b0068fe76cdc62sm235680pfo.93.2023.10.04.19.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 19:35:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-openembedded][PATCH 1/4] images: Inherit from core-image-base
Date: Wed,  4 Oct 2023 19:35:02 -0700
Message-ID: <20231005023505.1072671-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 02:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105349

We really do not need to define base images which already exist in core
layer, reuse them here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/images/meta-filesystems-image.bb       | 2 +-
 .../recipes-multimedia/images/meta-multimedia-image.bb         | 2 +-
 meta-networking/recipes-core/images/meta-networking-image.bb   | 2 +-
 meta-oe/recipes-core/images/meta-oe-image.bb                   | 2 +-
 meta-oe/recipes-core/images/meta-oe-ptest-image.bb             | 3 +--
 meta-perl/recipes-core/images/meta-perl-image.bb               | 2 +-
 meta-perl/recipes-core/images/meta-perl-ptest-image.bb         | 3 +--
 meta-python/recipes-core/images/meta-python-image.bb           | 2 +-
 meta-python/recipes-core/images/meta-python-ptest-image.bb     | 3 +--
 meta-webserver/recipes-core/images/meta-webserver-image.bb     | 2 +-
 10 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
index ca21d2a0ed..80fb9f9137 100644
--- a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
+++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
@@ -1,3 +1,3 @@
-require  meta-filesystems-image-base.bb
+require recipes-core/images/core-image-base.bb
 
 IMAGE_INSTALL += "packagegroup-meta-filesystems"
diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
index 9f2fda9fef..dc76265a9b 100644
--- a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
+++ b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
@@ -1,3 +1,3 @@
-require  meta-multimedia-image-base.bb
+require recipes-core/images/core-image-base.bb
 
 IMAGE_INSTALL += "packagegroup-meta-multimedia"
diff --git a/meta-networking/recipes-core/images/meta-networking-image.bb b/meta-networking/recipes-core/images/meta-networking-image.bb
index f4c7401b35..20d3271c94 100644
--- a/meta-networking/recipes-core/images/meta-networking-image.bb
+++ b/meta-networking/recipes-core/images/meta-networking-image.bb
@@ -1,3 +1,3 @@
-require  meta-networking-image-base.bb
+require recipes-core/images/core-image-base.bb
 
 IMAGE_INSTALL += "packagegroup-meta-networking"
diff --git a/meta-oe/recipes-core/images/meta-oe-image.bb b/meta-oe/recipes-core/images/meta-oe-image.bb
index 1565549059..1338adf29f 100644
--- a/meta-oe/recipes-core/images/meta-oe-image.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image.bb
@@ -1,4 +1,4 @@
-require  meta-oe-image-base.bb
+require recipes-core/images/core-image-base.bb
 
 SUMMARY = "meta-oe build test image"
 
diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
index 613da02977..dd03022c57 100644
--- a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
+++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
@@ -1,10 +1,9 @@
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
+require recipes-core/images/core-image-base.bb
 require conf/include/ptest-packagelists-meta-oe.inc
 
-require  meta-oe-image-base.bb
-
 SUMMARY = "meta-oe ptest test image"
 
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
diff --git a/meta-perl/recipes-core/images/meta-perl-image.bb b/meta-perl/recipes-core/images/meta-perl-image.bb
index b8d3a76e6a..c46cba21cd 100644
--- a/meta-perl/recipes-core/images/meta-perl-image.bb
+++ b/meta-perl/recipes-core/images/meta-perl-image.bb
@@ -1,4 +1,4 @@
-require  meta-perl-base.bb
+require recipes-core/images/core-image-base.bb
 
 SUMMARY = "meta-perl build test image"
 
diff --git a/meta-perl/recipes-core/images/meta-perl-ptest-image.bb b/meta-perl/recipes-core/images/meta-perl-ptest-image.bb
index 7cca6402b2..d846717580 100644
--- a/meta-perl/recipes-core/images/meta-perl-ptest-image.bb
+++ b/meta-perl/recipes-core/images/meta-perl-ptest-image.bb
@@ -1,10 +1,9 @@
 inherit features_check
 REQUIRED_DISTRO_FEATURES += "ptest"
 
-require  meta-perl-base.bb
-
 SUMMARY = "meta-perl build ptest image"
 
+require recipes-core/images/core-image-base.bb
 require conf/include/ptest-packagelists-meta-perl.inc
 
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image.bb
index 6353d389b5..fbe3efc600 100644
--- a/meta-python/recipes-core/images/meta-python-image.bb
+++ b/meta-python/recipes-core/images/meta-python-image.bb
@@ -1,4 +1,4 @@
-require  meta-python-image-base.bb
+require recipes-core/images/core-image-base.bb
 
 SUMMARY = "meta-python build test image"
 
diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-ptest-image.bb
index a649cbb94c..f781322537 100644
--- a/meta-python/recipes-core/images/meta-python-ptest-image.bb
+++ b/meta-python/recipes-core/images/meta-python-ptest-image.bb
@@ -1,10 +1,9 @@
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
+require recipes-core/images/core-image-base.bb
 require conf/include/ptest-packagelists-meta-python.inc
 
-require  meta-python-image-base.bb
-
 SUMMARY = "meta-python ptest test image"
 
 DESCRIPTION += "Also including the ${MCNAME} ptest package."
diff --git a/meta-webserver/recipes-core/images/meta-webserver-image.bb b/meta-webserver/recipes-core/images/meta-webserver-image.bb
index ce4f8a0387..9d2badc236 100644
--- a/meta-webserver/recipes-core/images/meta-webserver-image.bb
+++ b/meta-webserver/recipes-core/images/meta-webserver-image.bb
@@ -1,3 +1,3 @@
-require  meta-webserver-image-base.bb
+require recipes-core/images/core-image-base.bb
 
 IMAGE_INSTALL += "packagegroup-meta-webserver"
-- 
2.42.0


