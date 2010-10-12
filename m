Received: from smtp-dist-03.services.comms.unsw.edu.au ([149.171.97.18]
	helo=smtp-dist.unsw.edu.au) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@tigger.cse.unsw.EDU.AU>) id 1P5XBR-0002MA-QJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 07:13:58 +0200
Received: from INFPACM003.services.comms.unsw.edu.au
	(INFPACM003.services.comms.unsw.edu.au [149.171.193.26])
	by smtp-dist.unsw.edu.au (8.13.6/8.13.6) with ESMTP id o9C4ejbH020341
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 15:41:01 +1100 (EST)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkMHAPeDs0yBXqz5/2dsb2JhbACTU419cbAhAYY1iGaFSAQ
X-IronPort-AV: E=Sophos;i="4.57,318,1283695200"; d="scan'208";a="86372159"
Received: from tigger.cse.unsw.edu.au ([129.94.172.249])
	by INFPACM003.services.comms.unsw.edu.au with ESMTP;
	12 Oct 2010 15:24:26 +1100
Received: by tigger.cse.unsw.EDU.AU (Postfix, from userid 1000)
	id 33E49174D8A; Tue, 12 Oct 2010 15:40:45 +1100 (EST)
From: Jayen Ashar <jayen@cse.unsw.edu.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 15:40:23 +1100
Message-Id: <1286858423-12602-2-git-send-email-jayen@cse.unsw.edu.au>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <AANLkTikS4goX8mvN7di19uN6dZccGN2csxKgYMwcutPj@mail.gmail.com>
References: <AANLkTikS4goX8mvN7di19uN6dZccGN2csxKgYMwcutPj@mail.gmail.com>
X-SA-Exim-Connect-IP: 149.171.97.18
X-SA-Exim-Mail-From: jayen@tigger.cse.unsw.EDU.AU
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_NEUTRAL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jayen Ashar <jayen@cse.unsw.edu.au>
Subject: [PATCH v2 2/2] SWI-Prolog: New program
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
X-List-Received-Date: Tue, 12 Oct 2010 05:13:58 -0000

* Starting with SWI-Prolog 5.10.1
* SWI-Prolog is a fast and powerful ISO/Edinburgh-style Prolog compiler with a
*  rich set of built-in predicates. It offers a fast, robust and small
*  environment which enables substantial applications to be developed with it.
* incorporating feedback from Frans (patch 3165)

Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
---
 recipes/swi-prolog/swi-prolog.inc       |   10 ++++++----
 recipes/swi-prolog/swi-prolog_5.10.1.bb |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes/swi-prolog/swi-prolog.inc b/recipes/swi-prolog/swi-prolog.inc
index 772873e..a682af8 100644
--- a/recipes/swi-prolog/swi-prolog.inc
+++ b/recipes/swi-prolog/swi-prolog.inc
@@ -3,9 +3,9 @@ HOMEPAGE = "http://www.swi-prolog.org/"
 SECTION = "interpreters"
 PRIORITY = "optional"
 LICENSE = "LGPL"
-DEPENDS = "ncurses readline gmp chrpath"
+DEPENDS = "ncurses readline gmp"
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 SRC_URI = "http://mirror.cse.unsw.edu.au/pub/debian/pool/main/s/${PN}/${PN}_${PV}.orig.tar.gz \
            file://configure.patch;patch=1"
@@ -23,8 +23,9 @@ do_configure() {
   fi
 }
 
-#appended so we can run configure and make on the packages directory after 
-#compiling the main enging
+#to configure and compile the packages
+#cannot be a configure_append, as it needs the main engine to be compiled first
+#cannot be a separate recipe, as it needs to be in the same WORKDIR as the main engine
 do_compile_append() {
   if [ -e ${S}/packages/configure ]; then
   if [ -x ${S}/packages/configure ] ; then
@@ -66,6 +67,7 @@ do_compile_append() {
 }
 
 #to install the packages
+#cannot be a separate recipe, as it needs to be in the same WORKDIR as the main engine
 do_install_append() {
   oe_runmake -C packages 'DESTDIR=${D}' install
 }
diff --git a/recipes/swi-prolog/swi-prolog_5.10.1.bb b/recipes/swi-prolog/swi-prolog_5.10.1.bb
index bb7e95b..7e96057 100644
--- a/recipes/swi-prolog/swi-prolog_5.10.1.bb
+++ b/recipes/swi-prolog/swi-prolog_5.10.1.bb
@@ -1,3 +1,3 @@
 require swi-prolog.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
-- 
1.7.0.4



