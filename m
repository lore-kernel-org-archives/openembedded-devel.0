Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916F3C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 09:43:11 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.6762.1653039790622017002
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 May 2022 02:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GdqjHkpR;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.115, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653039790; x=1684575790;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V5Wtlqc1sfAqgA08CTPnfsbcYBM4dzThW2Y0IEmpBsE=;
  b=GdqjHkpRtbLLBrK5695CS3V8TEC3CAodl2toiMzGRr7fIosDv5KP8DLR
   uBAX8LGSiQgSFPhUiEonVaieF+QsIVJMUqL7EgZzp3lx20PM6tDrvbQaB
   81yQZI+c8OLlMFy09E2Yh+HDIL3tnPjsuViMyNItpuB4BKllhBZ0GbfGN
   bn3EbhqCojVkaJUI93C91aIJ5rEYSjy/7XhukEndXzI0Pm8/RejluT/js
   5iy+Vx8J1R5+qNC8mIzBnvxK651bAD0FHlTY9MSlNNHWPWz5dLtu1MqmO
   N6xcwM1Scm4YJtskNue4tAbhX+Tg2omUCRD6y3nLZJ/QWEz1ZEs3N8FIs
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272682475"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600";
   d="scan'208";a="272682475"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 02:43:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600";
   d="scan'208";a="599130394"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 02:43:08 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-oe] [PATCH] openldap: Remove unnecessary use-urandom.patch
Date: Fri, 20 May 2022 17:42:57 +0800
Message-Id: <20220520094257.2906304-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 May 2022 09:43:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97211

use-urandom.patch sets URANDOM_DEVICE to /dev/urandom when cross
compiling, but the same value is also defined in the recipe's compile
flags. This patch removes that unnecessary patch and resolves the
redefinition warning.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../openldap/openldap/use-urandom.patch       | 35 -------------------
 .../openldap/openldap_2.5.12.bb               |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/use-urandom.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
deleted file mode 100644
index 0b7e3a28a..000000000
--- a/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-openldap: assume /dev/urandom exists
-
-When we are cross-compiling, we want to assume
-that /dev/urandom exists.  We could change the source
-code to look for it, but this is the easy way out.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -2117,6 +2117,7 @@ AC_SUBST(systemdsystemunitdir)
- 
- dnl ----------------------------------------------------------------
- dnl Check for entropy sources
-+dev=no
- if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
- 	dev=no
- 	if test -r /dev/urandom ; then
-@@ -2131,9 +2132,11 @@ if test $cross_compiling != yes && test "$ac_cv_mingw32" != yes ; then
- 		dev="/idev/random";
- 	fi
- 
--	if test $dev != no ; then
--		AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
--	fi
-+elif test $cross_compiling == yes ; then
-+       dev="/dev/urandom";
-+fi
-+if test $dev != no ; then
-+	AC_DEFINE_UNQUOTED(URANDOM_DEVICE,"$dev",[set to urandom device])
- fi
- 
- dnl ----------------------------------------------------------------
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
index e4475e506..a0ca2b5d3 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
@@ -15,7 +15,6 @@ SECTION = "libs"
 LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
-    file://use-urandom.patch \
     file://initscript \
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
-- 
2.34.1


