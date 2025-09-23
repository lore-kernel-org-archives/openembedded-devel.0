Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E414CAC5B3
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OlA4+FhB;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628669; x=1790164669;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QBk1K7H2xV87CbfJAQT0tm8edZxJfqIVl1BU6enHiso=;
  b=OlA4+FhBh+RTA/DpkmHQiguRMHQZvZe3q4vRse9qvUcPOtcZlQunDr7I
   SxaHEZtc3e9wKkCoBBq8XFtV+eTKn5d8AUIn1t/QabGpX5H/GV7XOVPUG
   G0dzFa112O+Hxx7lkmc4w2VSqi4pbp2cyJP+KOfgDpRjO87jMYj/SxZ3N
   NQlosQ3hG2rGi38eNKuTRcph98ezIa/XY3lcvCMNlxdEHl1uCYMqrNdwZ
   Ul0+2TLOeXg4YZmQB+HIV05e9G5eeqTDBIB8Bh5gabVAWyryojzxv2Aia
   01YYQ9et8x79hXgwqWX24YJ7ah8gj3LLLjrD1rjv9bNeVLa1V2ZqInQY6
   Q==;
X-CSE-ConnectionGUID: EaqsVweAQ+a3nnjnwddDuw==
X-CSE-MsgGUID: EYrO1ph1SLer8KL0EKJCMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821780"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:49 -0700
X-CSE-ConnectionGUID: rgP8a1hpTIit3cRQGlE0ZQ==
X-CSE-MsgGUID: Z6JMeDiWRFiPp48jPuOR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875129"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:48 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 05/24] python3-posix-ipc: fix runtime error
Date: Tue, 23 Sep 2025 19:57:08 +0800
Message-ID: <40db628f58f6d786bbc24cf8438c17f223eb65d7.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119694

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix follow runtime error: ./build_support/src/sniff_mq_prio_max:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by
./build_support/src/sniff_mq_prio_max)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ndle-runtime-errors-and-return-None-.patch | 47 +++++++++++++++++++
 .../python/python3-posix-ipc_1.2.0.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
new file mode 100644
index 0000000000..e84345a397
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
@@ -0,0 +1,47 @@
+From b079074048bc33b206b21f73fecb8173cf8adaf0 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Mon, 15 Sep 2025 21:15:45 +0800
+Subject: [PATCH] build_support: handle runtime errors and return None for
+ invalid max_priority
+
+When cross-compiling, test binaries may fail to execute on the host system if
+the target toolchain was built against a newer glibc version than what is
+available on the host.
+
+For example, on Ubuntu 20.04 the following error occurs:
+
+./build_support/src/sniff_mq_prio_max: /lib/x86_64-linux-gnu/libc.so.6: version
+`GLIBC_2.34' not found (required by ./build_support/src/sniff_mq_prio_max)
+
+This change ensures that such runtime errors are gracefully handled, and
+max_priority is set to None when the test binary cannot be executed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ build_support/discover_system_info.py | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index f6e6c8cbe6ba..4fec48b5529d 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -75,8 +75,12 @@ def compile_and_run(filename, linker_options=""):
+     if does_build_succeed(filename, linker_options=""):
+         try:
+             s = subprocess.Popen(["./build_support/src/%s" % filename[:-2]],
+-                                 stdout=subprocess.PIPE).communicate()[0]
+-            return s.strip().decode()
++                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
++            stdout, stderr = s.communicate()
++            if s.returncode != 0:
++                # runtime error
++                return None
++            return stdout.strip().decode()
+         except Exception:
+             # execution resulted in an error
+             return None
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index 8147e4108b..cad1403813 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -12,5 +12,6 @@ SRC_URI += " \
     file://0001-build_support-use-source-filename-instead-of-foo-for.patch \
     file://0002-build_support-handle-empty-max_priority-value-as-Non.patch \
     file://0003-build_support-use-does_build_succeed-in-compile_and_.patch \
+    file://0004-build_support-handle-runtime-errors-and-return-None-.patch \
 "
 inherit pypi python_setuptools_build_meta

