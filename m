Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BADC369A1
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:55:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9336.1727247326930571486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9998bdcc2c=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P6AcvT014623
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:55:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41umbvsk5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:55:26 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 23:55:24 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] mariadb: Upgrade to 10.11.9 release
Date: Wed, 25 Sep 2024 06:55:03 +0000
Message-ID: <20240925065503.3061053-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=TKoXSEla c=1 sm=1 tr=0 ts=66f3b3de cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=hkEv4HZQAAAA:8
 a=NEAV23lmAAAA:8 a=GHR8O2WEAAAA:20 a=tr2HHG5EM1JgrrMhvTMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=NA03pvyaApPJG5valX87:22
X-Proofpoint-ORIG-GUID: -ShYIN25HbAhO1mGxFIPAqxScRJGsv_V
X-Proofpoint-GUID: -ShYIN25HbAhO1mGxFIPAqxScRJGsv_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409250048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48P6AcvT014623
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112493

From: Khem Raj <raj.khem@gmail.com>

Drop upstreamed patches
Fixes build with fmt11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...e_10.11.7.bb =3D> mariadb-native_10.11.9.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   4 +-
 ...EV-33439-Fix-build-with-libxml2-2.12.patch | 170 ------------------
 ...Remove-the-compile_time_assert-lines.patch |  43 -----
 ...{mariadb_10.11.7.bb =3D> mariadb_10.11.9.bb} |   0
 5 files changed, 1 insertion(+), 216 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.7.bb =3D> mariadb=
-native_10.11.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix=
-build-with-libxml2-2.12.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-com=
pile_time_assert-lines.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.7.bb =3D> mariadb_10.11.=
9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb b/meta-o=
e/recipes-dbs/mysql/mariadb-native_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 33da32fb2..f52947f35 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,11 +23,9 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/=
${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.pat=
ch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://0001-Remove-the-compile_time_assert-lines.patch \
-           file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \
           "
 SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] =3D "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076=
