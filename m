Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PppYg-0001H2-HZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 23:09:14 +0100
Received: by gyd8 with SMTP id 8so819289gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=j5hm53Vu4Ffp0UeTXgrT8dBorywmB9sXlTNmPlQ+BMo=;
	b=QzFc9oqqgRwSV7qcbRtcB4UFdstmh5ivczZy2UPRubC9D1xlZVhi6Vr7NvuusNUWd6
	P0fFBm7EEHWTOVlInp4NWzP+Bq5xBQGCmUnOMU+HV9zZvDDa2oHAKwrmdW8ZAbMVoh+G
	iK6rxrXkgDev+M4lDC4abYCvO0Ehg9c7hAlto=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sc4BDLHtupBii4smpZVV+CYWOeHcPq1UrSmK7gztt7PFM9GF2IXS6bJI7/40MPcpDQ
	ccPBcpA3CKQK2qIzfBBRT46DMNIzFGX/7y7vD4dBo699cTCqFwSFmosnjx8Mu/09enXT
	+6tFlxZInYfo9yz+oCxLTF1cO3dsv6loy+Fhg=
Received: by 10.151.112.3 with SMTP id p3mr1398378ybm.227.1297894078965;
	Wed, 16 Feb 2011 14:07:58 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u27sm399093yba.3.2011.02.16.14.07.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 14:07:58 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 15:07:42 -0700
Message-Id: <1297894063-27374-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
References: <1297894063-27374-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] autotools: add INHIBIT_AUTOTOOLS_BOOTSTRAP
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
X-List-Received-Date: Wed, 16 Feb 2011 22:09:14 -0000

From: Chris Larson <chris_larson@mentor.com>

Setting this variable to a true value (obeying the semantics of the 'boolean'
type in oe.types) will result in not running autoreconf, and not depending on
the things which the autoreconf requires.  Note that the
config.guess/config.sub files are still updated when using
INHIBIT_AUTOTOOLS_BOOTSTRAP, and these are updated directly via a find+ln
rather than through gnu-configize usage in order to avoid the dependency upon
autoconf/automake (gnu-configize is included with gnu-config, but requires the
perl modules from the other recipes).

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/autotools.bbclass |   29 ++++++++++++++++++++++-------
 1 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 3c124ae..dd52e03 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -2,26 +2,31 @@ require classes/autotools/staging.inc
 require classes/autotools/bootstrap.inc
 require classes/autotools/configure.inc
 
+INHIBIT_AUTOTOOLS_BOOTSTRAP ?= "false"
+INHIBIT_AUTOTOOLS_BOOTSTRAP[type] = "boolean"
+
 def autotools_deps(d):
     if bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS', d, 1):
         return ''
 
-    pn = bb.data.getVar('PN', d, 1)
-    deps = ''
+    deps = 'gnu-config-native'
+    if oe.data.typed_value('INHIBIT_AUTOTOOLS_BOOTSTRAP', d):
+        return deps
 
+    pn = bb.data.getVar('PN', d, 1)
     if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
         return deps
 
-    deps += 'autoconf-native automake-native help2man-native '
+    deps += ' autoconf-native automake-native help2man-native'
 
     if pn not in ['libtool', 'libtool-native', 'libtool-cross']:
-        deps += 'libtool-native '
+        deps += ' libtool-native'
         if (not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
                                   'sdk') and
             not d.getVar('INHIBIT_DEFAULT_DEPS', True)):
-            deps += 'libtool-cross '
+            deps += ' libtool-cross'
 
-    return deps + ' gnu-config-native'
+    return deps
 
 AUTOTOOLS_DEPENDS = "${@autotools_deps(d)}"
 
@@ -29,8 +34,18 @@ DEPENDS_prepend = "${AUTOTOOLS_DEPENDS} "
 DEPENDS_virtclass-native_prepend = "${AUTOTOOLS_DEPENDS} "
 DEPENDS_virtclass-nativesdk_prepend = "${AUTOTOOLS_DEPENDS} "
 
+_INHIBITED = "${@base_ifelse(oe.data.typed_value('INHIBIT_AUTOTOOLS_BOOTSTRAP', \
+                                                 d), \
+                             'y', 'n')}"
 autotools_do_configure () {
-    autotools_do_bootstrap
+    if [ "${_INHIBITED}" = "n" ]; then
+        autotools_do_bootstrap
+    else
+        find ${S} -name config.guess -exec \
+            ln -sf ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess "{}" \;
+        find ${S} -name config.sub -exec \
+            ln -sf ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub "{}" \;
+    fi
 
     if [ -e ${S}/configure ]; then
         oe_runconf $@
-- 
1.7.2.3



