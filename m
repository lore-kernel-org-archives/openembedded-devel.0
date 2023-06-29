Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFA1EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 13:04:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7612.1688043871944901001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jun 2023 06:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bctt7IEb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6544b0ee17=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35TAd2GO020121
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 13:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=llVnH/LR77m5NN2smz
	sIfjOyfijaELGxsIO8+BKVBSQ=; b=bctt7IEbUvts8UYopw6Z7yiWEcKWTjB11g
	osT+mMdwRb4Hsh/oc28l3OX5v8YohiI1UELPzmxS79l3/mQ4pGLY+QWlhQXsDNG2
	TV4sqccwhGr3zNihV46TiXGZiJMRkGomVLTpGjPqh687AQ8EssEzoxigxW4/zFtW
	IPfAkgnpDZbL1ewjDJV6swNlAYu24rZsnWkeoNtgC1q4qqVRP0Lr4wKfOQW5W29B
	zzyNmSSYWU7a0q+bF7UXOaX81Uyhhg67QtQBcj1fAVBAEw1Zn3voMYNktF6oxUpR
	3MsziFEHljqmCJn6xqX+OLvlnjNA6MEt6WrALbYFWKGgHlnVfmPg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4cu2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 13:04:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnxGVsfp0hP/VWRCLvaNdglrwtByBN0X/Sd+X6MiYQmPLlONSavkynjmv0ujvkZRSi51Wfnxj0Myrtlw3QnAzpoHR/0C7US6l5CgOlDXnNpraoc2Yqyoy50r99C1XOWuptiiIk4QeOarPKsF6NGzyBwCylIw/vifRDwxuUinrWk32mefMbMncmKyXTvFSCrfaeZKTvC9Je0cyhgVyssaGZjvhZJo2VHLEwJ/QmnovJdhzRN9/qzH3FiR3PmPBAjxaZhmy31I9YvdljjtUwiwpEVv2Ed4GkyGPD3yHOihMRWuPK4mW2lBPQZK7rVvUN3G5TnaA8YxvZOMXdQLxWnXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llVnH/LR77m5NN2smzsIfjOyfijaELGxsIO8+BKVBSQ=;
 b=LMPuI3A7wFJAc50/9ROBhrVBYbKCxKYc438lEawJLJDf701UlAR2f3D4iRLto8Ck0fCDA1uOUm+xuAilGDqgkb1EfHaeznocYK98bg+3TSx+lHsMrumbg+AnkeGCJFW4g+s4Iy0AxVAkcVR65oEh0kohyJ6srfRynYxEfzA7+2C59+wUDQN5QJa9IKZZZgF80vB1yHoOR294YMY8Jc8twMhAQRPjhQTDTHTxR5kB3+SpuEAVb0HArCjPVE1kexdV2Ns1oe1O5hA5P0wdu3mJ5N1ceTekYPW7CV/kOtcM+VJdY7uCl61JyC+6yF5dJt/KC6AyWYealrKSBpBDFtY7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 13:04:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9%7]) with mapi id 15.20.6544.012; Thu, 29 Jun 2023
 13:04:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH][mickledore][master] open-vm-tools: Security fix CVE-2023-20867
