Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EEBCAC5B3
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ZcfCB0t+;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628681; x=1790164681;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EwmYD8ZwsHUfWuBKQSBXAGBDUwinbzBWy6payg37nmk=;
  b=ZcfCB0t+J/5aLJR4tI5dY/eO8yw6SmazmWjHMsvnUPDOwGTG8CCpp0uq
   XpzOrBQBoNxZjmZzCqX5gPFiFm5yiKzr4QaJxeusWqeNmOBLMbeFJIJyU
   sec2OVLz1BKgD3XDt8C/flLdBv8FBpeu1KL5ZilEc+z5QBmKFVlntFtt5
   eEGN7pgyuXHKuqC9XDmnAgOPpv5OKB3KJrJmMotsnBcYaJQFLEDb7VWty
   3bR8y6X0K0/Vn0XI0XZ2PWqHvlcTVOvh7qzJiXJnUvn8pQPNsi7vmmp7v
   35eiwK1ArWvP4zfWSTf0DCewhnK/Md1veDcsWQ+Fa25jOzTEORlgqeZBi
   w==;
X-CSE-ConnectionGUID: wsAWcpfDTpyUqVF/NAgHpg==
X-CSE-MsgGUID: LGFHoOqPSfmUYzabZEz3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821797"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:01 -0700
X-CSE-ConnectionGUID: MYh7J6jqQGm6Qsc8whQigA==
X-CSE-MsgGUID: DgDZ49xxSMCQ2zepxav04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875193"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:00 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 13/24] cjson 1.7.18: Fix CVE-2025-57052
Date: Tue, 23 Sep 2025 19:57:16 +0800
Message-ID: <d9e2cae64f4f7d7145c8389bc2406b5865d12893.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119702

From: Shubham Pushpkar <spushpka@cisco.com>

Upstream Repository: https://github.com/DaveGamble/cJSON.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57052
Type: Security Fix
CVE: CVE-2025-57052
Score: 9.8
Patch: https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../cjson/cjson/CVE-2025-57052.patch          | 33 +++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.18.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
new file mode 100644
index 0000000000..ed3d4a7eba
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
@@ -0,0 +1,33 @@
+From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
+From: Lee <peteralfredlee@gmail.com>
+Date: Fri, 5 Sep 2025 14:53:20 +0800
+Subject: [PATCH] fix the incorrect check in decode_array_index_from_pointer
+ (#957)
+
+this fixes CVE-2025-57052
+
+CVE: CVE-2025-57052
+Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa]
+
+(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ cJSON_Utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cJSON_Utils.c b/cJSON_Utils.c
+index 63651df..8fa24f8 100644
+--- a/cJSON_Utils.c
++++ b/cJSON_Utils.c
+@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(const unsigned char * const po
+         return 0;
+     }
+ 
+-    for (position = 0; (pointer[position] >= '0') && (pointer[0] <= '9'); position++)
++    for (position = 0; (pointer[position] >= '0') && (pointer[position] <= '9'); position++)
+     {
+         parsed_index = (10 * parsed_index) + (size_t)(pointer[position] - '0');
+ 
+-- 
+2.44.1
+
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index bdeab3055c..67d536cf24 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
+           file://CVE-2025-57052.patch \
          "
 SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 

