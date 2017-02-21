Return-Path: <chong.yi.chai@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 075A972F13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:27:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 16:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; d="scan'208";a="60586337"
Received: from chongyic-ilbpg1.png.intel.com ([10.88.227.83])
	by orsmga004.jf.intel.com with ESMTP; 20 Feb 2017 16:27:10 -0800
From: chong.yi.chai@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 08:26:03 +0800
Message-Id: <1487636765-15631-2-git-send-email-chong.yi.chai@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
References: <1487636765-15631-1-git-send-email-chong.yi.chai@intel.com>
MIME-Version: 1.0
Subject: [meta-networking][morty][PATCH 1/3] libtdb: fix SRC_URI - http has gone
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
X-List-Received-Date: Tue, 21 Feb 2017 00:27:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit 7131b825b6973e703c24101dec4628b1765723b6)
Signed-off-by: Chai, Chong Yi <chong.yi.chai@intel.com>
---
 meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
index 1d65d39..7eb0d7c 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-3.0+ & GPL-3.0+"
 LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c98f48018c4 \
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
 
-SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
+SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://do-not-check-xsltproc-manpages.patch \
            file://tdb-Add-configure-options-for-packages.patch \
 "
-- 
1.9.1


