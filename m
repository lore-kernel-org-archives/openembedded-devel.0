Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EF6C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 08:39:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.10476.1677746342213244462
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 00:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=acvda7Un;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677746342; x=1709282342;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UKdoCFwX5jTbZGODlHw/gPO76qdyi7KxrAimGUjRWxs=;
  b=acvda7Un9/TWWcKDsDxSarHo3LbcOw21TMX8Qugt8P31Qr4azE8B449S
   85Dd7OyZEQCEzJ9R2CBvGT47vtmi/j8BKSO8soj4WFUG+hCm1c87+fOkV
   i0c5wMdA96H7v8GtvkO3O4mfqKOFn5PoWpM9hEHm2aHofPj4y26VTaLH9
   xjZ5dcjN46Uz/Jd+oWlTFbqIYB/auYuPJaBnYHa9eMyk4qnVQ6DUHHII7
   xq+D1WJnc276pPo1U4IWKrbCQw4NFF0vHZZFJpyRZSwbUMgCBI8EEXF5s
   Lez8q0HFOJQG7wmoCvHPn2Wd735vKlC7Gsjhgy2scUH1qLCzq5pimmTq/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="322935872"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="322935872"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 00:39:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="763917145"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="763917145"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2023 00:39:00 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][patch] cifs-utils: fix CVE-2022-27239 CVE-2022-29869
Date: Thu,  2 Mar 2023 16:38:51 +0800
Message-Id: <20230302083851.169976-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 08:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101332

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../recipes-support/cifs/cifs-utils_6.14.bb   |  5 +-
 .../cifs/files/CVE-2022-27239.patch           | 40 ++++++++++++++++
 .../cifs/files/CVE-2022-29869.patch           | 48 +++++++++++++++++++
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
 create mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
index d4cdda0f81..516e467ee4 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
@@ -5,7 +5,10 @@ LICENSE = "GPL-3.0-only & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "8c06dce7d596e478c20bc54bdcec87ad97f80a1b"
-SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master"
+SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master \
+           file://CVE-2022-27239.patch \
+           file://CVE-2022-29869.patch \
+"
 
 S = "${WORKDIR}/git"
 DEPENDS += "libtalloc"
diff --git a/meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch b/meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
new file mode 100644
index 0000000000..77f6745abe
--- /dev/null
+++ b/meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
@@ -0,0 +1,40 @@
+From 007c07fd91b6d42f8bd45187cf78ebb06801139d Mon Sep 17 00:00:00 2001
+From: Jeffrey Bencteux <jbe@improsec.com>
+Date: Thu, 17 Mar 2022 12:58:52 -0400
+Subject: [PATCH] CVE-2022-27239: mount.cifs: fix length check for ip option
+ parsing
+
+Previous check was true whatever the length of the input string was,
+leading to a buffer overflow in the subsequent strcpy call.
+
+Bug: https://bugzilla.samba.org/show_bug.cgi?id=15025
+
+Signed-off-by: Jeffrey Bencteux <jbe@improsec.com>
+Reviewed-by: David Disseldorp <ddiss@suse.de>
+
+Upstream-Status: Backport [ https://git.samba.org/?p=cifs-utils.git;a=commit;h=007c07fd91b6d42f8bd45187cf78ebb06801139d]
+CVE: CVE-2022-27239
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ mount.cifs.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/mount.cifs.c b/mount.cifs.c
+index 84274c9..3a6b449 100644
+--- a/mount.cifs.c
++++ b/mount.cifs.c
+@@ -926,9 +926,10 @@ parse_options(const char *data, struct parsed_mount_info *parsed_info)
+ 			if (!value || !*value) {
+ 				fprintf(stderr,
+ 					"target ip address argument missing\n");
+-			} else if (strnlen(value, MAX_ADDRESS_LEN) <=
++			} else if (strnlen(value, MAX_ADDRESS_LEN) <
+ 				MAX_ADDRESS_LEN) {
+-				strcpy(parsed_info->addrlist, value);
++				strlcpy(parsed_info->addrlist, value,
++					MAX_ADDRESS_LEN);
+ 				if (parsed_info->verboseflag)
+ 					fprintf(stderr,
+ 						"ip address %s override specified\n",
+-- 
+2.34.1
diff --git a/meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch b/meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch
new file mode 100644
index 0000000000..f0c3f37dec
--- /dev/null
+++ b/meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch
@@ -0,0 +1,48 @@
+From 8acc963a2e7e9d63fe1f2e7f73f5a03f83d9c379 Mon Sep 17 00:00:00 2001
+From: Jeffrey Bencteux <jbe@improsec.com>
+Date: Sat, 19 Mar 2022 13:41:15 -0400
+Subject: [PATCH] mount.cifs: fix verbose messages on option parsing
+
+When verbose logging is enabled, invalid credentials file lines may be
+dumped to stderr. This may lead to information disclosure in particular
+conditions when the credentials file given is sensitive and contains '='
+signs.
+
+Bug: https://bugzilla.samba.org/show_bug.cgi?id=15026
+
+Signed-off-by: Jeffrey Bencteux <jbe@improsec.com>
+Reviewed-by: David Disseldorp <ddiss@suse.de>
+
+Upstream-Status: Backport [https://git.samba.org/?p=cifs-utils.git;a=commit;h=8acc963a2e7e9d63fe1f2e7f73f5a03f83d9c379]
+CVE: CVE-2022-29869
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ mount.cifs.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/mount.cifs.c b/mount.cifs.c
+index 3a6b449..2278995 100644
+--- a/mount.cifs.c
++++ b/mount.cifs.c
+@@ -628,17 +628,13 @@ static int open_cred_file(char *file_name,
+ 				goto return_i;
+ 			break;
+ 		case CRED_DOM:
+-			if (parsed_info->verboseflag)
+-				fprintf(stderr, "domain=%s\n",
+-					temp_val);
+ 			strlcpy(parsed_info->domain, temp_val,
+ 				sizeof(parsed_info->domain));
+ 			break;
+ 		case CRED_UNPARSEABLE:
+ 			if (parsed_info->verboseflag)
+ 				fprintf(stderr, "Credential formatted "
+-					"incorrectly: %s\n",
+-					temp_val ? temp_val : "(null)");
++					"incorrectly\n");
+ 			break;
+ 		}
+ 	}
+-- 
+2.34.1
+
-- 
2.37.3


