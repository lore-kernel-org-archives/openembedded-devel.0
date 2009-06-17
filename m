Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MH0mY-0004ln-0s
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:26:50 +0200
Received: from localhost.localdomain (unknown [10.50.1.118])
	by hermes.mvista.com (Postfix) with ESMTP
	id 5E4D219405; Wed, 17 Jun 2009 12:16:20 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 12:16:19 -0700
Message-Id: <1245266179-19985-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] bitbake.conf, base.bbclass: Changed build config summary header to be a variable.
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
X-List-Received-Date: Wed, 17 Jun 2009 19:26:50 -0000

Default in bitbake.conf for BUILDCFG_HEADER is "Build Configuration".  This
lets distributions make their builds ever so slightly prettier :)

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass |    2 +-
 conf/bitbake.conf    |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index e622aee..9687339 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -923,7 +923,7 @@ python base_eventhandler() {
 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
 		statusvars = bb.data.getVar("BUILDCFG_VARS", e.data, 1).split()
 		statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
-		statusmsg = "\nOE Build Configuration:\n%s\n" % '\n'.join(statuslines)
+		statusmsg = "\n%s\n%s\n" % (bb.data.getVar("BUILDCFG_HEADER", e.data, 1), "\n".join(statuslines))
 		print statusmsg
 
 		needed_vars = bb.data.getVar("BUILDCFG_NEEDEDVARS", e.data, 1).split()
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 4cdc56f..2daab00 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -609,6 +609,8 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 ENTERPRISE_DISTRO ?= "0"
 
 # Pre-build configuration output
+
+BUILDCFG_HEADER = "Build Configuration:"
 BUILDCFG_VARS ?= "BB_VERSION METADATA_BRANCH METADATA_REVISION TARGET_ARCH TARGET_OS MACHINE DISTRO DISTRO_VERSION"
 BUILDCFG_VARS_append_arm = " TARGET_FPU"
 BUILDCFG_VARS_append_armeb = " TARGET_FPU"
-- 
1.6.0



