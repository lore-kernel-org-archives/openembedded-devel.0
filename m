Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6DDCCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:40:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24937.1762695653224348185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AnmiEPkD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9Dcx5I3813379
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 05:40:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=VG1/5mfAgPU/N2EyF2Lx
	geK+cQFQgMNRgsAkwD3nATU=; b=AnmiEPkDGXYxW1oSB8QOurkcTBpty2SYLzeA
	QffgDsy7Gl+rZCPx5KwkVj8qUk0vqO5S9p82i4Jg9N2GPdaFlaxvXVHcawkT30M/
	JGPjuKaulygYtK7YQu1RWawVT4g1ylMxCfDsGk6Hmzwjis8ZGgzLM6yq6q4GdM14
	YgLaMLasvJgDEXOrk6BANW3i4R2kHtSeLOlPIHTXyeIdeTSBJjdrXL6fVQDxxNpl
	aB3eh3otKovDlVtL3PY8uOHlk5J7I+phHdKcxpcRDJmCgn6gK+l3RsVq7Olmxldl
	3BbGum0Bq79zyPQuepWx0jVzmGalIUQo3PSJdAlI1CqI5iDGUg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2130tch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 05:40:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmI/1yCq2EwGbrYckj7fdlr4LxH2WHlY41un9XDdsRkL+pbqdKuo/tnolFklCxVLRxHjLJBf71GAUDIADhpD9d5OqaBPUrDab1pu06Jl/+MpuSqUeb5eWIiwubVSOU7SxAUpSP8B1n+Byuli/ojmOFVqrMg3m4nbGZe+wG99PtaNiQ6qI7dOJeorkh01yJi61vcRtDs13I9u3h8ka064/ThfW1nSDxw/Zf2TqTmBImYcSXLet6v0Q6HektcFZJUDeh0Rh1oaaI0KcIHd3cQay6P/4fwgONZ8NpLEFtK9VDcTEcYSHZAFLpD5Z7WurFtpZgwAUXGg3o54RJWsHkxrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG1/5mfAgPU/N2EyF2LxgeK+cQFQgMNRgsAkwD3nATU=;
 b=mKfRmjCB41KkZkEnRlXLuN+l9D/PNbFUa8QYxCgWEqfsTuNfYjZmjEzOPqBAtlzov2xa2WXeomg0vqNk+QJhKEnxLNdBJINXD4Wdo3dmjOBJTWWZD8jZLZ99wLAqqicWLGJgSjWIuWfK6EC6GrUYxX8wJOuY3Qx+MPNzjpdK/GINwqOnB0drstzmnlNJv/A3/vDEq3KOMV36/SADhngZ8pXCAOAut1qWAATLJHxFwMcXLngNWf+DoCY+VLbTvItWfFHrNU+JxJwSPM7rk8ep4p6Qlwm/ip/duoxRuVzP0RlOhWlC9XwYO6HdtdAvMjbUL/NcVp/nKZvFCtzXFjI+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Sun, 9 Nov 2025 13:40:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:40:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/8] ipset: add UPSTREAM_CHECK_URI
