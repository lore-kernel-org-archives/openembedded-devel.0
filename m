Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D27E7C4F5
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 07:15:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9998.1696490095475541670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 00:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QUVBTeGU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=864239b5d2=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39574Mvt005400
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Oct 2023 07:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=wgDN1
	kqlIT9aGn9FAYBInv6tipLZGcheFAAzr3BjO24=; b=QUVBTeGUUphKVIxKP7u7h
	aD8tFNHLuJOmN34+PmsUQv3fVv7ZaKfdn93Y0n3JaDuB/SOxSfHrAOF3Oro4jrXW
	RlTKKrHuVPw51UNQjboURC6oryw9Gby3zKKgCARouvDBSzTFQDvJhUgP9eNC1MmT
	jtRPcxNZ5uR3n5eP/ZUG2EleWyI+0Hy5YPJZHkxopHSROl8l3DYzPwocBY5dW/FI
	i1i+zytFSMjWIW42Xm5q/IOJD9dMiYwgdJWfUwcG/eaVxDv0lV2g7W1HrgjRXt8B
	69Y/T4gEGWaF6KS73ET7tabkVimQWCl6+w2DsZJm3Y9HS892Bp6o38Q5pFCnpoxR
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tean64s01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 07:14:54 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 00:14:49 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] open-vm-tools: fix CVE-2023-20867
Date: Thu, 5 Oct 2023 07:14:31 +0000
Message-ID: <20231005071431.2086154-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: CPHo4lva3dyxPE8S-xcC3xIXf71adzgI
X-Proofpoint-ORIG-GUID: CPHo4lva3dyxPE8S-xcC3xIXf71adzgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_03,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1011 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310050054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 07:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105353

