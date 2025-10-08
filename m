Return-Path: <rajeshkumar.ramasamy@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4891CCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 17:52:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.560.1759945967323323650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 10:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qxeqljQE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23769bf0b3=rajeshkumar.ramasamy@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598Cu3h01854309
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Oct 2025 17:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=PQkgT15Rd29UOKFyJXSB
	sPpMIu3dqUPLfxuFsDu0vyE=; b=qxeqljQErtopqN5RAXJoKxiVgcMDilnQ21Zl
	kRvQBkpcret3jv9A1nR4P7sGHnsRvmw8cvICnjxC+780tTPT3k7FSmkXfcFLvziI
	pjv8/Ou0DjqQOZvukjVJJYNAIjYxNIUxFTGKfe1/gtnKZpEymXrA/zZTRDKGogal
	MiPYQvdSzdP6gk672n26Bz5CGFZkAeD/MOfZNb4w2MRS7ko/ZRpHIu/wjWmB5Jb2
	hpH4ePG7lT0QwYwzqH/5+JDfOeM3yONYsGjkd52A9UwCTQHdHcpI9/2qLmTQJyNZ
	LjpdiJWG2Chyasim/dQ6dmjFMSaBpREEeyDp/YuV6NjNULWFDw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jrxgvvv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 17:52:46 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 8 Oct 2025 10:52:44 -0700
From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH  1/1] open-vm-tools: fix CVE-2025-41244
Date: Wed, 8 Oct 2025 23:22:30 +0530
Message-ID: <20251008175230.2757048-1-rajeshkumar.ramasamy@windriver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: V-_Ik_Lv8QUxboxzywUUe_85O-hBa1HX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyNSBTYWx0ZWRfXzQLP6XITdWig
 EAQxmj/f0+H0vsgMgVpStDgDpbDrCqk7l7hMRg12ZiuXp6iEIWipdvLoNL4yeDCFi7Bx3QzeqVN
 Ht9ufvHwgCCClnLPBrd7l8uA5MplJqiLQdYJlPM0TuwNHQ7QgM0HvXwwz1baGFyOUpL+dnjP2NH
 qgVCWhkla2TNXae5Yp+vKX3tGU4hWZTNmMMp2PvNA/6Wx+8LI2zebYCrYdgm15YAm3bsHGXL64I
 EHeIiBNGgkwTZ3ENfUvoD7BhFa3AkZR2pyWMxPzdnoV64QD3qtgyXt8+aDSgXXMSTcQo68xF68F
 xXDKE7yGz6jQTFq64i3TYOGoO4bU0kacv6SXbmhMdC/CgS80ljY1a+5p42VLzz3LZeyxhAsO6u2
 i/4HOpIn/XP5YSqUk59Jg8ddQKUXsw==
X-Proofpoint-ORIG-GUID: V-_Ik_Lv8QUxboxzywUUe_85O-hBa1HX
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=68e6a4ee cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yU_jQ1hFIRIA:10 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8 a=Z9gm-2EgdLpnPDHb2IcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510080125
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 17:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120377

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
 .../open-vm-tools/CVE-2025-41244.patch        | 124 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.3.5.bb     |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch
new file mode 100644
index 0000000000..ad1ff93365
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-41244.patch
@@ -0,0 +1,124 @@
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
+ .../serviceDiscovery/serviceDiscovery.c       | 38 ++++++++++++++++---
+ 1 file changed, 32 insertions(+), 6 deletions(-)
+
+diff --git a/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c b/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c
+index de8901741..329f87e15 100644
+--- a/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c
++++ b/open-vm-tools/services/plugins/serviceDiscovery/serviceDiscovery.c
+@@ -1,5 +1,6 @@
+ /*********************************************************
+- * Copyright (C) 2020 VMware, Inc. All rights reserved.
++ * Copyright (c) 2020-2025 Broadcom. All Rights Reserved.
++ * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -107,6 +108,12 @@ VM_EMBED_VERSION(VMTOOLSD_VERSION_STRING);
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
+  * Maximum number of keys that can be deleted by one operation
+  */
+@@ -845,24 +852,27 @@ ServiceDiscoveryServerShutdown(gpointer src,
+  *
+  * Construct final paths of the scripts that will be used for execution.
+  *
+- *****************************************************************************
++ * @param[in] versionCheckEnabled  TRUE to include the SERVICE_DISCOVERY_KEY_VERSIONS
++ *                                 entry; FALSE to skip it (derived from config).
++ * *****************************************************************************
+  */
+
+ static void
+-ConstructScriptPaths(void)
++ConstructScriptPaths(Bool versionCheckEnabled)
+ {
+    int i;
+    gchar *scriptInstallDir;
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
+
+ #if defined(OPEN_VM_TOOLS)
+    scriptInstallDir = Util_SafeStrdup(VMTOOLS_SERVICE_DISCOVERY_SCRIPTS);
+@@ -874,6 +884,15 @@ ConstructScriptPaths(void)
+ #endif
+
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
+@@ -883,7 +902,8 @@ ConstructScriptPaths(void)
+       tmp.val = g_strdup_printf("%s%s%s", scriptInstallDir, DIRSEPS,
+                                 gKeyScripts[i].val);
+ #endif
+-      g_array_insert_val(gFullPaths, i, tmp);
++      g_array_insert_val(gFullPaths, insertIndex, tmp);
++      insertIndex++;
+    }
+
+    g_free(scriptInstallDir);
+@@ -951,14 +971,20 @@ ToolsOnLoad(ToolsAppCtx *ctx)
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
+        * Append scripts absolute paths based on installation dirs.
+        */
+-      ConstructScriptPaths();
++      ConstructScriptPaths(versionCheckEnabled);
+
+       disabled =
+          VMTools_ConfigGetBoolean(ctx->config,
+--
+2.40.0
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index b58b3ddb90..0e671b6557 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://CVE-2023-34058.patch;patchdir=.. \
            file://CVE-2023-34059.patch;patchdir=.. \
            file://CVE-2025-22247.patch;patchdir=.. \
+           file://CVE-2025-41244.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.48.1


