Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE64CCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 17:33:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.8943.1655141598494925969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EyXtwpF/;
 spf=pass (domain: mvista.com, ip: 209.85.214.176,
 mailfrom: asharma@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id n18so5669637plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bpLdp9567L8sJxJc1d4+B+9W+oHrnp2Q/HwAV7Jfw8c=;
        b=EyXtwpF/2ICApOyMfVsZRpew0ECimoPHWo2fiBUBtiPiEA19+p7OvHcudmSSui+UZ8
         Fj9aHZQk3Ocp6wdgPOPPxR15NmKzrUR/VDpsaTvvl3Cq/2OP8KXISp4noK8L6ankHTH4
         mtBz/tPPp1/aM9glgbXlDvILFHNKH4FFsTz0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bpLdp9567L8sJxJc1d4+B+9W+oHrnp2Q/HwAV7Jfw8c=;
        b=Oj5ySpI83ihvZaY4aujp1h2S6X34iNVtmVbOFvJTN7B5q1sSgCVp5BrFR5FpxrZFVR
         7rxRHjtYnMt1PIrSf4jnD4SbTpAqsMM4HMmnWzOirNGBbwT6oEqYw9d4awicbPKaZ/E3
         0L/wb8KMREG4VzSJqxwtv9P4EIr/8Ub6CBbvTcUyvTbkhisVRoDfURqX209WSapLLP8t
         3P8ra1AOadU4+4wPbNf3VvNlokQCTqQYAhigpmKII79Xf5A00a+7MiLjGqgq9yS/7B7U
         rFFF72XdYHitxgPoVtsOJllkt82dWqqiPZLCCZIbSlbe+fgK+Toa1NldtcMfqwpd0OmC
         phAA==
X-Gm-Message-State: AJIora/qdXg82bZzcQ3k+d5AnnVl7mzEWlBuMk30/G6SDcg9RFtzr6VB
	VN6HXiPB1+WGHmQW0bc3djrJehtiySxlZQ==
X-Google-Smtp-Source: 
 AGRyM1tQZd+ec+Y6Fb+vGSn+EHuoDA/Z2VqkNMiwldIcYkVUYRv1Y9uDdLOajOjRvXmwNkgex2Y+AQ==
X-Received: by 2002:a17:902:db06:b0:163:e89d:622c with SMTP id
 m6-20020a170902db0600b00163e89d622cmr175373plx.143.1655141597544;
        Mon, 13 Jun 2022 10:33:17 -0700 (PDT)
Received: from MVIN00004 ([223.190.88.188])
        by smtp.gmail.com with ESMTPSA id
 1-20020a621901000000b00518e1251197sm5810065pfz.148.2022.06.13.10.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:33:17 -0700 (PDT)
Received: by MVIN00004 (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 23:03:08 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [meta-networking][kirkstone][PATCH V4] netserver: don't change
 permissions on /dev/null
Date: Mon, 13 Jun 2022 23:03:02 +0530
Message-Id: <20220613173302.800915-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 17:33:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97492

Source: MontaVista Software, LLC
MR: 117141
Type: Defect Fix
Disposition: Backport from [https://github.com/HewlettPackard/netperf/pull/27/commits/78c9ae7d9a6735575bc72dd28a19b2bc3a251981]
ChangeID: 199f8618971de15d177dab9651f82f5696ff1aa1
Description:
	the (now default) suppress_debug=1 changes permissions on /dev/null
	to 0644. Don't do this.

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../netperf/files/netserver_permissions.patch | 29 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/netserver_permissions.patch

diff --git a/meta-networking/recipes-support/netperf/files/netserver_permissions.patch b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
new file mode 100644
index 000000000..55316363e
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
@@ -0,0 +1,29 @@
+From 78c9ae7d9a6735575bc72dd28a19b2bc3a251981 Mon Sep 17 00:00:00 2001
+From: Andrew Elble <aweits@rit.edu>
+Date: Mon, 8 Oct 2018 14:31:20 -0400
+Subject: [PATCH] netserver: don't change permissions on /dev/null
+
+the (now default) suppress_debug=1 changes permissions on /dev/null
+to 0644. Don't do this.
+
+Upstream-Status: Pending [https://github.com/HewlettPackard/netperf/pull/27/commits/78c9ae7d9a6735575bc72dd28a19b2bc3a251981]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
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
2.35.2


