Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE66BC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 19:42:48 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.2367.1642016568095053649
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GhrN3N/Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so7038846pji.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZxDuQ9UZgjpDAK22negIqhRMxd34fXDeXfKG1ZIs+Vo=;
        b=GhrN3N/Y3DLgQ3gX2Octk1pAUxyGiPOeqm0xFBP4e1sqo8ANphtq/eYRSR2Sm+V8bg
         p8nhQsuli4+jA3NT2AF+KjGech0QSfS5PdoOBe82leeDAAOEUwecfwUvSBNt3dLEMi9y
         EbkR0nDyc7/PGBDr2hLKlpWifXU+99ybCY/vKhmrIbTdFm6aEI33H36OG2W7gFCdQp5T
         smt32Ne+DvZmjHVcklaF/OiRt58j8aVYRK/0d3KD2aUdMi9iNnYNtxY3E9XWdR4PN+mj
         ppPENnKtyU8V+NGIiBTzUN/HLW6UgoaloK7nNLEOgDhNhPGT3ytppX4iabsyYFwtBXmz
         pmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZxDuQ9UZgjpDAK22negIqhRMxd34fXDeXfKG1ZIs+Vo=;
        b=pMiQt3kgvGJji1D/5QSJlQajoRuZeNB8BDsQ6TdBgxO7YvtlBEmhbF8vK5pQSt+dSl
         NXI4yT+zDmAhaH0CF5TyJBmA2KKVJp3uog+sWyWsfYHoVt2aTzZxJzOpHcPIx7/KcmQ9
         Sv+euWAz+vpAZWpaJZ+I1Nbn2V30ccrZRqe2apCt/6e6O13UFBaMnZ6OcLRgIS5tOgNi
         Ps1haTLTHBwOfh2I5SUkJP57vA6qBcQSj9gLWiY1vwc7ctjbUVRDL9caKSaHy9BYJByG
         XgXw2pydrlhNtqRWJsjYF8XrUpjCmc3LIATTq6qdQ0pxh06ceqQZGstLaFVCcN/sI+Cn
         WkxQ==
X-Gm-Message-State: AOAM531+7dTfBSV4UAiV7fbV9onMwXBzzXGBaS2tJzKqp84yTv5bCbIL
	VwZDyvz6IowNyXTVVIGOz0q7G51lKax8vQ==
X-Google-Smtp-Source: 
 ABdhPJx2c+ZneRHb4VzE8L2pKaDf2yHRlt4KOmqQl4P+L0jLRitpWHmjcq3dcQ77SSxf8s5qOdIMJg==
X-Received: by 2002:a17:90b:180e:: with SMTP id
 lw14mr1214858pjb.179.1642016567033;
        Wed, 12 Jan 2022 11:42:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 p10sm394108pfw.69.2022.01.12.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 11:42:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pybind11: Use setuptools3 instead of
 distutils3 functions
Date: Wed, 12 Jan 2022 11:42:44 -0800
Message-Id: <20220112194244.2823005-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 19:42:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94795

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index 3c6b2a657d..dfacb41f19 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -24,12 +24,12 @@ do_configure() {
 }
 
 do_compile() {
-	distutils3_do_compile
+	setuptools3_do_compile
 	cmake_do_compile
 }
 
 do_install() {
-	distutils3_do_install
+	setuptools3_do_install
 	cmake_do_install
 }
 
-- 
2.34.1


