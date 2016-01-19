Return-Path: <alexandru.but@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7B56E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:45:29 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0JAjTkm016394 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 04:45:29 -0600
Received: from zdravan.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016011904452934-63711 ;
	Tue, 19 Jan 2016 04:45:29 -0600 
From: Alexandru But <alexandru.but@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2016 12:45:18 +0200
Message-Id: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
X-Mailer: git-send-email 2.6.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/19/2016 04:45:29 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/19/2016 04:45:29 AM,
	Serialize complete at 01/19/2016 04:45:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-19_05:, , signatures=0
Subject: [meta-oe][PATCH] efivar: fix zero initializer compiler error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2016 10:45:30 -0000

Patch based on commit a3606c0:
Sometimes the compiler doesn't like { 0,} as an initializer

Signed-off-by: Alexandru But <alexandru.but@ni.com>
---
 ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 42 ++++++++++++++++++++++
 meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
new file mode 100644
index 0000000..68cabd6
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
@@ -0,0 +1,42 @@
+From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Tue, 14 Jul 2015 09:33:54 -0400
+Subject: [PATCH] Sometimes the compiler doesn't like { 0, } as an
+ initializer...
+
+Because it really wants to be { {0, },} or something, and sometimes the
+compiler, knowing full well what we're trying to do, likes to complain
+about the rigor applied to our technique in doing it.
+
+memset() the struct ifreq to 0 instead so I don't need to figure out its
+internal structure just to zero it out.
+
+Resolves #28
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+---
+ src/linux.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/linux.c b/src/linux.c
+index 57f71f3..817b8e6 100644
+--- a/src/linux.c
++++ b/src/linux.c
+@@ -847,12 +847,13 @@ ssize_t
+ __attribute__((__visibility__ ("hidden")))
+ make_mac_path(uint8_t *buf, ssize_t size, const char * const ifname)
+ {
+-	struct ifreq ifr = { 0, };
++	struct ifreq ifr;
+ 	struct ethtool_drvinfo drvinfo = { 0, };
+ 	int fd, rc;
+ 	ssize_t ret = -1, sz, off=0;
+ 	char busname[PATH_MAX+1] = "";
+ 
++	memset(&ifr, 0, sizeof (ifr));
+ 	strncpy(ifr.ifr_name, ifname, IF_NAMESIZE);
+ 	drvinfo.cmd = ETHTOOL_GDRVINFO;
+ 	ifr.ifr_data = (caddr_t)&drvinfo;
+-- 
+2.6.1
+
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
index b5ef90a..1684a10 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 DEPENDS_class-target = "popt efivar-native"
 
 SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
-SRC_URI = "git://github.com/rhinstaller/efivar.git"
+SRC_URI = "git://github.com/rhinstaller/efivar.git \
+           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
 SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
 
-- 
2.6.1


