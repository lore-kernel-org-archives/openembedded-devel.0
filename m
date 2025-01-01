Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BD8E7718B
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 23:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.24706.1735774293598423907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 15:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=30963dfe0d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501NU3uj005852
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Jan 2025 15:31:33 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq3bcf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 15:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyzEu1ZMay6hnRoqyXottMj4aW1C5jdrTNlf1eTrW9RsFS3dsrtBb2U6y9N5bpLXQeOH2rUkUMQJ2u49Pw2gKSdeej+by2vRRM30bTmTW2JvJiUJgwo2YnbnuOQbZrFhv3Be3QJQ1RyK/eEoLQOBd8UrhlrOOJ32mQCFq/yfVUHv+V8G5FCImlarW+T5c8/G6oc4HAabZwCzUC9g8/rDWPKaAC72fhi8rFuObtUADtqee/ezShNDYdpdstICPdagdv+NZi/PiwReb7JzWGFTdgZDiUwmsVqr3P9dzhvVqwvWoDvAfnTRcFHn7DqO+tvRQUAEjaVCozFzPYZli2aEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyk0xZ0OdHhUu11jJ8FcdSFrCvk6I2EZFK9cG+Pp74k=;
 b=UFnlG/B3xkaLHf78sls0Mt5OqN3rnNYeFY8lhxXtqCyRON9FDP+l2S8LdVncfj5+SUY0i2ZYjVzNlNLjVCoTXYXay96y9UrtjIQiWynx2bxYPMCQVtCPy4GYDkd+o5sJfG3l+U5OTPWFkK+crzGzcPfwar2lWsy+rowbafgFLndusP78h4AvoNOEHVH9ueVB+mPX/s+XuYE6TZs2XhVi0ucURJcnegwX/mTVRglHAGRCy1zPT6g1kfLhYXwXIXZOsFmENrWKggxOiAw1Dq99GbB4Emg2cMI0jGtDhOwDTk/ozca8sF4GsnM4VGS9h/w1YEhZXUztaEAA1sFXYlTixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8703.namprd11.prod.outlook.com (2603:10b6:610:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Wed, 1 Jan
 2025 23:31:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Wed, 1 Jan 2025
 23:31:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] snort3: upgrade 3.3.4.0 -> 3.6.1.0
