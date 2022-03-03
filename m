Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8682C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:59:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.9241.1646301562087852502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ksKQL7UN;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.126, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646301562; x=1677837562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FW3D6tpaOQv50EYLN1Mo9BJcC0LNNrgCzksklGRtKU4=;
  b=ksKQL7UNFDz7rVXvGwbyYfwKmN0FfbI85Y6pYXcK5nBKrQIYvGhkloQx
   5Sm0ytyEioxNJ3fEF2S1emTS2+oypbdi1t9OdVL4IgQuKJWpir8eUk7N7
   K3gmKi4suJkNLUQOVPtmj7kp3VBe22GYKzevZaBR52sQa/TR1/XfMAB/V
   NRHASj3mJdU6Y/w65rHzYpG6532ov4trgPMK+0Hu3aZtYkKKSEVMuQjSW
   qOROkvJAKAHlIEQMN18Kws2CHi1kBqq14GocsrqvPyL2CMugBkmnAe/3g
   qJHtLEzvyZq/AtzrkwHaeZ7gtzBQHeLavlPfVp0iZiqWWPIyNRO6it40C
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237143522"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400";
   d="scan'208";a="237143522"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:59:17 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400";
   d="scan'208";a="686450863"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 01:59:16 -0800
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-networking][PATCH 2/2] esmtp: fix libesmtp dependency check
Date: Thu,  3 Mar 2022 09:59:00 +0000
Message-Id: <20220303095900.2533635-3-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220303095900.2533635-1-jiaqing.zhao@linux.intel.com>
References: <20220303095900.2533635-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 09:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95736

Since libesmtp-1.1.0, libesmtp-config is removed, use pkg-config to
check for existence instead.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../0001-Fix-libESMTP-dependency-check.patch  | 44 +++++++++++++++++++
 .../recipes-support/esmtp/esmtp_1.2.bb        |  6 ++-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch

diff --git a/meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch b/meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch
new file mode 100644
index 000000000..92ac4b12b
--- /dev/null
+++ b/meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch
@@ -0,0 +1,44 @@
+From 63dbf8a9f04b34474021e8f0bf239b7446f10a7f Mon Sep 17 00:00:00 2001
+From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+Date: Thu, 3 Mar 2022 09:01:23 +0000
+Subject: [PATCH] Fix libESMTP dependency check
+
+Since libesmtp-1.1.0, libesmtp-config is removed, use pkg-config to
+check for existence instead.
+
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+---
+ configure.ac | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 64b19b4..83346a8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,6 +11,8 @@ AC_PROG_CC
+ 
+ AC_HEADER_STDC
+ 
++PKG_PROG_PKG_CONFIG
++
+ dnl getopt needs this
+ AC_C_CONST
+ 
+@@ -30,11 +32,11 @@ then
+ 	AC_CHECK_HEADER(libesmtp.h, ,[AC_MSG_ERROR([libesmtp.h not found in $with_libesmtp])])
+ fi    
+ AC_MSG_CHECKING(for libESMTP)
+-if libesmtp-config --version > /dev/null 2>&1
++if $PKG_CONFIG --exists 'libesmtp-1.0'
+ then
+ 	AC_MSG_RESULT(yes)
+-	CFLAGS="$CFLAGS `libesmtp-config --cflags`"
+-	LIBS="$LIBS `libesmtp-config --libs`"
++	CFLAGS="$CFLAGS `$PKG_CONFIG --cflags 'libesmtp-1.0'`"
++	LIBS="$LIBS `$PKG_CONFIG --libs 'libesmtp-1.0'`"
+ else
+ 	AC_MSG_RESULT(no)
+ 	AC_MSG_ERROR(libESMTP library not found)
+-- 
+2.32.0
+
diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
index 110399a36..be4cfe3e2 100644
--- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
+++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
@@ -11,12 +11,14 @@ DEPENDS = "libesmtp"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.bz2 \
+           file://0001-Fix-libESMTP-dependency-check.patch \
+           "
 
 # Have to set this or we get -L/lib in LDFLAGS
 EXTRA_OECONF = "--with-libesmtp=${STAGING_EXECPREFIXDIR}"
 
-inherit autotools update-alternatives
+inherit autotools update-alternatives pkgconfig
 
 ALTERNATIVE:${PN} = "sendmail mailq newaliases"
 # /usr/lib/sendmial is required by LSB core test
-- 
2.32.0


