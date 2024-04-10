Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA143CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 23:04:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.4464.1712790265858093206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 16:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QHB73OWW;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ecee5c08e6so6869659b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712790265; x=1713395065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzGn0ruaPQbdDf7f8cwfdDbw5g7J+O7teYBM8il8tI4=;
        b=QHB73OWWO2EiZwJ6V976E8JbHpG9xnOfdPNu06YH/RNbexVoHNMZU10k0kslnkNUB4
         7bIWYxkQaXnCG86I8SSqT1pZ0pJ+hbWiFcE2GSTCOrgeXp08fqljNVKTHcW3b4wRZRZP
         K68NRKyzkrn3CaFJoxih59R4MVKHbSn721t6PdCDk1xZvWBGWkxmfW2B4jIxkOxPDcqx
         JYvdEjv5KDVmQvUqB61KpUfTJQKxAb11eqE4D4/ObxXWNEhirqpM6rZLiB8RjuafU6kR
         Br40NloTObkGPekHWpmub2ZMcXZKhMDUBBnkXpGiGDRkMtX2r/lhwtZ1NxcRDoez19p9
         0fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712790265; x=1713395065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzGn0ruaPQbdDf7f8cwfdDbw5g7J+O7teYBM8il8tI4=;
        b=NacSQ4lrIQsGUqX4EykTP1IfMncdF49woMZnlp3Axe+X9RFw3rFhOjqzuhLh4GeZ7U
         HPSlOcKyUC4GPvVfzdZ+ZZwyAmA+k2KH007oG/+8WObBolEp21QdBVu0lPKo5kCJ0wzL
         YXuEPak5OHsjrBZ87dPxzbST6ibSaJYVUTKA6CJuxPxKMrrCMmAWNB+rAfwojMytyJFv
         X5FJCiehYLniHnklQxh3JDu2P3vRaB1rrgs8F8iny5YhWd2PjDJCxJwhUBRmbKW0MyPs
         tcxYBGnxenNK5AKQ8pfE/5U2CntSz2o/BVGt+CaEW9URd4vfDNTVgFXaFSjfoP53r2My
         4xVA==
X-Gm-Message-State: AOJu0YwC0PvEDGEu/L7C07MfVQJ7zg0LL4/eI7Q9hx/SrAu17L0bqLMP
	+/7kI+0c3Vs/bdqHa70jdY99eJ7GAgmQNh2g3yS83XLUu9SlrHh3i0qiWTCr
X-Google-Smtp-Source: AGHT+IEVoZvdfgmEcjdpfcMQCIhhsrDGqFQxLaRncu/73thhDt7l0h82AiOL6eQfkWfSeA9itgnznw==
X-Received: by 2002:a05:6a21:8883:b0:1a7:66ad:b93d with SMTP id tb3-20020a056a21888300b001a766adb93dmr5458457pzc.37.1712790264789;
        Wed, 10 Apr 2024 16:04:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id m19-20020a056a00081300b006e6c74eac34sm166293pfk.151.2024.04.10.16.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:04:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pint: Switch to using github SRC_URI
Date: Wed, 10 Apr 2024 16:04:21 -0700
Message-ID: <20240410230421.2359482-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410230421.2359482-1-raj.khem@gmail.com>
References: <20240410230421.2359482-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 23:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109916

It fixes some but not all ptest failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pint_0.23.bb     | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.23.bb b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
index ad3e13e5dd..370cd7017b 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.23.bb
@@ -8,9 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
 PYPI_PACKAGE := "Pint"
 
-inherit pypi ptest python_setuptools_build_meta
+inherit ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20e9072409346ec9b4"
+SRCREV = "f2e4081aee38f850938048beac7fb69c4908bc5e"
+SRC_URI = "git://github.com/hgrecco/pint;protocol=https;branch=master"
+S = "${WORKDIR}/git"
+#SRC_URI[sha256sum] = "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20e9072409346ec9b4"
 
 DEPENDS += "python3-setuptools-scm-native"
 
@@ -26,10 +29,13 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+	python3-appdirs \
+	python3-flexcache \
+	python3-flexparser \
 	python3-pytest \
 "
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
+	cp -rf ${S}/pint/* ${D}${PTEST_PATH}/
 }
-- 
2.44.0


