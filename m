Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LpmxM-0005zZ-Jj
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 19:17:36 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090403171054.BQJH27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Apr 2009 13:10:54 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id b5At1b00H4dMFYL045AtD0; Fri, 03 Apr 2009 13:10:53 -0400
X-Authority-Analysis: v=1.0 c=1 a=0-na18VFqboA:10 a=9sLVTvYMED0A:10
	a=jAuJt-RD0KGZ2T9NQWYA:9 a=RR4DlnnXEiP0DZ9LkkjcBLFnHBoA:4
	a=CWfAmLVWKswA:10
X-CM-Score: 0.00
Date: Fri, 3 Apr 2009 10:10:53 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090403171052.GE30840@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.45
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-SA-Exim-Scanned: No (on linuxtogo.org); SA Timed out after 240 secs
Subject: [PATCH] wireless-tools: Fix libiw/ifrename packages, bump PR.
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
X-List-Received-Date: Fri, 03 Apr 2009 17:17:37 -0000
X-List-Received-Date: Fri, 03 Apr 2009 17:17:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm sending this for review since it actually puts ifrename into its own
package as was apparently intended, but not happening.  Giving people
the weekend + Monday to complain and Tuesday AM (US -0700) I'll push.

 We weren't creating the above packages as we needed to use '=+' not
 '+=' here to take things from the default package.  For these
 additional packages, add files with '=' not '+=' and we only need to add
 ${sysconfdir}/network to the base package glob.  Also we need to run
 install-static to get libiw.a to be installed.

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

-- 
Tom Rini


