Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.6258.1600144218717107005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 21:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.196, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6BB0BE0005;
	Tue, 15 Sep 2020 04:30:14 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.4
Date: Mon, 14 Sep 2020 21:29:43 -0700
Message-Id: <20200915042943.1192873-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

createlang, droplang, and the tsearch2 module were all removed in the
10.0 release. More details are in the release notes:
https://www.postgresql.org/docs/10/release-10.html

The update from 12.3 to 12.4 is a minor release with bug and security
fixes:
https://www.postgresql.org/docs/current/release-12-4.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc                 | 4 +---
 .../postgresql/{postgresql_12.3.bb => postgresql_12.4.bb}     | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.3.bb => postgresql_12.4.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 5b20098a7..5b5bfb088 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -247,10 +247,8 @@ FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
 
 FILES_${PN}-client = "${bindir}/clusterdb \
     ${bindir}/createdb \
-    ${bindir}/createlang \
     ${bindir}/createuser \
     ${bindir}/dropdb \
-    ${bindir}/droplang \
     ${bindir}/dropuser \
     ${bindir}/pg_dump \
     ${bindir}/pg_dumpall \
@@ -332,7 +330,7 @@ FILES_${PN}-contrib = " ${bindir}/oid2name ${bindir}/pg_standby \
     ${libdir}/${BPN}/sslinfo.so \
     ${libdir}/${BPN}/tablefunc.so \
     ${libdir}/${BPN}/test_parser.so ${libdir}/${BPN}/timetravel.so \
-    ${libdir}/${BPN}/tsearch2.so ${libdir}/${BPN}/uuid-ossp.so \
+    ${libdir}/${BPN}/uuid-ossp.so \
     ${libdir}/${BPN}/pgxml.so ${libdir}/${BPN}/passwordcheck.so \
     ${libdir}/${BPN}/pg_upgrade_support.so ${libdir}/${BPN}/.so \
     ${libdir}/${BPN}/unaccent.so \
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb
index cc7e3ff52..6ea9acc00 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb
@@ -8,5 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[md5sum] = "a30c023dd7088e44d73be71af2ef404a"
-SRC_URI[sha256sum] = "94ed64a6179048190695c86ec707cc25d016056ce10fc9d229267d9a8f1dcf41"
+SRC_URI[sha256sum] = "bee93fbe2c32f59419cb162bcc0145c58da9a8644ee154a30b9a5ce47de606cc"
-- 
2.26.2