Date: Sun,  9 Nov 2025 21:40:28 +0800
Message-Id: <20251109134035.2741548-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d92c99-cbf5-470a-5ea0-08de1f95988e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HGkni+U5y+PuiyiSLwzYy0J/tn56XKCuyTEPxBNWvKlmmDbw/wjVDRfDR/af?=
 =?us-ascii?Q?FHWKCTqJQxgomD7RKAtDwWWtfTECi2glusSbXB52nONMwJDSfyVqBN4SFVML?=
 =?us-ascii?Q?haqKWs/QNr9Z5Tn9GUyLa3+zRZzh2bnv+j97L0Qhtj9D3Ros/R9KFF7MPeee?=
 =?us-ascii?Q?bWyPsXokz6eTdtohHIcdsE3kXyvlG8yRgTpcXriNpPuJ01ae57ruDjwolEie?=
 =?us-ascii?Q?he+nzEHnQdIRu7hc5YOKPytfeN9CZ8VoEWVrfrv4bqqhUwJpoyHLZAS4SQyy?=
 =?us-ascii?Q?N4YxSCYLrZxSUg2GoH9Z9/odK1AHBYs7Ea8+0ELa1zc0HVhb2WTqbppmg8IS?=
 =?us-ascii?Q?xxjXFq/Ifdy34ULJah/oYEpR0o+k/pjxvs/rbisHfa1GZrd0EA+tDs095pRX?=
 =?us-ascii?Q?fVumUhGaoYPG+Q113EazfXlbchUe9Jnevl7Irdm1nxIkJodth4fy4Ir+exuH?=
 =?us-ascii?Q?7m8GBrBYM6bl8o8VX4EiWni+kc3uOpLX7YEOlyL2HsZlmzgiSpUWA3Et1nmw?=
 =?us-ascii?Q?OTyN5Cv6YOBuFyDO7M3erPBAcW213zNt2+el5G/bJmOnvviyvZLmCwRVxR3Y?=
 =?us-ascii?Q?hLqxRDqCD5TFcY7ETYEItGT9apUIWlmdrZUcopTpCX2Ke+nQq/6xkb6NP0tG?=
 =?us-ascii?Q?G6Z4Z+kl/Kd8Yl1ko7fqOHyzALgW8nLvtbebVh8e0sfMCTk2KIN7DHRAVegc?=
 =?us-ascii?Q?N1qr73ZKz7yEbSOye3LJ+pNOCPR0tvq/AOmJfIqTl9hWmastYJHvXTXGqSa0?=
 =?us-ascii?Q?2s2n8/3133vnsXkbFXr1tNmQZ8/1UzlGOrCQqrorqyTYLu5sNTV4jmJZgRpb?=
 =?us-ascii?Q?qZdY3yUfgw+uJJd4qeoFxWo5cUisVsIxg71Mu99zTgXK3XCruSb6OemcnOn4?=
 =?us-ascii?Q?U3vzLwXLl1/Wqm2EsdWxg8AcgsmqNE4EQZ+LXiCib29REB0fj2Id/wfmdAKU?=
 =?us-ascii?Q?91zUYasJPCt/x3PEKZM9hTMYOoPHRF+unqFxVd7B/81xDbRoKnDith0CueFg?=
 =?us-ascii?Q?FlQCYOrx1oB55ag+OEUecJgddKf2eeuUzbddog++FOMIKqJl+v9lFhOoM6Uv?=
 =?us-ascii?Q?F6E4G9JzLRv3csQ7mRNetSzbkDseXp5str7rnKG70IDc4IUvbE1iq8dQnlD2?=
 =?us-ascii?Q?Jh5FDpVDZk6Dx+Ai/cHs1yQ1rk4oOKEAnObO1iHop6GbiozGRPgrh3Q9yLHn?=
 =?us-ascii?Q?Jo1pN9OAFhkP17JqYdr67uL28SGb+1mw9f9iDdoz2CTWey3vtdGCM4zBLgQ2?=
 =?us-ascii?Q?Kki0/UtNW7TijmxGv3p1IiODQPFWRhQEwOQciAgvb502jdgbToOqftbC01QO?=
 =?us-ascii?Q?QUvm2bj+gqDXd5qaMisrijfLBrC8prQRIzAzSwAp4wcRZaPvp14cZltPO1iB?=
 =?us-ascii?Q?F1R92SY5qi9kLdAM42hhP/9Ydj90B7bGNrcw9A8qGH4Dw1m1vSElQ8hcODlA?=
 =?us-ascii?Q?mYZsnqioC8ouCdWWXn7oOkTLYfPeWT5fzGPiBx0x+N3UcP9nDOmCFg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NU1Brdm0EmQIRL32F1plBNmGNSf+hwz3wzenNRQRwdicw6ljvyyP6JgTbRAP?=
 =?us-ascii?Q?mpdq4Kofz/UhoJuymzNZ3WXwTCTsugOAfTiIahHQiIDm/u5KyIvhwJhYgCPv?=
 =?us-ascii?Q?uAAAHIfleyHMkfQH34A+GJquI9Knx7HVJFDzPwiXgLMBgoJlbhKMOWizN8ES?=
 =?us-ascii?Q?9YuMDvbig41lI1HrINiL8eSWHno8ESsPd1tdmslCyCm4VR03l8OWHR6UpLqp?=
 =?us-ascii?Q?ZXgtE6zprjCKGm/QgOtOGcEtFVC4NoJK0MtvoUso4hx9mD/oYAfTcmaKo8zX?=
 =?us-ascii?Q?/YCxRWUgUOuXFFhZuOsLXv/Jcq7arePmVhOoK2BCKfx69uoZpt3dyUHBzfJK?=
 =?us-ascii?Q?KS2usBGwaMvpy66gc34aoIS5GRhXMKrzAcTN1i32wyXruNgsVe8pfm5IB0wC?=
 =?us-ascii?Q?VsTfkIYzYyzvZLInRQT9fra6r5NiQjDiBqwWrcjmwLMwPwPx01GW/LiJUD2s?=
 =?us-ascii?Q?Jjm2RqJCYkt3AXQtsInD2L+yR31azdYiTdG45HBCw+Zb3BxbZNzpaHonzOkz?=
 =?us-ascii?Q?9CPUQIjSI5ATuvLo/8SF6/KA0Vc7KxVORZyfuunPBei/v8E5l2QjvjrPwMDs?=
 =?us-ascii?Q?RmyRLivzhgSBy1V7i2YDqcVux9EfarG1UEVMsd4rrXsV4LB+jOacWmg3RFVS?=
 =?us-ascii?Q?gbfjuzB1aGRk+cWocSYyRYL3eCzzpgaAwNFMeYQTEm6efX6PX83n1gzzWzwX?=
 =?us-ascii?Q?vIlqURbn9JFhe0vr+NRuV2+E4vAXQuGy4JTpvAeZzgGtWMxQA1hsDf3dyAUD?=
 =?us-ascii?Q?G/T9iOPfKJTkbR+fV8YBLKttQxiBPsTH8EIYshW3IfjlCWdFOUjwYlPFVass?=
 =?us-ascii?Q?PKCLPUkpNMRUc3PnPEOM9yn88UoCpVx6u0DwQAm4ZQjz6Bo0an17AEcOjErq?=
 =?us-ascii?Q?ph7QFErjpL2XUtvNJuB6pHhSjDTGlHzBZHusPWm3BNoVYm6uL/k1zU9s9TPm?=
 =?us-ascii?Q?mHlLMEbVuh6454dKNSilJbzYJ4OLDLV94PAAzJG/ZYrLS6yrXrvxs1OQj2dN?=
 =?us-ascii?Q?f+Hur3cM8g6CqrVg8l6cCBCLDVoApNuYCvw/gxHv49oazc9Me+9YYWK0k3Ft?=
 =?us-ascii?Q?7FArflHNDB8EHQJ4tudRgBvLIgdbWEy1nR8sClXdMOysGW4JqdycbezoNY2r?=
 =?us-ascii?Q?WpE6CJzPRdLHa1PcCbdOJW1GZOZ27W4BE0NakX/xksIq8CiHTR2026nFw7of?=
 =?us-ascii?Q?B1TcDJyefOzelsl69upG7qPUtLVP1jE5LQfUtMg3RysB2DX+6V9TvV4TWAqb?=
 =?us-ascii?Q?iH3o0IOsbv161WlQ4Q5FEV+RbZA5rwlasRqD/AnBqLFVmr9ILzmfV1AHaDIF?=
 =?us-ascii?Q?ZP2/j+Cyv5v0/gb5+2wZU+9lHMJ0igS8GkUKlsUuHTNrZyjypjIGtEPVRJ1Y?=
 =?us-ascii?Q?6jyPjZeSyGSi+elu3M7kJ6B9BYuwYMCZXxbyiOXOvFZAfO/SK86IMHqc2slB?=
 =?us-ascii?Q?vxlBQsGgDmcu+PsBbbix84l0staycPznJ9eHKX3lsiAKgoaJVb+aMV3f5Hiv?=
 =?us-ascii?Q?8QoNBVV7XRR1PD1TFkko/OwDovxW/ZXPL3PSfuPHozwxdsikC9S8MP5LEez1?=
 =?us-ascii?Q?AetSdmRVWYS0+MP33M8bJ2YvmQ2Wvc8nDsM+OTbq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d92c99-cbf5-470a-5ea0-08de1f95988e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:40:50.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGydDEslQgaFVOG+A4zlBSPeI0oxyp6L/+eyPGt6Ns7BQmckWryY8KhBBEAfkW75fI2lZUOILhEUSnk1IuI9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfX+JEoGaforHSx
 91USVgMIbDmn/AkNxx2j0M2Isxfl6XoeZJnx1xrLvY4nL4DImadjKRyvctUi1vX9y29miGtJUwL
 C2VTB4VbrwVwkFIQR1f+gysrMc3LjFZh+v551ChZRUan03puxCQDdZjxtvUsocHAbMFeODfiCTF
 K52DGsvdmSK6wb+1pm+l8MTHqEXrVRZenMKdhmBEvKpC3MesoWOiXjEcLkXF8zEfRkxpb0ORsvb
 4a4oqrlniWILAD0gVZ+LlMz4PNgvsHri6CnhxQBaAHSEOQHRaLC8fpqTgVmmmRoEOrCJJgmU7K+
 Xc4VAmISPGteAe0eRSs6lBP+j+UzeKDnxDlRoOEqjFHr9QHYIh+Jnw+SdYY5HtvJuGWbZD/ChM4
 dxQOuHSN6x4MwFm7F0Cd1x6GH4pY8Q==
