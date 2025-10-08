Return-Path: <rajeshkumar.ramasamy@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46902CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 17:52:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.544.1759945939497678219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 10:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bTtmC3eq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23769bf0b3=rajeshkumar.ramasamy@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598GfLGm2552203
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Oct 2025 10:52:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=I2OHBt00yl1GHwM1fAO0
	9VCjYbhHMNyYx8jH9jF30lY=; b=bTtmC3eqE1NwafOn1kBeUYSX7pgLOo46F5zw
	91ASt5Cc54JvP/UBMcib7CouFzppJ3vNryY+z3RpLTz87nwGJLSjZfYT5J52liCx
	mjGIZSGo3eIDiroGVltFD1eXxira0hNMAskQKUzlgWu++7CbZfBLM1Ci/U4VdkNZ
	T+ExW4v+cxa6tYlqF594KpJ3jxrSOxv8c1OvCEe5ZRaW1/PNSsoqqrBrDT293FB1
	ePSRlvhRPkZAq/nW4XvVAoToCzqPhyvoUYQkpzbXzNHjoGcXhoXqw6Ts6jvDOqja
	26V3GwCWrdLJLMOpQ1eLBIkJytnuAj3sCaAVIpbglksG5OQjhQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jxuwmppq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 10:52:19 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 8 Oct 2025 10:52:17 -0700
From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][scarthgap][PATCH  1/1] open-vm-tools: fix CVE-2025-41244
Date: Wed, 8 Oct 2025 23:21:53 +0530
Message-ID: <20251008175153.2756734-1-rajeshkumar.ramasamy@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=UMLQ3Sfy c=1 sm=1 tr=0 ts=68e6a4d3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=JBbWWo_dQDwA:10 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8 a=r2ssYG_LKoQCGATGcXcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-ORIG-GUID: Wx8UDeXAmwaD_hYVroF-3A8vJuljX_o3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyNSBTYWx0ZWRfX9+nTo/I+6RrV
 11v0BwGMblV9I31/tnyMu2Z0Ic8/sg1DlWd5yBFmX2P7Rl/Iq7QJEtcv/stqj7amHbkiT1bFwU2
 oilS1NFEhRSnuovAvq1FxxpgElgiWUG1MMWAK803pP1s1ojpjVBnxz5C9/lmp5cowFgUpAYNrVt
 kJnUyB24rYkI2nxzCGgiBCIcsWYUXZeDOTSm7EExZQyMpHHyMJrVpp9TV6vGzgDSwdSO9vgFglg
 81oLBHZUGVIl4v9XOohqNcwnRw7hezMG7tmqCQB5WvsS9DpRSwMOe2yZx/1hlyxMCw1O9ttlG55
 oP+G/JBsam/Q6mtm0lnFUICfSrfmHxHDuqXf1ZOiPfFiY37dkwVh1HP7uQSAYDwTR+HlQ5mG27N
 kuO84JXuJKuKHtCv29jm6pOHevsyRg==
X-Proofpoint-GUID: Wx8UDeXAmwaD_hYVroF-3A8vJuljX_o3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2510080125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 17:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120376

VMware Aria Operations and VMware Tools contain a local privilege
escalation vulnerability. A malicious local actor with non-administrative
privileges having access to a VM with VMware Tools installed and managed
by Aria Operations with SDMP enabled may exploit this vulnerability
to escalate privileges to root on the same VM.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-41244

Upstream-patch:
https://github.com/vmware/open-vm-tools/commit/7ed196cf01f8acd09011815a605b6733894b8aab

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
---
 .../open-vm-tools/CVE-2025-41244.patch        | 123 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_12.3.5.bb     |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch
