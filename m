Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MDPSS-000657-H2
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 22:59:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 40DFB4D3F2F;
	Sun,  7 Jun 2009 16:49:48 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16670-07; Sun,  7 Jun 2009 16:49:48 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 210634D4465; Sun,  7 Jun 2009 16:49:48 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 3A14B2E6637;
	Sun,  7 Jun 2009 16:49:45 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 325AA4147E; Sun,  7 Jun 2009 16:49:45 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Jun 2009 16:49:38 -0400
Message-Id: <1244407779-23896-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <4A1EF22E.2040500@balister.org>
References: <4A1EF22E.2040500@balister.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] tcpdump: fix mix of tabs and spaces
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
X-List-Received-Date: Sun, 07 Jun 2009 20:59:12 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

Resend. Got rid of all space indents in the file, so this time hopefully
git am won't complain :)

 recipes/tcpdump/tcpdump_3.9.7.bb |   10 ++++++----
 recipes/tcpdump/tcpdump_4.0.0.bb |   16 +++++++++-------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/recipes/tcpdump/tcpdump_3.9.7.bb b/recipes/tcpdump/tcpdump_3.9.7.bb
index ba9710d..163d74f 100644
--- a/recipes/tcpdump/tcpdump_3.9.7.bb
+++ b/recipes/tcpdump/tcpdump_3.9.7.bb
@@ -5,8 +5,10 @@ SECTION = "console/network"
 PRIORITY = "optional"
 DEPENDS = "libpcap"
 
-SRC_URI = "http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
-           file://tcpdump_configure_no_-O2.patch;patch=1"
+SRC_URI = " \
+	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
+	file://tcpdump_configure_no_-O2.patch;patch=1 \
+"
 
 inherit autotools
 
@@ -15,6 +17,6 @@ EXTRA_OECONF = "--without-crypto"
 do_configure() {
 	gnu-configize
 	oe_runconf
-        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
-        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
+	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
+	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
 }
diff --git a/recipes/tcpdump/tcpdump_4.0.0.bb b/recipes/tcpdump/tcpdump_4.0.0.bb
index 537cb36..7f99220 100644
--- a/recipes/tcpdump/tcpdump_4.0.0.bb
+++ b/recipes/tcpdump/tcpdump_4.0.0.bb
@@ -6,10 +6,12 @@ PRIORITY = "optional"
 DEPENDS = "libpcap"
 PR = "r1"
 
-SRC_URI = "http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
-           file://tcpdump_configure_no_-O2.patch;patch=1 \
-           file://no-ipv6-tcpdump4.patch;patch=1 \
-           file://0001-minimal-IEEE802.15.4-allowed.patch;patch=1"
+SRC_URI = " \
+	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
+	file://tcpdump_configure_no_-O2.patch;patch=1 \
+	file://no-ipv6-tcpdump4.patch;patch=1 \
+	file://0001-minimal-IEEE802.15.4-allowed.patch;patch=1 \
+"
 
 inherit autotools
 # ac_cv_linux_vers=${ac_cv_linux_vers=2}
@@ -18,8 +20,8 @@ EXTRA_OECONF = "--without-crypto"
 
 do_configure() {
 	gnu-configize
-    autoconf
+	autoconf
 	oe_runconf
-        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
-        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
+	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
+	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
 }
-- 
1.6.3



