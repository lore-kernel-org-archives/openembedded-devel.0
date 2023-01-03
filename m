Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE6AC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 06:06:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.57537.1672725985744830231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 22:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QbW/VtxU;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id z7so14173149pfq.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 22:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXTmYnXifoxYY4oASqaBpwM9hrWI+Wlvn+OO1Lm8KJ0=;
        b=QbW/VtxUgguy0Nbnt9wXzzO3C1PeMtgms/khcl8XUIHaan3+40+2MSNAP1+XD8Xg46
         FncLTJ/MO0vbBDciR54zC4PSxCUlEchp3bZc9t1eXyGPcQGjQOY9x0l3dKJG8acynqce
         pciOBzMpzU4i+RVII31t/M3QvbEBmb9Re6cpdEYnQahS0iluMHHFf4+wj9QMgb7j2Ms+
         gDYAxNneH3ezFjwV+Ngt6KtI5/0T9fyvizE+kUtb77l9w+Q/ulaX/g2H6A54TbFrzkMi
         AuVAy+JCPgSVdb8p3h+MQfIiA0xrhZCzAa2f+KPHilAsf/2STEhLR66Vi2m805BJ21DD
         FFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXTmYnXifoxYY4oASqaBpwM9hrWI+Wlvn+OO1Lm8KJ0=;
        b=FnGrzdtCiNCRyqnCWe+u/d4W0Zd82e18ko27FA5ND7j8gVJV4moNCWOS3fN9JcUvnv
         9/qNO4qPHI32mQDp5fIDXfOiQ82aikdzuqnOwusLKzsSQwKCFDPfVT+0ci+IMyi345Iw
         mP7J6d4bNBdvSCa017zASQy5xI35vfc5+joi9dyNNHCeWZD2T0Xj+DCKmqyF1Tui6erp
         hswpj6hQYSaPdSKG5p/pP1m2d6m4mvZf9QaNt4/9q6n5tsnlIz2UddKTB176CAfNX3Pn
         WUelTegCKC9iTKiK6xv3f366fIF8KaI5cjIGLToGF3sVcAmPcMh1IaU1EF8+Qa3TRKsQ
         j+sQ==
X-Gm-Message-State: AFqh2kp56HE28o+T8Eqqa//67HCysncosGXa84mnRpIa2a3Pksd+FfNA
	fJjReNwhSEqxT8jIf3NcrytZMugdznM=
X-Google-Smtp-Source: AMrXdXu7pls7pMBs6g/e0ayohEqc9KX3xeamxVm2nhEK5Z//FzhZ2+O/7+swX0+uU31HPAOoVsstuA==
X-Received: by 2002:aa7:9210:0:b0:577:8bae:29a7 with SMTP id 16-20020aa79210000000b005778bae29a7mr42407979pfo.33.1672725984708;
        Mon, 02 Jan 2023 22:06:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id i127-20020a625485000000b005769cee6735sm19551438pfb.43.2023.01.02.22.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 22:06:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal,poco: Link with -latomic on ppc32 as well
Date: Mon,  2 Jan 2023 22:06:21 -0800
Message-Id: <20230103060621.950708-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 06:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100355

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 1 +
 meta-oe/recipes-support/poco/poco_1.12.4.bb          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 5248b1e288..a40d2bc2e6 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -29,6 +29,7 @@ inherit cmake pkgconfig ptest
 
 LIBATOMIC:mips = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 LIBATOMIC:riscv32 = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
+LIBATOMIC:powerpc = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
 PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON ${LIBATOMIC},,"
diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index fc8e4deced..f66a272524 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -65,6 +65,7 @@ EXTRA_OECMAKE:append = " -DCMAKE_SKIP_RPATH=ON"
 
 LDFLAGS:append:riscv32 = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
 LDFLAGS:append:mips = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
+LDFLAGS:append:powerpc = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
 
 python populate_packages:prepend () {
     poco_libdir = d.expand('${libdir}')
-- 
2.39.0


