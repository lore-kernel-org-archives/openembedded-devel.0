Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id B28B1601A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 15:09:11 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7FF9BfX001069 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:09:11 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014081510091178-1159409 ;
	Fri, 15 Aug 2014 10:09:11 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Aug 2014 10:09:03 -0500
Message-Id: <1408115343-23151-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/15/2014 10:09:11 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/15/2014 10:09:11 AM,
	Serialize complete at 08/15/2014 10:09:11 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-15_04:2014-08-15, 2014-08-15,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH] mg: fix build when host system does not have libncurses-dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Aug 2014 15:09:18 -0000

The configure script for mg checks the standard locations under /usr for
the term.h header file needed to build against ncurses; however, in the
OE cross-compile case, this is not valid, since the file will be under
the sysroot instead.  This causes the configure step to fail when the
build machine does not have the libncurses-dev package installed.

To fix the issue, remove the check.  Since mg DEPENDS on ncurses, term.h
will always be there.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
NOTE: I tried updating the recipe to the newest version of mg, but the way it's
built has changed quite a bit, and I hit some build errors after a quick update
of the recipe.  I'd like to get some feedback on whether this patch is an OK
way to remove the check or whether there's a better way to do it.  Thanks!

 .../mg/files/remove_ncurses_check.patch            | 36 ++++++++++++++++++++++
 meta-oe/recipes-support/mg/mg_20110905.bb          |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/mg/files/remove_ncurses_check.patch

diff --git a/meta-oe/recipes-support/mg/files/remove_ncurses_check.patch b/meta-oe/recipes-support/mg/files/remove_ncurses_check.patch
new file mode 100644
index 0000000..16137da
--- /dev/null
+++ b/meta-oe/recipes-support/mg/files/remove_ncurses_check.patch
@@ -0,0 +1,36 @@
+diff -uwr mg-20110905/configure mg-20110905-changed/configure
+--- mg-20110905/configure	2011-09-05 13:36:16.000000000 -0500
++++ mg-20110905-changed/configure	2014-08-14 10:46:14.168715425 -0500
+@@ -163,32 +163,6 @@
+     echo 'Fails.'
+ fi
+ 
+-
+-if [ ! -r /usr/include/term.h ]; then
+-    note 'term.h'
+-    if [ -r /usr/include/ncurses/term.h ]; then
+-	echo "Found in /usr/include/ncurses"
+-	extraflags="$extraflags -I/usr/include/ncurses"
+-    else
+-	for i in pkg local; do
+-	    if [ -r /usr/$i/include/term.h ]; then
+-		echo "Found in /usr/$i/include"
+-		extralibs="$extralibs -L/usr/$i/lib"
+-		extraflags="$extraflags -I/usr/$i/include"
+-		break
+-	    else
+-		false
+-	    fi
+-	done ||
+-	{
+-	    echo 'Not found!' >&2
+-	    echo 'Do you have the ncurses devel package installed?' >&2
+-	    echo 'If you know where term.h is, please email the author!' >&2
+-	    exit 1
+-	}
+-    fi
+-fi
+-
+ note 'base and dirname'
+ if gcc_defines "__GLIBC__" || gcc_defines "__CYGWIN__" ; then
+     echo 'Not present, adding.'
diff --git a/meta-oe/recipes-support/mg/mg_20110905.bb b/meta-oe/recipes-support/mg/mg_20110905.bb
index 33cc038..b9a4d33 100644
--- a/meta-oe/recipes-support/mg/mg_20110905.bb
+++ b/meta-oe/recipes-support/mg/mg_20110905.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://version.c;md5=811e1b67a5cd60c12b218a2b7c1adbf2"
 DEPENDS = "ncurses"
 SECTION = "console/editors"
 
-SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz"
+SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz \
+           file://remove_ncurses_check.patch"
 
 SRC_URI[md5sum] = "2de35316fa8ebafe6003efaae70b723e"
 SRC_URI[sha256sum] = "1cd37d7e6a3eecc890a5718c38b8f38495057ba93856762a756ccee2f9618229"
-- 
2.0.4


