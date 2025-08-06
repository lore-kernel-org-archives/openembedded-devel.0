Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BB1C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:39:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20337.1754469571840089008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0313cf4b72=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5767es9p2951479
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Aug 2025 01:39:31 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy7gmcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 01:39:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 6 Aug 2025 01:39:30 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 6 Aug 2025 01:39:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] luajit: fix CVEs
Date: Wed, 6 Aug 2025 16:39:29 +0800
Message-ID: <20250806083929.2934708-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=689314c3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=nm2HxRzrAAAA:8 a=t7CeM3EgAAAA:8
 a=IZq4ZYSnfo3lxQChRoEA:9 a=xTkba3CB784Yst2QIEaM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bPY3FWkANbVU8WkxjL6nsnAwpWfApKiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA1MiBTYWx0ZWRfXyuZj82imCATb
 eWG0RtRgAvsGhNb/sdFyqKJ5S+RfesutXMoDH7pQ1VSLMz1lWf4zW/p/Dpp6pyxLmIbvsJJ5Dwo
 nH260/JqNuWoz2EcMq4bNtCgdrHBy45hv7YRB+uZxqLVE2F3PPXLt27eW8BgNt4JT5itJ/Jv9Sy
 CD/kqE9mhu7gh3/EuK6ION2wySQPsWz19KqSF9ptRLRozEB5VM8QodWaU3TxELJLvU0dnJyJMUs
 0DkszcIWP3oTVzMjA1dCwpP8qX5R/+oGdAIZ64lvWwuf6xDqkzr57wpioJz3TN/yHxskEv2h7Cv
 oNhJjywoNAl9p8xvUHq3pwiqiIq5x5uoIglUhB4Hmqv0nZtMhhkeYBg5JuEVIA=
X-Proofpoint-ORIG-GUID: bPY3FWkANbVU8WkxjL6nsnAwpWfApKiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 08:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118890

From: Changqing Li <changqing.li@windriver.com>

fix CVE-2024-25176, CVE-2024-25177

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../luajit/luajit/CVE-2024-25176.patch        | 32 ++++++++++++++
 .../luajit/luajit/CVE-2024-25177.patch        | 44 +++++++++++++++++++
 meta-oe/recipes-devtools/luajit/luajit_git.bb |  2 +
 3 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch

diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
new file mode 100644
index 0000000000..7dba4e8239
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
@@ -0,0 +1,32 @@
+From 810bf18ff0ddbae9b2ceb30dd8b9c901cc634d1f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 5 Aug 2025 14:49:06 +0800
+Subject: [PATCH] Fix zero stripping in %g number formatting.
+
+Reported by pwnhacker0x18. #1149
+
+CVE: CVE-2024-25176
+Upstream-Status: Backport [https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/lj_strfmt_num.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lj_strfmt_num.c b/src/lj_strfmt_num.c
+index 3c60695c..41214894 100644
+--- a/src/lj_strfmt_num.c
++++ b/src/lj_strfmt_num.c
+@@ -454,7 +454,8 @@ static char *lj_strfmt_wfnum(SBuf *sb, SFormat sf, lua_Number n, char *p)
+ 	    prec--;
+ 	    if (!i) {
+ 	      if (ndlo == ndhi) { prec = 0; break; }
+-	      lj_strfmt_wuint9(tail, nd[++ndlo]);
++	      ndlo = (ndlo + 1) & 0x3f;
++	      lj_strfmt_wuint9(tail, nd[ndlo]);
+ 	      i = 9;
+ 	    }
+ 	  }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
new file mode 100644
index 0000000000..73ad9837aa
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
@@ -0,0 +1,44 @@
+From c8421200e9accf5a10a52768bb3dca2f555bd092 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 5 Aug 2025 15:05:07 +0800
+Subject: [PATCH] Fix unsinking of IR_FSTORE for NULL metatable.
+
+Reported by pwnhacker0x18. #1147
+
+CVE: CVE-2024-25177
+Upstream-Status: Backport [https://github.com/openresty/luajit2/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/lj_snap.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/lj_snap.c b/src/lj_snap.c
+index 4140fdb7..d7027875 100644
+--- a/src/lj_snap.c
++++ b/src/lj_snap.c
+@@ -453,6 +453,7 @@ static TRef snap_replay_const(jit_State *J, IRIns *ir)
+   case IR_KNUM: case IR_KINT64:
+     return lj_ir_k64(J, (IROp)ir->o, ir_k64(ir)->u64);
+   case IR_KPTR: return lj_ir_kptr(J, ir_kptr(ir));  /* Continuation. */
++  case IR_KNULL: return lj_ir_knull(J, irt_type(ir->t));
+   default: lj_assertJ(0, "bad IR constant op %d", ir->o); return TREF_NIL;
+   }
+ }
+@@ -882,9 +883,13 @@ static void snap_unsink(jit_State *J, GCtrace *T, ExitState *ex,
+ 	if (irk->o == IR_FREF) {
+ 	  lj_assertJ(irk->op2 == IRFL_TAB_META,
+ 		     "sunk store with bad field %d", irk->op2);
++	if (T->ir[irs->op2].o == IR_KNULL) {
++	  setgcrefnull(t->metatable);
++	} else {
+ 	  snap_restoreval(J, T, ex, snapno, rfilt, irs->op2, &tmp);
+ 	  /* NOBARRIER: The table is new (marked white). */
+ 	  setgcref(t->metatable, obj2gco(tabV(&tmp)));
++	}
+ 	} else {
+ 	  irk = &T->ir[irk->op2];
+ 	  if (irk->o == IR_KSLOT) irk = &T->ir[irk->op1];
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 3f3939eeb4..52126d2790 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -6,6 +6,8 @@ HOMEPAGE = "http://luajit.org"
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://clang.patch \
+           file://CVE-2024-25176.patch \
+           file://CVE-2024-25177.patch \
            "
 
 # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
-- 
2.34.1


