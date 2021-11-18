Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4FDC433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 08:41:26 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.3209.1637224885187408605
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 00:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=izVDcydj;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id bu18so22523901lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 00:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LrqaPbwwwowqXp2ojgyX3fuJGIE99hwRZkL14DGa12Y=;
        b=izVDcydjIZqjYRKoxZZEnAJpHQ8f8pcgDK87Aa4Dhz8FkoeGUpPhS7NfVSc1WzNtqV
         9wQPIxgVYvTXCg7/5jamdZeWy9zpWc1MFEGlyylEm/chh6MtQIbw0B4X1MLkplz0qlzK
         LI1KLoZ8FZlH8ToaMQEpffDdpg3xxbD8mQyNF1XlnpztC0bqhCDuyeGP8P5JVDmPczbW
         lwd0X27x6AWBM4+PFc87MNCRM8P1k+764XfsLfo9okPSk91vT9KXSOdZwXUqSnB2wSA1
         QsTF/O5fxlmn/G88FRU/IOcO+OT/tpJFLylJ01pclrnZF+ulGN6namRrPycqjKpDXVOs
         W25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LrqaPbwwwowqXp2ojgyX3fuJGIE99hwRZkL14DGa12Y=;
        b=LxplnvVhS66SzMUOUEYFyEO//OybQXvdBLx6ryvYOAqT5PNfROiptsTO7Q83yb7hZl
         3M/Sr14bSvfqj0k8cBgbjBWAFgwLosk3BIXC73xXmWtH5Z4gVywollXlo3lEKYBUDaOB
         Uk4HNYK97J6cScJaoXDw6NisxhEVFvUHfqXcDKRQG+DEFtIolsw8urTtw/mxe0zgdRaf
         Au4Gvz3tz0V4eVwPpiKZ8+PSGdRHfQbg9F72NNyiU0FSdJWKofqdwAKr1AjGzTIZfvDJ
         VG5nPXY80UhKFqiLn+ZjTwfZdOMy4abSFyAgzJHX0BiAoYNpI9cTUKDwNf3JJThzlSUt
         vUXA==
X-Gm-Message-State: AOAM530nKrcDq15rPsAsUVmN9kkHd6qY+qcn/OaByn+f2yrDgBXoM4bh
	9KPfD094Bo222WO50tlqZOLE4uG+p8Ofjg==
X-Google-Smtp-Source: 
 ABdhPJz0CXta9k7+o3oh+7I6QWGcKeSodfkgQTF7PxfoLmNXa/rVkvBwtwzZCzsMK2XWCQoR+cJF0A==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr14879216lji.143.1637224883285;
        Thu, 18 Nov 2021 00:41:23 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 o15sm232648lfk.175.2021.11.18.00.41.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 00:41:22 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH] jdepend: Set protocol=https and branch=master
Date: Thu, 18 Nov 2021 09:41:07 +0100
Message-Id: <20211118084107.1039286-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 08:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94019

Fixes:
WARNING: jdepend-native-2.9.1-r0 do_fetch: URL: git://github.com/clarkware/jdepend uses git protocol which is no longer supported by github. Please change to ;protocol=https in the url.
WARNING: jdepend-native-2.9.1-r0 do_fetch: URL: git://github.com/clarkware/jdepend does not set any branch parameter. The future default branch used by tools and repositories is uncertain and we will therefore soon require this is set in all git urls.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/jdepend/jdepend_2.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend/jdepend_2.9.1.bb
index 7c6cc8c..deae6a8 100644
--- a/recipes-core/jdepend/jdepend_2.9.1.bb
+++ b/recipes-core/jdepend/jdepend_2.9.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5777d32a7709d558c2877d4a6616230"
 
 HOMEPAGE = "https://github.com/clarkware/jdepend"
 
-SRC_URI = "git://github.com/clarkware/jdepend"
+SRC_URI = "git://github.com/clarkware/jdepend;protocol=https;branch=master"
 SRCREV = "57980590313a5dbde236a3eb2c8958e9e53e6a10"
 S = "${WORKDIR}/git"
 

