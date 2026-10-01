Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BF7CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:04:08 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3388.1790823841072361745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=phrZiS9L;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804b59404aso2900662b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823840; x=1791428640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVeFfvCxQ284my7rwlrp6zIBYq0kCXW0TjAXo4DoN9g=;
        b=phrZiS9Lo7S5GtKdgY5kqCwOUZElPteYkEKQ8HD6WNYW6C4D5Je3YMT2fwr4O5FOa5
         qf3ghMQse5TAHnJVPF0NfZ5pJOCk6CV66nZA88OajZWap2ZRjSQeMx/0EGeioPFmvT6w
         HfrLDnMS9g8ODnMriXP/fXPhdUaMvQNwtTLMOFFom2y4xjK2dqNFS56K7zWXcWChcMHz
         GCP39ad5G0NK7BvIoqKtolL+1n0HBr42DjG30b6PGGhvU0QtM13ow95SkHB5vsYrg3pX
         slXd28G3JKkp4QlIZQBxff6zqoT48iym+dhZ295zsLkdwCqXTQvhlJ7KwiBecD0KSkxR
         Dweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823840; x=1791428640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVeFfvCxQ284my7rwlrp6zIBYq0kCXW0TjAXo4DoN9g=;
        b=K3gJhGjK4KrxQdJot76Xv304vCZDLpU17TNwXxYSZ2w9s7Tp+ZxA1kOD+3KqXNINEo
         DMSDGawQ6AXvonezkrH8MzKHxJAXrCyLM/ADMTgK+4HRcft0ow2Mi7pGkzQXZSeEwM65
         rX/yYMUA4lD0FKbwi5QBpOSYFrIryWN7rD7w50CLl80Z6fidvWASQmQHduSgpjIuy4dt
         X3Cb3/iDRyLzfbS9gAzCjdpvTt9KLDVGjtoRYeXnb4X2FGcYdzAYf55qID1fFvp2COVh
         Yr6+grpVQah90p5XQm+kiBG464m+KewCVsEGSF3/6ACWNdiYNYcR2Z7g6w5biE92vmNU
         5Gmw==
X-Gm-Message-State: AFuF++nf3deMTsE0SzfJmrHa0B0diEGWk3YEl/4b1TJrNxs9aEgB1Yes
	mreuLy17ZjafuLWJGM7iitiQeStcjI8eTAcXMxgo4LCjd4i/fZI9JnV6pztLRQ==
X-Gm-Gg: AYBFou2xA+7pQ/mq2Zj8FvlESx+VeWo9iZZUnG0ild/BIx9ZySdz5LLaVR2NFH57aoZ
	BZDv9tyZi/kDj2hBjp771o2+BoUbM0G4OTpWDm8yH5x/M/ZktS1F5pNZmMsFFeAp6xfqCwNFcoy
	h4ylnRz/j3V0Zf5o2YfylgZ83ywCOrBZg65Jl0ljMysZU10Soe8Q1pl7n2UjfhlM+gq5XtBr2HV
	dW3I6wjY4xXp/KkC7bVSf1YYAiXPTZYEDPtA315Lur8putjosg2zFViUMfWGblMUWhwACrtdm5X
	DF1jdCbWq4l1zkk+fVeVTwHVdbgso+w15973Mck2sDlvmb2r7eVkEaPAegogce0VpsSiUTqcKR2
	J0PeiK35D4l64F6fuXg7WXIAk22zgyLx8udfTeA9YhNfdr4aUJ2ZvUmbP6mZzYhHCIeA18Y72u2
	kjyDsMpkbjIwGgWNNMyPYF1IiwhIZFLuxiCra0plEycHXl39nQKHEpiejKybgJV6Dfrx2GVVikm
	6NxX8CP3SrJ3db6AUCKu5k=
X-Received: by 2002:a05:6a00:8e09:b0:882:94ab:20f6 with SMTP id d2e1a72fcca58-887498026f1mr2297928b3a.1.1790823840341;
        Wed, 30 Sep 2026 20:04:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 12/17] squid: upgrade 7.6 -> 7.7
Date: Thu,  1 Oct 2026 16:03:24 +1300
Message-ID: <20261001030331.1581021-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130561

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also refresh patches for the new version.

Changelog:
https://github.com/squid-cache/squid/blob/SQUID_7_7/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...l-remove-reference-to-nonexisting-directory.patch |  5 +----
 ...-make-squid-conf-tests-run-on-target-device.patch | 12 ++++++------
 .../squid/files/Set-up-for-cross-compilation.patch   |  8 +++-----
 .../squid/files/Skip-AC_RUN_IFELSE-tests.patch       |  9 ++++-----
 ...uid-use-serial-tests-config-needed-by-ptest.patch |  5 ++---
 .../squid/{squid_7.6.bb => squid_7.7.bb}             |  2 +-
 6 files changed, 17 insertions(+), 24 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.6.bb => squid_7.7.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
index 9babcfb24d..d5c83a8834 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-libltdl-remove-reference-to-nonexisting-directory.patch
@@ -1,4 +1,4 @@
-From a6638a007a42917fea4b03e5c30d9b7208c634c4 Mon Sep 17 00:00:00 2001
+From 9c3718bce43146f219dec3c3cd47e57a6b418a19 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Thu, 7 Nov 2024 22:04:40 +0100
 Subject: [PATCH] libltdl: remove reference to nonexisting directory
