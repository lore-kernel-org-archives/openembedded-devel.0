Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qyk2T-0008Uz-UY
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:37:06 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Wed, 31 Aug 2011
	14:32:11 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Aug 2011 14:32:22 +0200
Message-ID: <1314793942-19857-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH v3] connman: fix typo with -test package
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
X-List-Received-Date: Wed, 31 Aug 2011 12:37:06 -0000
Content-Type: text/plain

The typo prohibited the connman-tests package from being populated.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
V3: Bump PR in .bb instead of .inc

V2: Bump PR.

 meta-oe/recipes-connectivity/connman/connman.inc   |    2 +-
 .../recipes-connectivity/connman/connman_0.77.bb   |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
index eeccf50..8209502 100644
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ b/meta-oe/recipes-connectivity/connman/connman.inc
@@ -72,7 +72,7 @@ PACKAGES_DYNAMIC = "${PN}-plugin-*"
 PACKAGES =+ "${PN}-scripts ${PN}-tools ${PN}-tests"
 
 FILES_${PN}-tools = "${bindir}/wispr"
-FILES_${PN{-tests = "${bindir}/*-test"
+FILES_${PN}-tests = "${bindir}/*-test"
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.77.bb b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
index 6c7b5f8..b132f4b 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.77.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.77.bb
@@ -1,4 +1,5 @@
 require connman.inc
+PR = "r1"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
-- 
1.7.5.4



