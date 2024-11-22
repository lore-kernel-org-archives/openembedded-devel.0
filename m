Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011E9E65D3D
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 09:33:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20472.1732267995368956912
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 01:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=105629bf38=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM90fKv013948
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 09:33:14 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xjc8enbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 09:33:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 22 Nov 2024 01:33:13 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 22 Nov 2024 01:33:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH] indent: fix CVE-2024-0911
Date: Fri, 22 Nov 2024 17:33:11 +0800
Message-ID: <20241122093311.1656415-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: XjZbd8b8HTMVXnFjG3S3DBTLV-gfX0Sd
X-Authority-Analysis: v=2.4 cv=R6hRGsRX c=1 sm=1 tr=0 ts=67404fda cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=K9ldW985twQB9SWqAZwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=YJYNnhH9ANwA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XjZbd8b8HTMVXnFjG3S3DBTLV-gfX0Sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_04,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411220080
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AM90fKv013948
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 09:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113993

Backport a fix from upstream to resolve CVE-2024-0911

  https://git.savannah.gnu.org/git/indent.git feb2b646e6c3a05018e132515c5=
eda98ca13d50d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ap-buffer-underread-in-set_buf_break.patch | 123 ++++++++++++++++++
 .../recipes-extended/indent/indent_2.2.12.bb  |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Fix-a-hea=
p-buffer-underread-in-set_buf_break.patch