Date: Thu,  2 Jan 2025 07:31:12 +0800
Message-Id: <20250101233112.2219927-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250101233112.2219927-1-yi.zhao@windriver.com>
References: <20250101233112.2219927-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f32bdc-f1e4-40c3-2120-08dd2abc6978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8b+NAluQCUyLrT1xm7nKnR9TqqLeZa1pyRH/SVO2tMXNbTixF5Aep3sqp6ib?=
 =?us-ascii?Q?UCu04uz3lc5Wgz0vb8TbafhOgNnNMwj/qgpoGETjQ7UHs2jbpVPMoYl2jIm0?=
 =?us-ascii?Q?Whe8FuvE3PEgsvRXz2FCcHU3noD388DgRhl0pTUEDnIIXH5jDWNdq6vV0TgV?=
 =?us-ascii?Q?c7CzRmzvQqxQ6S5PQqA/aAXipmHt1+BO+ca+CLWCrYr/m9DcCZt6vnC6N4ep?=
 =?us-ascii?Q?IKVuzpMJ6ZEZHP3NOlbtc6x5kQNKx/WDwne5soJUYroXWJeQPN9w+F0F+mpj?=
 =?us-ascii?Q?isw6G9ipRXa9S4QeSktwR2uUrXiSMI+UJJMq+9Dg0qDWeRt9vLtRwfnKxW2U?=
 =?us-ascii?Q?dqbkusuiDJkEDHma7VrjVM16RjPp7sPqBem6O5KfeuKVhDq7kmLEImouen7e?=
 =?us-ascii?Q?ioYug9tQ2LALGW+Oie6ash80x2FiAKxvC3fPwwkpnDvPL3SICRdD2w+/pXEJ?=
 =?us-ascii?Q?NshzE3xsjA4ZDTb8XG4u1atCVSXYvo+WLiL1ghDoiOed3KdTEFr1KoVhbM3J?=
 =?us-ascii?Q?/7tfZuoOjPSlIn+sadAFJcrMWIxulxQu+6msxhXDdoQ4T7JUWtjK2ekC9IPH?=
 =?us-ascii?Q?N5lNG1ugITV2qYCi3NO/8OkWLR55+zaEZOxSxrzZ999LpADdG7KZT2RGJRRY?=
 =?us-ascii?Q?2Xr4rur4BFna+KYJwuAdKvzzPdT1oeyy26W4ku9edRfpH2bFixxlFGEvwQLD?=
 =?us-ascii?Q?D2WZvovZjGYqNX+98haF95pNDU93xwFAm8WbDT/OvN3KofbsPO845ZoH0Xnt?=
 =?us-ascii?Q?r0reha2dbqBgdkMZp8KN7JTIQU0LQw9K7og/4vBxol/79XKLBxPYRkmzMHXW?=
 =?us-ascii?Q?RvdU9omTqyCKJXnii2JfI1qAtmDrm/Po2DfvbqGp57WvruXo47gIbEdLnh66?=
 =?us-ascii?Q?dxEWtrUC+eLXz0YdL/mEHyZqRkFrNDNr3qnkZVGMC7a102JpOf65M4kecfRd?=
 =?us-ascii?Q?AnOIrbetpBSWLBxhPuy899woM2hwcvJbYxaZzBB5L5AtHLg8RwWUXXO7MNE3?=
 =?us-ascii?Q?qwCex4nAhgc08ZwSCS+UVX2Q0qXNpEqI3RKszc3GnCfNlGqClNQunlXT8J8B?=
 =?us-ascii?Q?Q9Nwt18sOgCWvLEMYFI8CLCh2nu2KXbg3xh6E7YU5NTAE3LQduHjq7WMWNRM?=
 =?us-ascii?Q?UfRv4tQmUP5WIn/Szat2Ei4nNWoADLTlnPhvM65byyA9ksTlWsE4T1Nd811J?=
 =?us-ascii?Q?TMupfx3lDLq1768H7osu132dn+n/eM6X7KC9WTf7p21ysWZE7zXcLe3a9OD8?=
 =?us-ascii?Q?l5rG2pTffY5CQiOuaOJvbyRsr5jd5hAinRmGQN7pFsnQyekRlB1bSN6XKZpz?=
 =?us-ascii?Q?CWtpBcuF6XkPXSxLTr0Q08NUuSrq8B1eftHrBMHCTFketyGT3/sQeCK1P1/m?=
 =?us-ascii?Q?zNvFH0grr2wclwV/16ZqaA/+WUuFOSO8c+FyxYnAe90yy3ElTx13Gk/gyydb?=
 =?us-ascii?Q?0nt6ac5JC4gvUbeoWyGmXXXgJaky1jsQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QyGEjIGoRfjiz50biM0aGA1JV385UbiCdhDNsWUi7g+w2H5R+sDjCyTJfwX4?=
 =?us-ascii?Q?bVgOCUy8/upbjpOwe5yt+jkZjCVzI3QTVUVVGXGxZZvmPOFjChY5eWRjizlH?=
 =?us-ascii?Q?We2nAXewLRnYg84ZStM+8LVJsyVjZEujkPHNBltsuiAhUhsQv/CqLzOAk+L3?=
 =?us-ascii?Q?24gxFjo3eHxgYwcLR/xwQMaiGerfIRsMULrQy514RaCzG5YOmUbUDvpvD5f2?=
 =?us-ascii?Q?bQm+WJd1SyXB9oYVlEJVumZ69D9GdkFWgFQCbLF1SGxintVOu0ZUML+2Ir2Q?=
 =?us-ascii?Q?4d3SBPvlbRKwnZ77DzXoljiYkjfP5HxAjbhxBiXwGfo4HSLYXX33ODbRW4hh?=
 =?us-ascii?Q?0SgWQbF1NA5+v8XCxYXroci3/JfafDFlLOlulixHFG+lnARHMo30Evq9DoVg?=
 =?us-ascii?Q?0X8bYeB4USMaYqXKj14bfKy7/g0YUGumZKlgiArJwoNSSeospnU7WzP/ie++?=
 =?us-ascii?Q?F8/a2nMNgWkZ7WhJ6qQBAI+9Un11i1d5wwtQI+/tZ4RbRCjI9ETKRFnKRa99?=
 =?us-ascii?Q?y8mUNprrfDdO955Tunj6agY3Qz89IvQ4mjnZtYyuMRK+71NBgg4eZNbUCM6K?=
 =?us-ascii?Q?tJe9lFqAcqnE2yjMbk5ElXH0WCySuU3CEpNWpKJQiekrNUyZ4DrmplGAbK/I?=
 =?us-ascii?Q?RafBXj5jsfta6zXPqBO4J876N5UkAb6RZZlY6T7IG0hn4gr3Z7e/tmeZ+RdX?=
 =?us-ascii?Q?lZ1vNjFWPms4rXwAhGICORTUmXEVJ9D4j8oS9opWGuGm0UxPp4X6pFNl03+P?=
 =?us-ascii?Q?HAN0tSX1KL72uwwr3rcII/Zn9UfhYpkHk3nzuLut9Mnxss0lpEbzrP/JsPp6?=
 =?us-ascii?Q?IIOkktOLhxPdAliD5sRlcAigDhLM+svFDCIKlOysM4vWyBPCnTbNwfvn3lqa?=
 =?us-ascii?Q?dGtzOo97tctopbxHbWN+aDX0WHQjs1hhwB7nInX8goLSOj97JxYuJXRiYFG0?=
 =?us-ascii?Q?GwZaiDoN8gdG9UzEmGUPe5mkVMwQdO/sICpdO4c9rAaoFjR9McwIjtzs5M3o?=
 =?us-ascii?Q?s/94lOjKDcySbvPnprsqzXJc1xv7x7z6e2164sIGeoAMDA4mLog8BN11wlE7?=
 =?us-ascii?Q?tyfmGdDiS+Uw3p6mELVcYQVJVXB3Yz+GN/3lnPCKZeo82+9aEimFgvUvzaD0?=
 =?us-ascii?Q?kQLisrYEGjHM6bzRXj5NShOwqax9MOuBzETAjVCIQNSFGM+ZjD1/s25NIVXK?=
 =?us-ascii?Q?aCnrOE+2EPsBZnd1VWj/5acfUmWqLjjBy82q7FrIuWAtYDVojJ0PyG1sGDbf?=
 =?us-ascii?Q?3ozDrzyTi40Et4g061Re4QBIm1kXuwv0JR32xcFxnmMed2qEDjKZHc3wqJVM?=
 =?us-ascii?Q?tNvJwwPbNVSUIF7FKbYewkFAMLXOG1u3ixv6OT8YyZeN2di1gjhvi0l6Q57s?=
 =?us-ascii?Q?H6by0o+UukELkE67cUD6nqb5aIY/PIjkMrOMy4UtM4ZAAhlV8lH6d9JK3iCc?=
 =?us-ascii?Q?I6eUslPQahypFrv/OzkU1a+59tQIbxVfOWB9XhU+zf9eTF/AkgfbeEyhvVDD?=
 =?us-ascii?Q?1vujAu/vYSbL2FpnpgzxAH5Xje8x7RcjUwXL8sH4P1m4kim2aIX9haEK1u6W?=
 =?us-ascii?Q?6KMDe4Yq1x2oClqtXX2M78DqdYkNei+6Vml0bULh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f32bdc-f1e4-40c3-2120-08dd2abc6978
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2025 23:31:26.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxlOQK2Ns77nhpUoUDpTlLNKDYE2UxjQAiDy3cfjH6ONPQGeF7ASWVLJ7oLdkt5Z3HRJTRdft6lcPMKBYWoc7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8703
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=6775d055 cx=c_pps a=o99l/OlIsmxthp48M8gYaQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=zeIcOJjDmT3q-tr9JccA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dcjGXmn0XseUEIdFz_vMkBfOpzIr3MjH
X-Proofpoint-ORIG-GUID: dcjGXmn0XseUEIdFz_vMkBfOpzIr3MjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-01_10,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501010210
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 23:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114611

https://github.com/snort3/snort3/releases/tag/3.6.1.0
https://github.com/snort3/snort3/releases/tag/3.6.0.0
https://github.com/snort3/snort3/releases/tag/3.5.2.0
https://github.com/snort3/snort3/releases/tag/3.5.1.0
https://github.com/snort3/snort3/releases/tag/3.5.0.0
https://github.com/snort3/snort3/releases/tag/3.3.7.0
https://github.com/snort3/snort3/releases/tag/3.3.6.0
https://github.com/snort3/snort3/releases/tag/3.3.5.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../snort/{snort3_3.3.4.0.bb => snort3_3.6.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort3_3.3.4.0.bb => snort3_3.6.1.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
index 0f3d0e986f..622ab56ae9 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.3.4.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.6.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch"
 
-SRCREV = "5598e8dd87829cb1bbb478a7b6d4f6fb8b5dabfe"
+SRCREV = "2f8c230d6605279b19dac8fe59e27f034ee81510"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


