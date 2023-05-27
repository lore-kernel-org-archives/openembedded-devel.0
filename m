Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61C6C7EE2C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:36:47 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.3367.1685151397941712780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 18:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hJJ7zuKk;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-52c30fbccd4so1225364a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 18:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685151397; x=1687743397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLZtfsb+dVXp/rEMGVDhaOTy6ZmA/2dZjJap84kFuJg=;
        b=hJJ7zuKkITpxnnR+m+kU4UFHsiPKy4Pm6y7in3uG54hjgZUXKphBMZNC9mKtBHxqf0
         Lng7u3Gcd7jMF3KJszhzibWJhmXhDH1uyLMUEArDSroF/eG7nuALGjil+UPsWKaBtAtR
         t6MVLCp7ZxjEhjmqz28HXHua52A08givUIj6NpMnQmTctxBnNN7gJP4HONTuNgxXQRkn
         tS4u/Mz0mGilw9mXPS5rt2oztlq0CpTgBLjYTux5YiG5J42AUfBcO0pQzfDTD8fq2bsA
         EfVLeZdtLj4P9kp+PcA+bUXJawUuA73jjRD6nVPGhO+S8pvLas2F1yCiOxl8CJOeSw6P
         ihcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151397; x=1687743397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLZtfsb+dVXp/rEMGVDhaOTy6ZmA/2dZjJap84kFuJg=;
        b=LJettpk3nxGGum1iUH1fvCvjUCFXtCCqhPo1Rky4X2Kilsu3M8ke5H0nsTsqMa9JMF
         181wy28X3ZugXlDxQ28BBQ1dwuug7xjAuT1oMk6l2BpFCM5HNqn0OOFZcVdi3o9V8YW5
         OflGAyG2OylerntXLwBe74fg0d5278uqBl01dVLCkZVogJYNVMu9MSUyUQYEgt13Oy5x
         hYN5vlSEcLJCR4EwoChK5UThwHQxa2Dfp+15iLX8Q0OR6WOOVhurrG6btCrB35ucttIZ
         diWeJwRJsDmg7fePVk3+oFuuEG7hlKSs24YRAiWKi9HnG014nHAOWXMF/Bg/2jsk2lot
         YoDA==
X-Gm-Message-State: AC+VfDyUCg8OUNb+/GTRTsrNIoSm04RS0Bo8nhLknug65zSg9MjV0mz2
	Psq28BRMIdPf27XyLN0uwEBf+eiLTR4=
X-Google-Smtp-Source: ACHHUZ4ENXXJMGJJnPxo1WGotWzWOWKBq30mrLotnvhNyIvpuHJLXfjWy1/fIgFVnAHkj0v/TPQqAQ==
X-Received: by 2002:a17:902:db09:b0:1af:dfd8:940c with SMTP id m9-20020a170902db0900b001afdfd8940cmr5449823plx.23.1685151397019;
        Fri, 26 May 2023 18:36:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b001aafe4f9b8esm3802191plp.180.2023.05.26.18.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:36:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/5] zeroconf: Pass cflags from environment
Date: Fri, 26 May 2023 18:36:31 -0700
Message-Id: <20230527013632.96030-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230527013632.96030-1-raj.khem@gmail.com>
References: <20230527013632.96030-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 01:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102877

Fixes
WARNING: zeroconf-0.9-r1 do_package_qa: QA Issue: File /usr/sbin/.debug/zeroconf in package zeroconf-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index 4f8d4f6c6e..0b9e05b324 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.g
 SRC_URI[md5sum] = "bdafb16b008ebb5633e4e581f77821d2"
 SRC_URI[sha256sum] = "a8c74df127753e2310fa1e072f3c9ca44a404bb0bbce9cfec7a84c6dff8bec7b"
 
+EXTRA_OEMAKE += "CPPFLAGS='${CFLAGS}'"
+
 do_install () {
     install -d ${D}${sbindir}
     install -d ${D}${sysconfdir}/network/if-up.d
-- 
2.40.1


