Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PsPjV-0004uL-Os
	for openembedded-devel@openembedded.org; Thu, 24 Feb 2011 02:11:05 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p1O0qE8q008605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Feb 2011 01:52:15 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Thu, 24 Feb 2011 01:52:14 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@openembedded.org
Date: Thu, 24 Feb 2011 01:12:49 +0100
Message-Id: <1298506369-3417-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.75
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] opkg-utils: convert mtime to int before comparing it
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
X-List-Received-Date: Thu, 24 Feb 2011 01:11:05 -0000

The st_mtime attribute (which is a float) is compared against a value
from the timestamp database, which was stored as an integer there.

When working on a filesystem with precise timestamps the comparision
will fail nearly everytime hence.

Although it might be possible to enhance the database to store the
fractional part too, this will complicate things more than we would
gain by this change.

This patch was applied as 49e11b32906fc1becd9218bb3125f6fc8fa03fa4 to
old ipkg-utils already.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/opkg-utils/opkg-utils/mtime-int.patch |   27 +++++++++++++++++++++++++
 recipes/opkg-utils/opkg-utils_svn.bb          |    5 ++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 recipes/opkg-utils/opkg-utils/mtime-int.patch

diff --git a/recipes/opkg-utils/opkg-utils/mtime-int.patch b/recipes/opkg-utils/opkg-utils/mtime-int.patch
new file mode 100644
index 0000000..efec3c0
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils/mtime-int.patch
@@ -0,0 +1,27 @@
+Convert mtime to int before comparing it
+
+The st_mtime attribute (which is a float) is compared against a value
+from the timestamp database, which was stored as an integer there.
+
+When working on a filesystem with precise timestamps the comparision
+will fail nearly everytime hence.
+
+Although it might be possible to enhance the database to store the
+fractional part too, this will complicate things more than we would
+gain by this change.
+
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+
+Index: opkg-utils/opkg-make-index
+===================================================================
+--- opkg-utils.orig/opkg-make-index
++++ opkg-utils/opkg-make-index
+@@ -100,7 +100,7 @@ for filename in files:
+      pkg = None
+      fnameStat = os.stat(filename)
+      if old_pkg_hash.has_key(basename):
+-          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
+             if (verbose):
+                sys.stderr.write("Found %s in Packages\n" % (filename,))
+             pkg = old_pkg_hash[basename]
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
index 951580a..6b8d3ea 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_svn.bb
@@ -6,10 +6,11 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
-           file://index-ignore-filenotfound.patch"
+           file://index-ignore-filenotfound.patch \
+           file://mtime-int.patch"
 
 S = "${WORKDIR}/opkg-utils"
 
-- 
1.7.4



