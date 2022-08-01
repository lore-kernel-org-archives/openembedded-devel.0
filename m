Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CA5C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 09:04:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.22535.1659344676517638782
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 02:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=T8vsC/m0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5212b3a2f3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2717qTXT022681
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Aug 2022 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=C1axMADhnMwW5mKI6tqzY9dZ5cApIvKqayZueE3fT6E=;
 b=T8vsC/m0EYRv0h6nBQXxm8c8T0OHHVzjLztasNpBi8BeRCdqB7pbvoip4dPsTLYpRHO8
 twTeJ51FyBxIOJ6hROlDjYHCYxo7G9iFutJrrLCxWOv9YOXcOey77F2SpEKrv0r3sMiX
 8szsGseSOPAAVRyVlXbvqEJgvY20svaAfRQ81F+AeV/OGF91MAP7SFf/ShGD+PY511Ct
 ejNjbHGtQTYrXU8zYDKMjz1jCr8g2XTJJuPYFkVfnirUdi7iapuXtkh6V+3fJhm6MtEl
 WVHrkc1GyGikgTWwrHtIuc1vVKeikW8hAhuKfhEJuobezGOnRJMfqU6jaytDoCl691dc 2g==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmsv21d75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 09:04:35 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Aug 2022 02:04:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 1 Aug 2022 02:04:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] postgresql: Fix the buildpaths issue
Date: Mon, 1 Aug 2022 17:04:32 +0800
Message-ID: <20220801090432.2009189-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9gtY1v-QUKopcWJhmiwRTSrqqQnyKUQg
X-Proofpoint-ORIG-GUID: 9gtY1v-QUKopcWJhmiwRTSrqqQnyKUQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_05,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Aug 2022 09:04:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98071

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/bin/postgres in package postgresql contains reference to TMPDIR
  File /usr/bin/pg_config in package postgresql contains reference to TMPDIR [buildpaths]
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/include/pg_config.h in package libpq-dev contains reference to TMPDIR [buildpaths]
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/include/postgresql/server/pg_config.h in package postgresql-server-dev contains reference to TMPDIR
  File /usr/lib/postgresql/pgxs/src/Makefile.global in package postgresql-server-dev contains reference to TMPDIR [buildpaths]
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/lib/libpgcommon.a in package postgresql-staticdev contains reference to TMPDIR
  File /usr/lib/libpgcommon_shlib.a in package postgresql-staticdev contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-config_info.c-not-expose-build-info.patch | 110 ++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc |   8 ++
 .../recipes-dbs/postgresql/postgresql_14.4.bb |   1 +
 3 files changed, 119 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
new file mode 100644
index 000000000..101a74877
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
@@ -0,0 +1,110 @@
+From b92eebe8b0760fee7bd55c6c22318620c2c07579 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 1 Aug 2022 15:44:38 +0800
+Subject: [PATCH] config_info.c: not expose build info
+
+Don't collect the build information to fix the buildpaths issue.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.ac             |  2 +-
+ src/common/config_info.c | 68 ----------------------------------------
+ 2 files changed, 1 insertion(+), 69 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0eb595b..508487b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
+ AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
+ AC_CONFIG_AUX_DIR(config)
+ AC_PREFIX_DEFAULT(/usr/local/pgsql)
+-AC_DEFINE_UNQUOTED(CONFIGURE_ARGS, ["$ac_configure_args"], [Saved arguments from configure])
++AC_DEFINE_UNQUOTED(CONFIGURE_ARGS, ["ac_configure_args"], [Saved arguments from configure])
+ 
+ [PG_MAJORVERSION=`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
+ [PG_MINORVERSION=`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
+diff --git a/src/common/config_info.c b/src/common/config_info.c
+index e72e729..b482c20 100644
+--- a/src/common/config_info.c
++++ b/src/common/config_info.c
+@@ -123,74 +123,6 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
+ 	configdata[i].setting = pstrdup(path);
+ 	i++;
+ 
+-	configdata[i].name = pstrdup("CONFIGURE");
+-	configdata[i].setting = pstrdup(CONFIGURE_ARGS);
+-	i++;
+-
+-	configdata[i].name = pstrdup("CC");
+-#ifdef VAL_CC
+-	configdata[i].setting = pstrdup(VAL_CC);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("CPPFLAGS");
+-#ifdef VAL_CPPFLAGS
+-	configdata[i].setting = pstrdup(VAL_CPPFLAGS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("CFLAGS");
+-#ifdef VAL_CFLAGS
+-	configdata[i].setting = pstrdup(VAL_CFLAGS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("CFLAGS_SL");
+-#ifdef VAL_CFLAGS_SL
+-	configdata[i].setting = pstrdup(VAL_CFLAGS_SL);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LDFLAGS");
+-#ifdef VAL_LDFLAGS
+-	configdata[i].setting = pstrdup(VAL_LDFLAGS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LDFLAGS_EX");
+-#ifdef VAL_LDFLAGS_EX
+-	configdata[i].setting = pstrdup(VAL_LDFLAGS_EX);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LDFLAGS_SL");
+-#ifdef VAL_LDFLAGS_SL
+-	configdata[i].setting = pstrdup(VAL_LDFLAGS_SL);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LIBS");
+-#ifdef VAL_LIBS
+-	configdata[i].setting = pstrdup(VAL_LIBS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+ 	configdata[i].name = pstrdup("VERSION");
+ 	configdata[i].setting = pstrdup("PostgreSQL " PG_VERSION);
+ 	i++;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 00c010746..bef33e6bb 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -215,6 +215,14 @@ do_install:append() {
     install -m 0644 ${WORKDIR}/postgresql.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@BINDIR@,${bindir},g' \
         ${D}${systemd_unitdir}/system/postgresql.service
+    # Remove the build path
+    if [ -f ${D}${libdir}/${BPN}/pgxs/src/Makefile.global ]; then
+        sed -i -e 's#${RECIPE_SYSROOT}##g' \
+               -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
+               -e 's#${WORKDIR}##g' \
+               -e 's#${TMPDIR}##g' \
+             ${D}${libdir}/${BPN}/pgxs/src/Makefile.global
+    fi
 }
 
 SSTATE_SCAN_FILES += "Makefile.global"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
index 64e83b2cd..1daab22f9 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
@@ -8,6 +8,7 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://remove_duplicate.patch \
+   file://0001-config_info.c-not-expose-build-info.patch \
 "
 
 SRC_URI[sha256sum] = "c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a"
-- 
2.25.1


