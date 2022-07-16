Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A09DC43334
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 02:55:45 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.1929.1657940142362370234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 19:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9OUZJup;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s27so5929418pga.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 19:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PwF1hst6d9QDxTGYwicIhFwdeKlX+tn3n69nf6XLCDM=;
        b=G9OUZJuptrHggikbgeMJ3jVCdDV6ZI7UsKyomC7kBGV+S4ybeo4Owrr9oBMk85CtyX
         nArnlnTWOOHz3PmLyRhHSLh3HnBRkoANSj+dKU1NUonKbssLIpHgUijONNDVFKAO2ac7
         rHN7Zwl83TJPMw648qpVDtfBkICtDsGNW9ZOVEjLbn8nKa8xDXCMvcQz6odaUWmntRml
         4WqENGwRCCpps9mHck0gUT0pwG/+qf2Wb34/XFVd9cXCp1a3I8JvltfBTBWggidS+L4m
         Ng2jo515Fb0sc0nRK08xt2Ucene4icLpQmfSKb1BIDY/lAfs3qNQmDhvOoqgDXjiLXPp
         HMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PwF1hst6d9QDxTGYwicIhFwdeKlX+tn3n69nf6XLCDM=;
        b=VpTvv8WbOKJDjAZ24PRSOf08ZJBeNpcmCWRDoAosadWISpaHPYq694wbXrsOY5CD+9
         WRs7Txhj+KEklAq/1CXJbvFDGj4z6NIg74KDcUhKJfwXzVIZbIwp1RoiqxrSEYS7d063
         dl/NnJYIuQZaCxqETA+qnbOMv99qd8z9QDp9xs8/WZAkFvG5gZ7DsbfSFETzUDU1KqaG
         UjZDf3FXEYOdMV5dfPYz72r+82uKZ377swJ/z2UFcPmx35NYRAWDbkaCMdWc5t0cLdZC
         8EgZOM+gxr3KAKK3PUFE1jJs6XqIktLfV2FrLhilNcdTEiNwrm2QN/I41nLiVrL0KMs8
         YzmQ==
X-Gm-Message-State: AJIora8FyOWstwTzkd7DPdzMMXlMNVQtMa4LYb/3E2CjlDmJbewoI4ou
	o+g60zDwTpgWTyXFk6aE0PAUNRy4dPRePw==
X-Google-Smtp-Source: 
 AGRyM1v0ssL+/DcHpboZ1276pipHpNMmHt8P+xlbTP/NAdvtECNSAUP8xn4KBuBXojRuQ28jo72U6g==
X-Received: by 2002:a63:6aca:0:b0:419:cb1b:8b4f with SMTP id
 f193-20020a636aca000000b00419cb1b8b4fmr8180279pgc.92.1657940141384;
        Fri, 15 Jul 2022 19:55:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm6376460pjd.22.2022.07.15.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 19:55:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] poco: Link with libatomic on riscv32
Date: Fri, 15 Jul 2022 19:55:38 -0700
Message-Id: <20220716025538.3721413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Jul 2022 02:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97849

It does not have compiler intrinsics for 64bit atomics
Fixes
 MetricsSample.cpp:(.text._ZN16MetricsSampleApp4mainERKNSt3__16vectorINS0_12basic_stringIcNS0_11char_t
raitsIcEENS0_9allocatorIcEEEENS5_IS7_EEEE[_ZN16MetricsSampleApp4mainERKNSt3__16vectorINS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEENS5_IS7_EEEE]+0x104): undefined reference to `__atomic_compare_exchange_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.0.bb b/meta-oe/recipes-support/poco/poco_1.12.0.bb
index 6fff0707d3..428d374569 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.0.bb
@@ -66,6 +66,8 @@ EXTRA_OECMAKE:append:class-native = " -DPOCO_UNBUNDLED=OFF"
 # do not use rpath
 EXTRA_OECMAKE:append = " -DCMAKE_SKIP_RPATH=ON"
 
+LDFLAGS:append:riscv32 = "${@bb.utils.contains('PACKAGECONFIG', 'Prometheus', ' -Wl,--no-as-needed -latomic -Wl,--as-needed', '', d)}"
+
 python populate_packages:prepend () {
     poco_libdir = d.expand('${libdir}')
     pn = d.getVar("PN")
-- 
2.37.1


