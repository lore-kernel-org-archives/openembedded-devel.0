Return-Path: <chong.yi.chai@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B7F8672F0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:27:22 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 16:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; d="scan'208";a="60586370"
Received: from chongyic-ilbpg1.png.intel.com ([10.88.227.83])
	by orsmga004.jf.intel.com with ESMTP; 20 Feb 2017 16:27:22 -0800
From: chong.yi.chai@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 08:26:05 +0800
Message-Id: <1487636765-15631-4-git-send-email-chong.yi.chai@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
References: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
Subject: [meta-networking][morty][PATCH 3/3] libtalloc: fix SRC_URI to use https instead of http
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
X-List-Received-Date: Tue, 21 Feb 2017 00:27:22 -0000

From: "Chai, Chong Yi" <chong.yi.chai@intel.com>

Fetching using http from samba.org is no longer working and changing to https
would fix the issue.

Signed-off-by: Chai, Chong Yi <chong.yi.chai@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit 41feeb4df994c9f82955521c45e056d84d8e664b)
Signed-off-by: Chai, Chong Yi <chong.yi.chai@intel.com>
---
 meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
index 97a9a75..3f031ca 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://talloc.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
 
-SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
+SRC_URI = "https://samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://talloc-Add-configure-options-for-packages.patch \
 "
 LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
-- 
1.9.1