Date: Thu, 29 Jun 2023 21:04:15 +0800
Message-Id: <20230629130415.666094-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b246a9-0ac2-4c1e-8124-08db78a15f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DPUt62/wwpW2Iet8sau6k7oc77XqmkuLHeyfRAHdqFP8vCB416FmwFPSI8CLibFDT3qq4F42lg5P3Iv7juUc+6ua6VCdURS0D3nQj6zpCDoeU20d/PneiV/5xKoNslJI3urCTaiMi7POZhPgik6l2F8DHoDAiheOdZk0tBLTFhTAN4dEQyjCLG73m9HxQvRXjCKHCYAvP3WfAkvwNsYMZ76NUHLCEbKyh8bwuzgyNuIvDjkEFlg1ljskrs/CZkHXQemhfl9ezZ5BxnVk42Lvt9hrNn8t95j844O7SXJYfp8gY3oXnKbpqW4CaGSK7bJRscEG8HRDp2A6ZDeRqh3dSfgQ1YmukFs98QlU3RP8eSEFaA366bopf1C8MAnakua5+1ceiyG20gDFI6n6u7iJFjZOp2U0zDbhY0bgmeei7cR1HGH2ZSrMuIiesmgDWFVm+WxGmzZj8T+eVDwdD8xv093KGjuM032wbfzNMpbPDB16hTV4Iw8NZr6qmy6Acr202JrsGKd0KgNRwpON+keu7R/GN/pq2A/rbxjwqZn0Subta77s8gE0UWNIVvhhxwIcpzLHOIwUjTOHE8E11R3TqqGDLE+LTPDin0gy47ZmduEwJqfQtPMe1TaiUvaSdwg8Vs47Uw+6e7Hww8FNT5MYZ9LF9dUAv66NTZY+IXcskOY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(451199021)(83380400001)(52116002)(966005)(6666004)(478600001)(6486002)(1076003)(2906002)(66946007)(186003)(26005)(66476007)(6506007)(66556008)(6512007)(5660300002)(38350700002)(316002)(44832011)(41300700001)(38100700002)(8676002)(6916009)(8936002)(15650500001)(36756003)(86362001)(2616005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5MjwR8sEYO0R0sETXw7Ecm/YLXznHPeb3DdEujDI8oA5PKGWiHYviegMGdbl?=
 =?us-ascii?Q?wXXyWPVBTCvddouuZTf5/mNKLHcYK2GXdbPfSscn5n21RlPUq2Mfcg4Yhdrt?=
 =?us-ascii?Q?MSTWf9BFTEx7sE0iboGcz//JRIw141+c0HceiOh1JzncUilhNDwuLcPy3DS0?=
 =?us-ascii?Q?W1vVxOdN14364pEfFQ51ulIgCzEHQJPkZIG5vMxhh4Qa2uzeXOIdqong3iV0?=
 =?us-ascii?Q?6cDdRZuytKx/KCYEthTdm3sP7RR0DFJuzEBMe1rI7eZW1YO6uQxXfVunexnE?=
 =?us-ascii?Q?g/8hdzS1/t4Te4L19oYHI7fLCRMMVZQ3qI1IlbJ6dM4mxSgA3vbHxZI38XFF?=
 =?us-ascii?Q?fEqE5WfDFwNR7tAPkwqa/VL8Uek62ifto9LdCR3YUaoZRBaN/4MGl//CfoX4?=
 =?us-ascii?Q?5fM7WlPtoL+fIYJbUgb8GKlYAEgf9VXCjtnw5agcNRgTU3+hDQNsYkTE3iys?=
 =?us-ascii?Q?Orqwk3gFYYNCiHNrF5E8qBtP0pWfrkhqkjHr0imRqUI1DMC0nTgw/77VVnuG?=
 =?us-ascii?Q?UKn3Tsk2HnAt0vFQy8lbQnE/7I5PB+9KSBqSpMtfQKG+yRD/Mayo0ZWXYeFn?=
 =?us-ascii?Q?fTx49bdMqwrD5FhSkopGenSnDHEZbK6F3tK1jeRZctZD1cjdA7pfNKuLuy78?=
 =?us-ascii?Q?i+dFsNrjuFSkRZu+Y9OxIDRbwlHwXribQmLqKiGfWSlFBfUGZNaMmzxkIOWj?=
 =?us-ascii?Q?P1cGgDVohK0NR1vsRs7JM4Z4qgtoQhOHWh7TDYn35jkGwiDMGebQ2Y2ZPlQS?=
 =?us-ascii?Q?sku45iF4Ep3plrayAktQiXwzKTcQxYApWn8uqh7+hjnXj8Y0FZgNz6ctPRAA?=
 =?us-ascii?Q?uD9aTWDPOrEzv/rxDVvBYXMihmDidXCSi5N3yLXNU7wacUg/bLIpjmBydUPk?=
 =?us-ascii?Q?gMOzBSkLi9XlzYtEVOXSKWjeWetx0l3/KoUpYkHmHDtv5qgZIMVImL8JWcRD?=
 =?us-ascii?Q?ZAVH0taocAzCt6sgDIh/hFzVNGQaMZDjt/lsIOByYajQpkdwFJqbunPoyQ1Q?=
 =?us-ascii?Q?EE+FaFVOsDBdhLcZRwWkpJwIGAVXROjqbAiXal6H4OMuibibGyDtfjIs6rTc?=
 =?us-ascii?Q?nU4w8dz3XzJxOqlLGC/003+c3zvIYd+EG/qKkBeoBf0iQWm84UaVWEvPOR2s?=
 =?us-ascii?Q?hzdi766lfBEOyibTMto0R8slliKi406uS4c4B7jytLmMYsxUMn+ARIYp5j5m?=
 =?us-ascii?Q?4EoVvxSAC2Ljl5ybYoD2q8kOSyzSqFU74PnDHz0wLR81dR7TMAismaNBZpic?=
 =?us-ascii?Q?uWR4Wz2W4LLXkQwWnj6pq2+LNzY3sUb8PtA4BPmc7Gh9KoI35In3qNr4OK+U?=
 =?us-ascii?Q?urfcLacKBNfIkxjsPZoOaNKkmLPTd7gbtIqpKSUi2iEb+FLfhR9aLlDNWz5K?=
 =?us-ascii?Q?XYFhKLYyOa1GkjrDfX5G3V/4naQTGRiaLLjXOp/vgqGSK/FfCD1+fvw0np9C?=
 =?us-ascii?Q?tivupg7oVj5cAuR+w532N8uFKLVoFkFkdKVm/6d7iDXfO8kIvIBWMVz2P/e0?=
 =?us-ascii?Q?w0Ore0itjdWTFUgluEgOgsENN4IH8cvIJuXfD/wWStfcKGaOwYDLy7Lgias0?=
 =?us-ascii?Q?ev/oOJejVMiel0USsLyFwFHo/MGOoXB928yz8K0d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b246a9-0ac2-4c1e-8124-08db78a15f5b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 13:04:28.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EubZNcchNgOkIwLv+2G+PpI3BP3uPZgYjZ4xqJ/IIe6dkY7RAoQggziWWLhV1uInJjtQ9wa8DKOxP1yctPYclA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
X-Proofpoint-ORIG-GUID: 3C6NID9z32m4Un4BiZ3a2W8syHfZr6jw
X-Proofpoint-GUID: 3C6NID9z32m4Un4BiZ3a2W8syHfZr6jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jun 2023 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103640

CVE-2023-20867:
A fully compromised ESXi host can force VMware Tools to fail to
authenticate host-to-guest operations, impacting the confidentiality and
integrity of the guest virtual machine.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-20867

Patch from:
https://github.com/vmware/open-vm-tools/blob/CVE-2023-20867.patch/2023-20867-Remove-some-dead-code.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../open-vm-tools/CVE-2023-20867.patch        | 163 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_12.1.5.bb     |   1 +
 2 files changed, 164 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
new file mode 100644
index 000000000..170dddf68
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
@@ -0,0 +1,163 @@
+From 3028cdd4c0b2461b904cbe5a5868c8e591aa0941 Mon Sep 17 00:00:00 2001
+From: John Wolfe <jwolfe@vmware.com>
+Date: Mon, 8 May 2023 19:04:57 -0700
+Subject: [PATCH] Remove some dead code.
+
+Address CVE-2023-20867.
+Remove some authentication types which were deprecated long
+ago and are no longer in use. These are dead code.
+
+CVE: CVE-2023-20867
+
+Upstream-Status: Backport
+[https://github.com/vmware/open-vm-tools/blob/CVE-2023-20867.patch/2023-20867-Remove-some-dead-code.patch]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ open-vm-tools/services/plugins/vix/vixTools.c | 102 --------------------------
+ 1 file changed, 102 deletions(-)
+
+diff --git a/open-vm-tools/services/plugins/vix/vixTools.c b/open-vm-tools/services/plugins/vix/vixTools.c
+index 9f376a7..85c5ba7 100644
+--- a/open-vm-tools/services/plugins/vix/vixTools.c
++++ b/open-vm-tools/services/plugins/vix/vixTools.c
+@@ -254,8 +254,6 @@ char *gImpersonatedUsername = NULL;
+ #define  VIX_TOOLS_CONFIG_API_AUTHENTICATION          "Authentication"
+ #define  VIX_TOOLS_CONFIG_AUTHTYPE_AGENTS             "InfrastructureAgents"
+ 
+-#define VIX_TOOLS_CONFIG_INFRA_AGENT_DISABLED_DEFAULT  TRUE
+-
+ /*
+  * The switch that controls all APIs
+  */
+@@ -730,9 +728,6 @@ VixError GuestAuthSAMLAuthenticateAndImpersonate(
+ 
+ void GuestAuthUnimpersonate();
+ 
+-static Bool VixToolsCheckIfAuthenticationTypeEnabled(GKeyFile *confDictRef,
+-                                                     const char *typeName);
+-
+ #if SUPPORT_VGAUTH
+ 
+ VGAuthError TheVGAuthContext(VGAuthContext **ctx);
+@@ -8013,29 +8008,6 @@ VixToolsImpersonateUser(VixCommandRequestHeader *requestMsg,   // IN
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
+@@ -8205,36 +8177,6 @@ VixToolsImpersonateUserImplEx(char const *credentialTypeStr,         // IN
+       }
+ 
+       /*
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
+-      /*
+        * If the VMX asks us to run commands in the context of the current
+        * user, make sure that the user who requested the command is the
+        * same as the current user.
+@@ -10917,50 +10859,6 @@ VixToolsCheckIfVixCommandEnabled(int opcode,                          // IN
+ /*
+  *-----------------------------------------------------------------------------
+  *
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
+-/*
+- *-----------------------------------------------------------------------------
+- *
+  * VixTools_ProcessVixCommand --
+  *
+  *
+-- 
+2.6.2
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
index d389d2450..e12e4be7f 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0001-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
+           file://CVE-2023-20867.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


