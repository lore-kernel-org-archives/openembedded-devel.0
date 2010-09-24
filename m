Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1OzDf2-0002QM-C8
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:10:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 78F668AD8E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:10:14 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09688-07 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 24 Sep 2010 15:10:14 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 531C58ADA78; Fri, 24 Sep 2010 15:10:14 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 2DBCF8A4280
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:10:13 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 10FD614097E5; Fri, 24 Sep 2010 15:10:12 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 15:10:12 -0400
Message-Id: <1285355412-14559-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openvpn: change kernel-module-tun to RRECOMMEND
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
X-List-Received-Date: Fri, 24 Sep 2010 19:10:21 -0000

RRECOMMEND, not RDEPEND, in case a particular platform doesn't have
a separate kernel-module-tun package. Matches behaviour of other
packages, like bridge-utils.

Also switch to INC_PR.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/openvpn/openvpn.inc      |    4 +++-
 recipes/openvpn/openvpn_2.1.0.bb |    2 +-
 recipes/openvpn/openvpn_2.1.3.bb |    2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/openvpn/openvpn.inc b/recipes/openvpn/openvpn.inc
index c4870b5..68bfc51 100644
--- a/recipes/openvpn/openvpn.inc
+++ b/recipes/openvpn/openvpn.inc
@@ -4,7 +4,9 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
 DEPENDS = "lzo openssl"
-RDEPENDS_${PN} = "kernel-module-tun"
+RRECOMMENDS_${PN} = "kernel-module-tun"
+
+INC_PR = "r2"
 
 SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \
 	file://openvpn"
diff --git a/recipes/openvpn/openvpn_2.1.0.bb b/recipes/openvpn/openvpn_2.1.0.bb
index 16d551f..69d1da5 100644
--- a/recipes/openvpn/openvpn_2.1.0.bb
+++ b/recipes/openvpn/openvpn_2.1.0.bb
@@ -1,6 +1,6 @@
 require openvpn.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 SRC_URI = "http://openvpn.net/release/${P}.tar.gz \
 	   file://openvpn"
 
diff --git a/recipes/openvpn/openvpn_2.1.3.bb b/recipes/openvpn/openvpn_2.1.3.bb
index c448151..ceadf31 100644
--- a/recipes/openvpn/openvpn_2.1.3.bb
+++ b/recipes/openvpn/openvpn_2.1.3.bb
@@ -1,6 +1,6 @@
 require openvpn.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 SRC_URI = "http://openvpn.net/release/${P}.tar.gz \
 	   file://openvpn"
 
-- 
1.7.0.4



