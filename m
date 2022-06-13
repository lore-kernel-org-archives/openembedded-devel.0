Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCC6C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 12:22:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5146.1655122935143345649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 05:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gDFFzPQ4;
 spf=pass (domain: mvista.com, ip: 209.85.214.172,
 mailfrom: asharma@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id o6so4968465plg.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n/+MXe15SDU0vTD2lOxMVriWNVhfft6g7yNpPhZiYS4=;
        b=gDFFzPQ4/oGrwUKJPqi32B1pqEjsdZBU1xgeNTsLk/0qzhJACEfmNFWeKD/Pn5hKyv
         Zd15oUal++6Wm+JVcgIkugx8YqUEwwRjfpZignxzRbYQEzj3M2I73za1g0qat0s5uJeB
         PmcXXZA+FD4brRcT1AYHcc1u1/7ho8U3n5Cfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n/+MXe15SDU0vTD2lOxMVriWNVhfft6g7yNpPhZiYS4=;
        b=GSWgQIzsrIVYkf63/h4vPzCZk1Hb3dzIGcmRkDBe0OtZOpr8jWbu/M7vGlzXY05abg
         MA+S++5D7mbMpt7raGMC95TR7HJbVq94rIXWtxLglkk8NyehpevUm2tLBaLlWO3esAzO
         /t02GgaX/jKuL9blZlC9YEKBUpehq/a7CFmc32S8rRW3XSDhG5keiH9fJUsZVe4fzB9W
         Fu0TuWzPVjscBg4Zsi5hvLDtZ+Wkel/2FhMf9YUb+Yuc+GDzzUTyvPt6SRv5r3Gl/hzE
         U0RBrD+d6OY6TPUwoNZMH0As3ek5r0DFsQIFGTBGMTeUl30MGKKFuB1febhT/dx45R8l
         6Mlg==
X-Gm-Message-State: AOAM531XYi6D4y1jlcOhltRNBo3TGhmsjn0J65VH2YIL3+BrpkPrUYRN
	3NxKX65t66ohbLJ4FnutGEZa+JFDQfebiw==
X-Google-Smtp-Source: 
 ABdhPJw4dRE6X8SDPYaMbL1IE8awDJ/LdhKpDjv+k2JIjm0Pq8ikMQV0R3Bp7lrIAHJhAKSUaoqbzA==
X-Received: by 2002:a17:90b:1017:b0:1e2:f568:bc74 with SMTP id
 gm23-20020a17090b101700b001e2f568bc74mr15528970pjb.156.1655122934302;
        Mon, 13 Jun 2022 05:22:14 -0700 (PDT)
Received: from MVIN00004 ([223.190.88.188])
        by smtp.gmail.com with ESMTPSA id
 t22-20020aa79396000000b0051c4ecb0e3dsm5204060pfe.193.2022.06.13.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 05:22:13 -0700 (PDT)
Received: by MVIN00004 (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 17:52:05 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: asharma@mvista.com
Subject: [meta-networking][kirkstone][PATCH V3] netserver: don't change
 permissions on /dev/null
Date: Mon, 13 Jun 2022 17:51:19 +0530
Message-Id: <20220613122150.795162-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 12:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97489

From: asharma <asharma@MVIN00004>

Source: https://github.com/HewlettPackard/netperf
MR: 117141
Type: Defect Fix
Disposition: Backport from [https://github.com/HewlettPackard/netperf/pull/27/commits/78c9ae7d9a6735575bc72dd28a19b2bc3a251981]
ChangeID: 81ba6fc73694cdf32ee1856c1b69c646ac87db40
Description:
	the (now default) suppress_debug=1 changes permissions on /dev/null
	to 0644. Don't do this.

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../netperf/files/netserver_permissions.patch | 28 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/netserver_permissions.patch

diff --git a/meta-networking/recipes-support/netperf/files/netserver_permissions.patch b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
new file mode 100644
index 000000000..7cfc3e9b5
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/netserver_permissions.patch
@@ -0,0 +1,28 @@
+From 78c9ae7d9a6735575bc72dd28a19b2bc3a251981 Mon Sep 17 00:00:00 2001
+From: Andrew Elble <aweits@rit.edu>
+Date: Mon, 8 Oct 2018 14:31:20 -0400
+Subject: [PATCH] netserver: don't change permissions on /dev/null
+
+the (now default) suppress_debug=1 changes permissions on /dev/null
+to 0644. Don't do this.
+
+Upstream-Status: Backport[https://github.com/HewlettPackard/netperf/pull/27/commits/78c9ae7d9a6735575bc72dd28a19b2bc3a251981]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
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


