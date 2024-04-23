Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C248FC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 10:53:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.15509.1713869623857935772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Apr 2024 03:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ar/oKaB6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240423105340ac2ea428d55a76fcab-wydsf0@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240423105340ac2ea428d55a76fcab
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 23 Apr 2024 12:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=heZ6QXVzwp1WeEaRVwVxzVAkGn2WO1c1EU544/WLZBI=;
 b=Ar/oKaB62LMARIJHvE6VdKzxMpawwELbXI8c/NQ/pHApBcgcaigfzVCL4+q1E9Ed43auTP
 Gy5pgx4E7Ji9lE4RtWMZsPLhDATU4pvjspco+TPLfPPwwDnRE5etl23U/kZbyb1YiRgGGnXN
 Wyjoj2qqHUTvvGtSpysu0lQ+2EgvE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][scarthgap][PATCH] soci: update build options
Date: Tue, 23 Apr 2024 12:52:33 +0200
Message-Id: <20240423105233.1307395-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 10:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110117

From: Peter Marko <peter.marko@siemens.com>

* make it possible to configure build without boost
* build tests only when requested
* disable build of IBM proprietary DB2 which does not have recipe
  (this creates some cmake warnings if enabled without dependency)
* EXTRA_OECONF is empty with cmake build
* remove SOCI_LIBDIR which was removed in upgrade to v4.0.2
* use WITH_* instedad of SOCI_* as SOCI defines still search
  for dependencies unnecessarily and WITH define automatically
  enables SOCI define, too

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-dbs/soci/soci_4.0.3.bb | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
index 25d67ff8b..315f5d515 100644
--- a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://soci.sourceforge.net"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SECTION = "libs"
-DEPENDS = "boost"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
            file://0001-Do-not-use-std-shuffle-with-clang-15.patch \
@@ -18,20 +17,20 @@ OBASEDIR ?= "/opt/oracle"
 OINCDIR = "rdbms/public"
 OLIBDIR = "lib"
 
-PACKAGECONFIG[sqlite3] = "-DSOCI_SQLITE3=ON,-DSOCI_SQLITE3=OFF,sqlite3,"
-PACKAGECONFIG[mysql] = "-DSOCI_MYSQL=ON,-DSOCI_MYSQL=OFF,mariadb,"
-PACKAGECONFIG[postgresql] = "-DSOCI_POSTGRESQL=ON,-DSOCI_POSTGRESQL=OFF,postgresql,"
-PACKAGECONFIG[odbc] = "-DSOCI_ODBC=ON,-DSOCI_ODBC=OFF,,"
+PACKAGECONFIG[sqlite3] = "-DWITH_SQLITE3=ON,-DWITH_SQLITE3=OFF,sqlite3,"
+PACKAGECONFIG[mysql] = "-DWITH_MYSQL=ON,-DWITH_MYSQL=OFF,mariadb,"
+PACKAGECONFIG[postgresql] = "-DWITH_POSTGRESQL=ON,-DWITH_POSTGRESQL=OFF,postgresql,"
+PACKAGECONFIG[odbc] = "-DWITH_ODBC=ON,-DWITH_ODBC=OFF,,"
 PACKAGECONFIG[empty] = "-DSOCI_EMPTY=ON,-DSOCI_EMPTY=OFF,,"
 PACKAGECONFIG[oracle] = "-DWITH_ORACLE=ON --with-oracle-include=${OINCDIR} --with-oracle-lib=${OLIBDIR},-DWITH_ORACLE=OFF,,"
 PACKAGECONFIG[firebird] = "-DWITH_FIREBIRD=ON,-DWITH_FIREBIRD=OFF,,"
-PACKAGECONFIG[ptest] = "${TESTCONFIG},,,"
+PACKAGECONFIG[boost] = "-DWITH_BOOST=ON,-DWITH_BOOST=OFF,boost"
+PACKAGECONFIG[ptest] = "${TESTCONFIG},-DSOCI_TESTS=OFF,,"
 
 # enable your backend by default we enable 'empty'
-PACKAGECONFIG ??= "empty"
+PACKAGECONFIG ??= "boost empty"
 
-# Take the flags added by PACKAGECONFIG and pass them to cmake.
-EXTRA_OECMAKE = "${EXTRA_OECONF} -DSOCI_LIBDIR=${libdir}"
+EXTRA_OECMAKE = "-DWITH_DB2=OFF"
 DISABLE_STATIC = ""
 
 inherit dos2unix cmake
-- 
2.30.2


