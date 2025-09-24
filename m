Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB54CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PMN7Dm/s;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686374; x=1790222374;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EQhBrqnGVS0XfWKwCrCFJEaqrIAdpSv20p9INm3R93Y=;
  b=PMN7Dm/sC1NOoYpmtSJRJBr8vpD8h6KGAwMuN+uIfTpCf+/QzmWLM7Ce
   zQZ/wOVdS+oYI5EWVZY46RrFSpcQ+oo7af08xv7XiRnxLrggT8d0Zp51L
   7LN3U2+5gP+RXfyYFFGvvA+5iaGbBEufzyI7I1g6xMMlXFy+/iQD7NCIQ
   VwtrtGrOcIjeOtx3R0rZmwwIrzPjUgxk74R6dQKJba93jgLTZDNQopKQS
   OXic27cScBVPs/8bkJKf+lAtni+esyfbm25QyjOHd13Cb/O83NOmTQDvR
   1ynC1N4OWr5MbccEES7Ex6+XAOr+N66I3uaayIyhLvfiRN2YZ4YCYvPhP
   g==;
X-CSE-ConnectionGUID: JEqKSq4ETSugLZ/sFGwpCA==
X-CSE-MsgGUID: +mIF4sg9TKeywY7wCB+2kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602894"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602894"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:34 -0700
X-CSE-ConnectionGUID: 7gjiN9O5TkmlpxGT8cqvPg==
X-CSE-MsgGUID: eRvJDK6rRbWEiVpSrBvzDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873679"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 6/8] procmail: patch CVE-2017-16844.
Date: Wed, 24 Sep 2025 11:59:21 +0800
Message-ID: <20250924035923.35477-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035923.35477-1-anuj.mittal@intel.com>
References: <20250924035923.35477-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119746

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-26%2Bdeb10u1/debian/patches/30

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3d97f4c13d5f5810659e107f6461f0b63f6fa92a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../procmail/procmail/CVE-2017-16844.patch    | 20 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
new file mode 100644
index 0000000000..6e04989c33
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
@@ -0,0 +1,20 @@
+From: Santiago Vila <sanvila@debian.org>
+Subject: Fix heap-based buffer overflow in loadbuf()
+Bug-Debian: http://bugs.debian.org/876511
+X-Debian-version: 3.22-26
+
+CVE: CVE-2017-16844
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -103,7 +103,7 @@
+ }
+ 							    /* append to buf */
+ void loadbuf(text,len)const char*const text;const size_t len;
+-{ if(buffilled+len>buflen)			  /* buf can't hold the text */
++{ while(buffilled+len>buflen)			  /* buf can't hold the text */
+      buf=realloc(buf,buflen+=Bsize);
+   tmemmove(buf+buffilled,text,len);buffilled+=len;
+ }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 4806bf5f80..16fcf84dad 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-man-file.patch \
     file://man-file-mailstat.1-from-debian.patch \
     file://CVE-2014-3618.patch \
+    file://CVE-2017-16844.patch \
 "
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"

