Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C385CA0EC0
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 09:06:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43732.1754903212636436951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Aug 2025 02:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03189c50d2=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 57B66DYL2247480
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 02:06:52 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48e5uhs4us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 02:06:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 11 Aug 2025 02:06:54 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 11 Aug 2025 02:06:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] luajit: fix several CVEs
Date: Mon, 11 Aug 2025 17:06:50 +0800
Message-ID: <20250811090650.1619443-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2MCBTYWx0ZWRfX1wW6EZ/zkGBE
 Ba0dmykwsx7aPi2IzcmUrjv50tmoxY9woOBq4m6u28too1JtN+xFHBUDCJhTQ9IYInxPt5copt7
 ZkIyxCyLJHR2c4FLvs1F/h1HUOPzYQ/aqiKJ7PrVht9zgBjaiQ1ukQMZx8USwVLeDOUkvsWg0wy
 S3Yg5iZXTbYMGhjhbJZJSinWSuTvdNpflCH84S1QBwGiPfJwEUVOepMq8/oulldQQjiwzaz24+9
 JrXHUI7tNxvppLOJWMZeCawHsjlF8vpHlbxL33KCMEuS8jg07EvnwFhB00KYwFhJFgyNQO8xkH4
 K+wnTZf6AEgod35qyuODmIhfwtcvLUt/aPbOJERZtAzIWSGcd2XTAkPK3UhmKY=
X-Proofpoint-GUID: Hp7TReBK6yB_mJJL6Pn7Nu_6gIW8v_GK
X-Proofpoint-ORIG-GUID: Hp7TReBK6yB_mJJL6Pn7Nu_6gIW8v_GK
X-Authority-Analysis: v=2.4 cv=cZzSrmDM c=1 sm=1 tr=0 ts=6899b2ac cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=nm2HxRzrAAAA:8 a=t7CeM3EgAAAA:8
 a=Rf3VsElimUIm9gMKyfEA:9 a=xTkba3CB784Yst2QIEaM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 09:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118908

From: Changqing Li <changqing.li@windriver.com>

fix CVE-2024-25176, CVE-2024-25177, CVE-2024-25178

