Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6230D76F56
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Oct 2015 09:31:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A9VdWN011316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 10 Oct 2015 02:31:39 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sat, 10 Oct 2015 02:31:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Sat, 10 Oct 2015 17:19:51 +0800
Message-ID: <1444468791-18370-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] drbd-utils: fix multilib problem
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
X-List-Received-Date: Sat, 10 Oct 2015 09:31:40 -0000
Content-Type: text/plain

If multilib is enabled, errors about 'installed-not-shipped' would appear.
This patch fixes this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
index 66b94dd..2971280 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
@@ -34,7 +34,7 @@ RDEPENDS_${PN} += "bash perl"
 # The drbd items are explicitly put under /lib when installed.
 #
 FILES_${PN} += "/run"
-FILES_${PN} += "${base_libdir}/drbd \
-                ${libdir}/drbd \
-                ${libdir}/tmpfiles.d"
-FILES_${PN}-dbg += "${base_libdir}/drbd/.debug"
+FILES_${PN} += "${nonarch_base_libdir}/drbd \
+                ${nonarch_libdir}/drbd \
+                ${nonarch_libdir}/tmpfiles.d"
+FILES_${PN}-dbg += "${nonarch_base_libdir}/drbd/.debug"
-- 
1.9.1


