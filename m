Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2173CD5BC9
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 03:03:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3072.1779937435698307330
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 20:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SgKvPyd8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9608b69687=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S0hJkP587238
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 20:03:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zVW4+GpVA8oTilQKNnkx
	C2qtviZXYdTo/tfkJkcp5uU=; b=SgKvPyd8VnRvkBzmLyPSkQwkK3pECKPgHTXI
	X7D5Mcf9RprHpcBMoGEcBCWNrcdYr4vILndwtwXI1kGJhhWvPqXTMZ565DaTom2y
	EJypeTzAUIAEOsX8xcC0IKiUHZz5zvTi9cgH3ImV7tR37R7PSXxIVqHnaadqvpPR
	3XhMnL3/FIhfYzJZ5NXxRwOTi94Hk2qoNorx1ymiZoVgZccWqrzFwrNFA4ZTBC3S
	fIGB8N10NYyefjQyRncKcJQ1+CGiEA2vkUaBH27IKRnqZNHMz8TkTz3LMyRdUOG2
	TbzrcXLKhr6iZNkI/2xUcz+Uf0jQ2cgHMDTPJvItd1g1qyEo3g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6g9rh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 20:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kf7HHzhgZIC0AmDQvjUbnbsBpgedOSybQQ6pWOKyOqd+NHii++DTgUJBqabm22WmxKFLazDqp1p5nKSPbhLSlSsWkP2aiKt+PKOivGwZdUTP5BCVBFCxj5fnuDzhhrX2DgifQN/eNqIHDZrFC7x7Yl97EXFlRA7NTMXGzmOWAATp2qvgfRv0HGs2cRvAWsto5IALf5iJGSati3+nK5K4uxIMQ6Wi7sKSiLIyPiraubb4HeSMU3EhHmVes4ni+xgSk4fO66aw7mIFaMZFwQ4MzfH7lMKyGsvQOg+6dDydkFMt4VJh7uwStASO5PnA4e056k4cmURDUwh+kYuI+D7d7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVW4+GpVA8oTilQKNnkxC2qtviZXYdTo/tfkJkcp5uU=;
 b=L3PrZkVGI838v1drrEV6pZncAopgvhNR60X5s5c4CP7j0AEJ7Pa9j6hUfukQoF+I71tquQJitIs46IqJLXJgOFjtbRd3priV0nuCaEe4ilzN2hOplNg/FxHFo9Mc1udcgxLi+aymXIuNJ1Bb+HtmBFckWX1lCynn5fpkvOSM1rFndzIvmt9xC1BgQRvmjYM+GyaE+OLoSljyZH7frEtuwzCWy6Toqj135zai588dQFCsnS2ay5j0lnbgp1h+Yq4OVVw5235f0dWuOz4nDCX59xIBfNYgF3HD5UCUxDCS2sjmfvmiICpFoC/GwRhHQLO3d/A0GotlU7OMWi9m9nFFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7623.namprd11.prod.outlook.com (2603:10b6:8:142::6) by
 DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Thu, 28 May 2026 03:03:52 +0000