new file mode 100644
index 0000000000..4d3f80f3d7
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch
@@ -0,0 +1,123 @@
+From 7ed196cf01f8acd09011815a605b6733894b8aab Mon Sep 17 00:00:00 2001
+From: Kruti Pendharkar <kp025370@broadcom.com>
+Date: Mon, 29 Sep 2025 01:02:40 -0700
+Subject: [PATCH] Address CVE-2025-41244 - Disable (default) the execution of
+ the SDMP get-versions.sh script.
+
+With the Linux SDMP get-versions.sh script disabled, version information
+of installed services will not be made available to VMware Aria
+
+CVE: CVE-2025-41244
+
+Upstream-Status: Backport [https://github.com/vmware/open-vm-tools/commit/7ed196cf01f8acd09011815a605b6733894b8aab]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ .../serviceDiscovery/serviceDiscovery.c       | 37 ++++++++++++++++---
+ 1 file changed, 32 insertions(+), 5 deletions(-)
+
+diff --git a/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c b/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c
+index 103cf14..bf928c8 100644
+--- a/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c
++++ b/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c
+@@ -1,5 +1,6 @@
+ /*********************************************************
+- * Copyright (C) 2020-2021,2023 VMware, Inc. All rights reserved.
++ * Copyright (c) 2020-2025 Broadcom. All Rights Reserved.
++ * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -115,6 +116,12 @@ static gchar* scriptInstallDir = NULL;
+  */
+ #define SERVICE_DISCOVERY_RPC_WAIT_TIME 100
+
++/*
++ * Defines the configuration to enable/disable version obtaining logic
++ */
++#define CONFNAME_SERVICEDISCOVERY_VERSION_CHECK "version-check-enabled"
++#define SERVICE_DISCOVERY_CONF_DEFAULT_VERSION_CHECK FALSE
++
+ /*
+  * Defines the configuration to cache data in gdp plugin
+  */
+@@ -1239,23 +1246,27 @@ ServiceDiscoveryServerShutdown(gpointer src,
+  *
+  * Construct final paths of the scripts that will be used for execution.
+  *
++ * @param[in] versionCheckEnabled  TRUE to include the SERVICE_DISCOVERY_KEY_VERSIONS
++ *                                 entry; FALSE to skip it (derived from config).
++ *
+  *****************************************************************************
+  */
+
+ static void
+-ConstructScriptPaths(void)
++ConstructScriptPaths(Bool versionCheckEnabled)
+ {
+    int i;
+ #if !defined(OPEN_VM_TOOLS)
+    gchar *toolsInstallDir;
+ #endif
++   int insertIndex = 0;
+
+    if (gFullPaths != NULL) {
+       return;
+    }
+
+    gFullPaths = g_array_sized_new(FALSE, TRUE, sizeof(KeyNameValue),
+-                                  ARRAYSIZE(gKeyScripts));
++                                  ARRAYSIZE(gKeyScripts) - (versionCheckEnabled ? 0u : 1u));
+    if (scriptInstallDir == NULL) {
+ #if defined(OPEN_VM_TOOLS)
+       scriptInstallDir = Util_SafeStrdup(VMTOOLS_SERVICE_DISCOVERY_SCRIPTS);
+@@ -1267,6 +1278,15 @@ ConstructScriptPaths(void)
+ #endif
+    }
+    for (i = 0; i < ARRAYSIZE(gKeyScripts); ++i) {
++      /*
++       * Skip adding if:
++       * 1. Version check is disabled, AND
++       * 2. The keyName matches SERVICE_DISCOVERY_KEY_VERSIONS
++       */
++      if (!versionCheckEnabled &&
++         g_strcmp0(gKeyScripts[i].keyName, SERVICE_DISCOVERY_KEY_VERSIONS) == 0) {
++         continue;
++      }
+       KeyNameValue tmp;
+       tmp.keyName = g_strdup_printf("%s", gKeyScripts[i].keyName);
+ #if defined(_WIN32)
+@@ -1274,7 +1294,8 @@ ConstructScriptPaths(void)
+ #else
+       tmp.val = g_strdup_printf("%s%s%s", scriptInstallDir, DIRSEPS, gKeyScripts[i].val);
+ #endif
+-      g_array_insert_val(gFullPaths, i, tmp);
++      g_array_insert_val(gFullPaths, insertIndex, tmp);
++      insertIndex++;
+    }
+ }
+
+@@ -1340,14 +1361,20 @@ ToolsOnLoad(ToolsAppCtx *ctx)
+          }
+       };
+       gboolean disabled;
++      Bool versionCheckEnabled;
+
+       regData.regs = VMTools_WrapArray(regs,
+                                        sizeof *regs,
+                                        ARRAYSIZE(regs));
++      versionCheckEnabled = VMTools_ConfigGetBoolean(
++         ctx->config,
++         CONFGROUPNAME_SERVICEDISCOVERY,
++         CONFNAME_SERVICEDISCOVERY_VERSION_CHECK,
++         SERVICE_DISCOVERY_CONF_DEFAULT_VERSION_CHECK);
+       /*
+        * Append scripts execution command line
+        */
+-      ConstructScriptPaths();
++      ConstructScriptPaths(versionCheckEnabled);
+
+       disabled =
+          VMTools_ConfigGetBoolean(ctx->config,
+--
+2.40.0
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
index 34ac34ba20..1ef2781d6a 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0014-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
            file://CVE-2025-22247.patch;patchdir=.. \
+           file://CVE-2025-41244.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.48.1


