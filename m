Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OPE8H-0002iJ-7L
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 14:23:46 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E22DD110009E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 14:19:16 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1B3F3110009B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 14:19:15 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225005141.adsl.alicedsl.de
	[92.225.5.141]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 14:19:15 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id EC2A73C134; Thu, 17 Jun 2010 14:19:13 +0200 (CEST)
Date: Thu, 17 Jun 2010 14:19:13 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100617121913.GA16207@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Proposal to remove libattr recipe
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
X-List-Received-Date: Thu, 17 Jun 2010 12:23:46 -0000
X-Groupsio-MsgNum: 20228
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

the libattr from xfsprogs clashes with the attr recipe from udev and I can
find any recipe which uses libattr, besides libcap2 which could use attr
from udev too. So my proposal is to remove the libattr recipe and switch
libcap2 to use attr from udev. Attached are the two patches, to do it.

I would like to see some ack's.

Bye Henning

--7JfCtLOvnd9MIVvH
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="libattr.patch"

From cd0071c89450f81df538107350065036b00f68a9 Mon Sep 17 00:00:00 2001
From: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Thu, 17 Jun 2010 10:24:01 +0200
Subject: [PATCH 2/2] libattr: remove libattr because it is clashing with attr from udev and not used by anyother recipe

---
 recipes/xfsprogs/libattr_2.4.43.bb |   30 ------------------------------
 1 files changed, 0 insertions(+), 30 deletions(-)
 delete mode 100644 recipes/xfsprogs/libattr_2.4.43.bb

diff --git a/recipes/xfsprogs/libattr_2.4.43.bb b/recipes/xfsprogs/libattr_2.4.43.bb
deleted file mode 100644
index cf846cc..0000000
--- a/recipes/xfsprogs/libattr_2.4.43.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "library functions to get attribute bits"
-HOMEPAGE = "http://oss.sgi.com/projects/xfs"
-LICENSE = "GPL"
-SECTION = "base"
-PR = "r0"
-DEPENDS = "gettext"
-
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/attr_${PV}-1.tar.gz"
-S = "${WORKDIR}/attr-${PV}"
-
-PARALLEL_MAKE = ""
-inherit autotools
-EXTRA_OECONF = "--enable-gettext=no --enable-shared=yes"
-
-do_configure () {
-	export LIBTOOL="${STAGING_BINDIR_NATIVE}/${HOST_SYS}-libtool"
-	export DEBUG="-DNDEBUG"
-	oe_runconf
-}
-
-do_install () {
-	export DIST_ROOT=${D}
-	oe_runmake install
-	oe_libinstall -a libattr ${D}${libdir}
-	oe_libinstall -a libattr ${STAGING_LIBDIR}
-}
-
-
-SRC_URI[md5sum] = "91583a14bcbd637adaa9b07ea49c5d4b"
-SRC_URI[sha256sum] = "d358b233b3e2ad235e63fd8697e337006fc7506844e424b0d9dd7a24affec5bf"
-- 
1.7.1


--7JfCtLOvnd9MIVvH
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="libcap2.patch"

From cbccc349878874c876958ca65b1cdbcb2176c0db Mon Sep 17 00:00:00 2001
From: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Thu, 17 Jun 2010 10:16:56 +0200
Subject: [PATCH 1/2] libcap2: use attr instead of libattr as dependency, fixes systemd

* convert to new staging system, by removing do_stage
---
 recipes/libcap/libcap2_2.16.bb |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16.bb
index ebcb981..947811b 100644
--- a/recipes/libcap/libcap2_2.16.bb
+++ b/recipes/libcap/libcap2_2.16.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Libcap is a library for getting and setting POSIX.1e (formerly PO
 PRIORITY = "optional"
 SECTION = "libs"
 LICENSE = "GPL"
-DEPENDS = "bison-native flex-native libattr"
+DEPENDS = "bison-native flex-native attr"
 PR = "r0"
 
 BUILD_CFLAGS += "-I${S}/libcap/include"
@@ -25,11 +25,5 @@ do_install() {
 	oe_libinstall -s -C libcap libcap ${D}${libdir}
 }
 
-do_stage() {
-	install -d ${STAGING_INCDIR}/sys
-	install -m 0644 libcap/include/sys/capability.h ${STAGING_INCDIR}/sys/
-	oe_libinstall -s -C libcap libcap ${STAGING_LIBDIR}
-}
-
 SRC_URI[md5sum] = "6e2c9d0f3c3118e41cd07288ba9577ce"
 SRC_URI[sha256sum] = "9c5a41a5577d6f702fe4d29e92f91f1d586a2ef272f6b7fa137bae3f0e76cc2f"
-- 
1.7.1


--7JfCtLOvnd9MIVvH--
