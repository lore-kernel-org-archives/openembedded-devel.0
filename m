Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9E3CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gLWjP+Ta;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628685; x=1790164685;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iIaE+y7ahxWr49CjHv2uqZd3zVEc+rukL2neS4t9TVk=;
  b=gLWjP+Ta2Ze8x5Keg+maOb1lFBCPhlnc54bd+VyO/AXff/eP/s42xJ0F
   GsaFogXZb89Vu6k36PI0NuWudkdqAJOHKqj4SpWqSHlA/3E28u9SAp01t
   GW25J8mxjtvBU1W8FUiwtgsNtOWxYfuJo/OG2A26Lr8s/RZEIBLiqFEMn
   abgwck6tmmyzmOBQkKXnRI7pHUIRytrgjYA+9Kabc79Wz9cCNZs/krAZl
   OBuutJwfsxDKLoZMf6zxOVsr4fAja0CaV/iREuY70kBpHcg/n1XLoQ1MO
   l8BedIgZ82TzcuDCxFk6j4nFWpOEoI4Xg5JnpOJdFG6u5n9H3SIBmQ4hQ
   A==;
X-CSE-ConnectionGUID: D1NcZiN+Qhiu+UFIdFxEsA==
X-CSE-MsgGUID: Wn41eiCpTou0kqI8NGUhdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821807"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821807"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:05 -0700
X-CSE-ConnectionGUID: aHHBbF5tRJmIa4bY5hpHlw==
X-CSE-MsgGUID: aAMyh3xgSkG4r3cTIfiuMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875224"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:04 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 16/24] fcgi: patch CVE-2025-23016
Date: Tue, 23 Sep 2025 19:57:19 +0800
Message-ID: <239223765568106604945dfd029b782f4d85200c.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119705

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 6e86e0dd54e1ca7459f3e1afebf24f5437d8b586)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../fcgi/fcgi/CVE-2025-23016.patch            | 40 +++++++++++++++++++
 .../recipes-support/fcgi/fcgi_git.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch

diff --git a/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch b/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch
new file mode 100644
index 0000000000..b763d7651c
--- /dev/null
+++ b/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch
@@ -0,0 +1,40 @@
+From b0eabcaf4d4f371514891a52115c746815c2ff15 Mon Sep 17 00:00:00 2001
+From: Pycatchown <39068868+Pycatchown@users.noreply.github.com>
+Date: Tue, 8 Apr 2025 17:39:30 +0200
+Subject: [PATCH] Update fcgiapp.c
+
+Fixing an integer overflow (CVE-2025-23016)
+
+CVE: CVE-2025-23016
+Upstream-Status: Backport [https://github.com/FastCGI-Archives/fcgi2/commit/b0eabcaf4d4f371514891a52115c746815c2ff15]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libfcgi/fcgiapp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libfcgi/fcgiapp.c b/libfcgi/fcgiapp.c
+index 4ffe318..99c3630 100644
+--- a/libfcgi/fcgiapp.c
++++ b/libfcgi/fcgiapp.c
+@@ -1173,6 +1173,10 @@ static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
+ 	    }
+             nameLen = ((nameLen & 0x7f) << 24) + (lenBuff[0] << 16)
+                     + (lenBuff[1] << 8) + lenBuff[2];
++	    if (nameLen >= INT_MAX) {
++                SetError(stream, FCGX_PARAMS_ERROR);
++                return -1;
++	    }
+         }
+         if((valueLen = FCGX_GetChar(stream)) == EOF) {
+             SetError(stream, FCGX_PARAMS_ERROR);
+@@ -1185,6 +1189,10 @@ static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
+ 	    }
+             valueLen = ((valueLen & 0x7f) << 24) + (lenBuff[0] << 16)
+                     + (lenBuff[1] << 8) + lenBuff[2];
++	    if (valueLen >= INT_MAX) {
++                SetError(stream, FCGX_PARAMS_ERROR);
++                return -1;
++	    }
+         }
+         /*
+          * nameLen and valueLen are now valid; read the name and value
diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
index 61ef6073e0..d327d435d5 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -7,6 +7,7 @@ SRCREV = "382aa2b0d53a87c27f2f647dfaf670375ba0b85f"
 PV = "2.4.2"
 
 SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master \
+           file://CVE-2025-23016.patch \
           "
 
 S = "${WORKDIR}/git"

