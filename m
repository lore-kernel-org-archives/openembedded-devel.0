Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71369CF0428
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 21:59:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1351.1728424756825002564
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 14:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yMWyBejo;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4305724c12eso6196285e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728424755; x=1729029555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKdTlY+KOR4i98m0kId6L673KYffGycFn0i+NBeAEOU=;
        b=yMWyBejo2PytFVJbYtFu9xRHbS8iAIqxIzAc1S3sFipfli1f1AMOKZz2eYSsytH6Rc
         wfPrAZPxPSvrn+IcaO6Mab1O4bZ6hSkn3CmjJ+9k83sAZMPjtw9s4tmU8gX+HdyjfZ98
         0fQgLY6ex7DQvnppT+DAOV9JCkOz49qk7vEFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728424755; x=1729029555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKdTlY+KOR4i98m0kId6L673KYffGycFn0i+NBeAEOU=;
        b=WOKamUzOlcBwwTBWsxcrGD0Cor0cgemeUcfG2zOIFXz5Ux4tu8voGhL+Y35iDJvwkm
         cNOusVQZjqnMwPMvXaoAClLVv/IjAAqWzqWBmHyi+z2p7m/RayH3raTO+AJZHQhx49q9
         7MZFzIDvRAdax60LCAI1S2aP1XXn3i8Ajkd/Ral8L6FkxpEGicCtqXFrEOrUt+45j1f9
         cZqPtzrK6gepgKbO/vZ1vtCBbHEwKAc+ZmtuUmZtB0gv59ZfC1vaGFULbLYhYr/IT2I0
         b3FQdGkdXvRMEpUK4GJqN+gcox01ci0n+pX1Lx6LjzLM4EPfdze/ulUBWiKt9JmjrY/9
         qn0Q==
X-Gm-Message-State: AOJu0YyPwuFvbzA64vpZszAoLhcX0dY5ENxyxFSMaRU+/fYgYp8PrLRT
	MrS9zwkt9SNmGy6rQvxHo/fsGRQoqSAwsERApZIalyMZYJdGYx+KZV3zgUSEmDWWnKnbkxOPxHB
	N
X-Google-Smtp-Source: AGHT+IHu57YgdbprShKRmjjWXpk98VQLCTbDr0B0vNgfNpXQa7OsMNNoobWKiayEODuHs/SGJbuDhw==
X-Received: by 2002:a05:600c:3b19:b0:42c:a7cc:cb64 with SMTP id 5b1f17b1804b1-430ccf1b0c0mr1080515e9.3.1728424754645;
        Tue, 08 Oct 2024 14:59:14 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691ba45sm8925722f8f.44.2024.10.08.14.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 14:59:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] wtmpdb: fix installed-vs-shipped build error
Date: Tue,  8 Oct 2024 23:58:55 +0200
Message-Id: <20241008215855.1242951-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 21:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112721

From: Yoann Congal <yoann.congal@smile.fr>

wtmpdb installs a PAM plugin in "${base_libdir}/security/pam_wtmpdb.so".
This path is not in default FILES.

Add this path to FILES:${PN} to fix this error:
  ERROR: wtmpdb-0.11.0-r0 do_package: QA Issue: wtmpdb: Files/directories were installed but not shipped in any package:
    /lib/security/pam_wtmpdb.so
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  wtmpdb: 1 installed and not shipped files. [installed-vs-shipped]
  ERROR: wtmpdb-0.11.0-r0 do_package: Fatal QA errors were found, failing task.
  ERROR: Logfile of failure stored in: .../poky/build-master/tmp/work/core2-64-poky-linux/wtmpdb/0.11.0/temp/log.do_package.939726
  ERROR: Task (.../poky/meta-openembedded/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb:do_package) failed with exit code '1'

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
index 7fb31f208b..d4a8b49e1d 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.11.0.bb
@@ -33,3 +33,4 @@ do_install:append () {
 FILES:${PN} += " ${systemd_system_unitdir} "
 FILES:${PN} += " ${libdir} "
 FILES:${PN} += " ${nonarch_libdir}/tmpfiles.d/* "
+FILES:${PN} += " ${base_libdir}/security/*.so "

