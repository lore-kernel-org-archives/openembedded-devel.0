Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.26294.1608483250067606384
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Dec 2020 08:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nQ5tYvlY;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id c12so5046885pfo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Dec 2020 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7D31o3l0LzZK1a1bkjDlrYTx5Y+zZAK955s17X5bUYE=;
        b=nQ5tYvlYThSzLymlIYXCQ/uQYinP8Oy6D/Rf8kgsoOYo6HkCM+fRV6BifUiniwdohN
         /9Y9o56UU/yC56NGoWSkVgczTJxSjbBe0PxeEvwEydQMBlLXJE75vkXFFMce0YCi9nd4
         XJKWHrJfUOxVJvWEbigcDWo0lUP0bHH+pUGdvX+EfckG53CaqLwUru7a6gST/r0GVdho
         UuKJATtkQfbgp/QNn2K2XDODQUL17fm1Oy0INQkUNh4Uon7UTBIKRvejNkxx71vftb+G
         u3a6PMRfiQ3PzmyKNVlru4GTeR+wfCc0qVNRocPWKZ8RkYxf+tTLHU9vTFvlWm22+lGE
         Ialw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7D31o3l0LzZK1a1bkjDlrYTx5Y+zZAK955s17X5bUYE=;
        b=rl2BTkxlZt+WInGRIBDlg/yltiOS97/8CiWA9Ctx5VtRTEKr+V8edkAIDz3MXDyTye
         49yHftRWd8V0uDiANxC/6k3DPo+28BL0lfL9ab0mY/CHkDIeitdYwko0xd9cKp0h/fBD
         q/XnC9IPlo32X2oqFhHQtjL6w9SKVlOt7DMBwXuTbTEdHUKMzcfgaNyisqQjAtXLDdnP
         ksH5IgUBbv2Q2gNEAJfqNR1rRB47JzTH+YnjH643Ecscli4+Uw+yp5tXqITq54mROP6c
         CJdDJxtgOsozByzu54cc6qL3Twf0ybgaS99aOvcsiyTuljLSoXKkmHmxLMD0LvbtF2ne
         Y6Xg==
X-Gm-Message-State: AOAM530u100lFZ6sPlPca5aAcGc8c5EP66uY7s1dlhUoiK/tKNd6R3mh
	C/fjcjm66hBodprQ8M6jVtaCMt+O3cYtGQ==
X-Google-Smtp-Source: ABdhPJyYQLCgSisYSWybpdtMkbAi6/HcAjKQq7Ke0t3SIyaQNLwzmeqWrSOPFRxZdqin/R5blBJhrQ==
X-Received: by 2002:aa7:8701:0:b029:19e:561:d476 with SMTP id b1-20020aa787010000b029019e0561d476mr12513173pfo.2.1608483249378;
        Sun, 20 Dec 2020 08:54:09 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:81b4:28ec:120:f083])
        by smtp.gmail.com with ESMTPSA id j15sm14192234pfn.180.2020.12.20.08.54.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 08:54:09 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 5/6] dlt-daemon: add upstream patch to fix CVE-2020-29394
Date: Sun, 20 Dec 2020 08:53:59 -0800
Message-Id: <a82e2fbdfa72173577730bb34ed6c59f348caa35.1608483161.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608483161.git.akuster808@gmail.com>
References: <cover.1608483161.git.akuster808@gmail.com>

From: Gianfranco <costamagna.gianfranco@gmail.com>

More information on: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=976228
| A buffer overflow in the dlt_filter_load function in dlt_common.c in
| dlt-daemon 2.8.5 (GENIVI Diagnostic Log and Trace) allows arbitrary
| code execution because fscanf is misused (no limit on the number of
| characters to be read in a format argument).

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dlt-daemon/dlt-daemon/275.patch           | 38 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
new file mode 100644
index 00000000000..75065eb0549
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
@@ -0,0 +1,38 @@
+Upstream-status: Backport
+CVE: CVE-2020-29394
+From 7f5cd5404a03fa330e192084f6bdafb2dc9bdcb7 Mon Sep 17 00:00:00 2001
+From: GwanYeong Kim <gy741.kim@gmail.com>
+Date: Sat, 28 Nov 2020 12:24:46 +0900
+Subject: [PATCH] dlt_common: Fix buffer overflow in dlt_filter_load
+
+A buffer overflow in the dlt_filter_load function in dlt_common.c in dlt-daemon allows arbitrary code execution via an unsafe usage of fscanf, because it does not limit the number of characters to be read in a format argument.
+
+Fixed: #274
+
+Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
+---
+ src/shared/dlt_common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 254f4ce4..d15b1cec 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -404,7 +404,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+     while (!feof(handle)) {
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
+@@ -419,7 +419,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+ 
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index f3fcee4d201..5066e76d348 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0004-Modify-systemd-config-directory.patch \
     file://241.patch \
     file://245.patch \
+    file://275.patch \
 "
 SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
-- 
2.17.1

