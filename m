Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596E7EFCE5B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 03:20:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36212.1772680802154972278
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 19:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=T9gXx0An;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7524835116=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62508T2V1764275
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Mar 2026 03:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0rysE+bHC2BtoQPKciMt
	W3xwI2EWsjdk/RHL4Qeijdw=; b=T9gXx0AnaLtsTKZI3KutNy9PTYFnsTydYO/c
	Ye0X/gglQJzi+bx0nQnVMVqf5Gv573kiadue9n9ZMYuEKeH8ZUI7llHdyEvO9ppS
	Ah+UwqWMPgsyVML4WRsLo7X/T9GNRgVJdeghisNzSEGrptEgnxRSFpzRAomGIE4G
	uWzLbGx5ZwsxEy7Odfd4OShTPp5nu6+bu27Z+Ygh8nrfYStzmTT739G6wan+fBu1
	NcPgMCcSpnU3b/wYoASyK+KWxOgno4wKa+jgFXo7QRE1+eIntFNvbTb9+XL9et15
	yjaKVZNtddceU/vwnAdqE0u/FlpVc50QT4kRfs7u5Onu6/WKcA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4nwam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:20:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 4 Mar 2026 19:19:59 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 4 Mar 2026 19:19:58 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Upgrade 11.4.9 -> 11.4.10
Date: Thu, 5 Mar 2026 11:19:57 +0800
Message-ID: <20260305031957.1842782-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a8f660 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=jpp-Wi3FAAAA:8
 a=NEAV23lmAAAA:8 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=hqlPtk99tgdEu6c7OPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=3HWhRrkoiJongTt84g_J:22 a=NA03pvyaApPJG5valX87:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xuh1tBN_StmyW4puVg1TRdWCL2K8lwgT
X-Proofpoint-ORIG-GUID: xuh1tBN_StmyW4puVg1TRdWCL2K8lwgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyNCBTYWx0ZWRfX/Av2FYBpPXuM
 eipyl2c6BT2yymTUfr2ZJTkxmlYagTNKE/g+J8jtMsGi7bwyQ9tsKo6AHOCAHECmANqK6SM1Lc3
 YAl85oBG+rXX9Y6ZLd8JAyUPoAVZNlkX13eLAQA5fCcQOb1IFo/dsrPYcAhJ6RIJmCu3VZXnBkg
 j2UZBf+yFRqesr7JzpG1K+uKaMH593Eta/SMpAbqM42wd1oUVdB+TlhZvd1WUF4CIjRVaA8kyfL
 ah+5Ro/gzB83kOj2fTPVRWfkmcyr70IzfSWgMGggGsJnPcCCQcB+6AIqRnTFJn7zJXLhHYI/rlK
 aInrc1PGePAeMYRl7aFy9Wt+80NZxZXcLYbe7KiyS4ykR/xHfUuN7p6c0G5RVoWch/bh4SOlUQO
 Or2kIHHE/EBwH020xjukS74d90FZ4Ywe7oiFy/ZqzEQ3bHEUfp3+spnjztRWQp8xXZ+nGv91Yok
 bEBHkgmF5k1js6cg9Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050024
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62508T2V1764275
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124859

From: Mingli Yu <mingli.yu@windriver.com>

Remove 0001-Remove-x86-specific-loop-in-my_convert.patch as it's fixed
in new version [1].

Remove 0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
as its logic is included in new version [2].

Release note:
https://mariadb.com/docs/release-notes/community-server/11.4/11.4.10

[1] https://github.com/MariaDB/server/commit/470487c
[2] https://github.com/MariaDB/server/commit/a61a746

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ve_11.4.9.bb =3D> mariadb-native_11.4.10.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...info-t-fails-for-certain-TZ-values-o.patch | 47 ----------
 ...move-x86-specific-loop-in-my_convert.patch | 93 -------------------
 .../{mariadb_11.4.9.bb =3D> mariadb_11.4.10.bb} |  0
 5 files changed, 1 insertion(+), 143 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.9.bb =3D> mariadb-=
