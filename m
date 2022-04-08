Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A20C3A59E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.607.1649379534078246345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=i7N2lhnD;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649379534; x=1680915534;
  h=from:to:subject:date:message-id;
  bh=EZcic7ZeDQ3GlW23rXoYN6y/kgPhBRWEEiTb2G1yuEk=;
  b=i7N2lhnDlrubAOgTEkfvftMf3wu3ilINQoUe8NJK8w4zinY132rhrA0P
   o3MrEfXntXNkUj3NU5P7jVejFPR5xCwHoKlpmePncb4FCDu9ZMCvDyDEH
   PSqK/e3tt4YbyXhbk6r7vGV4rzUymqfSSZ72l+Z5By5811VLhSPxObIfp
   PwTZYir4Bg6KhUd/tjrhPz5FuJ6fUd53UtRvB4UFJM5dQCLS6UJ8xuDGL
   icFL7zgcX6+CJkJ70Zq7EUfPKCR3h5NH3zDHm+B/SHI5dxZCRZ7WhqasF
   srDf0P3l5280tBofI1kLl4PMKh4eHwcQf8T/U1OiidWo7yjMGt3r3+wQW
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261170514"
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400";
   d="scan'208";a="261170514"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 17:58:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400";
   d="scan'208";a="550307447"
Received: from saininav-desk1.png.intel.com ([10.158.87.77])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 17:58:52 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ndctl: fix build failure with EXEWRAPPER_ENABLED
 False
Date: Fri,  8 Apr 2022 09:16:34 +0800
Message-Id: <20220408011634.27385-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96468

The v73 version tries to build and run a test program at compile
time to check whether compiler supports sizeof and expression statements
and sets HAVE_STATEMENT_EXPR accordingly. This requires EXEWRAPPER_ENABLED
in meson.bbclass to be True and qemu-usermode to be working.

In cases when EXEWRAPPER_ENABLED is False, build fails with error:

| ../git/meson.build:213:0: ERROR: Can not run test applications in
this cross environment.

We don't really need to do this as these have been supported since gcc3 and can set the configs to 1.

The autotools implementation also used to set it to 1 so this doesn't change anything:

https://github.com/pmem/ndctl/blob/v72.1/configure.ac#L70

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ...01-build-set-HAVE_STATEMENT_EXPR-var.patch | 60 +++++++++++++++++++
 meta-oe/recipes-core/ndctl/ndctl_v73.bb       |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch

diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch
new file mode 100644
index 000000000..486d6c07b
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch
@@ -0,0 +1,60 @@
+From b06d16ec2d4aefc4cf1675e9dd6314956bc32d69 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Thu, 7 Apr 2022 14:36:58 +0800
+Subject: [PATCH] build: set HAVE_STATEMENT_EXPR var
+
+The v73 version tries to build and run a test program at compile
+time to check whether compiler supports sizeof and expression statements
+and sets HAVE_STATEMENT_EXPR accordingly. This requires EXEWRAPPER_ENABLED
+in meson.bbclass to be True and qemu-usermode to be working.
+
+In cases when EXEWRAPPER_ENABLED is False, build fails with error:
+
+| ../git/meson.build:213:0: ERROR: Can not run test applications in
+this cross environment.
+
+We don't really need to do this as these have been supported since gcc3 and can set the configs to 1.
+
+The autotools implementation also used to set it to 1 so this doesn't change anything:
+
+https://github.com/pmem/ndctl/blob/v72.1/configure.ac#L70
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ meson.build | 18 ++----------------
+ 1 file changed, 2 insertions(+), 16 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 42e11aa..e8d218b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -210,22 +210,8 @@ conf.set('ENABLE_DESTRUCTIVE', get_option('destructive').enabled())
+ conf.set('ENABLE_LOGGING', get_option('logging').enabled())
+ conf.set('ENABLE_DEBUG', get_option('dbg').enabled())
+ 
+-typeof = cc.run('''
+-  int main() {
+-    struct {
+-      char a[16];
+-    } x;
+-    typeof(x) y;
+-
+-    return sizeof(x) == sizeof(y);
+-  }
+-  '''
+-)
+-
+-if typeof.compiled() and typeof.returncode() == 1
+-  conf.set('HAVE_TYPEOF', 1)
+-  conf.set('HAVE_STATEMENT_EXPR', 1)
+-endif
++conf.set('HAVE_TYPEOF', 1)
++conf.set('HAVE_STATEMENT_EXPR', 1)
+ 
+ if target_machine.endian() == 'big'
+   conf.set('HAVE_BIG_ENDIAN', 1)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v73.bb b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
index c88d39297..da649d578 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v73.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v73.bb
@@ -13,7 +13,8 @@ inherit meson pkgconfig bash-completion systemd
 SRCREV = "dd58d43458943d20ff063850670bf54a5242c9c5"
 SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
            file://0001-util-Correct-path-to-iniparser.h.patch \
-           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch"
+           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch \
+           file://0001-build-set-HAVE_STATEMENT_EXPR-var.patch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
 
-- 
2.17.1


