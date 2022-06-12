Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02A1C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 18:29:30 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.19031.1655058568158028197
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 11:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gg/UL0sd;
 spf=pass (domain: mvista.com, ip: 209.85.216.52,
 mailfrom: asharma@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id j7so3760211pjn.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdxEBwlp/Qv0xAWzrnX4bgO9UdefQRmGN9abJ5tGwcM=;
        b=gg/UL0sdA+HOUgvfVerYkTwOYs8E62zHpfod8Wf7oqdhLSARHeuSUXSWsoM5Ybg8bq
         mrwmodCNagROuH5VQ6/w3wRsTaWjgFWZV7LIYEAyfm2rsrLwoJZEJouxOsVCWAN7qu3K
         lpxpy6cx/asp9OesaIUlHpRpBEB3RfBA4KHwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdxEBwlp/Qv0xAWzrnX4bgO9UdefQRmGN9abJ5tGwcM=;
        b=5JlFkKbrPzrUpsekVw+AoUXbAQVIHWvUP1SnbtFuSPtiYW1v3wWPdXuTaJ57VSVBn5
         VfSfT4OVcZcSui2t0ETLqBCwBLvF7UWSaoaiS0IXNA8JiJq5uf6m7SHVbOL7OoE/sooZ
         WkknnLxMOCYEh70c/OxvoszeLr7+veG83crkpvLl4SvzIfFmF2q0ovR7PIhnsm0ieJGu
         d8McBq/hpRa5iZpZSMSBL8/tMGDCrrEIpT8TNPKM3s+RVCXWy2PF/Y4oJyz4TFMcyQ2a
         bvW2dRRrPBR/KukeuoInkpuju/5EFz7E8gNVuH5AZy1thx10idUzbU8grwPgLCWl3B8W
         QIxQ==
X-Gm-Message-State: AOAM530IFTyI804nV3YX8YCy34F8DUfnngFtIPpFg7qgPxm0Og+Kr1s6
	2prIJUs/P8eUkUYyljjQwZ5xt0mvep/EmQ==
X-Google-Smtp-Source: 
 ABdhPJw65UsKoSflBtSjL0GiUK3QY58B9E3R4rLYuMDuCd0406hyMhx73jr8VsLTapTMv0u51glxhw==
X-Received: by 2002:a17:902:cec8:b0:163:e4c1:b302 with SMTP id
 d8-20020a170902cec800b00163e4c1b302mr55411261plg.123.1655058566938;
        Sun, 12 Jun 2022 11:29:26 -0700 (PDT)
Received: from MVIN00004 ([223.190.85.242])
        by smtp.gmail.com with ESMTPSA id
 b4-20020a1709027e0400b0016368840c41sm3398391plm.14.2022.06.12.11.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 11:29:26 -0700 (PDT)
From: asharma <asharma@mvista.com>
X-Google-Original-From: asharma <asharma@MVIN00004>
Received: by MVIN00004 (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 23:59:18 +0530
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [meta-networking][kirkstone][PATCH V2] netserver: don't change
 permissions on /dev/null
Date: Sun, 12 Jun 2022 23:59:17 +0530
Message-Id: <20220612182917.5987-1-user@MVIN00004>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Jun 2022 18:29:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97475

From: Ashish Sharma <asharma@mvista.com>

Source: https://github.com/HewlettPackard/netperf
MR: 117141
Type: Defect Fix
Disposition: Backport from <https://github.com/HewlettPackard/netperf/pull/27/commits/78c9ae7d9a6735575bc72dd28a19b2bc3a251981>
ChangeID: 39ae4b83f803fcef07976393cba18d33cdba31a7
Description:

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../netperf/files/netserver_permissions.patch | 25 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/netserver_permissions.patch

diff --git a/meta-networking/recipes-support/netperf/files/netserver_permissions.patch b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
new file mode 100644
index 000000000..2c3f1e2ba
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
@@ -0,0 +1,25 @@
+From 78c9ae7d9a6735575bc72dd28a19b2bc3a251981 Mon Sep 17 00:00:00 2001
+From: Andrew Elble <aweits@rit.edu>
+Date: Mon, 8 Oct 2018 14:31:20 -0400
+Subject: [PATCH] netserver: don't change permissions on /dev/null
+
+the (now default) suppress_debug=1 changes permissions on /dev/null
+to 0644. Don't do this.
+---
+ src/netserver.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/netserver.c b/src/netserver.c
+index 00c8d23..86a1c45 100644
+--- a/src/netserver.c
++++ b/src/netserver.c
+@@ -278,7 +278,8 @@ open_debug_file()
+ 
+ #if !defined(WIN32)
+ 
+-  chmod(FileName,0644);
++  if (!suppress_debug)
++    chmod(FileName,0644);
+ 
+   /* redirect stdin to "/dev/null" */
+   rd_null_fp = fopen(NETPERF_NULL,"r");
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 62ba966d0..06b2eddbb 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git;branch=master;protocol=ht
            file://netserver.service \
            file://0001-netlib.c-Move-including-sched.h-out-og-function.patch \
            file://0001-nettest_omni-Remove-duplicate-variable-definitions.patch \
+           file://netserver_permissions.patch \
            "
 
 SRCREV = "3bc455b23f901dae377ca0a558e1e32aa56b31c4"
-- 
2.25.1


