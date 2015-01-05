Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 88A8D7213F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:33:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2015 02:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646373615"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 02:33:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:33:17 +0000
Message-Id: <43b07044797589c22f6c35846051d1f7a2d435ba.1420453688.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH v2 04/12] php: upgrade to 5.5.20
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
X-List-Received-Date: Mon, 05 Jan 2015 10:33:38 -0000

Among many fixes since 5.5.15, the following security issues were fixed:

CVE-2014-8142
CVE-2014-3710
CVE-2014-3669
CVE-2014-3670
CVE-2014-3668
CVE-2014-3538
CVE-2014-3587
CVE-2014-2497
CVE-2014-5120
CVE-2014-3597

For more details please see the upstream changelog:

  http://php.net/ChangeLog-5.php

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/php/{php_5.5.15.bb => php_5.5.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.5.15.bb => php_5.5.20.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.15.bb b/meta-oe/recipes-devtools/php/php_5.5.20.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_5.5.15.bb
rename to meta-oe/recipes-devtools/php/php_5.5.20.bb
index 1e53a32..7f11b7f 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.15.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.20.bb
@@ -29,8 +29,8 @@ SRC_URI_append_class-target += " \
             file://70_mod_php5.conf \
           "
 
-SRC_URI[md5sum] = "5cb5f2ed9099299f8a4c952d59d93812"
-SRC_URI[sha256sum] = "00f24226b12fee27e332383b6304f1b9ed3f4d9173dd728a68c5c3f5a59b8ba7"
+SRC_URI[md5sum] = "9dfc1d4d2b44fb7e2b4ee9651d032203"
+SRC_URI[sha256sum] = "f28a150d1cd8991bd1a41dce4fdff4e343d1dbe01a48b9b44bea74532ce0391a"
 
 S = "${WORKDIR}/php-${PV}"
 
-- 
1.9.3


