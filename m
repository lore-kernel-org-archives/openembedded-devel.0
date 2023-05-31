Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77FDC7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:22 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.11435.1685531593314786862
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LiWtRm9a;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-568bb833462so27743187b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531592; x=1688123592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvdwJmadpokA3TEhfejNmEItC6Df1CPi/v7pj3XWWDE=;
        b=LiWtRm9a6sp6dxwdkjzltMIIH7V+J565d5YHDKGv+eyYg1T3GsfzcqTFzkAkh4wH6V
         vEWJm26F/toLgAMoaDdDulLLKbQdzUVBo1+KQyo9pmbfqyJdmFhF4K2NXM5ZeTNexuDu
         ntUIf5RfEUpVHgqrU+ukjkadVwiLZCUk+7Ec5cSrLFnrY8yB3h7y5Z9M07NNKhOO0WPd
         eoDkA1StMdGSk/bfB3b+B9ArudwM5QLoJt3giw5ZItDPvBvA2huLrbG6SkycWAV49ETD
         Q+9pY70WJa/dE2LaxyUtjEUEHjjzHy86C6ZCrUTDoy9lwZRQFOqFk6OsEPgT6bOA1cHA
         MyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531592; x=1688123592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvdwJmadpokA3TEhfejNmEItC6Df1CPi/v7pj3XWWDE=;
        b=WtRezACA2LaKDRdk+Wl+6MKRa8LtxbM70lGAO7t/34ndFpVgqc1/qxnejhYvDpEwPf
         JiODzWaPov7I1jjCVFFePcUj1AjkYNDAJcZOY7D3HGZtV4kHk/6B2gNHQgcSunVR/sTa
         I3wcW1Wg0nsiESfKaahdotPmZSoGRret8T4z1woVGW8T+FwHjzGgns/QSblGxn9QCgD8
         BF4yVmde5DelOFhrdPdnE3rWYurbZHoRS12rBh606uffKI45IFjVJY1/5GBe87sh20XS
         510AuUgvpTyJK5HkpoyKtl1vaN3PudZwPo8jffDZc/LHtCXEC/TJe02uVQLX6lvH+rFT
         8bFg==
X-Gm-Message-State: AC+VfDx1dCv7ZTm2bOcGVJDmjl6BFgq2fD3qFpj0t+fhZjwdufQftM6J
	JcUj8D2d3dvntwhHEm1/ejbLxpWsReQ=
X-Google-Smtp-Source: ACHHUZ7PbJfgSlO028dAbS3vqsouSard0C8v0MTLxBf/mM7E1vU5ptiFtEmEWm4JrQlCIHxNyl30nw==
X-Received: by 2002:a81:92c6:0:b0:562:41c:f627 with SMTP id j189-20020a8192c6000000b00562041cf627mr4745019ywg.10.1685531591982;
        Wed, 31 May 2023 04:13:11 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 02/36] frr: add CVE_PRODUCT
Date: Wed, 31 May 2023 07:12:35 -0400
Message-Id: <20230531111309.2454603-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103031

From: Chen Qi <Qi.Chen@windriver.com>

The CVE_PRODUCT is frrouting in NVD database.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 10c7793832ec492da50c89889c5cdd114962b7a5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/frr/frr_8.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
index d01d895a80..9669260945 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
@@ -18,6 +18,8 @@ SRCREV = "62ac43de9f3bc470586cf4f51fadf013bf542b32"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
+CVE_PRODUCT = "frrouting"
+
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep python3native pkgconfig useradd systemd
-- 
2.25.1


