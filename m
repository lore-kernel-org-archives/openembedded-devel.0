Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC0D6D472
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:28:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V6Srg4010927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 23:28:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 23:28:52 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:29:45 +0800
Message-ID: <1383200986-18674-4-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
References: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/5] ndisc6: chmod in do_install and remove unnecessary pkg_postinst
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
X-List-Received-Date: Thu, 31 Oct 2013 06:28:52 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

We can use chmod to set the SUID bit for applications in the do_install
task. If we do so, the pkg_postinsts are no longer needed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
index d753912..a958e37 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
@@ -49,14 +49,8 @@ servers through slateless IPv6 autoconfiguration."
 
 do_install_append () {
     rm -rf ${D}${localstatedir}
-}
-# Enable SUID bit for applications that need it
-pkg_postinst_${PN}-rltraceroute6 () {
-    chmod 4555 ${bindir}/rltraceroute6
-}
-pkg_postinst_${PN}-ndisc6 () {
-    chmod 4555 ${bindir}/ndisc6
-}
-pkg_postinst_${PN}-rdisc6 () {
-    chmod 4555 ${bindir}/rdisc6
+    # Enable SUID bit for applications that need it
+    chmod 4555 ${D}${bindir}/rltraceroute6
+    chmod 4555 ${D}${bindir}/ndisc6
+    chmod 4555 ${D}${bindir}/rdisc6
 }
-- 
1.7.9.5