Received: from DS0PR11MB7623.namprd11.prod.outlook.com
 ([fe80::5cef:b8c7:f97e:2233]) by DS0PR11MB7623.namprd11.prod.outlook.com
 ([fe80::5cef:b8c7:f97e:2233%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 03:03:52 +0000
From: Kang Wenlin <wenlin.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-panel: backport patches to fix build failure
Date: Thu, 28 May 2026 11:03:39 +0800
Message-ID: <20260528030340.3326258-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0013.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::8) To DS0PR11MB7623.namprd11.prod.outlook.com
 (2603:10b6:8:142::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7623:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 539963d4-4ce4-4eb3-73fe-08debc65bf0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014|56012099006|18002099003|11063799006|3023799007|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 
	8qp+dlw0xjHbVhHq1UBDd7jRY90FIv0YTn5c+SmcFd0dF6v/Hd2Ho4fT40mXzKcalf97Oq03h8twprB5uJZwnIHeU2VRdTYqKFVfCxcqIY0ePzGR2tPAoNUndeCQk99Lxb9w/tcxKEotYbTPsQJCzEgY6XQXWTvx28NXGEkdMKBSmS08uxcWyOLTQyfMQWSA/ep8QmmCHiI3qY5T9q9qKaeIrJMiixODITrBP4btsE9U2mnrRJA5iJKN/oaI1ghsYsoheYHHrxkkpXJg6DtST+jtZv6opdN2SlA9JFVYSx50T2uchBJ/ekI/OwnkH4bVYFLLOUwbP9sWhPEAOHFm+Jk8v2RbBb6zP18wg4VNO3OJAiOUwFNIC5NvHvndDhoCn6bRLP+T9bqHnzsEy0hbH60t0SR9Cy5jzUCsfcKX13He9g5BW9CXCDtV70+uDqvP6ztyPODrZWDizrqDbnGUT2GtSiVxsYK3K/o773hUl2n+0R/zKVKoj/0EBhxLt7g+8R4ChLiZeSCHTriKoirY0l0ZyhoixGvTvOikHsy9MmGkzz1n37s2Mec89eCkNKBruTujOoQtwUeHaQNmuhBp1hNt1jfggAZLYjVPqekqYLMzdEjFHQb0DIyDGNB6rRq4xFG0Udc76VeJjQC2/05u2l2bBTSVHyxG28XK9YL+NAgV1pOLfxp/0x2qHp5xlvQ1lcAzmeiSq0rBs158K3HeWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7623.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014)(56012099006)(18002099003)(11063799006)(3023799007)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VGDLluwN6sRXSCgvPG3u2QGNi/dNMCi5pbysk3/rVARgV0dn6HCdK/T/QGyD?=
 =?us-ascii?Q?y80fNkLwO3V/M8z3ALpemm8T/z94VYyWKw6j1QvJknlJwq9SVykvgNCG2/5h?=
 =?us-ascii?Q?QjZKr+jgi0Evz6Z6emDVQTmeyV4DEyFs8elHK93BsaTyH6zciGqQ6giWhczP?=
 =?us-ascii?Q?yDi4o/khzjcKr/abF5bOPjHf9DnGDQIlANfUSBeRwzR3ICM1RWFF4I+QZbHW?=
 =?us-ascii?Q?yN7UQkAKhTlrWqTaW1z4tc74PyN3vQDt7+YMythk2wyqqIn3V5fRrVL5gLis?=
 =?us-ascii?Q?cYCZNyCkHP1v+NLH3aU5YBifo3ewbBkEMRlhpaAwgTPykpJBr8TX5hUtRdNn?=
 =?us-ascii?Q?XbfCOfGrSn+i5E592pDaNL+eAPLxdRnhzdC3UFGZodpR/QtmYv6Tt/b9o1yv?=
 =?us-ascii?Q?TtDRgdYomi7kapmI1aeFDeTcXphVH7QAKfhpkisJFVGhSF88KdvYcQ9F9C3r?=
 =?us-ascii?Q?LAUEvs0nGqCxZk6kZqzgMmeDTk0LtssM5LOkpC7ZWW5m4j4WA1g8n+uQD1Rf?=
 =?us-ascii?Q?DYUlAxzSVJVvZzUkK0FN3ZlfqHzPJbflrVvTGxjmiG8H+9a8Yt1EiJdNq+5Q?=
 =?us-ascii?Q?K4XTNbpudRShg3W4pePF8StLFdkL4f/485F6r/dsY+HT6AJgUdDP3h6fyAgF?=
 =?us-ascii?Q?JFIs9G/28CWjMdIeJAomIUvAuOTSTic57mvhjOlFqOV07i0WR+2/WgE/z/pa?=
 =?us-ascii?Q?M+/IIBvlMlc0JhG7suGhEF+bsnkTgEUz0D5RnE06/WdDk45eQyboJZl97DxB?=
 =?us-ascii?Q?5bZ8nH1sNNIRQVHaPxqB8tadD77NKFYkPyX4jlgnN/ZwTziYZCKg7xSdbH8K?=
 =?us-ascii?Q?a7pml6naPROdk/1KUeG317CQpQsDbNB9qTAoxXrSXmMFtR7pL77xMERbjsBq?=
 =?us-ascii?Q?NV0MaMfXbCPHgamGPtqofEJ5IrwmpJqCIaV9h7wKcpV96zjNW5Cgo+W2g9hs?=
 =?us-ascii?Q?cW+BSWxq8hCvHz/U1sm9PDPoLDe6EtCaeDFt/CFXpDpXdcVXdNW77XDW8D3v?=
 =?us-ascii?Q?R5Wg12gMJllL7GVGZeGsh1GMWGm8vAlfyjmxnPNoih4V+a22eA0TdZAPn1Nk?=
 =?us-ascii?Q?lH3/ljXgMhaAMiHlQoD+bFGH7ua5Q5po3hRoe3K7taZVivXzuacv/vWaCudU?=
 =?us-ascii?Q?kYLXGTpqkxAdZftqArRNvojTrvOBZsHNpHarYfbYaQC5dNbhXlip6Ei8AYHs?=
 =?us-ascii?Q?YnYFgItqHg4LrCdELpwpBqydJKTzQ+dWsquVfsKSxODK9ffha0Yi8d5tMrC2?=
 =?us-ascii?Q?K43czy6SSeX/RJ+wi/eOGf0lAbMnKR7qbmxMpsY79QRHdZ2DMsu8ZNXSu2l8?=
 =?us-ascii?Q?R+FCye2ujXYXhTcTBbmo6Nsz3pI7WHGSQUA/ejz6SEZID1AhStT6jBYsEuMy?=
 =?us-ascii?Q?QIXN2qyovH5UnlWB+hfqMhBl/6wLRrqNxQ6eJTeWMMHV/rwsj/wg7kTeFYCo?=
 =?us-ascii?Q?T3pyXFGc3xNIzZS61CwKpEPeivhCTV6C3jIFRvn5LhPbS0v0tkwwRPemdYup?=
 =?us-ascii?Q?o62PTu47DcPN51YKei0Mkx86UmerJ8CXtW9JNLmw0nRUfg1Kn/yExu76h6Sl?=
 =?us-ascii?Q?2vlgvc7q4KBTmmGsz2oEz6wLOPob4/jfFwUy1oCfhZwESzmZYtpbAIubM021?=
 =?us-ascii?Q?ayopULDHVbXRlf0HPxgnPDeLfElDZNj/HCgKxz6O3c1f0qxmk4NUhvdobsER?=
 =?us-ascii?Q?3Rr32g2UOloBmlpvOexeTLETuOu+bfjaO9UW43NXcOqmN/3K9W9WYFyR/2mF?=
 =?us-ascii?Q?oPOf2toMGQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	s09fWlf7titnwcNE9rPk9Gih6uGlkbinBkpEoZMVUDXkxM3Lpi4VRCuM2O1NrKuWOnoAOBdYEqQO1lT9fqTgGIy/mZ4zbjjrYSvlm5y9PkqzTZqUu4p/umcvoX35fIEPYeSHIj6GP1xG1eWAaRypWomALt5Eo4PSLthvZS0o7otR9X61xulG63N2flfCA2nAVJ5ZpiF8nPl9I382kpbJ3YgSmcTLqeZVNjma+NdMyxssOwYN5moy0GHDFEDPf4C+E0P8BFUUDDbj4d4zE9+OLKG31L1PBtuaEvb2FRSrqi8uzdvnEFtcL5NCQueSnqSq2TPDgESTbwuH/0SsrxufrA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539963d4-4ce4-4eb3-73fe-08debc65bf0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7623.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 03:03:52.0289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGaeSOycmbmyIoeKWlaRcCulY/Syeozxbzla0VLJSJw2s9+pX8W4j9SgBf9YSMtc9MzPwFD3cO6D9Y9sLCkxUXO84aOJLFd/srRMJCGVmSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
X-Proofpoint-GUID: EyyWcpEFVUPRqGF5nIkeRox92xysJyHs
X-Proofpoint-ORIG-GUID: EyyWcpEFVUPRqGF5nIkeRox92xysJyHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyNyBTYWx0ZWRfX6yMhBYvMxj/F
 zsI5b3aK+8dRlVvBJ8K8TVHrgrYYL02DpgHcH+DSLIc2c9v9RCIJzw5MEF6jeOhMYnLDUAVL0yT
 KdmXYd8pmoMgWGS3TFjSncbGkcgTomCgiyYFkvVsVMu5z8HnhPwoL/DdxzMytM3iLhmmQn8KB9J
 +ddsPI7Kpak58xAJVI9VqDO0qjlcMA8ggUG4kWuK3UNwn8ibwBy4eRqX+q/17ltRAmIJGWx2Sxn
 fiuNwiGwoJdorXb9aGbplk+464WEg9dt2e894u4CWAC4Q+7zpLMD265yzuQ6ytP2MH6hjPId5JG
 oz0ikIK3/TiEmaQmI939BuVxm8VcYRmGzNaOcwIFKf3iS0oQQoNXBCnhVAegQLGiL1kshjcvxvs
 68idyWofLh2sccbqFOR3k0Z0wnlPRRwpoDMtLD59kGn3o4iXpIp8zyEjaChqPUYOhAkaMOMSkNG
 4o2FH6uliObS++Ru08Q==
X-Authority-Analysis: v=2.4 cv=bY1bluPB c=1 sm=1 tr=0 ts=6a17b09b cx=c_pps
 a=jRvQvoFr2LhS1HEjeZSEyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=TZmW2KODYJoofZSZ_MUA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 03:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127270

From: Wenlin Kang <wenlin.kang@windriver.com>

Backport upstream patches to fix the following build error:

| In file included from ../sources/xfce4-panel-4.21.1/migrate/main.c:23:
| ../sources/xfce4-panel-4.21.1/libxfce4panel/libxfce4panel.h:27:10: fatal error: libxfce4panel/libxfce4panel-enum-types.h: No such file or directory
|    27 | #include <libxfce4panel/libxfce4panel-enum-types.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Reference:
  https://gitlab.xfce.org/xfce/xfce4-panel/-/work_items/969

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...-generate-sub-headers-before-includi.patch | 311 ++++++++++++++++++
 ...uild-Install-missing-libxfce4panel.h.patch |  30 ++
 .../xfce4-panel/xfce4-panel_4.21.1.bb         |   2 +
 3 files changed, 343 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch
new file mode 100644
index 0000000000..67d2b4eaa8
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch
@@ -0,0 +1,311 @@
+From c259dfbbb8e139b43af179acec9824ecf849d34d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Thu, 19 Feb 2026 11:44:35 +0100
+Subject: [PATCH 1/2] build: Be sure to generate sub-headers before including
+ libxfce4panel.h
+
+Fixes: #969
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/c259dfbbb8e139b43af179acec9824ecf849d34d]
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ common/meson.build                              |  3 +++
+ .../{libxfce4panel.h => libxfce4panel.h.in}     |  0
+ libxfce4panel/meson.build                       | 17 +++++++++++++++--
+ migrate/meson.build                             |  3 +++
+ panel/meson.build                               |  1 +
+ plugins/actions/meson.build                     |  5 ++++-
+ plugins/applicationsmenu/meson.build            |  5 ++++-
+ plugins/clock/meson.build                       |  5 ++++-
+ plugins/directorymenu/meson.build               |  5 ++++-
+ plugins/launcher/meson.build                    |  5 ++++-
+ plugins/pager/meson.build                       |  5 ++++-
+ plugins/separator/meson.build                   |  5 ++++-
+ plugins/showdesktop/meson.build                 |  5 ++++-
+ plugins/systray/meson.build                     |  5 ++++-
+ plugins/tasklist/meson.build                    |  5 ++++-
+ plugins/windowmenu/meson.build                  |  5 ++++-
+ wrapper/meson.build                             |  3 +++
+ 17 files changed, 69 insertions(+), 13 deletions(-)
+ rename libxfce4panel/{libxfce4panel.h => libxfce4panel.h.in} (100%)
+
+diff --git a/common/meson.build b/common/meson.build
+index ce7f3a98c..d880455ac 100644
+--- a/common/meson.build
++++ b/common/meson.build
+@@ -8,6 +8,9 @@ libpanel_common = static_library(
+     'panel-xfconf.c',
+     'panel-xfconf.h',
+   ],
++  sources: [
++    libxfce4panel_h,
++  ],
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libpanel-common'),
+   ],
+diff --git a/libxfce4panel/libxfce4panel.h b/libxfce4panel/libxfce4panel.h.in
+similarity index 100%
+rename from libxfce4panel/libxfce4panel.h
+rename to libxfce4panel/libxfce4panel.h.in
+diff --git a/libxfce4panel/meson.build b/libxfce4panel/meson.build
+index bb66b1534..150319388 100644
+--- a/libxfce4panel/meson.build
++++ b/libxfce4panel/meson.build
+@@ -6,7 +6,6 @@ libpanel_install_dir = get_option('prefix') / get_option('includedir') / libpane
+ 
+ libpanel_headers = [
+   'libxfce4panel-enums.h',
+-  'libxfce4panel.h',
+   'xfce-arrow-button.h',
+   'xfce-panel-convenience.h',
+   'xfce-panel-image.h',
+@@ -16,7 +15,7 @@ libpanel_headers = [
+ 
+ # do not add this header to GI sources, it creates unsolvable conflicts with other
+ # libs whose identifier prefix is Xfce, e.g. libxfce4ui and libxfce4util
+-configure_file(
++libpanel_config_h = configure_file(
+   configuration: configuration_data({
+     'LIBXFCE4PANEL_VERSION': meson.project_version(),
+     'LIBXFCE4PANEL_VERSION_MAJOR': version_parts[0],
+@@ -84,6 +83,20 @@ libpanel_enums += gnome.mkenums(
+   ftail: '\n#define __LIBXFCE4PANEL_ENUM_TYPES_C__\n#include "libxfce4panel-visibility.c"\n',
+ )
+ 
++libxfce4panel_h = custom_target(
++  'libxfce4panel.h',
++  input: 'libxfce4panel.h.in',
++  output: 'libxfce4panel.h',
++  command: ['cp', '@INPUT@', '@OUTPUT@'],
++  depends: [
++    libpanel_enums,
++  ],
++  depend_files: [
++    libpanel_config_h,
++  ],
++)
++libpanel_sources += libxfce4panel_h
++
+ libpanel_deps = [
+   glib,
+   gmodule,
+diff --git a/migrate/meson.build b/migrate/meson.build
+index 8159f6336..19d95a2eb 100644
+--- a/migrate/meson.build
++++ b/migrate/meson.build
+@@ -21,6 +21,9 @@ migrate_sources = [
+ executable(
+   'migrate',
+   migrate_sources,
++  sources: [
++    libxfce4panel_h,
++  ],
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('xfce4-panel-migrate'),
+     '-DXDGCONFIGDIR="@0@"'.format(xdgconfdir),
+diff --git a/panel/meson.build b/panel/meson.build
+index 78e2d8d15..6c2fd4e1e 100644
+--- a/panel/meson.build
++++ b/panel/meson.build
+@@ -73,6 +73,7 @@ executable(
+   sources: [
+     xfce_revision_h,
+     xfce4_panel_resources_c,
++    libxfce4panel_h,
+   ],
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('xfce4-panel'),
+diff --git a/plugins/actions/meson.build b/plugins/actions/meson.build
+index 55dcd2e1f..c3d824d41 100644
+--- a/plugins/actions/meson.build
++++ b/plugins/actions/meson.build
+@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'actions',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libactions'),
+diff --git a/plugins/applicationsmenu/meson.build b/plugins/applicationsmenu/meson.build
+index efa825f00..15e06af0f 100644
+--- a/plugins/applicationsmenu/meson.build
++++ b/plugins/applicationsmenu/meson.build
+@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'applicationsmenu',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libapplicationsmenu'),
+diff --git a/plugins/clock/meson.build b/plugins/clock/meson.build
+index b08f3c39c..8e005f486 100644
+--- a/plugins/clock/meson.build
++++ b/plugins/clock/meson.build
+@@ -22,7 +22,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'clock',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libclock'),
+diff --git a/plugins/directorymenu/meson.build b/plugins/directorymenu/meson.build
+index 43e81abf3..0bf48bae6 100644
+--- a/plugins/directorymenu/meson.build
++++ b/plugins/directorymenu/meson.build
+@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'directorymenu',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libdirectorymenu'),
+diff --git a/plugins/launcher/meson.build b/plugins/launcher/meson.build
+index d228eca54..8815b5baa 100644
+--- a/plugins/launcher/meson.build
++++ b/plugins/launcher/meson.build
+@@ -10,7 +10,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'launcher',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('liblauncher'),
+diff --git a/plugins/pager/meson.build b/plugins/pager/meson.build
+index 30fcbdef6..45e34c62b 100644
+--- a/plugins/pager/meson.build
++++ b/plugins/pager/meson.build
+@@ -10,7 +10,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'pager',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libpager'),
+diff --git a/plugins/separator/meson.build b/plugins/separator/meson.build
+index 9de0289b3..26581e90e 100644
+--- a/plugins/separator/meson.build
++++ b/plugins/separator/meson.build
+@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'separator',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libseparator'),
+diff --git a/plugins/showdesktop/meson.build b/plugins/showdesktop/meson.build
+index 2e4812de4..c599138c2 100644
+--- a/plugins/showdesktop/meson.build
++++ b/plugins/showdesktop/meson.build
+@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'showdesktop',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libshowdesktop'),
+diff --git a/plugins/systray/meson.build b/plugins/systray/meson.build
+index 2efa088d4..ea364ccff 100644
+--- a/plugins/systray/meson.build
++++ b/plugins/systray/meson.build
+@@ -52,7 +52,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'systray',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libsystray'),
+diff --git a/plugins/tasklist/meson.build b/plugins/tasklist/meson.build
+index 333e91c21..61b889536 100644
+--- a/plugins/tasklist/meson.build
++++ b/plugins/tasklist/meson.build
+@@ -10,7 +10,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'tasklist',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libtasklist'),
+diff --git a/plugins/windowmenu/meson.build b/plugins/windowmenu/meson.build
+index 71125ffc7..07a6d767a 100644
+--- a/plugins/windowmenu/meson.build
++++ b/plugins/windowmenu/meson.build
+@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
+ shared_module(
+   'windowmenu',
+   plugin_sources,
+-  sources: xfce4_panel_resources_c,
++  sources: [
++    xfce4_panel_resources_c,
++    libxfce4panel_h,
++  ],
+   gnu_symbol_visibility: 'hidden',
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('libwindowmenu'),
+diff --git a/wrapper/meson.build b/wrapper/meson.build
+index 4f33fd89a..e88644c1f 100644
+--- a/wrapper/meson.build
++++ b/wrapper/meson.build
+@@ -31,6 +31,9 @@ wrapper_sources += gnome.gdbus_codegen(
+ executable(
+   'wrapper-2.0',
+   wrapper_sources,
++  sources: [
++    libxfce4panel_h,
++  ],
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('xfce4-panel-wrapper'),
+   ],
+-- 
+2.43.0
+
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch
new file mode 100644
index 0000000000..ee1f48086a
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch
@@ -0,0 +1,30 @@
+From 151fec5f91fcb3dc5d55aee82a6d717dad77e877 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Sun, 22 Feb 2026 17:11:05 +0100
+Subject: [PATCH 2/2] build: Install missing libxfce4panel.h
+
+Fixes: c259dfbbb8e139b43af179acec9824ecf849d34d
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/151fec5f91fcb3dc5d55aee82a6d717dad77e877]
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ libxfce4panel/meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libxfce4panel/meson.build b/libxfce4panel/meson.build
+index 150319388..38d8ad198 100644
+--- a/libxfce4panel/meson.build
++++ b/libxfce4panel/meson.build
+@@ -94,6 +94,8 @@ libxfce4panel_h = custom_target(
+   depend_files: [
+     libpanel_config_h,
+   ],
++  install: true,
++  install_dir: libpanel_install_dir,
+ )
+ libpanel_sources += libxfce4panel_h
+ 
+-- 
+2.43.0
+
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
index 00c9352dec..350784e083 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
@@ -15,6 +15,8 @@ SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
     file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
+    file://0001-build-Be-sure-to-generate-sub-headers-before-includi.patch \
+    file://0002-build-Install-missing-libxfce4panel.h.patch \
 "
 SRC_URI[sha256sum] = "c940dae515bef4af08a126011d2fd873ce99e815157ba8cef5332195bb60e51e"
 
-- 
2.43.0


