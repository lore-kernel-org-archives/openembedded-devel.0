Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5F9C433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 09:33:25 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.8956.1651743197689064474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 02:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2459XEZI026428
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 5 May 2022 02:33:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2459XAwl014848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 5 May 2022 02:33:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 5 May 2022 02:33:10 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 5 May 2022 02:33:09 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] s-nail: Set VAL_MTA
Date: Thu, 5 May 2022 17:33:08 +0800
Message-ID: <20220505093308.824156-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 09:33:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96959

From: Mingli Yu <mingli.yu@windriver.com>

Some build server may provide sendmail like /usr/lib/sendmail which
may result the VAL_MTA to be /usr/lib/sendmail during do_configure,
but the sendmail is actually /usr/sbin/sendmail on the target.

Fixes:
  # echo "invalide address email" | s-nail -s "test mail" -r test@test.com tester@test.com
  s-nail: Cannot start /usr/lib/sendmail: executable not found (adjust *mta* variable)
  /home/root/dead.letter 10/234
  s-nail: ... message not sent

  # which sendmail
  /usr/sbin/sendmail

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-make.rc-set-VAL_MTA.patch      | 48 +++++++++++++++++++
 .../recipes-extended/s-nail/s-nail_14.9.24.bb |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch

diff --git a/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
new file mode 100644
index 000000000..f4decda14
--- /dev/null
+++ b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
@@ -0,0 +1,48 @@
+From da8c7a027390de7828d4272a3c8bcdbffbac25ad Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 5 May 2022 16:57:48 +0800
+Subject: [PATCH] make.rc: set VAL_MTA
+
+Some build server may provide sendmail like /usr/lib/sendmail which
+may result the VAL_MTA to be /usr/lib/sendmail, but the sendmail
+is actually /usr/sbin/sendmail on the target.
+
+Fixes:
+  # echo "invalide address email" | s-nail -s "test mail" -r test@test.com tester@test.com
+  s-nail: Cannot start /usr/lib/sendmail: executable not found (adjust *mta* variable)
+  /home/root/dead.letter 10/234
+  s-nail: ... message not sent
+
+  # which sendmail
+  /usr/sbin/sendmail
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ make.rc | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/make.rc b/make.rc
+index 98bd968..45ac0d4 100644
+--- a/make.rc
++++ b/make.rc
+@@ -96,14 +96,7 @@ VAL_MAIL=`\
+ 
+ # Path to the local MTA (Mail-Transfer-Agent).
+ # MTA aliases (aliases(5)) are optionally supported via OPT_MTA_ALIASES.
+-VAL_MTA=`\
+-   if [ -x /usr/bin/sendmail ]; then \
+-      echo /usr/bin/sendmail;\
+-   elif [ -x /usr/lib/sendmail ]; then \
+-      echo /usr/lib/sendmail;\
+-   else \
+-      echo /usr/sbin/sendmail;\
+-   fi`
++VAL_MTA=/usr/sbin/sendmail
+ 
+ # Today a lot of systems no longer use sendmail(1), but a different MTA.
+ # To ensure compatibility with sendmail(1), a system called
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
index bc514b577..539f9c3c8 100644
--- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
@@ -6,7 +6,8 @@ LICENSE = "ISC & BSD-3-Clause & BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87266591c81260f10221f1f38872d023"
 
 SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
-           file://make-errors.patch"
+           file://make-errors.patch \
+           file://0001-make.rc-set-VAL_MTA.patch"
 SRC_URI[sha256sum] = "2714d6b8fb2af3b363fc7c79b76d058753716345d1b6ebcd8870ecd0e4f7ef8c"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


