Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KeBDO-00064v-65
	for openembedded-devel@openembedded.org; Fri, 12 Sep 2008 18:09:46 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080912160657.ERHF8615.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 12 Sep 2008 12:06:57 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id Ds6x1a00W1E665w04s6xkL; Fri, 12 Sep 2008 12:06:58 -0400
Date: Fri, 12 Sep 2008 09:06:57 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20080912160657.GE29676@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Fri, 12 Sep 2008 16:09:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ This is all also available at
http://bugs.openembedded.net/show_bug.cgi?id=4549 ]

A number of xorg dev packages (both literally -dev and util-macros) are
uninstallable on the target.  The problem is that by default (with ipk)
any given -dev package will depend on the main package, for example
xproto-dev depends on xproto.  But in these packages case, there is no
main package (no xproto).  The following patch fixes the issue.

This is important in the case of SDK users.

#
# old_revision [e5b917e5de77a3e1e649867986fdd33f141c7bd3]
#
# patch "packages/xorg-lib/xtrans_1.0.3.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
# 
# patch "packages/xorg-lib/xtrans_1.0.4.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
# 
# patch "packages/xorg-lib/xtrans_1.1.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
# 
# patch "packages/xorg-lib/xtrans_1.2.bb"
#  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
#    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
# 
# patch "packages/xorg-proto/xorg-proto-common.inc"
#  from [2f88e96e17c9a539cf5bf9383cad1500375eae86]
#    to [5c6754f960805e8352b7d28a498e98a4fb1a46be]
# 
# patch "packages/xorg-util/util-macros_1.1.5.bb"
#  from [e4dba9f37b257cea60724c9fd34b82e27e27e349]
#    to [f33bcbd1e083dce6f243c7a9ca7b908c33868ad8]
# 
# patch "packages/xorg-util/util-macros_1.1.6.bb"
#  from [9dd3c08d7715e6e845ab141fd67cbb4e3a962977]
#    to [0d3b638b2967a60b38c2603dad643c7325d70ae2]
#
============================================================
--- packages/xorg-lib/xtrans_1.0.3.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.0.3.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+RDEPENDS_${PN}-dev = ""
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-lib/xtrans_1.0.4.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.0.4.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+RDEPENDS_${PN}-dev = ""
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-lib/xtrans_1.1.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.1.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+RDEPENDS_${PN}-dev = ""
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-lib/xtrans_1.2.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
+++ packages/xorg-lib/xtrans_1.2.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
@@ -1,5 +1,7 @@ require xorg-lib-common.inc
 require xorg-lib-common.inc
 
+RDEPENDS_${PN}-dev = ""
+
 DESCRIPTION = "network API translation layer to insulate X applications and \
 libraries from OS network vageries."
 PE = "1"
============================================================
--- packages/xorg-proto/xorg-proto-common.inc	2f88e96e17c9a539cf5bf9383cad1500375eae86
+++ packages/xorg-proto/xorg-proto-common.inc	5c6754f960805e8352b7d28a498e98a4fb1a46be
@@ -1,9 +1,10 @@ XORG_PN = "${PN}"
 DESCRIPTION = "X protocol headers: ${XORG_PN}"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/libs"
 LICENSE = "MIT-X"
 
 XORG_PN = "${PN}"
+RDEPENDS_${PN}-dev = ""
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${XORG_PN}-${PV}.tar.bz2"
 
============================================================
--- packages/xorg-util/util-macros_1.1.5.bb	e4dba9f37b257cea60724c9fd34b82e27e27e349
+++ packages/xorg-util/util-macros_1.1.5.bb	f33bcbd1e083dce6f243c7a9ca7b908c33868ad8
@@ -1,5 +1,7 @@ require xorg-util-common.inc
 require xorg-util-common.inc
 
+RDEPENDS_${PN}-dev = ""
+
 DESCRIPTION = "X autotools macros"
 PR = "r1"
 PE = "1"
============================================================
--- packages/xorg-util/util-macros_1.1.6.bb	9dd3c08d7715e6e845ab141fd67cbb4e3a962977
+++ packages/xorg-util/util-macros_1.1.6.bb	0d3b638b2967a60b38c2603dad643c7325d70ae2
@@ -1,4 +1,6 @@ require xorg-util-common.inc
 require xorg-util-common.inc
 
+RDEPENDS_${PN}-dev = ""
+
 DESCRIPTION = "X autotools macros"
 PE = "1"

-- 
Tom Rini


