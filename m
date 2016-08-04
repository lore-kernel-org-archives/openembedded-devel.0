Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C58936010B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 08:42:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u748gT8K005799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Aug 2016 01:42:29 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 4 Aug 2016 01:42:28 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Aug 2016 04:42:26 -0400
Message-ID: <1470300146-37351-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] proftpd: clean the host path in prxs
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
X-List-Received-Date: Thu, 04 Aug 2016 08:42:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

prxs (PRoftpd eXtenSion tool) is a perl script,
in which the host path should be avoided.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
index 2a36083..ed6356b 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
@@ -98,6 +98,11 @@ do_install () {
         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
         -e 's,@SBINDIR@,${sbindir},g' \
         -i ${D}${systemd_unitdir}/system/*.service
+
+    sed -e 's|--sysroot=${STAGING_DIR_HOST}||g' \
+        -e 's|${STAGING_DIR_NATIVE}||g' \
+        -e 's|-fdebug-prefix-map=[^ ]*||g' \
+        -i ${D}/${bindir}/prxs
 }
 
 INITSCRIPT_NAME = "proftpd"
-- 
2.8.1


