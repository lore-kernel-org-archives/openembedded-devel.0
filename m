Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3840BC7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.11449.1685531602677100480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TdMcbOxc;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-565aa2cc428so47387947b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531611; x=1688123611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arr2v/mrmlJ4iwA+aZiUUMMVzMgo9ZIWTtFn/v9Nqdk=;
        b=TdMcbOxcYe0N4jwY+yRe6r7Ma+oZ84oQ2bBHZ8CJ6vii/e7u1kJTuztx5eOBufUwjn
         uQKDHWAnwMcZ6JfluNqRdekRWTUyYwqyrOE8snPHpns+DgH81P4o2AQFcIo7Lhxn2+St
         9mjbraENyw5j1mgB0iEx0fpwCkPvNBdfZKyvh/WfP52WdoLkfM05z5yaPkWZEdylYzOV
         HAra1+evJWf1hLTeqrSP6pUysaZAmPUy0EDgX2lloy70UQ7qhv6wpDF7WUOt8tJ/VAIl
         J1tXiPDMz19vuURrnY9TK7hqF2RBldwMQ3ryPkYIVhsiSl/rtB/vs9PbiIqokPt2daon
         g0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531611; x=1688123611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Arr2v/mrmlJ4iwA+aZiUUMMVzMgo9ZIWTtFn/v9Nqdk=;
        b=bFlJ4jfMGcUJfE86t4uiioDEL/RqELFuYC2Y3PX0tM2TAcTDW/udCdfuzyzfBVkGpg
         MDGTL0sodgPZRyvtz9BHL7H0X5llIjcMsrYg04WSz7Xb3IkJSqGFIvIEdUkHXcdRm+r5
         2Em49nPb5AWNoet5PWiOTocQSwVJpjGLPiywAr00VbPpor1NAr4FZDiOrN0w7ZVQuQOw
         gGmOPI099yQclzZDm+0l5Uvh6AvDkfBhtGOrRqmLDdSBFXXYQ7CfH8ge5celhOG3ZToI
         J7jOxdPYeiacMbwOLmMKm1VkOAZaUFXewu0avwPFtXxF2L1LRkZxcwL0wHJs0h5MEHGD
         QyvA==
X-Gm-Message-State: AC+VfDyaxvpRTO6mPlF3brQH+6xI6LcCCsGPFqGPvcGQzSCh3bF44QMb
	XWAHtHZ0GAdCab+XEnfFLM4m/p2I2vs=
X-Google-Smtp-Source: ACHHUZ6hOTnDmUMUlfsOtF+GuBcaWamp5HMPK2EpBomFJd+uCyAxyo6aBGP+gzWemgx78rBhS6KiPg==
X-Received: by 2002:a81:a050:0:b0:561:9082:8039 with SMTP id x77-20020a81a050000000b0056190828039mr5138307ywg.38.1685531611548;
        Wed, 31 May 2023 04:13:31 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 22/36] curlpp: Remove references to buildpaths e.g. TMPDIR
Date: Wed, 31 May 2023 07:12:55 -0400
Message-Id: <20230531111309.2454603-22-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103051

From: Khem Raj <raj.khem@gmail.com>

Fixes
WARNING: curlpp-0.8.1-r0 do_package_qa: QA Issue: File /usr/bin/curlpp-config in package curlpp-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8257604b8ab05f7f6e5d0414a12a4aae84e99aaa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-Remove-references-to-absolute-build.patch | 40 +++++++++++++++++++
 .../recipes-support/curlpp/curlpp_0.8.1.bb    |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch

diff --git a/meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch b/meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch
new file mode 100644
index 0000000000..539e9cefb6
--- /dev/null
+++ b/meta-networking/recipes-support/curlpp/curlpp/0001-curlpp-config.in-Remove-references-to-absolute-build.patch
@@ -0,0 +1,40 @@
+From d6eee2d52f31e034f9d84d38a749d86a63d5b769 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 May 2023 20:37:47 -0700
+Subject: [PATCH] curlpp-config.in: Remove references to absolute buildpaths
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extras/curlpp-config.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/extras/curlpp-config.in b/extras/curlpp-config.in
+index b0bd964..1416b94 100644
+--- a/extras/curlpp-config.in
++++ b/extras/curlpp-config.in
+@@ -43,7 +43,7 @@ while test $# -gt 0; do
+ 
+     case "$1" in
+     --cc)
+-	echo @CC@
++	curl-config --cc
+ 	;;
+ 
+     --prefix)
+@@ -73,10 +73,10 @@ while test $# -gt 0; do
+        	;;
+ 
+     --libs)
+-       	echo -L@libdir@ @LDFLAGS@ @LIBS@ `curl-config --libs` -lcurlpp
++       	echo `curl-config --libs` -lcurlpp
+        	;;
+     --static-libs)
+-       	echo @libdir_static@/libcurlpp.@libext@ @LDFLAGS@ @LIBS@ `curl-config --static-libs`
++       	echo $prefix/@libdir_static@/libcurlpp.@libext@ `curl-config --static-libs`
+         ;;
+ 
+     *)
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
index e36a86fd09..131f1873a2 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fd0c9adf285a69aa3b4faf34384e1029"
 DEPENDS = "curl"
 DEPENDS:class-native = "curl-native"
 
-SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/jpbarrette/curlpp.git;branch=master;protocol=https \
+           file://0001-curlpp-config.in-Remove-references-to-absolute-build.patch"
 
 SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
 
-- 
2.25.1


