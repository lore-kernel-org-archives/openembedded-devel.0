Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEA2C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 10:18:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.8071.1651141118997457868
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 03:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hCZq/N/n;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.100, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651141119; x=1682677119;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QmpDI5lkINjaASzXGYaDMrKYlewW5W6ekIDym6q9YFY=;
  b=hCZq/N/n30hGDGIgn4kuDFfDwrGqhmKVhRNM9GJgFaC7SO5zTH1K1QBa
   +eWb+xju0Qd0OdaPP1+IBVnaIGRmEX1GAdF/6r2h9Ha/dgInt/4bJJjJG
   nDS4TELCMwDIi+dZRgxLMXQJ4RbFHI6qJhw2vYfZXZ3x9bbJFDf2CUIRa
   brhX74hmjFdf3QcCzAPYYBE5jQYvRSeMZNPvXqI1gPYZm7ciZldaDAqVM
   GDgfddqT5W3QpiUELUSH3ZFLXdKuixhWBKN/MJ/mXWbLPoGL6JY9HCJ6N
   mmHtKChbnV8JdvyPQ69YtzYrJlFbM9r+LnwlHChJMS4BnUbRe7aNTgEnc
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="329180592"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400";
   d="scan'208";a="329180592"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 03:18:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400";
   d="scan'208";a="559588361"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 03:18:37 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-networking] [PATCH] libesmtp: Disable NTLM support by default
Date: Thu, 28 Apr 2022 18:18:03 +0800
Message-Id: <20220428101803.2347766-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 10:18:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96839

NTLM authentication uses MD4 algorithm which is considered to be
insecure, and some modern systems may drop MD4 support. This patch
adds an 'ntlm' option to this feature, which is disabled by default.

Upstream-Status: Accepted [https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d]
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...01-Add-build-option-for-NTLM-support.patch | 85 +++++++++++++++++++
 .../libesmtp/libesmtp_1.1.0.bb                |  4 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
new file mode 100644
index 000000000..64938a482
--- /dev/null
+++ b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Add-build-option-for-NTLM-support.patch
@@ -0,0 +1,85 @@
+From 1c304e7886a08fb56485e41614ff3f8685afb59d Mon Sep 17 00:00:00 2001
+From: Jiaqing Zhao <jiaqing.zhao@intel.com>
+Date: Tue, 8 Mar 2022 15:05:32 +0000
+Subject: [PATCH] Add build option for NTLM support
+
+Currently, NTLM plugin is built by default when openssl is available
+and STARTTLS is enabled. But in libesmtp 1.0.6, there is a separate
+build option. This commits adds the 'ntlm' option back. It's also
+disabled by default.
+
+Like 1.0.6, it will check openssl MD4 algorithm support as MD4 is
+insecure and modern systems may drop MD4 support.
+
+Upstream-Status: Accepted [https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685afb59d]
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@intel.com>
+---
+ meson.build       | 13 ++++++++++---
+ meson_options.txt |  1 +
+ ntlm/meson.build  |  2 +-
+ 3 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 11d6ed8..d2a0e06 100644
+--- a/meson.build
++++ b/meson.build
+@@ -61,6 +61,7 @@ add_project_arguments(cc.get_supported_arguments(cflags), language: 'c')
+ ################################################################################
+ dldep = cc.find_library('dl')
+ ssldep = dependency('openssl', version : '>=1.1.0', required : get_option('tls'))
++ntlmdep = dependency('openssl', version : '>=1.1.0', required : get_option('ntlm'))
+ threaddep = dependency('threads', required : get_option('pthreads'))
+ 
+ #XXX add test for libbind9.so
+@@ -69,6 +70,7 @@ lwresdep = cc.find_library('lwres', required : get_option('lwres'))
+ deps = [
+   dldep,
+   ssldep,
++  ntlmdep,
+   threaddep,
+   lwresdep,
+ ]
+@@ -237,8 +239,12 @@ include_dir = include_directories('.')
+ subdir('login')
+ subdir('plain')
+ subdir('crammd5')
+-if ssldep.found()
+-  subdir('ntlm')
++if ntlmdep.found()
++  if cc.has_header('openssl/md4.h') and cc.has_function('MD4_Init', dependencies : ntlmdep)
++    subdir('ntlm')
++  else
++    error('MD4 is not supported in current openssl, unable to build NTLM plugin')
++  endif
+ endif
+ 
+ ################################################################################
+@@ -264,4 +270,5 @@ summary({'current:revision:age': libesmtp_cra,
+ 	 'STARTTLS': ssldep.found(),
+ 	 'CHUNKING': get_option('bdat'),
+ 	 'ETRN': get_option('etrn'),
+-	 'XUSR': get_option('xusr')})
++	 'XUSR': get_option('xusr'),
++	 'NTLM': ntlmdep.found()})
+diff --git a/meson_options.txt b/meson_options.txt
+index 8375e2c..158f38f 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -5,3 +5,4 @@ option('lwres', type : 'feature', value : 'disabled', description : 'use lwres l
+ option('bdat', type : 'boolean', value : 'true', description : 'enable SMTP BDAT extension')
+ option('etrn', type : 'boolean', value : 'true', description : 'enable SMTP ETRN extension')
+ option('xusr', type : 'boolean', value : 'true', description : 'enable sendmail XUSR extension')
++option('ntlm', type : 'feature', value : 'disabled', description : 'build with support for NTLM authentication')
+diff --git a/ntlm/meson.build b/ntlm/meson.build
+index e0eef58..11d7f58 100644
+--- a/ntlm/meson.build
++++ b/ntlm/meson.build
+@@ -5,7 +5,7 @@ sasl_ntlm_sources = [
+   'ntlmstruct.c',
+ ]
+ 
+-ntlm_deps = [ ssldep, ]
++ntlm_deps = [ ntlmdep, ]
+ 
+ sasl_ntlm = shared_module('ntlm', sasl_ntlm_sources,
+ 			  name_prefix : 'sasl-',
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index 231c57260..bf1a12d48 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -8,7 +8,8 @@ SECTION = "libs"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/libesmtp/libESMTP.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/libesmtp/libESMTP.git;branch=master;protocol=https \
+           file://0001-Add-build-option-for-NTLM-support.patch"
 SRCREV = "1d0af244310a66943ab400be56b15a9087f181eb"
 
 S = "${WORKDIR}/git"
@@ -26,6 +27,7 @@ EXTRA_OEMESON = " \
     -Dbdat=true \
     -Detrn=true \
     -Dxusr=true \
+    -Dntlm=disabled \
 "
 
 FILES:${PN} = "${libdir}/lib*${SOLIBS} \
-- 
2.34.1


