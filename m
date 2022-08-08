Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136DFC25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.25879.1659968713722983131
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qOeJKuQ6;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 o3-20020a17090a0a0300b001f7649cd317so1616184pjo.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/Wg481gMWcu/fBGI3mFJHxhWgh0L1AQyYr/QD3dfevQ=;
        b=qOeJKuQ6WlS5JpuADkScuZ8LugPnihOgUFyhQfQR5/HGk8DtMFjbbE7Y6gty3ZN2Y8
         wddAn/aRzlWTac5Kpb5EWSjSondozLJpHVG50b0fFMmb3UPvi/Earb/S++5ibPaTzdXp
         XStJsDgFOsbDkK7lVZ+HzIjCE8IATLkMyoz+heaqEjskeyvbimGkTnhYWhTqbt6x8gGI
         Xlu7tdu2wfSaeiQms2acRo3FH8Ze3QBcogzQaNHMBGYxgn/GuO4wKaUw0naNyalE4yEZ
         1fS2Ob2ic8o27w0kfAgEfc6KCyIXi88oS3JYdkO77j2cyGXoaoGqxo6/dh3IVzZDXPVG
         5K3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Wg481gMWcu/fBGI3mFJHxhWgh0L1AQyYr/QD3dfevQ=;
        b=QzSoBdlox0hpt5AGLdUVF370A36U/n+HVtJ/e/CKTBJUSuXZkkpzXm+kUNh4HyyKZo
         1UyePFVAscHzZ8YoRROPeos3wUaopE/SVszUvJY3UDSIfzmyBsbnjV+anct9eB25voUm
         QIeTkAT/GtDildSyb7SqVevFCVnlp77qrqvIQGbwnerFt2D2LT8T44RARCZcFCom3d39
         GK0L8Spytx5Va20YHXZ5+/1JKapCCvT1rPue3VUiZZUF7t5wLpJLxlVnfZlPIZ8O+t8j
         /ahg+tLyIPpE+6+waLtxeDN0gZN69jPoHRlShWzpz0Sq/CRn7F+ai2UXefvkZOuxPFm9
         Jnkg==
X-Gm-Message-State: ACgBeo3vhulDxB92sj12kcgsKUVqWuuvL1sj3a9W5IKk/QYVPRcwoD87
	u4c3km159xP34frBzmu8wr4Tblcv/eI=
X-Google-Smtp-Source: 
 AA6agR5hit8fe+n+tGWYRV/HxbGbOoWoqmU0PWooMRwyUtwScJ0if5dfmZcohhPPhSXa4QrNKYwgdw==
X-Received: by 2002:a17:902:70c7:b0:170:9030:8219 with SMTP id
 l7-20020a17090270c700b0017090308219mr9897132plt.163.1659968712728;
        Mon, 08 Aug 2022 07:25:12 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 09/13] freeradius: Fix buildpaths issue
Date: Mon,  8 Aug 2022 07:22:48 -0700
Message-Id: 
 <055f26ce9a2607b7412730de728abd6305fd4c80.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98169

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: freeradius-3.0.21-r0 do_package_qa: QA Issue: File /usr/bin/radeapclient in package freeradius-utils contains reference to TMPDIR [buildpaths]
  WARNING: freeradius-3.0.21-r0 do_package_qa: QA Issue: File /usr/lib/libfreeradius-server.so.0.0.0 in package freeradius contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1c91de67b4981f62ddc7308bf88c1a6f4a844fdb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...01-version.c-don-t-print-build-flags.patch | 41 +++++++++++++++++++
 .../freeradius/freeradius_3.0.21.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
new file mode 100644
index 0000000000..697205efe0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
@@ -0,0 +1,41 @@
+From cbc64dcf6aa2a1be63f45ea6dd7d2c49b70a0bee Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 3 Aug 2022 16:44:29 +0800
+Subject: [PATCH] version.c: don't print build flags
+
+Don't print the build flags to avoid collecting the build environment info.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/main/version.c | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/src/main/version.c b/src/main/version.c
+index 62972d9f53..cf81de72c9 100644
+--- a/src/main/version.c
++++ b/src/main/version.c
+@@ -589,19 +589,6 @@ void version_print(void)
+ 		DEBUG2("  unknown");
+ #endif
+ 
+-		DEBUG2("Compilation flags:");
+-#ifdef BUILT_WITH_CPPFLAGS
+-		DEBUG2("  cppflags : " BUILT_WITH_CPPFLAGS);
+-#endif
+-#ifdef BUILT_WITH_CFLAGS
+-		DEBUG2("  cflags   : " BUILT_WITH_CFLAGS);
+-#endif
+-#ifdef BUILT_WITH_LDFLAGS
+-		DEBUG2("  ldflags  : " BUILT_WITH_LDFLAGS);
+-#endif
+-#ifdef BUILT_WITH_LIBS
+-		DEBUG2("  libs     : " BUILT_WITH_LIBS);
+-#endif
+ 		DEBUG2("  ");
+ 	}
+ 	INFO("FreeRADIUS Version " RADIUSD_VERSION_STRING);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index d6477e340e..1407b798b5 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://radiusd.service \
     file://radiusd-volatiles.conf \
     file://check-openssl-cmds-in-script-bootstrap.patch \
+    file://0001-version.c-don-t-print-build-flags.patch \
 "
 
 raddbdir="${sysconfdir}/${MLPREFIX}raddb"
-- 
2.25.1


