Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWQ-0006e6-GN
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164019.HRXF15318.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:19 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgKu2; Fri, 24 Apr 2009 12:40:19 -0400
X-Authority-Analysis: v=1.0 c=1 a=lDE0WW7hEnwA:10 a=b36yVlBc07IA:10
	a=4HVRqb_MAAAA:8 a=jAuJt-RD0KGZ2T9NQWYA:9
	a=hM6F7AAeimraLFzAAhLpj4vaAQcA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:53 -0700
Message-Id: <1240589520-1104-6-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-5-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] wireless-tools: Fix libiw/ifrename packages, bump PR.
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:06 -0000

From: Tom Rini <trini@embeddedalley.com>

Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/wireless-tools/wireless-tools.inc   |   21 ++++++++++-----------
 recipes/wireless-tools/wireless-tools_29.bb |    2 +-
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/recipes/wireless-tools/wireless-tools.inc b/recipes/wireless-tools/wireless-tools.inc
index d2a7b89..f52c3f1 100644
--- a/recipes/wireless-tools/wireless-tools.inc
+++ b/recipes/wireless-tools/wireless-tools.inc
@@ -31,7 +31,7 @@ do_stage() {
 }
 
 do_install() {
-    oe_runmake PREFIX=${D} install-iwmulticall install-dynamic install-man install-hdr
+    oe_runmake PREFIX=${D} install-iwmulticall install-dynamic install-static install-man install-hdr
     install -d ${D}${sbindir}
     install -m 0755 ifrename ${D}${sbindir}/ifrename
     install -d ${D}${sysconfdir}/network/if-pre-up.d
@@ -39,13 +39,12 @@ do_install() {
     install ${WORKDIR}/zzz-wireless.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/zzz-wireless
 }
 
-PACKAGES += "libiw libiw-dev libiw-doc libiw-dbg ifrename ifrename-dbg ifrename-doc"
-FILES_libiw += "${libdir}/*.so.*"
-FILES_libiw-dbg += "${libdir}/.debug/*.so.*"
-FILES_libiw-dev += "${libdir}/*.a ${libdir}/*.so ${includedir}"
-FILES_libiw-doc += "${mandir}/man7"
-FILES_ifrename += "${sbindir}/ifrename"
-FILES_ifrename-dbg += "${sbindir}/.debug/ifrename"
-FILES_ifrename-doc += "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
-FILES_${PN} += "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
-FILES_${PN}-doc += "${mandir}/man8"
+PACKAGES =+ "libiw libiw-dev libiw-doc libiw-dbg ifrename ifrename-dbg ifrename-doc"
+FILES_libiw = "${libdir}/*.so.*"
+FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
+FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
+FILES_libiw-doc = "${mandir}/man7"
+FILES_ifrename = "${sbindir}/ifrename"
+FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
+FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
+FILES_${PN} += "${sysconfdir}/network"
diff --git a/recipes/wireless-tools/wireless-tools_29.bb b/recipes/wireless-tools/wireless-tools_29.bb
index 196a194..fb68127 100644
--- a/recipes/wireless-tools/wireless-tools_29.bb
+++ b/recipes/wireless-tools/wireless-tools_29.bb
@@ -1,3 +1,3 @@
 require wireless-tools.inc
 
-PR = "r3"
+PR = "r4"
-- 
1.5.6.3



