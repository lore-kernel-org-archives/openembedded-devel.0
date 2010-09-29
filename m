Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P13V1-0001k9-2W
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:43:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 31F3C3148E51
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 22:37:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dvWUa5SsKRCy; Wed, 29 Sep 2010 22:37:19 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 156C03148E33;
	Wed, 29 Sep 2010 22:37:11 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 29 Sep 2010 20:37:11 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 20:36:30 +0000
Message-Id: <1285792594-10032-15-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 14/18] cdparanoia: create libcdparanoia packages
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
X-List-Received-Date: Wed, 29 Sep 2010 20:43:58 -0000

* Create separate packages for the libraries, which
  use a different license than the executable:

"The cdparanoia command line tool versions 10.1 and later are
 distributed under the GNU General Public Licence v2.0 or, at your
 option, any later version of the GPL."

"The 10.1 and later release versions of the cdda-interface and
 cdda-paranoia libraries are distributed the GNU Lesser General Public
 License v2.1 or, at your option, any later version of the GNU LGPL."

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/cdparanoia/cdparanoia_10.2.bb |   14 ++++++++++++++
 recipes/cdparanoia/cdparanoia_svn.bb  |   15 ++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/recipes/cdparanoia/cdparanoia_10.2.bb b/recipes/cdparanoia/cdparanoia_10.2.bb
index 7bb6035..894c038 100644
--- a/recipes/cdparanoia/cdparanoia_10.2.bb
+++ b/recipes/cdparanoia/cdparanoia_10.2.bb
@@ -2,6 +2,7 @@
 # Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 LICENSE = "GPL"
+PR = "r1"
 
 SRC_URI = "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-10.2.src.tgz \
          file://fixes10.patch \
@@ -17,6 +18,19 @@ S = "${WORKDIR}/cdparanoia-III-10.2"
 
 inherit autotools
 
+PACKAGES += "libcdparanoia libcdparanoia-dev libcdparanoia-static"
+
+LICENSE_libcdparanoia = "LGPLv2.1"
+LICENSE_libcdparanoia-dev = "LGPLv2.1"
+LICENSE_libcdparanoia-static = "LGPLv2.1"
+
+FILES_${PN} = "${bindir}/*"
+FILES_${PN}-dev = ""
+FILES_${PN}-static = ""
+FILES_libcdparanoia = "${libdir}/lib*${SOLIBS}"
+FILES_libcdparanoia-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV}"
+FILES_libcdparanoia-static = "${libdir}/*.a"
+
 do_install() {
         oe_runmake BINDIR="${D}/usr/bin" MANDIR="${D}/usr/share/man/" \
                    INCLUDEDIR="${D}/usr/include/" LIBDIR="${D}/usr/lib" install
diff --git a/recipes/cdparanoia/cdparanoia_svn.bb b/recipes/cdparanoia/cdparanoia_svn.bb
index 0f81d6c..5610450 100644
--- a/recipes/cdparanoia/cdparanoia_svn.bb
+++ b/recipes/cdparanoia/cdparanoia_svn.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-PR = "r2"
+PR = "r3"
 LICENSE = "GPL"
 
 PV = "10.2+svnr${SRCPV}"
@@ -21,6 +21,19 @@ PARALLEL_MAKE = ""
 
 inherit autotools
 
+PACKAGES += "libcdparanoia libcdparanoia-dev libcdparanoia-static"
+
+LICENSE_libcdparanoia = "LGPLv2.1"
+LICENSE_libcdparanoia-dev = "LGPLv2.1"
+LICENSE_libcdparanoia-static = "LGPLv2.1"
+
+FILES_${PN} = "${bindir}/*"
+FILES_${PN}-dev = ""
+FILES_${PN}-static = ""
+FILES_libcdparanoia = "${libdir}/lib*${SOLIBS}"
+FILES_libcdparanoia-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV}"
+FILES_libcdparanoia-static = "${libdir}/*.a"
+
 do_install() {
 	oe_runmake BINDIR="${D}/usr/bin" MANDIR="${D}/usr/share/man/" \
 		   INCLUDEDIR="${D}/usr/include/" LIBDIR="${D}/usr/lib" install
-- 
1.7.1



