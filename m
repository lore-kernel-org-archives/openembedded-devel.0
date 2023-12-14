Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541E1C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:13:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18800.1702548831985281124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nJbxnG3x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=071226f55b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE6f8mA027953
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 02:13:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=q0YrF
	IINd4kCWwHR9bi+Cl/tDCZEtEIZfLFGDBHxYF8=; b=nJbxnG3xossZufxPzJtQi
	DTx1FVOEGbv4tWjgGL9Wfaar7sa9COlAv7D6jmVZi4YC0HF8sJZfPtn3qUPIDCc+
	venkfktEZTD98mDm1SZydHdwqWR5+YY/ie3KgpFRK/sti49bMB3vsmdTKWuuDcqN
	T/Tib1GUSbhfohXxghKR85KzeL7JdOTsVmtDW9ijcJWo8C4MH6pNteS1+TMj3dLi
	rTP0toyib0b0SckRG9QisNFWhrCJ1kWjOgR7LyQsgBAbPTxC8ZYhtSMdcsXiu6Q4
	iMA7Mb9xUh7n1/2MpGckwt88mJStKp4+0f1zDP0EKLW4tjqlDGYTBKchgRp8MFRf
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr9k0axr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 02:13:51 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 02:13:56 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 02:13:55 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.11.6
Date: Thu, 14 Dec 2023 18:13:49 +0800
Message-ID: <20231214101349.3413535-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GTabNA1CMY-lWJdgGbZC9hMz435Hzvk0
X-Proofpoint-GUID: GTabNA1CMY-lWJdgGbZC9hMz435Hzvk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 10:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107450

From: Mingli Yu <mingli.yu@windriver.com>

Remove one patch as the logic is included in the new version [1] [2].

Upgrade mariadb to 10.11.6 [3].

[1] https://github.com/MariaDB/server/commit/f4cec369a392c8a6056207012992ad4a5639965a
[2] https://github.com/MariaDB/server/commit/cd5808eb8da13c5626d4bdeb452cef6ada29cb1d
[3] https://mariadb.com/kb/en/mariadb-10-11-6-release-notes/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...e_10.11.5.bb => mariadb-native_10.11.6.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 .../mysql/mariadb/libfmt_make_fmt.patch       | 68 -------------------
 ...{mariadb_10.11.5.bb => mariadb_10.11.6.bb} |  0
 4 files changed, 1 insertion(+), 70 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.5.bb => mariadb-native_10.11.6.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.5.bb => mariadb_10.11.6.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.5.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.6.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index d64d5b0e4..7e6ef42bc 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,10 +23,9 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://libfmt_make_fmt.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "4c9484048d4d0c71dd076ab33fc2a9ce8510bdf762886de0d63fe52496f3dbbb"
+SRC_URI[sha256sum] = "1c0163463e98d71f4780741611a40981eee2bc44d392601ca49bbf948d04dd67"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch b/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
deleted file mode 100644
index 4d5f4a611..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/libfmt_make_fmt.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Make make_arg work with libfmt 10.1+
-
-This ensures that compiler can find the correct template to use
-Fixes
-
-mariadb-10.11.5/sql/item_strfunc.cc:1429:22: error: no matching functi
-on for call to 'make_arg'
-|  1429 |       vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_int());
-|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
-| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1588:20: note: candidate functio
-n [with Context = fmt::basic_format_context<fmt::appender, char>, T = long long] not viable: expects an lvalue for 1st argument
-|  1588 | FMT_CONSTEXPR auto make_arg(T& val) -> basic_format_arg<Context> {
-|       |                    ^        ~~~~~~
-| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1559:31: note: candidate templat
-e ignored: invalid explicitly-specified argument for template parameter 'PACKED'
-|  1559 | FMT_CONSTEXPR FMT_INLINE auto make_arg(T& [ 46%] Building C object mysys/CMakeFiles/mysys.dir/my_likely.c.o
-| val) -> value<Context> {
-|       |                               ^
-| /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/mariadb/10.11.5/recipe-sysroot/usr/include/fmt/core.h:1596:27: note: candidate templat
-e ignored: invalid explicitly-specified argument for template parameter 'PACKED'
-|  1596 | FMT_CONSTEXPR inline auto make_arg(T& val) -> basic_format_arg<Context> {
-|       |                           ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/cmake/libfmt.cmake
-+++ b/cmake/libfmt.cmake
-@@ -33,8 +33,9 @@ MACRO (CHECK_LIBFMT)
-      #include <fmt/format-inl.h>
-      #include <iostream>
-      int main() {
-+       int val = 42;
-        fmt::format_args::format_arg arg=
--         fmt::detail::make_arg<fmt::format_context>(42);
-+         fmt::detail::make_arg<fmt::format_context>(val);
-          std::cout << fmt::vformat(\"The answer is {}.\",
-                                    fmt::format_args(&arg, 1));
-      }" HAVE_SYSTEM_LIBFMT)
---- a/sql/item_strfunc.cc
-+++ b/sql/item_strfunc.cc
-@@ -1426,14 +1426,22 @@ String *Item_func_sformat::val_str(Strin
-     switch (args[carg]->result_type())
-     {
-     case INT_RESULT:
--      vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_int());
-+      int intval;
-+      intval = args[carg]->val_int();
-+      vargs[carg-1]= fmt::detail::make_arg<ctx>(intval);
-       break;
-     case DECIMAL_RESULT: // TODO
-     case REAL_RESULT:
-+      float fval;
-+      int val;
-       if (args[carg]->field_type() == MYSQL_TYPE_FLOAT)
--        vargs[carg-1]= fmt::detail::make_arg<ctx>((float)args[carg]->val_real());
--      else
--        vargs[carg-1]= fmt::detail::make_arg<ctx>(args[carg]->val_real());
-+      {
-+        fval = (float)args[carg]->val_real();
-+        vargs[carg-1]= fmt::detail::make_arg<ctx>(fval);
-+      } else {
-+        val = args[carg]->val_real();
-+        vargs[carg-1]= fmt::detail::make_arg<ctx>(val);
-+      }
-       break;
-     case STRING_RESULT:
-       if (!(parg= args[carg]->val_str(&val_arg[carg-1])))
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
-- 
2.25.1