A fully compromised ESXi host can force VMware Tools to
fail to authenticate host-to-guest operations, impacting
the confidentiality and integrity of the guest virtual machine.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../open-vm-tools/CVE-2023-20867.patch        | 158 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.3.5.bb     |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
new file mode 100644
index 000000000..071ddf45d
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
@@ -0,0 +1,158 @@
+From 32fe1b6ac239255a91020020510453685459b28a Mon Sep 17 00:00:00 2001
+From: John Wolfe <jwolfe@vmware.com>
+Date: Mon, 8 May 2023 19:04:57 -0700
+Subject: [PATCH] open-vm-tools: Remove some dead code.
+
+Address CVE-2023-20867.
+Remove some authentication types which were deprecated long
+ago and are no longer in use. These are dead code.
+
+Upstream-Status: Backport [https://github.com/vmware/open-vm-tools/blob/CVE-2023-20867.patch/2023-20867-Remove-some-dead-code.patch]
+CVE: CVE-2023-20867
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ open-vm-tools/services/plugins/vix/vixTools.c | 100 ------------------
+ 1 file changed, 100 deletions(-)
+
+diff --git a/open-vm-tools/services/plugins/vix/vixTools.c b/open-vm-tools/services/plugins/vix/vixTools.c
+index bde74021..6e51d1f4 100644
+--- a/open-vm-tools/services/plugins/vix/vixTools.c
++++ b/open-vm-tools/services/plugins/vix/vixTools.c
+@@ -254,7 +254,6 @@ char *gImpersonatedUsername = NULL;
+ #define  VIX_TOOLS_CONFIG_API_AUTHENTICATION          "Authentication"
+ #define  VIX_TOOLS_CONFIG_AUTHTYPE_AGENTS             "InfrastructureAgents"
+
+-#define VIX_TOOLS_CONFIG_INFRA_AGENT_DISABLED_DEFAULT  TRUE
+
+ /*
+  * The switch that controls all APIs
+@@ -730,8 +729,6 @@ VixError GuestAuthSAMLAuthenticateAndImpersonate(
+
+ void GuestAuthUnimpersonate();
+
+-static Bool VixToolsCheckIfAuthenticationTypeEnabled(GKeyFile *confDictRef,
+-                                                     const char *typeName);
+
+ #if SUPPORT_VGAUTH
+
+@@ -7913,29 +7910,6 @@ VixToolsImpersonateUser(VixCommandRequestHeader *requestMsg,   // IN
+                                           userToken);
+       break;
+    }
+-   case VIX_USER_CREDENTIAL_ROOT:
+-   {
+-      if ((requestMsg->requestFlags & VIX_REQUESTMSG_HAS_HASHED_SHARED_SECRET) &&
+-          !VixToolsCheckIfAuthenticationTypeEnabled(gConfDictRef,
+-                                            VIX_TOOLS_CONFIG_AUTHTYPE_AGENTS)) {
+-          /*
+-           * Don't accept hashed shared secret if disabled.
+-           */
+-          g_message("%s: Requested authentication type has been disabled.\n",
+-                    __FUNCTION__);
+-          err = VIX_E_GUEST_AUTHTYPE_DISABLED;
+-          goto done;
+-      }
+-   }
+-   // fall through
+-
+-   case VIX_USER_CREDENTIAL_CONSOLE_USER:
+-      err = VixToolsImpersonateUserImplEx(NULL,
+-                                          credentialType,
+-                                          NULL,
+-                                          loadUserProfile,
+-                                          userToken);
+-      break;
+    case VIX_USER_CREDENTIAL_NAME_PASSWORD:
+    case VIX_USER_CREDENTIAL_NAME_PASSWORD_OBFUSCATED:
+    case VIX_USER_CREDENTIAL_NAMED_INTERACTIVE_USER:
+@@ -8104,36 +8078,6 @@ VixToolsImpersonateUserImplEx(char const *credentialTypeStr,         // IN
+          }
+       }
+
+-      /*
+-       * If the VMX asks to be root, then we allow them.
+-       * The VMX will make sure that only it will pass this value in,
+-       * and only when the VM and host are configured to allow this.
+-       */
+-      if ((VIX_USER_CREDENTIAL_ROOT == credentialType)
+-            && (thisProcessRunsAsRoot)) {
+-         *userToken = PROCESS_CREATOR_USER_TOKEN;
+-
+-         gImpersonatedUsername = Util_SafeStrdup("_ROOT_");
+-         err = VIX_OK;
+-         goto quit;
+-      }
+-
+-      /*
+-       * If the VMX asks to be root, then we allow them.
+-       * The VMX will make sure that only it will pass this value in,
+-       * and only when the VM and host are configured to allow this.
+-       *
+-       * XXX This has been deprecated XXX
+-       */
+-      if ((VIX_USER_CREDENTIAL_CONSOLE_USER == credentialType)
+-            && ((allowConsoleUserOps) || !(thisProcessRunsAsRoot))) {
+-         *userToken = PROCESS_CREATOR_USER_TOKEN;
+-
+-         gImpersonatedUsername = Util_SafeStrdup("_CONSOLE_USER_NAME_");
+-         err = VIX_OK;
+-         goto quit;
+-      }
+-
+       /*
+        * If the VMX asks us to run commands in the context of the current
+        * user, make sure that the user who requested the command is the
+@@ -10814,50 +10758,6 @@ VixToolsCheckIfVixCommandEnabled(int opcode,                          // IN
+ }
+
+
+-/*
+- *-----------------------------------------------------------------------------
+- *
+- * VixToolsCheckIfAuthenticationTypeEnabled --
+- *
+- *    Checks to see if a given authentication type has been
+- *    disabled via the tools configuration.
+- *
+- * Return value:
+- *    TRUE if enabled, FALSE otherwise.
+- *
+- * Side effects:
+- *    None
+- *
+- *-----------------------------------------------------------------------------
+- */
+-
+-static Bool
+-VixToolsCheckIfAuthenticationTypeEnabled(GKeyFile *confDictRef,     // IN
+-                                         const char *typeName)      // IN
+-{
+-   char authnDisabledName[64]; // Authentication.<AuthenticationType>.disabled
+-   gboolean disabled;
+-
+-   Str_Snprintf(authnDisabledName, sizeof(authnDisabledName),
+-                VIX_TOOLS_CONFIG_API_AUTHENTICATION ".%s.disabled",
+-                typeName);
+-
+-   ASSERT(confDictRef != NULL);
+-
+-   /*
+-    * XXX Skip doing the strcmp() to verify the auth type since we only
+-    * have the one typeName (VIX_TOOLS_CONFIG_AUTHTYPE_AGENTS), and default
+-    * it to VIX_TOOLS_CONFIG_INFRA_AGENT_DISABLED_DEFAULT.
+-    */
+-   disabled = VMTools_ConfigGetBoolean(confDictRef,
+-                                       VIX_TOOLS_CONFIG_API_GROUPNAME,
+-                                       authnDisabledName,
+-                                       VIX_TOOLS_CONFIG_INFRA_AGENT_DISABLED_DEFAULT);
+-
+-   return !disabled;
+-}
+-
+-
+ /*
+  *-----------------------------------------------------------------------------
+  *
+--
+2.40.0
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index 4670a85a6..c80827a99 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0001-Properly-check-authorization-on-incoming-guestOps-re.patch;patchdir=.. \
+           file://CVE-2023-20867.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.0


