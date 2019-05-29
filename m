Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE92B7D25F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 07:47:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T7lUWn011925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 00:47:30 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 00:47:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 May 2019 15:47:28 +0800
Message-ID: <1559116048-169825-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba/libldb: add rconflicts
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
X-List-Received-Date: Wed, 29 May 2019 07:47:28 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

samba have bundled libldb, so when both samba and libldb, or both pyldb \
and samba-python is installed, below error will appear:

file /usr/bin/ldbadd conflicts between attempted installs of samba-4.8.11-r0.i586 and libldb-1.4.1-r0.i586
file /usr/bin/ldbdel conflicts between attempted installs of samba-4.8.11-r0.i586 and libldb-1.4.1-r0.i586
...
file /usr/lib/python2.7/site-packages/ldb.so conflicts between attempted installs of libpyldb-util1-1.4.1-r0.i586 and samba-python-4.8.11-r0.i586

so add rconflicts for both packages

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.8.11.bb | 3 +++
 meta-networking/recipes-support/libldb/libldb_1.4.1.bb     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
index 8c08d1e..8139ed4 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.11.bb
@@ -41,6 +41,9 @@ RDEPENDS_${PN}_remove = "perl"
 
 DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam"
 
+RCONFLICTS_${PN} = "libldb"
+RCONFLICTS_${PN}-python = "pyldb"
+
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
index 3c7e545..f3608c6 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
@@ -5,6 +5,8 @@ LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
 
 DEPENDS += "libtdb libtalloc libtevent popt"
 RDEPENDS_pyldb += "python samba"
+RCONFLICTS_${PN} = "samba"
+RCONFLICTS_pyldb = "samba-python"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
-- 
2.7.4


