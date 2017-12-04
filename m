Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7684278558
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Dec 2017 20:41:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 12:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,361,1508828400"; d="scan'208";a="183947388"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2017 12:41:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Dec 2017 09:40:44 +1300
Message-Id: <20171204204044.25226-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-networking][PATCH] postfix: drop NATIVE_INSTALL_WORKS
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
X-List-Received-Date: Mon, 04 Dec 2017 20:41:29 -0000

This variable hasn't been used in a very long time, so there's no need
to be setting it here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a588bd3..585c039 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -219,8 +219,6 @@ do_install_append_class-target() {
     sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
 }
 
-NATIVE_INSTALL_WORKS = "1"
-
 ALTERNATIVE_${PN} = "sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
 ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
-- 
2.9.5


