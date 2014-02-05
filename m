Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0F06EA30
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2014 08:47:50 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=mS6NIquU2gAi1Xe8xEaHtIAzLvPq+5+dMkTf/gnlwSkz4b6g2BnmyE0z4gAIOFUIdLKBcdMbp8yI
	MZG01NzGpWVxmeiWCz19JW6aMtW3g1ACTxLWA1YBrPjaGVAGK0E1  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1391590056860462.6482841105807;
	Wed, 5 Feb 2014 00:47:36 -0800 (PST)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2014 09:44:57 +0100
Message-Id: <1391589897-10063-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
X-ZohoMail: Ss  SS_10 UW UB ZCF-710TPL UW UB  ZSF-HLOLL_2  SGR3_1_16014_4521
X-ZohoMail-Owner: <1391589897-10063-1-git-send-email-diego.ml@zoho.com>+zmo_0_<diego.ml@zoho.com>
X-ZohoMail-Sender: 188.10.246.65
X-Zoho-Virus-Status: 2
X-ZohoMailClient: External
Cc: Diego Rondini <diego.ml@zoho.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-browser][PATCH] chromium: Fix build with nss 3.15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 08:47:50 -0000

Meta-browser commit 4b7a82273a85802070441e9c510e0891acc482fa broke Chromium build because removal of meta-browser nss 3.13.3 forced build against OE-Core 3.15.1, which is not supported out of the box by Chromium 29.
This commit backports this patch:
https://src.chromium.org/viewvc/chrome/trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c?r1=206184&r2=206183&pathrev=206184&diff_format=u

Upstream-Status: Backport of SVN REV 206184

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 .../chromium-29.0.1518.2/secitem_array.patch       |   26 ++++++++++++++++++++
 recipes-browser/chromium/chromium_29.0.1518.2.bb   |    1 +
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch

diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch b/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
new file mode 100644
index 0000000..3537952
--- /dev/null
+++ b/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
@@ -0,0 +1,26 @@
+--- trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:43:39	206183
++++ trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:44:52	206184
+@@ -6,6 +6,7 @@
+  * Support routines for SECItemArray data structure.
+  */
+ 
++#include "nssutil.h"
+ #include "seccomon.h"
+ #include "secitem.h"
+ #include "secerr.h"
+@@ -13,10 +14,15 @@
+ 
+ typedef struct SECItemArrayStr SECItemArray;
+ 
++#define NSSUTIL_VERSION_NUM \
++    (NSSUTIL_VMAJOR * 10000 + NSSUTIL_VMINOR * 100 + NSSUTIL_VPATCH)
++#if NSSUTIL_VERSION_NUM < 31500
++// Added in NSS 3.15.
+ struct SECItemArrayStr {
+     SECItem *items;
+     unsigned int len;
+ };
++#endif
+ 
+ SECItemArray *
+ SECITEM_AllocArray(PLArenaPool *arena, SECItemArray *array, unsigned int len)
diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recipes-browser/chromium/chromium_29.0.1518.2.bb
index 4ebb254..1c62f1e 100644
--- a/recipes-browser/chromium/chromium_29.0.1518.2.bb
+++ b/recipes-browser/chromium/chromium_29.0.1518.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "\
         file://google-chrome.desktop \
         file://uninitialised-warning.patch \
 	file://001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch \
+	file://secitem_array.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "2480c3fd109ef000575629acb8a906ca"
 SRC_URI[sha256sum] = "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d8c1b1f7c66fd4ed681a1"
-- 
1.7.9.5



