Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BE1CAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OYJ74weR;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686373; x=1790222373;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4IUs7JMuMmOIt3CB89S6mOikxiB7ZbzYB0f1KCFZcl8=;
  b=OYJ74weRkWOpXQEgW/ZpO2Csp+xLv/qeuUf74Q2jxFz/qdUvycCEtG0l
   Z8m1ypnhWUm1oFAE3SQcYEecnGAugcb9EZ3x7WzsvNirO1s9vqB7j0bwS
   68g3ECjq3QSU7WDuiyaSi9Pfi7anjb7pVMr642dOYQtwHxjBKmqnk+Ji6
   8JpNusdEtPnZvhNEy6crbtjKVSicQ9iqJmPaIXDqYTZ6YwU7ELPUhSL7h
   MziMmOP+IdD7YD6xL8pg4I0GLXDBvXkJv7iEK2HjL4ttRTflU48cbPVtc
   VSfQpD52fJwddQr0SI4hA8fpdxKaVgEz020gzZ7yZf/lRphYCGeBlI2Lx
   w==;
X-CSE-ConnectionGUID: KUzMUCkORYOYatdvp39pTw==
X-CSE-MsgGUID: o+LyRNGqRB6SQMCcbpqalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602893"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:33 -0700
X-CSE-ConnectionGUID: OTIGflv3TKu3qRPtIC5ICw==
X-CSE-MsgGUID: HtTE+L0BSvqDwyEXxGqIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873677"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 5/8] procmail: patch CVE-2014-3618
Date: Wed, 24 Sep 2025 11:59:20 +0800
Message-ID: <20250924035923.35477-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035923.35477-1-anuj.mittal@intel.com>
References: <20250924035923.35477-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119745

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-20%2Bdeb7u1/debian/patches/CVE-2014-3618.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8378820dab0b6955fb0e2b27f24a1626f9124e5b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../procmail/procmail/CVE-2014-3618.patch     | 29 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
new file mode 100644
index 0000000000..b041924361
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
@@ -0,0 +1,29 @@
+Description: Fix heap-overflow in formail
+ CVE-2014-3618: Heap-overflow in formail when processing
+ specially-crafted email headers.
+Origin: http://www.openwall.com/lists/oss-security/2014/09/03/8
+Bug-Debian: https://bugs.debian.org/704675
+Bug-Debian: https://bugs.debian.org/760443
+Forwarded: not-needed
+Last-Update: 2014-09-04
+
+CVE: CVE-2014-3618
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -84,12 +84,11 @@ normal:	   *target++= *start++;
+ 	case '"':*target++=delim='"';start++;
+       }
+      ;{ int i;
+-	do
++	while(*start)
+ 	   if((i= *target++= *start++)==delim)	 /* corresponding delimiter? */
+ 	      break;
+ 	   else if(i=='\\'&&*start)		    /* skip quoted character */
+ 	      *target++= *start++;
+-	while(*start);						/* anything? */
+       }
+      hitspc=2;
+    }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index abb87f9935..4806bf5f80 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -12,7 +12,9 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-compile-errors.patch \
     file://from-debian-to-modify-parameters.patch \
     file://from-debian-to-fix-man-file.patch \
-    file://man-file-mailstat.1-from-debian.patch"
+    file://man-file-mailstat.1-from-debian.patch \
+    file://CVE-2014-3618.patch \
+"
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 

