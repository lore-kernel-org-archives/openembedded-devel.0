Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2A47487C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2018 09:50:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 02:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,400,1517904000"; d="scan'208";a="44486624"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.235])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2018 02:50:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Apr 2018 17:50:16 +0800
Message-Id: <1522749016-17637-6-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
References: <1522749016-17637-1-git-send-email-anuj.mittal@intel.com>
Subject: [meta-oe][PATCH 5/5] php: enable opcache by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 09:50:42 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-devtools/php/php.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 8ba218c..066b97c 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -67,7 +67,7 @@ EXTRA_OECONF_class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 imap \
+PACKAGECONFIG ??= "mysql sqlite3 imap opcache \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG_class-native = ""
-- 
2.7.4