native_11.4.10.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_=
tzinfo-t-fails-for-certain-TZ-values-o.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-spe=
cific-loop-in-my_convert.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.9.bb =3D> mariadb_11.4.10=
.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb b/meta-oe=
/recipes-dbs/mysql/mariadb-native_11.4.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.10.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 4fcb5a1e40..9470184d3d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,12 +23,10 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source=
/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://riscv32.patch \
-           file://0001-Remove-x86-specific-loop-in-my_convert.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-b=
uil.patch \
-           file://0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-value=
s-o.patch \
           "
-SRC_URI[sha256sum] =3D "8e481ca29b5a740444d45451c8ea2d93711cf525d6fa5d27=
bc9512cf8973b075"
+SRC_URI[sha256sum] =3D "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a44=
8f00f87a9f0a4a6b"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-=
t-fails-for-certain-TZ-values-o.patch b/meta-oe/recipes-dbs/mysql/mariadb=
/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
deleted file mode 100644
index f1e07e304a..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails=
-for-certain-TZ-values-o.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 61bc216ff9e1d0a8a7fafce57ba916018cd6ac6d Mon Sep 17 00:00:00 2001
-From: Vladislav Vaintroub <vvaintroub@gmail.com>
-Date: Wed, 19 Nov 2025 13:01:56 +0100
-Subject: [PATCH] MDEV-38029 my_tzinfo-t fails for certain TZ values on m=
usl
-
-From: Vladislav Vaintroub <vvaintroub@gmail.com>
-
-The test fails for TZ values such as `PST8PDT` (present but outdated in
-tzdb) and custom forms like `GST-1GDT`. On musl, these values do not
-trigger the expected DST transitions, leading to incorrect DST offsets
-or abbreviations.
-
-This appears to be a musl libc bug; the same TZ values behave correctly
-elsewhere, including Windows. We work around it by skipping the
-affected tests when musl is detected.
-
-Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/4452]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- unittest/mysys/my_tzinfo-t.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/unittest/mysys/my_tzinfo-t.c b/unittest/mysys/my_tzinfo-t.c
-index b38ebd37..585d52f8 100644
---- a/unittest/mysys/my_tzinfo-t.c
-+++ b/unittest/mysys/my_tzinfo-t.c
-@@ -112,6 +112,20 @@ void test_timezone(const char *tz_env, const char *=
*expected_tznames,
-     }
-   }
-   ok(found, "%s: timezone_name =3D %s", tz_env, timezone_name);
-+
-+#if defined __linux__ && !defined __GLIBC__ && !defined __UCLIBC__
-+  /*
-+    MUSL incorrectly calculates UTC offsets and abbreviations
-+    for certain values of TZ (DST related). See MDEV-38029
-+    Skip tests in this case.
-+  */
-+  if (!strcmp(tz_env, "PST8PDT") || !strcmp(tz_env, "GST-1GDT"))
-+  {
-+    skip(6, "musl UTC offset/abbreviation bug, tzname %s, see MDEV-3802=
9", tz_env);
-+    return;
-+  }
-+#endif
-+
-   my_tzinfo(SUMMER_TIMESTAMP, &tz);
-   ok(summer_gmt_off =3D=3D tz.seconds_offset, "%s: Summer GMT offset %l=
d", tz_env, tz.seconds_offset);
-   check_utc_offset(SUMMER_TIMESTAMP,tz.seconds_offset, tz_env);
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-l=
oop-in-my_convert.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x=
86-specific-loop-in-my_convert.patch
deleted file mode 100644
index afcf4fe843..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-=
my_convert.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 79d2a95391abc133e86688696ae21628b7035b2d Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
- <zboszor@gmail.com>
-Date: Wed, 1 Oct 2025 09:29:04 +0200
-Subject: [PATCH] Remove x86 specific loop in my_convert()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-mysqldump/mariadb-dump crashes with this backtrace:
-
-| (gdb) bt
-| #0  my_convert (to=3D<optimized out>, to_length=3D160, to_cs=3D0x55b57=
40fbda0 <my_charset_utf8mb4_general_ci>, from=3D<optimized out>, from_len=
gth=3D40,
-|     from_cs=3D0x55b57408bda0 <my_charset_utf8mb3_unicode_ci>, errors=3D=
0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/strings/ctype.c:1256
-| #1  0x000055b572d9f4a0 in copy_and_convert (to=3D0x7f94fc00c9db "Confi=
guratiogicate_log\020automagicate_log\017is_done_message\017is_done_messa=
ge",
-|     to_length=3D<optimized out>, to_cs=3D<optimized out>, from=3D0x7f9=
4fc059f37 "Configuration downloading from portal...", from_length=3D40, f=
rom_cs=3D<optimized out>,
-|     errors=3D0x7f950c35cd6c) at /usr/src/debug/mariadb/11.8.3/sql/sql_=
string.h:53
-| #2  Protocol::net_store_data_cs (this=3D0x7f94fc001260, from=3D0x7f94f=
c059f37 "Configuration downloading from portal...", length=3D40, from_cs=3D=
<optimized out>,
-|     to_cs=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/prot=
ocol.cc:114
-| #3  0x000055b572da103f in Protocol::send_result_set_row (this=3Dthis@e=
ntry=3D0x7f94fc001260, row_items=3Drow_items@entry=3D0x7f94fc013418)
-|     at /usr/src/debug/mariadb/11.8.3/sql/protocol.cc:1359
-| #4  0x000055b572e19442 in select_send::send_data (this=3D0x7f94fc014f7=
8, items=3D...) at /usr/src/debug/mariadb/11.8.3/sql/sql_class.cc:3294
-| #5  0x000055b572ef7c69 in select_result_sink::send_data_with_check (u=3D=
<optimized out>, sent=3D<optimized out>, this=3D<optimized out>, items=3D=
...)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6264
-| #6  select_result_sink::send_data_with_check (this=3D<optimized out>, =
items=3D..., u=3D<optimized out>, sent=3D<optimized out>)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_class.h:6254
-| #7  end_send (join=3D<optimized out>, join_tab=3D<optimized out>, end_=
of_records=3D<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_se=
lect.cc:25629
-| #8  0x000055b572ec38b6 in evaluate_join_record (join=3Djoin@entry=3D0x=
7f94fc014fa0, join_tab=3Djoin_tab@entry=3D0x7f94fc016940, error=3Derror@e=
ntry=3D0)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24523
-| #9  0x000055b572edcbf2 in sub_select (join=3D0x7f94fc014fa0, join_tab=3D=
0x7f94fc016940, end_of_records=3D<optimized out>)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:24290
-| #10 0x000055b572f119c6 in do_select (join=3D0x7f94fc014fa0, procedure=3D=
<optimized out>) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:23801
-| #11 JOIN::exec_inner (this=3Dthis@entry=3D0x7f94fc014fa0) at /usr/src/=
debug/mariadb/11.8.3/sql/sql_select.cc:5071
-| #12 0x000055b572f11d43 in JOIN::exec (this=3Dthis@entry=3D0x7f94fc014f=
a0) at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:4859
-| #13 0x000055b572f0ffe6 in mysql_select (thd=3Dthd@entry=3D0x7f94fc000c=
d8, tables=3D0x7f94fc013f38, fields=3D..., conds=3D0x0, og_num=3D0, order=
=3D0x0, group=3D0x0, having=3D0x0,
-|     proc_param=3D0x0, select_options=3D551922436864, result=3D0x7f94fc=
014f78, unit=3D0x7f94fc005038, select_lex=3D0x7f94fc013160)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:5387
-| #14 0x000055b572f107dd in handle_select (thd=3Dthd@entry=3D0x7f94fc000=
cd8, lex=3Dlex@entry=3D0x7f94fc004f58, result=3Dresult@entry=3D0x7f94fc01=
4f78,
-|     setup_tables_done_option=3Dsetup_tables_done_option@entry=3D0) at =
/usr/src/debug/mariadb/11.8.3/sql/sql_select.cc:633
-| #15 0x000055b572e77d9e in execute_sqlcom_select (thd=3Dthd@entry=3D0x7=
f94fc000cd8, all_tables=3D0x7f94fc013f38) at /usr/src/debug/mariadb/11.8.=
3/sql/sql_parse.cc:6190
-| #16 0x000055b572e877be in mysql_execute_command (thd=3Dthd@entry=3D0x7=
f94fc000cd8, is_called_from_prepared_stmt=3Dis_called_from_prepared_stmt@=
entry=3Dfalse)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:3975
-| #17 0x000055b572e88e03 in mysql_parse (thd=3D0x7f94fc000cd8, rawbuf=3D=
<optimized out>, length=3D<optimized out>, parser_state=3D<optimized out>=
)
-|     at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:7905
-| #18 0x000055b572e8b2a1 in dispatch_command (command=3Dcommand@entry=3D=
COM_QUERY, thd=3Dthd@entry=3D0x7f94fc000cd8, packet=3Dpacket@entry=3D0x7f=
94fc0088a9 "",
-|     packet_length=3Dpacket_length@entry=3D152, blocking=3Dblocking@ent=
ry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_parse.cc:1903
-| #19 0x000055b572e8cf7c in do_command (thd=3Dthd@entry=3D0x7f94fc000cd8=
, blocking=3Dblocking@entry=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/=
sql_parse.cc:1416
-| #20 0x000055b572fcfc0d in do_handle_one_connection (connect=3D<optimiz=
ed out>, put_in_cache=3Dtrue) at /usr/src/debug/mariadb/11.8.3/sql/sql_co=
nnect.cc:1415
-| #21 0x000055b572fcffc5 in handle_one_connection (arg=3Darg@entry=3D0x5=
5b57943cbd8) at /usr/src/debug/mariadb/11.8.3/sql/sql_connect.cc:1327
-| #22 0x000055b573382440 in pfs_spawn_thread (arg=3D0x55b5795eb598) at /=
usr/src/debug/mariadb/11.8.3/storage/perfschema/pfs.cc:2198
-| #23 0x00007f952e8571dd in start_thread (arg=3D<optimized out>) at pthr=
ead_create.c:448
-| #24 0x00007f952e8d318c in __GI___clone3 () at ../sysdeps/unix/sysv/lin=
ux/x86_64/clone3.S:78
-
-See also:
-https://jira.mariadb.org/browse/MDEV-37786
-https://jira.mariadb.org/browse/MDEV-37148
-
-Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
-Upstream-Status: Inappropriate [oe specific]
----
- strings/ctype.c | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/strings/ctype.c b/strings/ctype.c
-index 629514e5e9c..d7e788c693b 100644
---- a/strings/ctype.c
-+++ b/strings/ctype.c
-@@ -1243,22 +1243,6 @@ my_convert(char *to, uint32 to_length, CHARSET_IN=
FO *to_cs,
-=20
-   length=3D length2=3D MY_MIN(to_length, from_length);
-=20
--#if defined(__i386__) || defined(__x86_64__)
--  /*
--    Special loop for i386, it allows to refer to a
--    non-aligned memory block as UINT32, which makes
--    it possible to copy four bytes at once. This
--    gives about 10% performance improvement comparing
--    to byte-by-byte loop.
--  */
--  for ( ; length >=3D 4; length-=3D 4, from+=3D 4, to+=3D 4)
--  {
--    if ((*(uint32*)from) & 0x80808080)
--      break;
--    *((uint32*) to)=3D *((const uint32*) from);
--  }
--#endif /* __i386__ */
--
-   for (; ; *to++=3D *from++, length--)
-   {
-     if (!length)
---=20
-2.51.0
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb b/meta-oe/recipe=
s-dbs/mysql/mariadb_11.4.10.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.9.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.10.bb
--=20
2.34.1


