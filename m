Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10693780A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 08:22:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4P8MDDG030335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 01:22:16 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 25 May 2017 01:22:11 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 May 2017 16:21:26 +0800
Message-ID: <1495700486-136828-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-oe][PATCH] traceroute: Move manual pages from mandir to man8 under it
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
X-List-Received-Date: Thu, 25 May 2017 08:22:17 -0000
Content-Type: text/plain

Traceroute's manual pages are installed in /usr/share/man,
which should be placed in /usr/share/man/man8.
Correct this.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 48a0c12..8f17d3f 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -33,10 +33,10 @@ do_install() {
 
     install -m755 wrappers/tcptraceroute ${D}${bindir}
 
-    install -d ${D}${mandir}
-    install -p -m644 ${BPN}/${BPN}.8 ${D}${mandir}
-    ln -s ${BPN}.8 ${D}${mandir}/${BPN}6.8
-    ln -s ${BPN}.8 ${D}${mandir}/tcptraceroute.8
+    install -d ${D}${mandir}/man8
+    install -p -m644 ${BPN}/${BPN}.8 ${D}${mandir}/man8
+    ln -s ${BPN}.8 ${D}${mandir}/man8/${BPN}6.8
+    ln -s ${BPN}.8 ${D}${mandir}/man8/tcptraceroute.8
 
 }
 
-- 
1.9.1


