Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D4EC52D7F
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 07:20:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.92571.1723620008102710710
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 00:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=895659f41f=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E56D1g029574
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 00:20:07 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 410ncf04g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 00:20:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 00:20:05 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 00:20:03 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libosinfo: add runtime dependency osinfo-db
Date: Wed, 14 Aug 2024 15:20:02 +0800
Message-ID: <20240814072002.2946758-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7GRAtmvETKqcdyGaVPzHGruJIh3QYDtv
X-Proofpoint-GUID: 7GRAtmvETKqcdyGaVPzHGruJIh3QYDtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408140050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 07:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111798

From: Kai Kang <kai.kang@windriver.com>

osinfo-db is required by libosinfo to list os info. So add the recipes
osinfo-db and its dependency osinfo-db-tools-native. Then add osinfo-db
to RDEPENDS of libosinfo.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libosinfo/libosinfo_1.11.0.bb             |  2 +-
 .../0001-Make-xmlError-structs-constant.patch | 56 +++++++++++++++++++
 .../libosinfo/osinfo-db-tools_1.11.0.bb       | 18 ++++++
 .../libosinfo/osinfo-db_20240701.bb           | 21 +++++++
 4 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch
 create mode 100644 meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.11.0.bb
 create mode 100644 meta-oe/recipes-support/libosinfo/osinfo-db_20240701.bb

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
index 8ef7ac3df..727d5ecf8 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
@@ -32,4 +32,4 @@ EXTRA_OEMESON += " \
 	-Dwith-usb-ids-path=${datadir}/hwdata/usb.ids \
 "
 
-RDEPENDS:${PN} = "hwdata"
+RDEPENDS:${PN} = "hwdata osinfo-db"
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch b/meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch
new file mode 100644
index 000000000..edff5732c
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Backport [https://gitlab.com/libosinfo/osinfo-db-tools/-/commit/34378a4]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 34378a4ac257f2f5fcf364786d1634a8c36b304f Mon Sep 17 00:00:00 2001
+From: Michal Privoznik <mprivozn@redhat.com>
+Date: Mon, 27 Nov 2023 15:04:43 +0100
+Subject: [PATCH] Make xmlError structs constant
+
+In libxml2 commits v2.12.0~14 and v2.12.0~77 the API changed so
+that:
+
+1) xmlGetLastError() returns pointer to a constant xmlError
+   struct, and
+
+2) xmlSetStructuredErrorFunc() changed the signature of callback
+   (validate_structured_error_nop()), it too is passed pointer to
+   a constant xmlError struct.
+
+But of course, older libxml2 expects different callback
+signature. Therefore, we need to typecast it anyway.
+
+Also, drop obviously incorrect @error annotation in
+validate_structured_error_nop; the variable is used.
+
+Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
+---
+ tools/osinfo-db-validate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/tools/osinfo-db-validate.c b/tools/osinfo-db-validate.c
+index a721b4d..b1434a6 100644
+--- a/tools/osinfo-db-validate.c
++++ b/tools/osinfo-db-validate.c
+@@ -35,7 +35,7 @@ static void validate_generic_error_nop(void *userData G_GNUC_UNUSED,
+ }
+ 
+ static void validate_structured_error_nop(void *userData G_GNUC_UNUSED,
+-                                          xmlErrorPtr error G_GNUC_UNUSED)
++                                          const xmlError *error)
+ {
+     if (error->file)
+         g_printerr("%s:%d %s", error->file, error->line, error->message);
+@@ -173,7 +173,8 @@ static gboolean validate_files(GFile *schema, gsize nfiles, GFile **files, GErro
+     g_autofree gchar *schemapath = NULL;
+ 
+     xmlSetGenericErrorFunc(NULL, validate_generic_error_nop);
+-    xmlSetStructuredErrorFunc(NULL, validate_structured_error_nop);
++    /* Drop this typecast when >=libxml2-2.12.0 is required */
++    xmlSetStructuredErrorFunc(NULL, (xmlStructuredErrorFunc) validate_structured_error_nop);
+ 
+     schemapath = g_file_get_path(schema);
+     rngParser = xmlRelaxNGNewParserCtxt(schemapath);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.11.0.bb b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.11.0.bb
new file mode 100644
index 000000000..0584bee15
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.11.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Tools for managing the libosinfo database files"
+HOMEPAGE = "https://libosinfo.org"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "glib-2.0 json-glib libarchive libsoup-2.4"
+
+SRC_URI = "git://gitlab.com/libosinfo/osinfo-db-tools.git;branch=main;protocol=https \
+           file://0001-Make-xmlError-structs-constant.patch \
+           "
+SRCREV = "85a1788c6977419b6facad11dbfbf823e739eb3b"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20240701.bb b/meta-oe/recipes-support/libosinfo/osinfo-db_20240701.bb
new file mode 100644
index 000000000..d36904605
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20240701.bb
@@ -0,0 +1,21 @@
+SUMMARY = "osinfo-db provides the database files for use with the libosinfo library"
+HOMEPAGE = "https://libosinfo.org"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "osinfo-db-tools-native"
+
+SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https"
+
+SRCREV = "cde78484ab747c87532d47cf3f09b76f280c0b74"
+
+S = "${WORKDIR}/git"
+
+inherit allarch autotools-brokensep
+
+EXTRA_OEMAKE = "OSINFO_DB_TARGET='--dir ${datadir}/osinfo'"
+
+do_configure[noexec] = "1"
+
+FILES:${PN} = "${datadir}/osinfo"
-- 
2.34.1


