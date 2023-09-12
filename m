Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAA6CA0EF7
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 16:50:41 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.30801.1694537435210696250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 09:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0YbLVaiX;
 spf=pass (domain: baylibre.com, ip: 209.85.208.170, mailfrom: pidge@baylibre.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b962535808so100503781fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 09:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694537433; x=1695142233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXyMUP5TDjhAfx5XRujVdS7ikN7f6R6uqrAG+vO9nPs=;
        b=0YbLVaiXnP0QDXatV8rzsLYpXiXYFq1/l/5evrc8k7kw78znCx2DiDn9H6qG8+wxqQ
         SYnKpKTiyXq8ITL5vIS0/XYuIdA5lOBXXlXjqTIckGA0OTRBIpCvtH+vuLhvmlMlN3Nw
         92rBqgPtu1NHYWdigPA0ICA6AF6LKTT3RVusUqgkKcnaS5VpFCogoyXfBF5yMPtMwXkD
         yyO2YTVz1+dfj97eRwBPu3XGpV24iPo1b8UnWm5HYsUpAXOWDcN4aGiEgBTty6oSL2Ul
         QuSevo+qiD5eNscDTCgEzkSJF1U7yvrJoB4AGq4EtFJMJqTpoG/LmsJEjf7b75kaeNYs
         tMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694537433; x=1695142233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXyMUP5TDjhAfx5XRujVdS7ikN7f6R6uqrAG+vO9nPs=;
        b=SWNppuI9IJBORfYCWb7bYyZDDYFNQRyNN6smYC5gr7X1r9Ud7gdEIYoBligtxLLOqG
         fjqGoWY6FHEeLaAFmY7AVx9KO4NhWaoKLKDJyN+q6VuOMfkb2/IMyTbOsBkIxN8kZvyi
         8oZ12mUY0O76VH2+a6SMUPHEeMJrk/tOOpXFt3cHxJKJAcGhMZkX792oumuDc1QQGlhH
         2cNx1bDl+W2n1FJXT21lakmffoI1HTrA2Fj/vkzLKWGvA9/tVGtHa/kvOXzWMLd4fmOx
         cVeg46Bjh+mWDHQFJi3mk9oZnuiNCvVky9eumEvWzouG+4+Z+v25ekHbUNEmGVcd52GA
         YVuA==
X-Gm-Message-State: AOJu0Yxr6YI9mX80tqqlHDQUHkZFPey+21E/0jemsHM9Qk4VYFfCuuTY
	5uXhwX1EVWr1iE7LVyrtlLxiHua6ziuitq34t1xoTQ==
X-Google-Smtp-Source: AGHT+IG1uUFgkqDJaokLlZPJeQazBc6c/Ozc5b+XZvOAu60x7wCYf7ZGQSzAgiCuUUOzgCH8d1jEJA==
X-Received: by 2002:ac2:5def:0:b0:500:9de4:5966 with SMTP id z15-20020ac25def000000b005009de45966mr66851lfq.62.1694537433119;
        Tue, 12 Sep 2023 09:50:33 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7c6c7000000b0052328d4268asm6157436eds.81.2023.09.12.09.50.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 09:50:32 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core 1/2] lib/oe/package_managegment: Add nativesdk-intercept PATH
Date: Tue, 12 Sep 2023 16:50:23 +0000
Message-Id: <a2b098f82579861cc3442394ded9d4c3aed9ff52.1694535904.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694535904.git.pidge@baylibre.com>
References: <cover.1694535904.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 16:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104849

[YOCTO #15023]

This patch adds (and removes after function execution) the
nativesdk-intercept/chown|chgrp PATH before target_pm.run_intercepts
calls during populate_sdk builds.

This has been tested with cleanall builds and testsdk and fails on deb
due to an issue where $D${localstatedir}/cache/man/ does not exist for
some reason. I've a work around for that in the next patch in this
series.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oe/package_manager/deb/sdk.py | 5 +++++
 meta/lib/oe/package_manager/ipk/sdk.py | 5 +++++
 meta/lib/oe/package_manager/rpm/sdk.py | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 653e42ab3c0..6f3005053eb 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -69,7 +69,12 @@ class PkgSdk(Sdk):
 
         self.target_pm.run_pre_post_installs()
 
+        env_bkp = os.environ.copy()
+        os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
+                             os.pathsep + os.environ["PATH"]
+
         self.target_pm.run_intercepts(populate_sdk='target')
+        os.environ.update(env_bkp)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 6a1f167fb77..cc7a7ede547 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -63,7 +63,12 @@ class PkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        env_bkp = os.environ.copy()
+        os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
+                             os.pathsep + os.environ["PATH"]
+
         self.target_pm.run_intercepts(populate_sdk='target')
+        os.environ.update(env_bkp)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index 85df6e949cc..ea79fe050bc 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -67,7 +67,12 @@ class PkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        env_bkp = os.environ.copy()
+        os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
+                             os.pathsep + os.environ["PATH"]
+
         self.target_pm.run_intercepts(populate_sdk='target')
+        os.environ.update(env_bkp)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
-- 
2.34.1