For apply CVE-2024-25178-0003.patch more smoothly,
CVE-2024-25178-0001.patch and CVE-2024-25178-0002.patch is backported.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../luajit/luajit/CVE-2024-25176.patch        |  32 ++++
 .../luajit/luajit/CVE-2024-25177.patch        |  44 +++++
 .../luajit/luajit/CVE-2024-25178-0001.patch   |  28 +++
 .../luajit/luajit/CVE-2024-25178-0002.patch   |  49 ++++++
 .../luajit/luajit/CVE-2024-25178-0003.patch   | 163 ++++++++++++++++++
 meta-oe/recipes-devtools/luajit/luajit_git.bb |   5 +
 6 files changed, 321 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25176.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25177.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0001.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0002.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0003.patch

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
diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0001.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0001.patch
new file mode 100644
index 0000000000..50dddf6378
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0001.patch
@@ -0,0 +1,28 @@
+From d4fd9f2939645eb20616ced3bbffba609c1eeac6 Mon Sep 17 00:00:00 2001
+From: Mike Pall <mike>
+Date: Wed, 9 Nov 2022 11:01:41 +0100
+Subject: [PATCH 1/3] Ensure correct stack top for OOM error message.
+
+Reported by Sergey Kaplun.
+
+Upstream-Status: Backport [https://github.com/LuaJIT/LuaJIT/commit/ca8d3257bb44e42100c7910c47dcdcf01f494187]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/lj_err.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lj_err.c b/src/lj_err.c
+index 563c7706..283c3d18 100644
+--- a/src/lj_err.c
++++ b/src/lj_err.c
+@@ -777,6 +777,7 @@ LJ_NOINLINE void lj_err_mem(lua_State *L)
+ {
+   if (L->status == LUA_ERRERR+1)  /* Don't touch the stack during lua_open. */
+     lj_vm_unwind_c(L->cframe, LUA_ERRMEM);
++  if (curr_funcisL(L)) L->top = curr_topL(L);
+   setstrV(L, L->top++, lj_err_str(L, LJ_ERR_ERRMEM));
+   lj_err_throw(L, LUA_ERRMEM);
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0002.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0002.patch
new file mode 100644
index 0000000000..c3249cbb18
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0002.patch
@@ -0,0 +1,49 @@
+From 4b736a552ff84d72f39aa0cf36eb8a4e1a77f350 Mon Sep 17 00:00:00 2001
+From: Mike Pall <mike>
+Date: Thu, 21 Sep 2023 01:58:43 +0200
+Subject: [PATCH 2/3] Cleanup stack overflow handling.
+
+Reported by Peter Cawley. #962
+
+Upstream-Status: Backport [https://github.com/LuaJIT/LuaJIT/commit/d2f6c55b05c716e5dbb479b7e684abaee7cf6e12]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/lj_state.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/lj_state.c b/src/lj_state.c
+index 0b9c46ba..ccdfa381 100644
+--- a/src/lj_state.c
++++ b/src/lj_state.c
+@@ -103,8 +103,17 @@ void lj_state_shrinkstack(lua_State *L, MSize used)
+ void LJ_FASTCALL lj_state_growstack(lua_State *L, MSize need)
+ {
+   MSize n;
+-  if (L->stacksize > LJ_STACK_MAXEX)  /* Overflow while handling overflow? */
+-    lj_err_throw(L, LUA_ERRERR);
++  if (L->stacksize >= LJ_STACK_MAXEX) {
++    /* 4. Throw 'error in error handling' when we are _over_ the limit. */
++    if (L->stacksize > LJ_STACK_MAXEX)
++      lj_err_throw(L, LUA_ERRERR);  /* Does not invoke an error handler. */
++    /* 1. We are _at_ the limit after the last growth. */
++    if (!L->status) {  /* 2. Throw 'stack overflow'. */
++      L->status = LUA_ERRRUN;  /* Prevent ending here again for pushed msg. */
++      lj_err_msg(L, LJ_ERR_STKOV);  /* May invoke an error handler. */
++    }
++    /* 3. Add space (over the limit) for pushed message and error handler. */
++  }
+   n = L->stacksize + need;
+   if (n > LJ_STACK_MAX) {
+     n += 2*LUA_MINSTACK;
+@@ -114,8 +123,6 @@ void LJ_FASTCALL lj_state_growstack(lua_State *L, MSize need)
+       n = LJ_STACK_MAX;
+   }
+   resizestack(L, n);
+-  if (L->stacksize > LJ_STACK_MAXEX)
+-    lj_err_msg(L, LJ_ERR_STKOV);
+ }
+ 
+ void LJ_FASTCALL lj_state_growstack1(lua_State *L)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0003.patch b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0003.patch
new file mode 100644
index 0000000000..d830c21916
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/CVE-2024-25178-0003.patch
@@ -0,0 +1,163 @@
+From 891bd078750312746541327332071a8fc354c10b Mon Sep 17 00:00:00 2001
+From: Mike Pall <mike>
+Date: Sun, 4 Feb 2024 16:34:30 +0100
+Subject: [PATCH] Rework stack overflow handling.
+
+Reported by pwnhacker0x18. Fixed by Peter Cawley. #1152
+
+CVE: CVE-2024-25178
+Upstream-Status: Backport [https://github.com/LuaJIT/LuaJIT/commit/defe61a56751a0db5f00ff3ab7b8f45436ba74c8
+https://github.com/LuaJIT/LuaJIT/commit/0d313b243194a0b8d2399d8b549ca5a0ff234db5]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/lj_debug.c |  1 +
+ src/lj_err.c   | 22 +++++++++++++++++---
+ src/lj_err.h   |  1 +
+ src/lj_state.c | 56 +++++++++++++++++++++++++++++++++-----------------
+ 4 files changed, 58 insertions(+), 22 deletions(-)
+
+diff --git a/src/lj_debug.c b/src/lj_debug.c
+index 112f5358..861fac6b 100644
+--- a/src/lj_debug.c
++++ b/src/lj_debug.c
+@@ -64,6 +64,7 @@ static BCPos debug_framepc(lua_State *L, GCfunc *fn, cTValue *nextframe)
+     if (cf == NULL || (char *)cframe_pc(cf) == (char *)cframe_L(cf))
+       return NO_BCPOS;
+     ins = cframe_pc(cf);  /* Only happens during error/hook handling. */
++    if (!ins) return NO_BCPOS;
+   } else {
+     if (frame_islua(nextframe)) {
+       ins = frame_pc(nextframe);
+diff --git a/src/lj_err.c b/src/lj_err.c
+index 283c3d18..b514df57 100644
+--- a/src/lj_err.c
++++ b/src/lj_err.c
+@@ -777,7 +777,14 @@ LJ_NOINLINE void lj_err_mem(lua_State *L)
+ {
+   if (L->status == LUA_ERRERR+1)  /* Don't touch the stack during lua_open. */
+     lj_vm_unwind_c(L->cframe, LUA_ERRMEM);
+-  if (curr_funcisL(L)) L->top = curr_topL(L);
++  if (curr_funcisL(L)) {
++    L->top = curr_topL(L);
++    if (LJ_UNLIKELY(L->top > tvref(L->maxstack))) {
++      /* The current Lua frame violates the stack. Replace it with a dummy. */
++      L->top = L->base;
++      setframe_gc(L->base - 1 - LJ_FR2, obj2gco(L), LJ_TTHREAD);
++    }
++  }
+   setstrV(L, L->top++, lj_err_str(L, LJ_ERR_ERRMEM));
+   lj_err_throw(L, LUA_ERRMEM);
+ }
+@@ -838,9 +845,11 @@ LJ_NOINLINE void LJ_FASTCALL lj_err_run(lua_State *L)
+ {
+   ptrdiff_t ef = (LJ_HASJIT && tvref(G(L)->jit_base)) ? 0 : finderrfunc(L);
+   if (ef) {
+-    TValue *errfunc = restorestack(L, ef);
+-    TValue *top = L->top;
++    TValue *errfunc, *top;
++    lj_state_checkstack(L, LUA_MINSTACK * 2);  /* Might raise new error. */
+     lj_trace_abort(G(L));
++    errfunc = restorestack(L, ef);
++    top = L->top;
+     if (!tvisfunc(errfunc) || L->status == LUA_ERRERR) {
+       setstrV(L, top-1, lj_err_str(L, LJ_ERR_ERRERR));
+       lj_err_throw(L, LUA_ERRERR);
+@@ -865,6 +874,13 @@ LJ_NOINLINE void LJ_FASTCALL lj_err_trace(lua_State *L, int errcode)
+ }
+ #endif
+ 
++/* Stack overflow error. */
++void LJ_FASTCALL lj_err_stkov(lua_State *L)
++{
++  lj_debug_addloc(L, err2msg(LJ_ERR_STKOV), L->base-1, NULL);
++  lj_err_run(L);
++}
++
+ /* Formatted runtime error message. */
+ LJ_NORET LJ_NOINLINE static void err_msgv(lua_State *L, ErrMsg em, ...)
+ {
+diff --git a/src/lj_err.h b/src/lj_err.h
+index bd4de9ae..a3aaa756 100644
+--- a/src/lj_err.h
++++ b/src/lj_err.h
+@@ -23,6 +23,7 @@ LJ_DATA const char *lj_err_allmsg;
+ LJ_FUNC GCstr *lj_err_str(lua_State *L, ErrMsg em);
+ LJ_FUNCA_NORET void LJ_FASTCALL lj_err_throw(lua_State *L, int errcode);
+ LJ_FUNC_NORET void lj_err_mem(lua_State *L);
++LJ_FUNC_NORET void LJ_FASTCALL lj_err_stkov(lua_State *L);
+ LJ_FUNC_NORET void LJ_FASTCALL lj_err_run(lua_State *L);
+ #if LJ_HASJIT
+ LJ_FUNCA_NORET void LJ_FASTCALL lj_err_trace(lua_State *L, int errcode);
+diff --git a/src/lj_state.c b/src/lj_state.c
+index ccdfa381..74725bbc 100644
+--- a/src/lj_state.c
++++ b/src/lj_state.c
+@@ -102,27 +102,45 @@ void lj_state_shrinkstack(lua_State *L, MSize used)
+ /* Try to grow stack. */
+ void LJ_FASTCALL lj_state_growstack(lua_State *L, MSize need)
+ {
+-  MSize n;
+-  if (L->stacksize >= LJ_STACK_MAXEX) {
+-    /* 4. Throw 'error in error handling' when we are _over_ the limit. */
+-    if (L->stacksize > LJ_STACK_MAXEX)
++  MSize n = L->stacksize + need;
++  if (LJ_LIKELY(n < LJ_STACK_MAX)) {  /* The stack can grow as requested. */
++    if (n < 2 * L->stacksize) {  /* Try to double the size. */
++      n = 2 * L->stacksize;
++      if (n > LJ_STACK_MAX)
++   n = LJ_STACK_MAX;
++    }
++    resizestack(L, n);
++  } else {  /* Request would overflow. Raise a stack overflow error. */
++    if (curr_funcisL(L)) {
++      L->top = curr_topL(L);
++      if (L->top > tvref(L->maxstack)) {
++   /* The current Lua frame violates the stack, so replace it with a
++   ** dummy. This can happen when BC_IFUNCF is trying to grow the stack.
++   */
++   L->top = L->base;
++    setframe_gc(L->base - 1 - LJ_FR2, obj2gco(L), LJ_TTHREAD);
++      }
++    }
++    if (L->stacksize <= LJ_STACK_MAXEX) {
++      /* An error handler might want to inspect the stack overflow error, but
++      ** will need some stack space to run in. We give it a stack size beyond
++      ** the normal limit in order to do so, then rely on lj_state_relimitstack
++      ** calls during unwinding to bring us back to a convential stack size.
++      ** The + 1 is space for the error message, and 2 * LUA_MINSTACK is for
++      ** the lj_state_checkstack() call in lj_err_run().
++      */
++      resizestack(L, LJ_STACK_MAX + 1 + 2 * LUA_MINSTACK);
++      lj_err_stkov(L);  /* May invoke an error handler. */
++    } else {
++      /* If we're here, then the stack overflow error handler is requesting
++      ** to grow the stack even further. We have no choice but to abort the
++      ** error handler.
++      */
++      GCstr *em = lj_err_str(L, LJ_ERR_STKOV);  /* Might OOM. */
++      setstrV(L, L->top++, em);  /* There is always space to push an error. */
+       lj_err_throw(L, LUA_ERRERR);  /* Does not invoke an error handler. */
+-    /* 1. We are _at_ the limit after the last growth. */
+-    if (!L->status) {  /* 2. Throw 'stack overflow'. */
+-      L->status = LUA_ERRRUN;  /* Prevent ending here again for pushed msg. */
+-      lj_err_msg(L, LJ_ERR_STKOV);  /* May invoke an error handler. */
+     }
+-    /* 3. Add space (over the limit) for pushed message and error handler. */
+-  }
+-  n = L->stacksize + need;
+-  if (n > LJ_STACK_MAX) {
+-    n += 2*LUA_MINSTACK;
+-  } else if (n < 2*L->stacksize) {
+-    n = 2*L->stacksize;
+-    if (n >= LJ_STACK_MAX)
+-      n = LJ_STACK_MAX;
+-  }
+-  resizestack(L, n);
++  } 
+ }
+ 
+ void LJ_FASTCALL lj_state_growstack1(lua_State *L)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 3f3939eeb4..592fb20565 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -6,6 +6,11 @@ HOMEPAGE = "http://luajit.org"
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://clang.patch \
+           file://CVE-2024-25176.patch \
+           file://CVE-2024-25177.patch \
+           file://CVE-2024-25178-0001.patch \
+           file://CVE-2024-25178-0002.patch \
+           file://CVE-2024-25178-0003.patch \
            "
 
 # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
-- 
2.34.1


