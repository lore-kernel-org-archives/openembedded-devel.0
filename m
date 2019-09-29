Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 754647E467
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:24:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8T3Ofv0011913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 20:24:41 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 20:24:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 11:24:43 +0800
Message-ID: <a375d82d5287417286d50ebbfb3d6d2b386731cd.1569727253.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569727253.git.liezhi.yang@windriver.com>
References: <cover.1569727253.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] net-snmp: Fix PACKAGECONFIG for perl
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
X-List-Received-Date: Sun, 29 Sep 2019 03:24:40 -0000
Content-Type: text/plain

* Remove perl-lib since it had been removed by oe-core:
  commit 68552c353255188de3d5b42135360a30e7eac535
  Author: Alexander Kanavin <alex.kanavin@gmail.com>
  Date:   Sun Dec 2 12:46:37 2018 +0100

      perl: remove the previous version of the recipe

  Now the files are in perl pacakge.

* Fix perl paths when perl is enabled.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 60b2b38..192b6b5 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
 
 PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no,\
-                       perl, perl perl-lib"
+                       perl,"
 PACKAGECONFIG[des] = "--enable-des,--disable-des"
 
 EXTRA_OECONF = "--enable-shared \
@@ -88,8 +88,8 @@ do_configure_prepend() {
 
     if [ "${HAS_PERL}" = "1" ]; then
         # this may need to be changed when package perl has any change.
-        cp -f ${STAGING_DIR_TARGET}/usr/lib*/perl/*/Config.pm ${WORKDIR}/
-        cp -f ${STAGING_DIR_TARGET}/usr/lib*/perl/*/Config_heavy.pl ${WORKDIR}/
+        cp -f ${STAGING_DIR_TARGET}/usr/lib*/perl?/*/Config.pm ${WORKDIR}/
+        cp -f ${STAGING_DIR_TARGET}/usr/lib*/perl?/*/*/Config_heavy.pl ${WORKDIR}/
         sed -e "s@libpth => '/usr/lib.*@libpth => '${STAGING_DIR_TARGET}/${libdir} ${STAGING_DIR_TARGET}/${base_libdir}',@g" \
             -e "s@privlibexp => '/usr@privlibexp => '${STAGING_DIR_TARGET}/usr@g" \
             -e "s@scriptdir => '/usr@scriptdir => '${STAGING_DIR_TARGET}/usr@g" \
@@ -190,7 +190,8 @@ ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-server = "1"
 ALLOW_EMPTY_${PN}-libs = "1"
 
-FILES_${PN}-perl-modules = "${libdir}/perl/*"
+FILES_${PN}-perl-modules = "${libdir}/perl?/*"
+RDEPENDS_${PN}-perl-modules = "perl"
 
 FILES_${PN}-libs = ""
 FILES_${PN}-mibs = "${datadir}/snmp/mibs"
-- 
2.7.4


