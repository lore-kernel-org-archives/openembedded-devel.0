Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.58])
 by mx.groups.io with SMTP id smtpd.web08.3586.1618260875382881123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 13:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nO+5e1u+;
 spf=pass (domain: windriver.com, ip: 40.107.220.58, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJSyL7NrWFWg1G41yCJzHlyQGHkoXTtw79/dLpPQKNTrLcVEzrtEiNk7fXe1Z2sS0QCyxFk6ZoHm1PPnOCab6DOmEDFxwHiYb2J4UdNDDJT7QPJJk2ImJ3/Bo5/F/wehYeh22eu6yzXQFfleGfYzgSQ/uOZSCGijONjycOmm55keqH7bLznELPsA3A8vYCJyLQiHK+xdMcTlgDTWhfT0N7u2uZ0TaJFLSRPHwh+2XQSjlgockx1UnxB3Vg04a+30IgPQYLQ5IFzHQENQz8oGQ2HbX0kV9AKYpI68B0NkxFW0Yt/TMo5so/4Xsi9RQsO3g+0CtEmwrOoXeS61uLHwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mJjJPml2dyJa2sh1m6hc+Q5igOtn82mlE7LMwFUtGc=;
 b=LSFbv4l04JIdtaMPC0Rk9DRKABl16FEMBKuYuAwtWPqeO70Tw07cvduN3LqBRYMmLevE/aETS7hbmM3lxrW9mQ+4P6ehMvTphjVCg7tL6ZloA6QwbpCYbcBxxubtCnVSnKkop44N1/obTqWgk+2LCWBE6r4/5LBjtk2r7LsAOK0+nAmLcDtWHCLL3mN8KEUqBE96xcKSyCHbHFGfymms1xJt6V+YkRg8g3RUfBvVzsWqmNwSCwBgWq+ak7mF63MYOdhBqii0duV59EQhoy1cOLC9YI7cO4eO62aTmbsvhkjk+mwJBN0kgCJxeOPLhuQV+OqCBw7RWz2OKYcOskMkRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mJjJPml2dyJa2sh1m6hc+Q5igOtn82mlE7LMwFUtGc=;
 b=nO+5e1u+QtbNPgT0t7KXoi7og4yAcvT+SFiPv0rHaY/9T6IihWO7Zx4npXgu5SRyfNmEUGQnwy4DAoNOLnBa293+OBZWlQEvtQ7RLLhvoshFISPQoUHHCfX9D7XiHOfhDCBfgE6aLW9JYai6ATuR3GVRdBKDZKz1BOvEHYA9Yts=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2717.namprd11.prod.outlook.com (2603:10b6:805:60::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 20:54:30 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 20:54:30 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: upgrade 6.0.9 -> 6.2.1
Date: Mon, 12 Apr 2021 16:54:18 -0400
Message-ID: <20210412205418.19421-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:208:236::28) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR05CA0059.namprd05.prod.outlook.com (2603:10b6:208:236::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.9 via Frontend Transport; Mon, 12 Apr 2021 20:54:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63995a5b-e0ff-444c-eb4f-08d8fdf52ae5
X-MS-TrafficTypeDiagnostic: SN6PR11MB2717:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2717D607F84AF672ADF5396680709@SN6PR11MB2717.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bUuSUitAeZuY0RWWAOwd2OsqqySBnyqEgRosVpK3qZi6BR2PJZgmIZyUQ/alDFXtluS4rxhv8r0B1M/4UtIa6plJ/miEfdnTd/glc+k+D/Yn/cCK8SlnLCKkQQqhc/LtcN1D3BVEbucQMuu7OaSBRgzeSTclTPNCyfeJW62AktCU9XuuGi2aDZ3MwWvQjJn2zomSho3WBHe2kth3o4F28Tl1LncD2/8HVqQzmEbJF2DzCPkhd0Du8IChRrBAyz9m97gscHAwbGNXjW+nRPQ0TU9JcAoV6y7svZ0CG8OFOktbxw7/ENiPn16DEqKWz11rn25M0RwuER0OgOYIrASQFjXjn8k2GpN5oARrSdh3K9c0/J1hqjwaNlJduX85bC1Roa9IA/QTpSFOm+00MsbUhpYD1jOlHREEKV5lhD7jr4Q6w26/RTjGmTUC/MMe2WldnoT0+Bq5XZEply0ixZP9UZ6hvO/1kadUpnoMCfMdOgcDk6dWqCoMHLAo+nY4kT0VpTn3LgI+5HB+H/eA+zxAEHHfaVmtMcM3ojuxMyGQlspOEYYVESQgjrtlI4XdUstBz3T+JOiMCPKInnRgD5zwQ+sXqFQ9kskOFwFodUU/4m5JC1XgNUphT7X8YfnY18LXzAAS9my1DVM2w6SSnTb3bb+SNz6NPAXDSOYJboFX1i9go4iuqZpY6fsQJ0CAY3izZG6pzGWGdJ4aKJDOD/h8hp9vBkelzcAIDzq6CHt86dA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(366004)(346002)(136003)(16526019)(52116002)(66556008)(26005)(66476007)(186003)(478600001)(66946007)(38350700002)(38100700002)(6486002)(86362001)(36756003)(1076003)(53546011)(8936002)(6506007)(6916009)(30864003)(83380400001)(316002)(956004)(5660300002)(6666004)(8676002)(2906002)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?RHntjwIrjVXVlDp46qBa1Bt8GxB82LV3zgXhZvuC58gQhiGHCR/ylYQYInjg?=
 =?us-ascii?Q?0ECtwy2/K1498SoLmHGzO8VhI1qtaERH9Y+LbFvgj3zYB6IDHhv2ggcDPMto?=
 =?us-ascii?Q?mzqaJMo3FsrtPqLuZXr5J82H/7Z74j4DBRL3BNAnwQ1tGYJcEaMhTVBXOQzK?=
 =?us-ascii?Q?e9u5UDTGii+D2H72QzEzJ07Txj7Vc4JloKl694bV5MxJHbX4RnP+wPUQwO5o?=
 =?us-ascii?Q?25LdqOH+IjyN6x0ei3meBgKQJltuDqplxfPa9lMVHZMEzIkQrh0n7E+GCG4y?=
 =?us-ascii?Q?NtgdFOa61HjYydP/HfICdfzWFyjgRr2/o0Kmi27jtr8fimLavVy8LXCMnSyH?=
 =?us-ascii?Q?JAs+ILSzjzXIZP6Gv1fc/fnSNQtu45f1SHxD3Pyntlhpljxs3i22ICamvHhE?=
 =?us-ascii?Q?hfoRRCVbrihFEllKF7Xw5LfW4bL47XawHt9NuZXwDgF5cJDCD2RjSAT5/Qko?=
 =?us-ascii?Q?OhUYMpIOVwVW4/x/vpmlWxVEVmJgD+2XU0PgfqpqFrOkfkMoefvUgixQhKa8?=
 =?us-ascii?Q?ZsO7J+/jXeXqbOzZxPm+XO0/E4ykiio0G7dZ7dlcHgNzDkxHMVGMPoCALvvx?=
 =?us-ascii?Q?tJ2fSL787UliQbCpXQ6E6+64sucCqEOoyZ2c4HpuqRv/zJxWoDdo+y2n5n7L?=
 =?us-ascii?Q?KRqewhl7vHECjVgiDY25XR3PqyDESxs6ETqLxOnLPzXl9O92W/W/zWC9EMCn?=
 =?us-ascii?Q?fwskIMjY9A6wwNNMYa4xCiAmEncul0FkpDLKFhkcZKGVgHifYdOH/OPMQWDq?=
 =?us-ascii?Q?CWiES7nssXcC9L6Kbkuw/GarWVzBhjfPgBET/z1mNwxaObs/l+QP0ze989Bz?=
 =?us-ascii?Q?uBcg4Op3gyEZlfg9n0Fn4MVYawK402avu2v8gIE9ahXD3nc/fMCrftpSJNoG?=
 =?us-ascii?Q?v8kytlaSP/CmLg6gcR/JOp4a9wvm7zjzc1fnBvu1ZkNUFprnEqdBZb8ize/e?=
 =?us-ascii?Q?xZZu5qpHvfCXL/NScbrfZsuEySKSc0u/CcWjZ9n0OpQdOH4VGegx1k4OQ63i?=
 =?us-ascii?Q?u6Ush6PI+M0qcWXgFkOQZtSuxTadq2M0ju0ZpbdO8pBiHe4406QN9SeOluUF?=
 =?us-ascii?Q?1t8MWYmkYshOCO2D8KwoeouII+8I+afB8T8lpJtRKJluppApYkCl4GhkvSdE?=
 =?us-ascii?Q?ljKk1+aAjBjyMOe+m0upEpaOd6KY057k6knDODMXYSLNQRIJWOxxnixSY1uL?=
 =?us-ascii?Q?LAnQPxK0XwfbJ7Ex451qCGEbXSSrLdDeXGY5DbM09EylaEG2iMli5Hmr45Dp?=
 =?us-ascii?Q?wGuRDL/vft2NZaZeKUCBbE/O+WbYzG95LUPx4/qDdfSQSCHaYmID3+RPKKQZ?=
 =?us-ascii?Q?XLMpQG2HPt+xkAFaf2ljlDxF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63995a5b-e0ff-444c-eb4f-08d8fdf52ae5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 20:54:30.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adIFYV7pwQJ+Z0s2PjfqcbW7h8oZr/aVBScRVmF7+kCAdezyZOutQ2jwnNZTmMOZBHP0dcxhoHwCN0VpRpyB4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2717
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Refresh 3 patches.

Removed Patch:
ilp32.patch fixed by upstream 0719388cfb1a79160204314beb1de1f9c29a3684

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...06-Define-correct-gregs-for-RISCV32.patch} | 26 ++++++--
 .../recipes-extended/redis/redis/ilp32.patch  | 29 --------
 ...ile-to-use-environment-build-setting.patch | 66 ++++++++++---------
 .../redis/redis/oe-use-libc-malloc.patch      | 12 ++--
 .../redis/{redis_6.0.9.bb =3D> redis_6.2.1.bb}  |  5 +-
 5 files changed, 62 insertions(+), 76 deletions(-)
 rename meta-oe/recipes-extended/redis/redis/{riscv32.patch =3D> 0006-Defin=
e-correct-gregs-for-RISCV32.patch} (61%)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/ilp32.patch
 rename meta-oe/recipes-extended/redis/{redis_6.0.9.bb =3D> redis_6.2.1.bb}=
 (93%)

diff --git a/meta-oe/recipes-extended/redis/redis/riscv32.patch b/meta-oe/r=
ecipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 61%
rename from meta-oe/recipes-extended/redis/redis/riscv32.patch
rename to meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-fo=
r-RISCV32.patch
index 79ec7423d..b2d1a32ed 100644
--- a/meta-oe/recipes-extended/redis/redis/riscv32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RI=
SCV32.patch
@@ -1,21 +1,33 @@
-Define correct gregs for RISCV32
+From 6134b471c35df826ccb41aab9a47e5c89e15a0c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Oct 2020 21:32:22 -0700
+Subject: [PATCH] Define correct gregs for RISCV32
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Updated patch for 6.2.1
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ src/debug.c | 26 ++++++++++++++++++++++++--
+ 1 file changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/debug.c b/src/debug.c
+index e7fec29..5abb404 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -942,7 +942,9 @@ static void *getMcontextEip(ucontext_t *
+@@ -1039,7 +1039,9 @@ static void *getMcontextEip(ucontext_t *uc) {
      #endif
  #elif defined(__linux__)
      /* Linux */
--    #if defined(__i386__) || defined(__ILP32__)
+-    #if defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)=
) && defined(__ILP32__))
 +    #if defined(__riscv) && __riscv_xlen =3D=3D 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
-+    #elif defined(__i386__) || defined(__ILP32__)
++    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64_=
_)) && defined(__ILP32__))
      return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
      #elif defined(__X86_64__) || defined(__x86_64__)
      return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1102,8 +1104,28 @@ void logRegisters(ucontext_t *uc) {
+@@ -1206,8 +1208,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -40,8 +52,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +    );
 +    logStackContent((void**)uc->uc_mcontext.__gregs[REG_SP]);
      /* Linux x86 */