b6ffe258110e5157"
+SRC_URI[sha256sum] =3D "0a00180864cd016187c986faab8010de23a117b9a75f91d6=
456421f894e48d20"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-=
with-libxml2-2.12.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-334=
39-Fix-build-with-libxml2-2.12.patch
deleted file mode 100644
index 3e42535da..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-li=
bxml2-2.12.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From dae52f5916ef59434c93f0b716270f59dd0c3a94 Mon Sep 17 00:00:00 2001
-From: Jan Tojnar <jtojnar@gmail.com>
-Date: Sun, 7 Jan 2024 10:19:54 +0100
-Subject: [PATCH] MDEV-33439 Fix build with libxml2 2.12
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-libxml2 2.12.0 made `xmlGetLastError()` return `const` pointer:
-
-https://gitlab.gnome.org/GNOME/libxml2/-/commit/61034116d0a3c8b295c61379=
56adc3ae55720711
-
-Clang 16 does not like this:
-
-    error: assigning to 'xmlErrorPtr' (aka '_xmlError *') from 'const xm=
lError *' (aka 'const _xmlError *') discards qualifiers
-    error: cannot initialize a variable of type 'xmlErrorPtr' (aka '_xml=
Error *') with an rvalue of type 'const xmlError *' (aka 'const _xmlError=
 *')
-
-Let=E2=80=99s update the variables to `const`.
-For older versions, it will be automatically converted.
-
-But then `xmlResetError(xmlError*)` will not like the `const` pointer:
-
-    error: no matching function for call to 'xmlResetError'
-    note: candidate function not viable: 1st argument ('const xmlError *=
' (aka 'const _xmlError *')) would lose const qualifier
-
-Let=E2=80=99s replace it with `xmlResetLastError()`.
-
-ALso remove `LIBXMLDOC::Xerr` protected member property.
-It was introduced in 65b0e5455b547a3d574fa77b34cce23ae3bea0a0
-along with the `xmlResetError` calls.
-It does not appear to be used for anything.
-
-Upstream-Status: Backport [https://github.com/MariaDB/server/pull/2983]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- storage/connect/libdoc.cpp | 39 +++++++++++++++++++-------------------
- 1 file changed, 19 insertions(+), 20 deletions(-)
-
-diff --git a/storage/connect/libdoc.cpp b/storage/connect/libdoc.cpp
-index 67f22ce2..ab588dd4 100644
---- a/storage/connect/libdoc.cpp
-+++ b/storage/connect/libdoc.cpp
-@@ -93,7 +93,6 @@ class LIBXMLDOC : public XMLDOCUMENT {
-   xmlXPathContextPtr Ctxp;
-   xmlXPathObjectPtr  Xop;
-   xmlXPathObjectPtr  NlXop;
--  xmlErrorPtr        Xerr;
-   char              *Buf;                  // Temporary
-   bool               Nofreelist;
- }; // end of class LIBXMLDOC
-@@ -327,7 +326,6 @@ LIBXMLDOC::LIBXMLDOC(char *nsl, char *nsdf, char *en=
c, PFBLOCK fp)
-   Ctxp =3D NULL;
-   Xop =3D NULL;
-   NlXop =3D NULL;
--  Xerr =3D NULL;
-   Buf =3D NULL;
-   Nofreelist =3D false;
-   } // end of LIBXMLDOC constructor
-@@ -365,8 +363,8 @@ bool LIBXMLDOC::ParseFile(PGLOBAL g, char *fn)
-       Encoding =3D (char*)Docp->encoding;
-=20
-     return false;
--  } else if ((Xerr =3D xmlGetLastError()))
--    xmlResetError(Xerr);
-+  } else if (xmlGetLastError())
-+    xmlResetLastError();
-=20
-   return true;
-   } // end of ParseFile
-@@ -505,9 +503,9 @@ int LIBXMLDOC::DumpDoc(PGLOBAL g, char *ofn)
- #if 1
-   // This function does not crash (
-   if (xmlSaveFormatFileEnc((const char *)ofn, Docp, Encoding, 0) < 0) {
--    xmlErrorPtr err =3D xmlGetLastError();
-+    const xmlError *err =3D xmlGetLastError();
-     strcpy(g->Message, (err) ? err->message : "Error saving XML doc");
--    xmlResetError(Xerr);
-+    xmlResetLastError();
-     rc =3D -1;
-     } // endif Save
- //  rc =3D xmlDocDump(of, Docp);
-@@ -546,8 +544,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (Nlist) {
-       xmlXPathFreeNodeSet(Nlist);
-=20
--      if ((Xerr =3D xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
-=20
-       Nlist =3D NULL;
-       } // endif Nlist
-@@ -555,8 +553,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (Xop) {
-       xmlXPathFreeObject(Xop);
-=20
--      if ((Xerr =3D xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
-=20
-       Xop =3D NULL;
-       } // endif Xop
-@@ -564,8 +562,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (NlXop) {
-       xmlXPathFreeObject(NlXop);
-=20
--      if ((Xerr =3D xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
-=20
-       NlXop =3D NULL;
-       } // endif NlXop
-@@ -573,8 +571,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (Ctxp) {
-       xmlXPathFreeContext(Ctxp);
-=20
--      if ((Xerr =3D xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
-=20
-       Ctxp =3D NULL;
-       } // endif Ctxp
-@@ -590,6 +588,7 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
- /******************************************************************/
- xmlNodeSetPtr LIBXMLDOC::GetNodeList(PGLOBAL g, xmlNodePtr np, char *xp=
)
-   {
-+  const xmlError *xerr;
-   xmlNodeSetPtr nl;
-=20
-   if (trace(1))
-@@ -649,11 +648,11 @@ xmlNodeSetPtr LIBXMLDOC::GetNodeList(PGLOBAL g, xm=
lNodePtr np, char *xp)
-     } else
-       xmlXPathFreeObject(Xop);            // Caused node not found
-=20
--    if ((Xerr =3D xmlGetLastError())) {
--      strcpy(g->Message, Xerr->message);
--      xmlResetError(Xerr);
-+    if ((xerr =3D xmlGetLastError())) {
-+      strcpy(g->Message, xerr->message);
-+      xmlResetLastError();
-       return NULL;
--      } // endif Xerr
-+      } // endif xerr
-=20
-     } // endif Xop
-=20
-@@ -1079,7 +1078,7 @@ void XML2NODE::AddText(PGLOBAL g, PCSZ txtp)
- /******************************************************************/
- void XML2NODE::DeleteChild(PGLOBAL g, PXNODE dnp)
-   {
--  xmlErrorPtr xerr;
-+  const xmlError *xerr;
-=20
-   if (trace(1))
-     htrc("DeleteChild: node=3D%p\n", dnp);
-@@ -1122,7 +1121,7 @@ void XML2NODE::DeleteChild(PGLOBAL g, PXNODE dnp)
-   if (trace(1))
-     htrc("DeleteChild: errmsg=3D%-.256s\n", xerr->message);
-=20
--  xmlResetError(xerr);
-+  xmlResetLastError();
-   } // end of DeleteChild
-=20
- /* -------------------- class XML2NODELIST ---------------------- */
---=20
-2.44.0
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_ti=
me_assert-lines.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the=
-compile_time_assert-lines.patch
deleted file mode 100644
index 9a6e28297..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_asse=
rt-lines.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From cc5f1d0759b367265a1a000287e2ec15c31eb518 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 26 Feb 2024 14:56:02 +0800
-Subject: [PATCH] Remove the compile_time_assert lines
-
-Remove the problematic compile_time_assert lines to fix the below build
-failure on 32-bit arm.
- In file included from TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linu=
x-gnueabi/mariadb/10.11.7/mariadb-10.11.7/tests/mysql_client_test.c:38:
- TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.1=
1.7/mariadb-10.11.7/tests/mysql_client_fw.c:1438:3: error: 'compile_time_=
assert' declared as an array with a negative size
-  1438 |   compile_time_assert(sizeof(MYSQL) =3D=3D 77*sizeof(void*)+656=
);
-       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Inappropriate [Upstream will bring the asset back
-                                in a new way [1]]
-[1] https://jira.mariadb.org/browse/MDEV-33429
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/mysql_client_fw.c | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/tests/mysql_client_fw.c b/tests/mysql_client_fw.c
-index c9e64678..5c0c7ce2 100644
---- a/tests/mysql_client_fw.c
-+++ b/tests/mysql_client_fw.c
-@@ -1430,14 +1430,6 @@ int main(int argc, char **argv)
-     tests_to_run[i]=3D NULL;
-   }
-=20
--#ifdef _WIN32
--  /* must be the same in C/C and embedded, 1208 on 64bit, 968 on 32bit =
*/
--  compile_time_assert(sizeof(MYSQL) =3D=3D 60*sizeof(void*)+728);
--#else
--  /* must be the same in C/C and embedded, 1272 on 64bit, 964 on 32bit =
*/
--  compile_time_assert(sizeof(MYSQL) =3D=3D 77*sizeof(void*)+656);
--#endif
--
-   if (mysql_server_init(embedded_server_arg_count,
-                         embedded_server_args,
-                         (char**) embedded_server_groups))
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
--=20
2.40.0