@@ -50,6 +50,3 @@ index 9929557..c77df2e 100644
  AUTOMAKE_OPTIONS = foreign
  
  # -I$(srcdir) is needed for user that built libltdl with a sub-Automake
--- 
-2.30.2
-
diff --git a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
index 86b454d710..b42f77bc74 100644
--- a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
+++ b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
@@ -1,4 +1,4 @@
-From cd8bf8a4bf881f84c23a5fc1f48bb716efa51512 Mon Sep 17 00:00:00 2001
+From 9f6eb086ee1d525cf404189893fccfb8a03235bb Mon Sep 17 00:00:00 2001
 From: Patrick Wicki <patrick.wicki@siemens.com>
 Date: Wed, 22 Nov 2023 15:35:44 +0100
 Subject: [PATCH] squid: make squid-conf-tests run on target device
@@ -20,7 +20,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 18 insertions(+), 18 deletions(-)
 
 diff --git a/src/TestHeaders.am b/src/TestHeaders.am
-index 0ed5f56..d668876 100644
+index 4562d28..bc57e4c 100644
 --- a/src/TestHeaders.am
 +++ b/src/TestHeaders.am
 @@ -14,8 +14,8 @@ EXCLUDE_FROM_HDR_TESTING =
@@ -42,7 +42,7 @@ index 0ed5f56..d668876 100644
 +#TESTS += testHeaders
  CLEANFILES += testHeaders
 diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
-index 0da5844..0bc381a 100644
+index 1a7d91d..f51bf92 100644
 --- a/test-suite/Makefile.am
 +++ b/test-suite/Makefile.am
 @@ -11,7 +11,7 @@ include $(top_srcdir)/src/Common.am
@@ -105,7 +105,7 @@ index 0da5844..0bc381a 100644
 +	/var/log/squid-stderr.log.next \
 +	/var/log/squid-stderr.log.unmatched
 diff --git a/test-suite/test-squid-conf.sh b/test-suite/test-squid-conf.sh
-index 413a927..f678c5a 100755
+index 7d88ea5..bb5d76f 100755
 --- a/test-suite/test-squid-conf.sh
 +++ b/test-suite/test-squid-conf.sh
 @@ -76,7 +76,7 @@ expectMessages()
@@ -124,5 +124,5 @@ index 413a927..f678c5a 100755
 -errorLog="squid-stderr.log"
 +errorLog="/var/log/squid-stderr.log"
  
- $sbindir/squid -k parse -f $configFile 2> $errorLog
- result=$?
+ # Start `$sbindir/squid` from $configFile's directory, so that Squid can find files included by $configFile.
+ # If we decide to support relative `$sbindir` paths, we will add a portable realpath replacement.
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
index f80d37de20..a4cb5f40ef 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From c0be3192f608037682464bcb728e97f9d9b543aa Mon Sep 17 00:00:00 2001
+From 19c82bff799611303f2985a2d317662b0529b24d Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Wed, 16 Oct 2013 16:41:03 -0400
 Subject: [PATCH] Set up for cross compilation
@@ -8,16 +8,14 @@ Message-Id: <17e5a28667f667859c48bee25e575a072d39ee1b.1381956170.git.Jim.Somervi
 Set the host compiler to BUILD_CXX so
 proper cross compilation can occur.
 
+Upstream-Status: Pending
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
-
 ---
-Upstream-Status: Pending
-
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index c7312d8..3b0e9e2 100644
+index cd7fbfd..850fdaf 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -29,6 +29,7 @@ m4_include([acinclude/lib-checks.m4])
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 39392e1cc7..66987e02e6 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -1,4 +1,4 @@
-From 050f8ab275a7a5f3d94045da6b15a2b63dfbeb3f Mon Sep 17 00:00:00 2001
+From 822fd6630617040a713df5eb876d68051a716a0f Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Tue, 14 Oct 2014 02:56:08 -0400
 Subject: [PATCH] Skip AC_RUN_IFELSE tests
@@ -10,13 +10,12 @@ environment.  Choose sane defaults.
 
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
- acinclude/lib-checks.m4 |  8 ++++++--
- 2 files changed, 15 insertions(+), 3 deletions(-)
+ acinclude/lib-checks.m4 | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
-index 9793b9a..4f2dc83 100644
+index 573ca17..f9c4666 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
 @@ -207,7 +207,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
index d57ebe7869..21439a1334 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From 3d881c112bba765731d581194aae95651819b715 Mon Sep 17 00:00:00 2001
+From 5ce613e9f0c4725aaa82d9a62f76c809e375fe49 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 19 Jul 2016 01:56:23 -0400
 Subject: [PATCH] squid: use serial-tests config needed by ptest
@@ -9,13 +9,12 @@ serial-tests is required to generate those targets.
 Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3b0e9e2..c730212 100644
+index 850fdaf..10968b3 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -10,7 +10,7 @@ AC_PREREQ(2.61)
diff --git a/meta-networking/recipes-daemons/squid/squid_7.6.bb b/meta-networking/recipes-daemons/squid/squid_7.7.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_7.6.bb
rename to meta-networking/recipes-daemons/squid/squid_7.7.bb
index 637d1f6942..b657197fd7 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.6.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992"
+SRC_URI[sha256sum] = "e3bd613b91b1c498ec2992276063342a85cd6edddd5521294e04f44bc055da9b"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://errors/COPYRIGHT;md5=41d117978dbffedc893e8eeca12537d0 \

