Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84BBC433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 18:23:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.18968.1655058181403790783
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 11:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MXD+xg0V;
 spf=pass (domain: mvista.com, ip: 209.85.216.54,
 mailfrom: asharma@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id a10so3752666pju.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jun 2022 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdxEBwlp/Qv0xAWzrnX4bgO9UdefQRmGN9abJ5tGwcM=;
        b=MXD+xg0V1Xd3fZ3oKdk31fRJzM4AprOXpKnm+jy246RLyvPOUwjq2w4ZIQX/OKu3Mr
         22npco5LxeHzQllMiguFEioDy5ZisS42ppxdfVTkkD/njdTfNUYJTxo+58z6HH0v/ojW
         ziuu117vmiW6W4G4TAeBNxaPEsHxkgJczk/l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KdxEBwlp/Qv0xAWzrnX4bgO9UdefQRmGN9abJ5tGwcM=;
        b=Ro190hD4/aLPi1sr5fQxrV4EI1s5xbP8g4ZKMUAyazxhcpH4ldf00T+mY+WqCmqLrc
         nl+ciO1+H++EKMnFMY5P0/z4xTBd9CugVHZsN/XG7p1xUeP5yX8sr7ocVOuL/GZlkyjS
         xt+hMsn1JFGbu20GX6hn52ceMQDkImoyOqmqzRMIreS9MqXXb1GlLqnVfEdzD7ZJ9oIG
         id5gzG9S9gws8COkw0iB9mfasoCzRZymh4jhg4TeKITI1NCij/xCRqOW8EmrEjusXjAa
         ZlW+Wik8slxhLYpLvvNaJjefmppIUDKTiswnLULcD0YVqBOvSZkK8jQAQvhBPi1Y7Ynf
         gjSQ==
X-Gm-Message-State: AOAM532V7e1jCzytDTtpwZZVQRLdQvTeweJsRAZr35g85XQILQhGiopo
	J5JG2H8o6ZlvrQHd/z44nUXJhoVGgX8jpA==
X-Google-Smtp-Source: 
 ABdhPJy22JJbuNx3rV5V7pVi6vEmCqyCDdpOtcLb79HxVaM6PyrIJKVdZzCe0LDB379FOWUarAn5Vw==
X-Received: by 2002:a17:90b:4d05:b0:1e0:b53:f4a3 with SMTP id
 mw5-20020a17090b4d0500b001e00b53f4a3mr11517354pjb.3.1655058180667;
        Sun, 12 Jun 2022 11:23:00 -0700 (PDT)
Received: from MVIN00004 ([223.190.85.242])
        by smtp.gmail.com with ESMTPSA id
 m3-20020a17090a858300b001e307d66123sm3466214pjn.25.2022.06.12.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 11:23:00 -0700 (PDT)
From: asharma <asharma@mvista.com>
X-Google-Original-From: asharma <asharma@MVIN00004>
Received: by MVIN00004 (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 23:52:51 +0530
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] netserver: don't change
 permissions on /dev/null
Date: Sun, 12 Jun 2022 23:52:50 +0530
Message-Id: <20220612182250.5674-1-user@MVIN00004>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Jun 2022 18:23:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97474

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


