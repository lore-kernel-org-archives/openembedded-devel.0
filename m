Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 13B4F78493
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 05:41:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36779437"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Feb 2018 13:41:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 1152E49F19B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2018 13:40:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Feb 2018 13:41:01 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Feb 2018 13:40:45 +0800
Message-ID: <1517809249-7183-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1517809249-7183-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 1152E49F19B0.A5C70
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] drbd-utils: 8.9.6 -> 9.2.0
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
X-List-Received-Date: Mon, 05 Feb 2018 05:41:04 -0000
Content-Type: text/plain

1.Upgrade drbd-utils from 8.9.6 to 9.2.0.
2.Delete 0001-Makefile.in-fix-permission-bits-for-drbd.service.patch, since it is integrated upstream.
3.Upgrade the SRC_RUL.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...e.in-fix-permission-bits-for-drbd.service.patch | 25 ----------------------
 .../{drbd-utils_8.9.6.bb => drbd-utils_9.2.0.bb}   |  7 +++---
 2 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_8.9.6.bb => drbd-utils_9.2.0.bb} (84%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
deleted file mode 100644
index 90dd1f8..0000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-Subject:  Makefile.in: fix permission bits for drbd.service
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- scripts/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/Makefile.in b/scripts/Makefile.in
-index 402b93b..4a45407 100644
---- a/scripts/Makefile.in
-+++ b/scripts/Makefile.in
-@@ -65,7 +65,7 @@ endif
- # yes, debian apparently allows installing both types from the same package
- ifneq ($(initscripttype),sysv)		# "systemd" or "both"
- 	install -d $(DESTDIR)$(systemdunitdir)
--	install -m 755 drbd.service $(DESTDIR)$(systemdunitdir)/
-+	install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
- 	install -d $(DESTDIR)/lib/drbd/
- 	install -m 755 drbd $(DESTDIR)/lib/drbd/
- 	install -d $(DESTDIR)$(tmpfilesdir)/
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.2.0.bb
similarity index 84%
rename from meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.2.0.bb
index 5f6c43f..fb0c142 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.2.0.bb
@@ -8,11 +8,10 @@ SECTION = "admin"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
-SRC_URI = "http://oss.linbit.com/drbd/${BP}.tar.gz \
-           file://0001-Makefile.in-fix-permission-bits-for-drbd.service.patch \
+SRC_URI = "http://www.linbit.com/downloads/drbd/utils/${BP}.tar.gz \
           "
-SRC_URI[md5sum] = "76ed6d3190cd77b00890f3365353124b"
-SRC_URI[sha256sum] = "297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913"
+SRC_URI[md5sum] = "17f8d90423287d3c6da16d36705c1416"
+SRC_URI[sha256sum] = "11299b555b703440ef0af2c74b69cf6dfb833e050b87cfdc3b93d0b71d8820a6"
 
 SYSTEMD_SERVICE_${PN} = "drbd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.7.4




