Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1887C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 09:23:37 +0000 (UTC)
Received: from mx0a-00300601.pphosted.com (mx0a-00300601.pphosted.com [148.163.146.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36584.1785921633422888247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 02:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=3uCJDISl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.146.64, mailfrom: prvs=967708a2d4=shubhanshu.mani.tripathi@emerson.com)
Received: from pps.filterd (m0484886.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dYaQ2570310;
	Wed, 5 Aug 2026 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=email; bh=TBevabNFgnobd3OOj/TtGc0k5a
	MUwRX9CqblL2Hapw0=; b=3uCJDISliCR1cwrWTdYsAZvpCxXrZ4o48D30ya9d9Y
	0SVYFXVSlA95j9Tnhyo0uzpnm/FUfJw5TrAqjtAJJYs7jzSY02eiTRlEmSUCuMCG
	Fyf0K8MD4dZSi423FQtHKuiUPtxwpokIH6HLY+OWBFObuDbHJ0Pi6uoFWXmvYevL
	jbyPwn1EWIVwaiDn0foWp1ZpheCRXNBE6xGL8LDTMJ8wXRQnlzZfGwCMOrLzZmW2
	hCSkIxMY8CkiijwmeYGAauBkPQTVBp69hMd237JfmjKjvfqp9Mo6YQeFD30lb7/k
	OQu8D1bSTUUwQ8ZPdiWEru02JGWJX3i0rW/EDfUsZJyw==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 4fuyq9h9d9-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 09:11:35 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 5 Aug 2026 04:11:28 -0500
Received: from shtripat-build-machine.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Wed, 5 Aug 2026 04:11:26 -0500
From: Shubhanshu Mani Tripathi <shubhanshu.mani.tripathi@emerson.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Anuj Mittal <anuj.mittal@intel.com>,
        "Darsh
 Kelaiya" <dkelaiya@cisco.com>,
        Shubhanshu Mani Tripathi
	<shubhanshu.mani.tripathi@emerson.com>
Subject: [meta-oe][scarthgap][PATCH] jq: fix build regression from CVE-2026-43895 backport
Date: Wed, 5 Aug 2026 14:41:15 +0530
Message-ID: <20260805091115.1827657-1-shubhanshu.mani.tripathi@emerson.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: 1-9hQDAS8JeODvI-4eketY2P-w3njV6d
X-Authority-Analysis: v=2.4 cv=AvveGu9P c=1 sm=1 tr=0 ts=6a72fe47 cx=c_pps
 a=VUOoxcgKHUMpfFMIT0tLvw==:117 a=VUOoxcgKHUMpfFMIT0tLvw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Ps6gwBxKFAOpZu8f3VnT:22
 a=b2B3eP2nOkD9akDMWo6S:22 a=geDs06hvAAAA:8 a=AUd_NHdVAAAA:8
 a=iJsmdLiuG8GtLBV03mYA:9 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-ORIG-GUID: 1-9hQDAS8JeODvI-4eketY2P-w3njV6d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3MSBTYWx0ZWRfXxK7dWkWZUzxR
 6PiA3hGg5RHLo4ADQdMCXsrCXKkJaJbyFg0U0zLvCpUDCgXru+y4b0WujPFk1CDfKG2O1oaFk+z
 pevzmPaEREYhhcu50fhtVWu4V5Y5Z3dbbrjfFcscq5jkIyoLOXia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3MSBTYWx0ZWRfX64BThp7/eubw
 TzJNYD7+4AwSGpD68CQ2GkABH3CmT4YfY+lsZenOXCjDKupgzDIVj70lmfwZ8XAw+v7Y/KK78LU
 srPA27qW0cU6Rcv0inbxraDHWhwaDbUZla926TQ/FYRI9nQcs02qaZ7g33LyCVVL8ykd5X07wIa
 ByvtVTn9lvqJ2RehQS8mP+5Qu7jNpsfcG24/2wXwhzX+oOQKgSBr0mofP+nHo+G1vw/jW/XZ0HL
 pFCzc9q6kp+ODSncpD6SJOnSwbaNZr3PL2S/PbgmcXLA4vIsBR4Jl4YyA1VhdwpaeRBfV/slZFm
 c8nu4dMZd1uKbiG/uxOU/3VFBP6nrRRnZgjklHqNFrWqEHvFXVd5Yy+aBYiDHo1QF5GPOA7i77z
 Utmg0jOFRUWBHgQlQMHunNiGkOB1vkisbwozcmZt/zED0aNIjFpt0VoePE2P7ManAbe/AyNHLNo
 zbjDBxt8pizfA9JFR+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050071
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 09:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128808

The CVE-2026-43895 backport patches both the pre-generated src/parser.c
that jq ships (and builds, since maintainer-mode/bison is disabled) and
its source src/parser.y. Git orders the diff sections alphabetically, so
parser.c is applied before parser.y and parser.y ends up with a newer
mtime. make's implicit .y.c rule then treats the shipped parser.c as
stale and tries to regenerate it with bison; jq's overridden rule only
prints "NOT building parser.c!" and produces no file, so the build fails
with:

  cc1: fatal error: src/parser.c: No such file or directory

Reorder the backport so the src/parser.y hunk is applied before the
generated src/parser.c hunk. parser.c is then written last, is not older
than parser.y, and make uses the shipped parser as-is.

Signed-off-by: Shubhanshu Mani Tripathi <shubhanshu.mani.tripathi@emerson.com>
---
 .../jq/jq/CVE-2026-43895.patch                | 73 ++++++++++---------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
index efde45c710..b21f7c2806 100644
--- a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
@@ -22,6 +22,9 @@ Backport Changes:
 - Limited parser.c to three import/include action changes.
   The newer grammar caused unrelated generated-parser churn.
   Keeping target numbering avoids unrelated generated changes.
+- Applied the src/parser.y hunk before the generated src/parser.c hunk.
+  Otherwise parser.y is newer and make regenerates parser.c with bison.
+  Bison is disabled here, so the shipped parser.c must stay the newest.
 
 (cherry picked from commit 9d223f153c3632a207fa071caaa6292da33ae361)
 Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
@@ -29,8 +32,8 @@ Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
  src/compile.c | 12 ++++++++----
  src/compile.h |  2 +-
  src/linker.c  |  6 +++++-
- src/parser.c  | 16 +++-------------
  src/parser.y  | 16 +++-------------
+ src/parser.c  | 16 +++-------------
  tests/shtest  | 17 +++++++++++++++++
  6 files changed, 37 insertions(+), 32 deletions(-)
 
@@ -97,6 +100,40 @@ index e7d1024..4b15008 100644
          gen_const(JV_OBJECT(
              jv_string("optional"), jv_true(),
              jv_string("search"), jv_string(home))));
+diff --git a/src/parser.y b/src/parser.y
+index 3d24689..2901cab 100644
+--- a/src/parser.y
++++ b/src/parser.y
+@@ -504,26 +504,16 @@ ImportWhat Exp ';' {
+ 
+ ImportWhat:
+ "import" ImportFrom "as" BINDING {
+-  jv v = block_const($2);
+-  // XXX Make gen_import take only blocks and the int is_data so we
+-  // don't have to free so much stuff here
+-  $$ = gen_import(jv_string_value(v), jv_string_value($4), 1);
++  $$ = gen_import(block_const($2), $4, 1);
+   block_free($2);
+-  jv_free($4);
+-  jv_free(v);
+ } |
+ "import" ImportFrom "as" IDENT {
+-  jv v = block_const($2);
+-  $$ = gen_import(jv_string_value(v), jv_string_value($4), 0);
++  $$ = gen_import(block_const($2), $4, 0);
+   block_free($2);
+-  jv_free($4);
+-  jv_free(v);
+ } |
+ "include" ImportFrom {
+-  jv v = block_const($2);
+-  $$ = gen_import(jv_string_value(v), NULL, 0);
++  $$ = gen_import(block_const($2), jv_invalid(), 0);
+   block_free($2);
+-  jv_free(v);
+ }
+ 
+ ImportFrom:
 diff --git a/src/parser.c b/src/parser.c
 index 0599db7..c50f2fb 100644
 --- a/src/parser.c
@@ -141,40 +178,6 @@ index 0599db7..c50f2fb 100644
  }
  #line 3116 "src/parser.c"
      break;
-diff --git a/src/parser.y b/src/parser.y
-index 3d24689..2901cab 100644
---- a/src/parser.y
-+++ b/src/parser.y
-@@ -504,26 +504,16 @@ ImportWhat Exp ';' {
- 
- ImportWhat:
- "import" ImportFrom "as" BINDING {
--  jv v = block_const($2);
--  // XXX Make gen_import take only blocks and the int is_data so we
--  // don't have to free so much stuff here
--  $$ = gen_import(jv_string_value(v), jv_string_value($4), 1);
-+  $$ = gen_import(block_const($2), $4, 1);
-   block_free($2);
--  jv_free($4);
--  jv_free(v);
- } |
- "import" ImportFrom "as" IDENT {
--  jv v = block_const($2);
--  $$ = gen_import(jv_string_value(v), jv_string_value($4), 0);
-+  $$ = gen_import(block_const($2), $4, 0);
-   block_free($2);
--  jv_free($4);
--  jv_free(v);
- } |
- "include" ImportFrom {
--  jv v = block_const($2);
--  $$ = gen_import(jv_string_value(v), NULL, 0);
-+  $$ = gen_import(block_const($2), jv_invalid(), 0);
-   block_free($2);
--  jv_free(v);
- }
- 
- ImportFrom:
 diff --git a/tests/shtest b/tests/shtest
 index 505d45d..4a5978c 100755
 --- a/tests/shtest
-- 
2.43.0


