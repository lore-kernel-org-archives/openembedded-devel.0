Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmD40-00024n-DA
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:22:05 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmD1F-0007HG-JB from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 13:19:13 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Mar 2010 13:19:11 -0800
Received: from 172.30.80.137 ([172.30.80.137]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  1 Mar 2010 21:18:29 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Mar 2010 14:18:28 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Mar 2010 14:18:28 -0700
Message-ID: <1267478308.4739.245.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Mar 2010 21:19:11.0971 (UTC)
	FILETIME=[D68A9B30:01CAB984]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH, RFC] Cleanup / update QEMU related checks
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
X-List-Received-Date: Mon, 01 Mar 2010 21:22:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

First, we should be performing qemu-native related checks not on ARM,
but on ENABLE_BINARY_LOCALE_GENERATION (for both the ARM but no
generation and not ARM but generation) cases.  This clarifies what we do
in the first sub-check (aside: When can qemu-0.9.x die?).  This changes
the assume provided check to make sure that at least 'qemu' exists
(afaict this will exist for distribution packages as well as from-source
ones where we might not have qemu-arm, if the developer isn't doing arm)
using the standard check.  Finally (how I wrote it, not how it's in the
patch), correct (grammar and content) the comment about what GCC
versions are allowed.  My fault initially for not noticing the gcc
3.3.x / 3.2.x stuff in the list.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 990e75e..eeff262 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1333,16 +1333,15 @@ def check_app_exists(app, d):
 	return len(which(path, app)) !=3D 0
=20
 def check_gcc3(data):
-	# Primarly used by qemu to make sure we have a workable gcc-3.4.x.
-	# Start by checking for the program name as we build it, was not
-	# all host-provided gcc-3.4's will work.
-
+	# Primarly used by qemu to make sure we have a workable gcc-3.x.
+	# Start by checking for the program name as we build it as there
+	# are some distribtuion provided gcc-3.x's that will not work.
 	gcc3_versions =3D 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4 gcc-3.4.7 gcc-3.3
gcc33 gcc-3.3.6 gcc-3.2 gcc32'
=20
 	for gcc3 in gcc3_versions.split():
 		if check_app_exists(gcc3, data):
 			return gcc3
-=09
+
 	return False
=20
 # Patch handling
diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index b66c9a9..a78e8ed 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -83,8 +83,10 @@ def check_sanity(e):
=20
 	required_utilities =3D "patch help2man diffstat texi2html makeinfo cvs
svn bzip2 tar gzip gawk md5sum"
=20
-	if data.getVar('TARGET_ARCH', e.data, True) =3D=3D "arm":
-		# qemu-native needs gcc 3.x
+	# If we'll be running qemu, perform some sanity checks
+	if data.getVar('ENABLE_BINARY_LOCALE_GENERATION', e.data, True):
+		# Some versions of qemu-native needs gcc 3.x.  Do a special
+		# check here to allow for host 'gcc' is 3.x.
 		if "qemu-native" not in assume_provided and "gcc3-native" in
assume_provided:
 			gcc_version =3D commands.getoutput("${BUILD_PREFIX}gcc --version |
head -n 1 | cut -f 3 -d ' '")
=20
@@ -93,8 +95,7 @@ def check_sanity(e):
 				missing =3D missing + "gcc-3.x (needed for qemu-native),"
=20
 		if "qemu-native" in assume_provided:
-			if not check_app_exists("qemu-arm", e.data):
-				messages =3D messages + "qemu-native was in ASSUME_PROVIDED but the
QEMU binaries (qemu-arm) can't be found in PATH"
+			required_utilities +=3D "qemu"
=20
 		try:
 			if os.path.exists("/proc/sys/vm/mmap_min_addr"):


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