X-Proofpoint-ORIG-GUID: 3-4xJbTiYInUDucHQM93pO8nfVeVkD5C
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=691099e4 cx=c_pps
 a=pVIVKlmwkrZr9AIty3oQVA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=3HDBlxybAAAA:8 a=t7CeM3EgAAAA:8 a=8vcrBgdiYPhNBsQy3e4A:9 a=nzPPoPw6Ir8A:10
 a=laEoCiVfU_Unz3mSdgXN:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3-4xJbTiYInUDucHQM93pO8nfVeVkD5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121407

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version ipset
INFO: Current version: 7.24
INFO: Latest version:

After the patch:
$ devtool latest-version ipset
INFO: Current version: 7.24
INFO: Latest version: 7.24

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-filter/ipset/ipset_7.24.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.24.bb b/meta-networking/recipes-filter/ipset/ipset_7.24.bb
index 15fffe6b9e..97c0d8b4d8 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.24.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.24.bb
@@ -13,6 +13,9 @@ SRC_URI = "https://ipset.netfilter.org/${BP}.tar.bz2 \
            file://0001-ipset-Define-portable-basename-function.patch"
 SRC_URI[sha256sum] = "fbe3424dff222c1cb5e5c34d38b64524b2217ce80226c14fdcbb13b29ea36112"
 
+UPSTREAM_CHECK_URI = "https://ipset.netfilter.org/install.html"
+UPSTREAM_CHECK_REGEX = "ipset-(?P<pver>\d+(\.\d+)+).tar"
+
 inherit autotools pkgconfig module-base
 
 EXTRA_OECONF += "-with-kbuild=${KBUILD_OUTPUT} --with-ksource=${STAGING_KERNEL_DIR}"
-- 
2.34.1