diff --git a/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffe=
r-underread-in-set_buf_break.patch b/meta-oe/recipes-extended/indent/inde=
nt/0001-Fix-a-heap-buffer-underread-in-set_buf_break.patch
new file mode 100644
index 0000000000..9938b6ebed
--- /dev/null
+++ b/meta-oe/recipes-extended/indent/indent/0001-Fix-a-heap-buffer-under=
read-in-set_buf_break.patch
@@ -0,0 +1,123 @@
+From ec3ce4dce7f0bc6f15e8a29eeb3776359e0750fb Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Petr=3D20P=3DC3=3DADsa=3DC5=3D99?=3D <ppisar@redhat.co=
m>
+Date: Fri, 22 Nov 2024 17:27:21 +0800
+Subject: [PATCH] Fix a heap buffer underread in set_buf_break()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If an opening parenthesis follows a comment with a text, a read from
+an invalid address happens in set_buf_break():
+
+    $ printf '/*a*/()' | valgrind -- ./src/indent - -o /dev/null
+    =3D=3D28887=3D=3D Memcheck, a memory error detector
+    =3D=3D28887=3D=3D Copyright (C) 2002-2022, and GNU GPL'd, by Julian =
Seward et al.
+    =3D=3D28887=3D=3D Using Valgrind-3.22.0 and LibVEX; rerun with -h fo=
r copyright info
+    =3D=3D28887=3D=3D Command: ./src/indent - -o /dev/null
+    =3D=3D28887=3D=3D
+    =3D=3D28887=3D=3D Invalid read of size 2
+    =3D=3D28887=3D=3D    at 0x409989: set_buf_break (output.c:319)
+    =3D=3D28887=3D=3D    by 0x401FE7: indent_main_loop (indent.c:640)
+    =3D=3D28887=3D=3D    by 0x4022A7: indent (indent.c:759)
+    =3D=3D28887=3D=3D    by 0x40294E: indent_single_file (indent.c:1004)
+    =3D=3D28887=3D=3D    by 0x402A1C: indent_all (indent.c:1042)
+    =3D=3D28887=3D=3D    by 0x402BD0: main (indent.c:1123)
+    =3D=3D28887=3D=3D  Address 0x4a5facc is 4 bytes before a block of si=
ze 16 alloc'd
+    =3D=3D28887=3D=3D    at 0x4849E60: calloc (vg_replace_malloc.c:1595)
+    =3D=3D28887=3D=3D    by 0x408B61: xmalloc (globs.c:42)
+    =3D=3D28887=3D=3D    by 0x40765E: init_parser (parse.c:73)
+    =3D=3D28887=3D=3D    by 0x402B1F: main (indent.c:1101)
+
+It happens when checking an indentation level of the outer scope by inde=
xing
+parser_state_tos->paren_indents[]:
+
+    level =3D parser_state_tos->p_l_follow;
+    [...]
+    /* Did we just parse a bracket that will be put on the next line
+     * by this line break? */
+    if ((*token =3D=3D '(') || (*token =3D=3D '['))
+        --level;    /* then don't take it into account */
+    [...]
+    if (level =3D=3D 0) {
+    } else {
+=E2=86=92       if (parser_state_tos->paren_indents[level - 1] < 0) {...=
}
+    }
+
+The cause is a special case for moving opening parentheses and
+brackets to a next line. If parser_state_tos->p_l_follow is zero
+(like in the reproducer), the index evaluates to -2 and goes out of
+range of the paren_indents array.
+
+This patch simply prevents from decreasing the index under zero when
+formating the code. Maybe it leaves some piece of code unformated, but
+it's safe.
+
+I checked all places where p_l_follow is set (it is only in
+handletoken.c) and they corretly prevent from decrasing it under
+zero. That keeps set_buf_break() in output.c as the culprit.
+
+<https://lists.gnu.org/archive/html/bug-indent/2024-01/msg00000.html>
+
+Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar@redhat.com>
+
+CVE: CVE-2024-0911
+Upstream-Status: Backport [feb2b646e6c3a05018e132515c5eda98ca13d50d
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ regression/TEST                                     | 2 +-
+ regression/input/comment-parent-heap-underread.c    | 3 +++
+ regression/standard/comment-parent-heap-underread.c | 5 +++++
+ src/output.c                                        | 2 +-
+ 4 files changed, 10 insertions(+), 2 deletions(-)
+ create mode 100644 regression/input/comment-parent-heap-underread.c
+ create mode 100644 regression/standard/comment-parent-heap-underread.c
+
+diff --git a/regression/TEST b/regression/TEST
+index a76c112..0888a18 100755
+--- a/regression/TEST
++++ b/regression/TEST
+@@ -38,7 +38,7 @@ BUGS=3D"case-label.c one-line-1.c one-line-2.c one-lin=
e-3.c \
+         macro.c enum.c elif.c nested.c wrapped-string.c minus_predecrem=
ent.c \
+         bug-gnu-33364.c float-constant-suffix.c block-comments.c \
+         no-forced-nl-in-block-init.c hexadecimal_float.c \
+-        comment-heap-overread.c"
++        comment-heap-overread.c comment-parent-heap-underread.c"
+=20
+ INDENTSRC=3D"args.c backup.h backup.c dirent_def.h globs.c indent.h \
+         indent.c indent_globs.h io.c lexi.c memcpy.c parse.c pr_comment=
.c \
+diff --git a/regression/input/comment-parent-heap-underread.c b/regressi=
on/input/comment-parent-heap-underread.c
+new file mode 100644
+index 0000000..68e13cf
+--- /dev/null
++++ b/regression/input/comment-parent-heap-underread.c
+@@ -0,0 +1,3 @@
++void foo(void) {
++/*a*/(1);
++}
+diff --git a/regression/standard/comment-parent-heap-underread.c b/regre=
ssion/standard/comment-parent-heap-underread.c
+new file mode 100644
+index 0000000..9a1c6e3
+--- /dev/null
++++ b/regression/standard/comment-parent-heap-underread.c
+@@ -0,0 +1,5 @@
++void
++foo (void)
++{
++/*a*/ (1);
++}
+diff --git a/src/output.c b/src/output.c
+index 5b92167..b8a4961 100644
+--- a/src/output.c
++++ b/src/output.c
+@@ -290,7 +290,7 @@ void set_buf_break (
+     /* Did we just parse a bracket that will be put on the next line
+      * by this line break? */
+=20
+-    if ((*token =3D=3D '(') || (*token =3D=3D '['))
++    if (level > 0 && ((*token =3D=3D '(') || (*token =3D=3D '[')))
+     {
+         --level;                        /* then don't take it into acco=
unt */
+     }
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/r=
ecipes-extended/indent/indent_2.2.12.bb
index a846682c13..7bf8e406fb 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Remove-dead-paren_level-code.patch \
            file://CVE-2023-40305_0001.patch \
            file://CVE-2023-40305_0002.patch \
+           file://0001-Fix-a-heap-buffer-underread-in-set_buf_break.patc=
h \
            "
 SRC_URI[md5sum] =3D "4764b6ac98f6654a35da117b8e5e8e14"
 SRC_URI[sha256sum] =3D "e77d68c0211515459b8812118d606812e300097cfac0b4e9=
fb3472664263bb8b"
--=20
2.34.1


