Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1QNBIA-0004rR-8z
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 00:02:02 +0200
Received: from localhost (95-90-75-76-dynip.superkabel.de [95.90.75.76])
	by dd20204.kasserver.com (Postfix) with ESMTPSA id 7DB6912A0288;
	Thu, 19 May 2011 23:50:02 +0200 (CEST)
From: Bernhard.Guillon@opensimpad.org
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 23:50:42 +0200
Message-Id: <1305841842-2431-1-git-send-email-Bernhard.Guillon@opensimpad.org>
X-Mailer: git-send-email 1.7.5.1
Subject: [PATCH] opkg-utils: port arfile.py patch to opkg-utils, bump PR
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
X-List-Received-Date: Thu, 19 May 2011 22:02:02 -0000

From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>

We need this patch for opkg as well

original commit b3da649ee25374f284d03ebce5843b6326559f73
original Author: Scott Anderson <o2e@saaworld.com>
original commit message:
ipkg-utils: Make arfile.py handle six digit UIDs

Essentially, the problem is that arfile.py is splitting the ar header with
white-space instead of fixed-width fields, so two fields would get treated
as a single field.  This makes things better than before as it now honors
the fixed field widths.

Signed-off-by: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
---
 .../opkg-utils/arfile_header_split.patch           |   17 +++++++++++++++++
 recipes/opkg-utils/opkg-utils_svn.bb               |    3 ++-
 2 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 recipes/opkg-utils/opkg-utils/arfile_header_split.patch

diff --git a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
new file mode 100644
index 0000000..4640367
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
@@ -0,0 +1,17 @@
+--- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
++++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
+@@ -74,7 +74,12 @@
+             if l == "\n":
+                 l = self.f.readline()
+                 if not l: break
+             l = l.replace('`', '')
+-            descriptor = l.split()
++            # Field lengths from /usr/include/ar.h:
++            ar_field_lens = [ 16, 12, 6, 6, 8, 10, 2 ]
++            descriptor = []
++            for field_len in ar_field_lens:
++                descriptor.append(l[:field_len].strip())
++                l = l[field_len:]
+ #            print descriptor
+             size = int(descriptor[5])
+             memberName = descriptor[0][:-1]
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
index 6b8d3ea..a8f2cb7 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_svn.bb
@@ -6,10 +6,11 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
            file://index-ignore-filenotfound.patch \
+           file://arfile_header_split.patch \
            file://mtime-int.patch"
 
 S = "${WORKDIR}/opkg-utils"
-- 
1.7.0.4