--    #if defined(__i386__) || defined(__ILP32__)
-+    #elif defined(__i386__) || defined(__ILP32__)
+-    #if defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)=
) && defined(__ILP32__))
++    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64_=
_)) && defined(__ILP32__))
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
diff --git a/meta-oe/recipes-extended/redis/redis/ilp32.patch b/meta-oe/rec=
ipes-extended/redis/redis/ilp32.patch
deleted file mode 100644
index 48d01a1d6..000000000
--- a/meta-oe/recipes-extended/redis/redis/ilp32.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-__ILP32__ is defined for all 32bit architectures with clang e.g.
-which is right but it is causing issues on non-x86 architectures
-where this condition becomes true and wrongly starts using this
-code, this issue is hidden with gcc becuase gcc does not define
-__ILP32__ for all 32bit architectures but for selected 64bit arches
-who choose to use 32bit ABI e.g. x32
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/src/debug.c
-+++ b/src/debug.c
-@@ -944,7 +944,7 @@ static void *getMcontextEip(ucontext_t *
-     /* Linux */
-     #if defined(__riscv) && __riscv_xlen =3D=3D 32
-     return (void*) uc->uc_mcontext.__gregs[REG_PC];
--    #elif defined(__i386__) || defined(__ILP32__)
-+    #elif defined(__i386__) || (defined(__X86_64__) && defined(__ILP32__)=
)
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
-     #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1125,7 +1125,7 @@ void logRegisters(ucontext_t *uc) {
-     );
-     logStackContent((void**)uc->uc_mcontext.__gregs[REG_SP]);
-     /* Linux x86 */
--    #elif defined(__i386__) || defined(__ILP32__)
-+    #elif defined(__i386__) || ( defined(__X86_64__) && defined(__ILP32__=
))
-     serverLog(LL_WARNING,
-     "\n"
-     "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
diff --git a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-us=
e-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/lu=
a-update-Makefile-to-use-environment-build-setting.patch
index 7e62ae131..1619e9db3 100644
--- a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-envir=
onment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-envir=
onment-build-setting.patch
@@ -1,4 +1,4 @@
-From 394108035d350ae662a431c80131f812b5f72dff Mon Sep 17 00:00:00 2001
+From 097a2b259cb266c2c861dc74fa6f80712d6138c5 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -12,14 +12,42 @@ Updated to work with 3.0.x
=20
 Signed-off-by: Armin Kuster <akust808@gmail.com>
=20
+updated to work wtih 6.2.1
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
- deps/lua/src/Makefile | 18 +++++++-----------
- 1 file changed, 7 insertions(+), 11 deletions(-)
+ deps/Makefile         |  1 -
+ deps/lua/Makefile     |  1 -
+ deps/lua/src/Makefile | 16 ++++++----------
+ 3 files changed, 6 insertions(+), 12 deletions(-)
=20
-Index: redis-3.0.2/deps/lua/src/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- redis-3.0.2.orig/deps/lua/src/Makefile
-+++ redis-3.0.2/deps/lua/src/Makefile
+diff --git a/deps/Makefile b/deps/Makefile
+index ff16ee9..d8d64aa 100644
+--- a/deps/Makefile
++++ b/deps/Makefile
+@@ -74,7 +74,6 @@ LUA_LDFLAGS+=3D $(LDFLAGS)
+ # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes it mo=
re
+ # challenging to cross-compile lua (and redis).  These defines make it ea=
sier
+ # to fit redis into cross-compilation environments, which typically set A=
R.
+-AR=3Dar
+ ARFLAGS=3Drc
+=20
+ lua: .make-prerequisites
+diff --git a/deps/lua/Makefile b/deps/lua/Makefile
+index 209a132..72f4b2b 100644
+--- a/deps/lua/Makefile
++++ b/deps/lua/Makefile
+@@ -33,7 +33,6 @@ INSTALL_DATA=3D $(INSTALL) -m 0644
+=20
+ # Utilities.
+ MKDIR=3D mkdir -p
+-RANLIB=3D ranlib
+=20
+ # =3D=3D END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+diff --git a/deps/lua/src/Makefile b/deps/lua/src/Makefile
+index f3bba2f..1555ec0 100644
+--- a/deps/lua/src/Makefile
++++ b/deps/lua/src/Makefile
 @@ -5,18 +5,14 @@
  # =3D=3D CHANGE THE SETTINGS BELOW TO SUIT YOUR ENVIRONMENT =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
@@ -45,27 +73,3 @@ Index: redis-3.0.2/deps/lua/src/Makefile
 =20
  # =3D=3D END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
-Index: redis-3.0.2/deps/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- redis-3.0.2.orig/deps/Makefile
-+++ redis-3.0.2/deps/Makefile
-@@ -63,7 +63,6 @@ LUA_LDFLAGS+=3D $(LDFLAGS)
- # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes it mo=
re
- # challenging to cross-compile lua (and redis).  These defines make it ea=
sier
- # to fit redis into cross-compilation environments, which typically set A=
R.
--AR=3Dar
- ARFLAGS=3Drcu
-=20
- lua: .make-prerequisites
-Index: redis-3.0.2/deps/lua/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- redis-3.0.2.orig/deps/lua/Makefile
-+++ redis-3.0.2/deps/lua/Makefile
-@@ -33,7 +33,6 @@ INSTALL_DATA=3D $(INSTALL) -m 0644
-=20
- # Utilities.
- MKDIR=3D mkdir -p
--RANLIB=3D ranlib
-=20
- # =3D=3D END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE=
 =3D=3D=3D=3D=3D=3D=3D=3D=3D
-=20
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch =
b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
index 6745f3d0e..a0f66b845 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
@@ -1,4 +1,4 @@
-From f8861d2129b9e18bba137705bfa38c6bd9be1790 Mon Sep 17 00:00:00 2001
+From 1fa047162983d4a7e0576f0837a73a6027a783bd Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -6,7 +6,7 @@ Subject: [PATCH] hack to force use of libc malloc
 Hack to force libc usage as it seems the option to pass it in has been
 removed in favor of magic.
=20
-Note that this of course doesn't allow tcmalloc and jemalloc, however=20
+Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
=20
 Signed-off-by: Venture Research <tech@ventureresearch.com>
@@ -15,11 +15,11 @@ Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
=20
 ---
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/src/Makefile b/src/Makefile
-index 86e0b3fe..a810180b 100644
+index ecd6929..c7f43c5 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -31,4 +31,4 @@ index 86e0b3fe..a810180b 100644
 +uname_S :=3D "USE_LIBC_MALLOC"
  uname_M :=3D $(shell sh -c 'uname -m 2>/dev/null || echo not')
  OPTIMIZATION?=3D-O2
- DEPENDENCY_TARGETS=3Dhiredis linenoise lua
+ DEPENDENCY_TARGETS=3Dhiredis linenoise lua hdr_histogram
diff --git a/meta-oe/recipes-extended/redis/redis_6.0.9.bb b/meta-oe/recipe=
s-extended/redis/redis_6.2.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_6.0.9.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.1.bb
index 50571ed55..89990df3d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.9.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.1.bb
@@ -15,10 +15,9 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.tar=
.gz \
            file://oe-use-libc-malloc.patch \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
-           file://riscv32.patch \
-           file://ilp32.patch \
+           file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] =3D "dc2bdcf81c620e9f09cfd12e85d3bc631c897b2db7a55218fd=
8a65eaa37f86dd"
+SRC_URI[sha256sum] =3D "cd222505012cce20b25682fca931ec93bd21ae92cb4abfe742=
cf7b76aa907520"
=20
 inherit autotools-brokensep update-rc.d systemd useradd
=20
--=20
2.29.2

