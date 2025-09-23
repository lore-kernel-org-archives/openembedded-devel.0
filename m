Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66174CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=R+jpHSKM;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628667; x=1790164667;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Udz5wXcaohqfl7g4PeO94kt5kpp7+xugAGyd6ke9NeA=;
  b=R+jpHSKMaaW7I+DfEwoozk079Ee+tztOaINJFvmuxJd87iUJBoesdUe5
   +KpLXGHKZrUhGMNEp5eWL3w5ENBG+YLldR4tqNBHtYZKzOlcuPhhOAAE5
   O/rIeLjmYlbKirdJUhkFXHoaOdzi6RCDMPlQPMyiBPI5yLzR4HrB1k4iX
   TeWeblQHrVfeEwffCdeNZ8jUCLpBmyH2um6KTUofOnF5i55cQsPc3BdHL
   38ShKg1LY9leTXcRYQEsWI6MyQFVMH0tZ5W9O9z72BNSpJP7NmMvC8lrW
   YuCVyTf1g0iZhMwrdfWMxVCfU8T9CY9HEnbBeYC+nmqy1A1PECyQEcIIl
   w==;
X-CSE-ConnectionGUID: UfqEluUZSW6R3rDxAw/2lg==
X-CSE-MsgGUID: C4wjJghjR9GJzXf7zI/E9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821779"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:47 -0700
X-CSE-ConnectionGUID: 6OdYiceUQ/GS9LC5KCnJyg==
X-CSE-MsgGUID: FSbYLiLfTE+WrcGKzmakGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875128"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:46 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 04/24] iperf3: fix CVE-2025-54350
Date: Tue, 23 Sep 2025 19:57:07 +0800
Message-ID: <92730597e96a9fc49d6dd7ea3936947127a97bb8.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119693

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-54350:
In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion
failure and application exit upon a malformed authentication attempt.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-54350]

Upstream patches:
[https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 39 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
new file mode 100644
index 0000000000..e6de0e810c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
@@ -0,0 +1,39 @@
+From 4cd6c8e85376a33bddd01fac143e27436d41f2b9 Mon Sep 17 00:00:00 2001
+From: "Bruce A. Mah" <bmah@es.net>
+Date: Tue, 24 Jun 2025 15:58:21 -0700
+Subject: [PATCH] Prevent crash due to assertion failures on malformed
+ authentication attempt.
+
+Reported by Han Lee (Apple Information Security)
+CVE-2025-54350
+
+CVE: CVE-2025-54350
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/iperf_auth.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 86b4eba..632f03d 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -152,7 +151,6 @@ int Base64Decode(const char* b64message, unsigned char** buffer, size_t* length)
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index e96d5f084b..7fb2c52d08 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://CVE-2025-54349.patch \
+           file://CVE-2025-54350.patch \
           "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"

