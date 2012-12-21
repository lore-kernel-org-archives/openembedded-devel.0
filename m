Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TmAHw-0003Bk-Tu
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 22:37:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBLLN5v3021133
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 13:23:05 -0800 (PST)
Received: from yow-mlittle.corp.ad.wrs.com (128.224.140.216) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 21 Dec 2012 13:23:05 -0800
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Dec 2012 16:23:04 -0500
Message-ID: <1356124984-19927-1-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [meta-networking][PATCH] traceroute: Remove bashisms
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 21:37:53 -0000
Content-Type: text/plain

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
index 719d9fb..d855c67 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
@@ -32,10 +32,8 @@ do_install() {
 
     install -d ${D}${mandir}
     install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
-    pushd ${D}${mandir}
-    ln -s ${PN}.8 ${PN}6.8
-    ln -s ${PN}.8 tcptraceroute.8
-    popd
+    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}${PN}6.8
+    ln -s ${D}${mandir}${PN}.8 ${D}${mandir}tcptraceroute.8
 
 }
 
-- 
1.7.11.7



