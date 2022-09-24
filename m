Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBE5C07E9D
	for <webhook@archiver.kernel.org>; Sat, 24 Sep 2022 10:11:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.5299.1664014254034437976
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Sep 2022 03:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AnN9QZOu;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id t14so3367923wrx.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Sep 2022 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hNu07U4XVjxhIKuxTlqsd0L3LJSU3v6g985pBbSZUSE=;
        b=AnN9QZOuSJeOPrIvJ4eao6GlVfFrowbte5USedhLZiQO9RRLxe/Xe2Ep303XjGBr/Z
         sl+UIgCOqjkp7uUlktUw0Mqx0Iotg9LTnC3mQTRtL7dkTm8ymdNM6NJNQ1xpRZ981ovw
         1iuoAG/iq6cAPHkrwCnDvOR6+T+GsWtgC73SixTElZ4yMxaUk0s98DIMGEHs5/XpQN87
         w5njGgYJiLma+8sdXcD0UuMTRcZQb2XAtHPSryH+uRZszQwUpDSHDFrt3imeSoxmtnBR
         S+O2cMsSZXW2igUkJQdSDA3jLIH/vM3hkPwPtIxnW17xV+ETyZl59HBMs0X76UUnbCEc
         ItoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hNu07U4XVjxhIKuxTlqsd0L3LJSU3v6g985pBbSZUSE=;
        b=YvyolInJXty7MAdPGiewvYO+cGIjFXQJvH+IQzlgXLHv03KtIUV36cSatrbcUT8PUd
         jy1lBx07lucj+S9Q5tiCw1vQjBd610UlmhLxQBin1CZEXswc2QAkLI5y4OWB1BdJre/k
         M62f72NgskyFAyYcIwxVmFt8FrQC+Q54+eaqff4JNKYTA0umql8jOe+ECpQ94Kklu+UB
         dgeTnqi1Cxkq129zAXN0zcaRqBoiymJaSOWt++zSwlh+vxxpB318UKQsRUcKIsNWfcf8
         pnMCX/qtjenOSpBaIAPaIYSxWljk0ET8T8O7aCH1IP292fMwtbH0gPg4zlvS6KujEx3X
         ZhSQ==
X-Gm-Message-State: ACrzQf2pNvlKLWWMyeNAXW+1C+84A2uZrjJ5q7BtPkYPqF6CUW6VkspM
	PHzHuXElUWELBJDTlTds5EwRUwGPyH0=
X-Google-Smtp-Source: 
 AMsMyM7h19YScNUqsWnd7gnBDeNcy4fBBaO8p8NxRF8e5vJCmh9NiF9u1V/FNP53wTcrq2W0WlakJw==
X-Received: by 2002:adf:fb10:0:b0:22a:f1d8:18d2 with SMTP id
 c16-20020adffb10000000b0022af1d818d2mr7763167wrr.483.1664014252284;
        Sat, 24 Sep 2022 03:10:52 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c3b0a00b003b47b913901sm14582914wms.1.2022.09.24.03.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 03:10:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] libcec: fix runtime dependencies for
 ${PN}-examples
Date: Sat, 24 Sep 2022 12:10:49 +0200
Message-Id: <20220924101049.2027807-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Sep 2022 10:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98946

* cec-client doesn't link with libcec, but uses LibCecInitialise to
  dlopen libcec, so do_package cannot add the runtime dependency
  automatically

* fixes:
  root@rpi4:# cec-client -l
  libcec.so.6: cannot open shared object file: No such file or directory
  root@rpi4:# cecc-client -l
  libcec.so.6: cannot open shared object file: No such file or directory
  libcec.so.6: cannot open shared object file: No such file or directory

  libcec/6.0.2-r0 $ objdump -p ./build/src/cec-client/cec-client-6.0.2 | grep NEEDED
    NEEDED               libncurses.so.5
    NEEDED               libtinfo.so.5
    NEEDED               libstdc++.so.6
    NEEDED               libgcc_s.so.1
    NEEDED               libc.so.6

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index cd586897a4..599416cb2a 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -29,6 +29,9 @@ EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
 PACKAGE_BEFORE_PN += "${PN}-examples-python ${PN}-examples"
 FILES:${PN}-examples-python = "${bindir}/py*"
 FILES:${PN}-examples = "${bindir}"
+# cec-client doesn't link with libcec, but uses LibCecInitialise to dlopen libcec, so do_package
+# cannot add the runtime dependency automatically
+RDEPENDS:${PN}-examples = "${PN}"
 RDEPENDS:${PN}-examples-python = "python3-${BPN} python3-core"
 
 # Create the wrapper for python3
-- 
2.37.3


