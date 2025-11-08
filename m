Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4808CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:18:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6330.1762611536568923861
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pVabNdNf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3407a683bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8DomcL2201403
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Nov 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=VDM4eUIm3ga6M0Zd3WtS
	nWXlnuQPGrlY0Yy2PZN4C+4=; b=pVabNdNfRcXu7ceFGFisEjibL9267OddSYzG
	efLrH1kcBh5WJ0EGllRsFMD6rLi7W5sS19Um+xJJCRZ4E+eYITL2dgHkBc/KSiHF
	vy4gBoY8JWI9xfgaNLmnx62ZnIDc5njoa4izajq9idJNmJgYTNaSspUvscNMFGAy
	pcZrBmych7kXQx24ew9ezoYrse7wIe2s71xWD5iUDewQPTvYMguerRC2Ov1qifA+
	3EBvjp2nHJI8kAV06w7cBKjYArJGNjqY+hAeLqnSWWjJOcJAxAYTvyMFeeGn+Fwx
	0kXDeXqJt/jhJ0ni6D3onPYn7/8G3aYMjh6cy2oSxBEdpUApFw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu90b5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:18:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwO2iPJHS+V5OMNT5VDknUGXBfmtO92+344rhlQipIzDM0iIQODGRhkQdh5Mj9fr+YVYomypVN1VFbY+NZY7wW41cHApxH54vtt/kxSb4nJgxPpbU+1qhqGuz3kTW4VHckwxawMcsJ9lF4gJCjHOCgIJ2ObdUGWa3uXJjw7Mev44DbeSsMcGXOopXLnsjGu6wuDive5humJL9Oy+13Gs0G4p0VEEBNSEZljIGg3Ptg77K/uSGg9zDCEJ4Wg0sEw0232YUBu5ja8HeF8iR9UtAf6FmjNJups3xKTMGqajvHtfpRXExgYP2E4WBRcolSGyWL7yVGH2PwAjD1WInPyXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDM4eUIm3ga6M0Zd3WtSnWXlnuQPGrlY0Yy2PZN4C+4=;
 b=BFnWXpk6mheKQw4tjUF6AAMwWYTgCGgt4d7Fxy2tos77MZr1+kfLPeWEJ08JP9nvZSuuB9hsc+1PNZ4iUzV+g5Te+5y2TFN7WFyhK/zPAgEQiI8PmE1IUNo2A20giBit8mSOhNIOc7ZQH89o4N1J76TAASgHVX6d+P3y+Mqfw0SO9ynQ2ZHwXQ9cB8kvD+VOFzGiT9s+U+3xbGDQrPFtgXOxiPq4PrkVL5KZkvUsuFrtZ8FYMiVdibeCRiDw9HhIcHqkxoAmrpU4z+NmTqsFCwwDxz0AV+J5CAtfgaOZPQap7Z7/awnce9QmzNwiJnK+/CLmlqaJ1BC0+eE/yzbJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 14:18:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 14:18:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] menulibre: add UPSTREAM_CHECK_URI
Date: Sat,  8 Nov 2025 22:18:38 +0800
Message-Id: <20251108141838.259595-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: ec612d9a-6158-49f2-4253-08de1ed1bf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tEDQDh41uYJjEwqQZzoJYTiL635p2mPEKryX6Ys9ynu4iCGJ2mD1Yz+SyPrb?=
 =?us-ascii?Q?s/bCTzIkaz0R3eXhmJUcgCfseF8LRb8EqTYGpTOSmsp90N6VOli/TwtUMsLn?=
 =?us-ascii?Q?cEaxWDjtlSvjIPAFi4M+An2PCySMePG/8T3bwR6VRCStMUyjAiyidcFP+y9E?=
 =?us-ascii?Q?4J3qtsgvqzJsxRayEFRRmslrJYWM9bOpKdJiqW37Aw1DJeBb+SozQHYLA4fB?=
 =?us-ascii?Q?+m2yXpzwd5Q7IZxNCAnIyQx6l6wf++SPBb9XjGeHBU17TnPhVoNaAkuiv7El?=
 =?us-ascii?Q?ItHGaaL8RZVPgRtyUcGPcm/JrLxlHO3BEqbpm0xhxD8Ml8XoD42ZJOMo8Xn2?=
 =?us-ascii?Q?lWTMPi93Bwae/9n6UoI4uOl+4VNQcCYHbT1EYvVYUX80j4YtFiHTT9AC/rrZ?=
 =?us-ascii?Q?Jhq0Fq53cFp8pEKJ6K0Dgf8Kea7ibAs3n1zWw4iTbZwdWKAg2kGRdya3xcWr?=
 =?us-ascii?Q?WJ5XI+WG7aa5aXsSoQ0ejw2gq8wWKmNm3kgkFl9qp9WZyPKzm8lGMcHioOXV?=
 =?us-ascii?Q?KIPaATyMz5jXmrJrhv5y2+5cSeu5vbmgNHeGO3XldKRVa771c68bi3AUkipj?=
 =?us-ascii?Q?VDUQ/1ZkMkITan6dKyi73wAkytFgiqWDJkIRUJaRCrNnJILwFTPikoVh/XGH?=
 =?us-ascii?Q?Tizso5PnVGQ6gTeYPcnPxKuX3IGn+gy3BoiQqmPXnPre6E55cCAs9ZuyjWv0?=
 =?us-ascii?Q?znKkRHBqjAxsbnfnLVDGqFFLOv3NjILKfZGh/TR12g1+o4obFTOQiAWxZbeT?=
 =?us-ascii?Q?Qmo7KO48RpP2TTAh1nYLUKBcM9mo0X0oDSyMCelHM5mbRvGuJ34WyDFSjO4K?=
 =?us-ascii?Q?APtDI1Ex1LAygJUDQEvK7KmWv8uQ5DikHMKJF2aDmctbhP+pdQ1UdIZCIzMR?=
 =?us-ascii?Q?hdkyNzWJWIi0iJresTIkBYcEkfHY0Ihi5x5KJW1yX8VWOtg3IxbWtBkoYYX7?=
 =?us-ascii?Q?75DNweoO0nz9DcYvZ2Eeff5XF/ZOTqOEyPYQeeqJExYHiUuJYCYWaFCQJCRt?=
 =?us-ascii?Q?g9v7boSBHmbeuj7647TaplZfPcqLawx/kAuLVGMzSeU6bpNmbWzsBGBB2XJr?=
 =?us-ascii?Q?0ZFByZfziC0XlE8U52Me3oTRY32wBlFqM1ejLReCGcqbdJZ4zxm3CrL25cju?=
 =?us-ascii?Q?oHPPAoTvLfTYIzguqMVsP/ON2aHkFpfM2lAVNGlRmY0zV2KjFUzF+PpTNteD?=
 =?us-ascii?Q?3AO19nSen0YMFcXXU6DOmMtbPFGnLdIrtkpkOVpE+sJuvJeuV87aCtRQpVRa?=
 =?us-ascii?Q?+ahSyJ0tY0GoCL+53/E7VKLciP4JI2Vuth0ssPCHts9jGMtiNmSMH1q2IPYB?=
 =?us-ascii?Q?ghEgQr0eZccA2AupvkM3VKEvFu9fqDR09X06HzksFKHU8GF1RjA8p1MV86CC?=
 =?us-ascii?Q?+vOB8GDKACdMNkDSyejxU71J3/xFqMnVirCNqvkZa7auXG0CgpZPb03vy1GU?=
 =?us-ascii?Q?GEZP+5D9HYEiCiPWNNYuphXdka/KQbO4I7Ut7LWsPP/CCXNciz59q+MWuBiI?=
 =?us-ascii?Q?ddNKwtKcJAyVwTJKQCm99duo8KkxZ1pvfQkH/Tf31VPmbhq+oL2MAqs1uA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PWc5LZDSVon1PbvfxFpGJnxMswyNVlWAtFjNR81buULqhHF7N7eKmoaUiohF?=
 =?us-ascii?Q?XUH8uxCgF7sgFg/LxoLfrN0LJ6zwzkxJQaA14sGo9TZ7WnosO2L0fjg6Y3Ie?=
 =?us-ascii?Q?lYVA3dlk3q5AtkRBTn1DvV3WJE8H6hs7xsW+YtAp+fk1HFnWvcaFkEFlcLCd?=
 =?us-ascii?Q?ABrxw3CD1H60PEul0MWtzHEpE/5qjUrytx4G6qugTwQjK0n4KwTKqaPmcpbw?=
 =?us-ascii?Q?E74GCm1J4W7cm9V4bzzU3LWFxDUkXD8hgTcWJjgLTgNufaax/M6iXBUXg3fp?=
 =?us-ascii?Q?LngUMp2QXyI8D6j8CxYslC1EPcwJgrZ7sPh4e0XxwRKxIsbS1aKtvESOEEoN?=
 =?us-ascii?Q?rcZ4neOuY5Z4niOkhZooyrVFg6gGQPVPy7lPGG3EGNG0w+dANTnAAsNPkNhT?=
 =?us-ascii?Q?sUlYx5DilHYPcKdf/YPpnUib5tAAQP4o+3rQap1pYdAnnU68ljc+/Y+VghWs?=
 =?us-ascii?Q?gJY69XAIAfPuno98jdZA0qKjxkfjQO8YqtQeAItOe97CVSBEySYJ35ILwJVN?=
 =?us-ascii?Q?HpFlKRyFgWMoQ3EdOCQf4/8hGiVuv2FZ7Biu2/5x/kKrYy/Xj4xgPXfOiQHu?=
 =?us-ascii?Q?LAPfAqRjs+Jc144Mr7DfypMlDS2NWXGgZtYw76lecM9SKMTlDWTFx8Vh3Q24?=
 =?us-ascii?Q?YYqftgo7IZtaueANbNiwr+G5YWHNnu4olHmhPamkySvWi+sO0IGRP5YYBybh?=
 =?us-ascii?Q?hvFvhKoVVKiwdO0xmtK9DWkbQDi0KCayZob5iKz8Vna83qAsoZWAfZzpz7pd?=
 =?us-ascii?Q?mCM5amMvFpN6ne3D2NEDTt+jZDwRLSlbf0yGueupYaoqtPGmudnVeCumn2ON?=
 =?us-ascii?Q?JRUt/uGVrfrjc9eeklKDawjkxg/SNfuHvTlLFMNSYzf5gWBLgTatezZqacba?=
 =?us-ascii?Q?EzXLMRBpy9lcJBINT2COKeIgbOz0cZ8rOUfTP+w+VimSvw4S9vg6AZzWLYPW?=
 =?us-ascii?Q?xw2nReRgTdOhRneO6VtH0Qz19al1fB7QzVbMvPYk3UpG1WVossZt4ujZ28zg?=
 =?us-ascii?Q?OiXCq4Aijjc9a/GO+xMdMx7YYZ2mLQPYytNVIQEyExvCLfeWHaxxi4SYVcXy?=
 =?us-ascii?Q?/Jta+9w5gPJXcBw1Jr2SSg0qyfw/2K+gdUGQJ0wVZd055RgoHdCbkEQMQsog?=
 =?us-ascii?Q?W06cg/022aAYzWgtwx4HUIhBaNZ1S7DlOqOddhfT8X9t4zm/8doZZsWfPK8A?=
 =?us-ascii?Q?FhyorJt2lJ206WWD71/j91qsr4J/cnDdUS6vhA7w6Bf/I4saJ4Z+kVJTAVet?=
 =?us-ascii?Q?ziwne5ayIXKZDFV1RrYU4cGdKQ3czdN8q8KrVDOD6EWlZvJnBoeGZeT86kNh?=
 =?us-ascii?Q?IPrkq+buiOhuj6nMI+p87jcWLs9jn5RlbYDENWZlJifYxKMSkNOesh/bzVwC?=
 =?us-ascii?Q?11iWg8QhllH2vHDEX8yHX2X4EytqB9XdUZYpNHTXrO1DM5sXejDGGJ2iyv/1?=
 =?us-ascii?Q?TB2l/7eI+WuSloikl+GwUaqd7Da+wjJucaYRSojVB/XJ2esm9BH4DRFaPwIg?=
 =?us-ascii?Q?bW6wm92l2B9dP6p3sHiRSdyyJkzsFxRgPqMkNmchWg7Slnx5GF6fJB+n01xl?=
 =?us-ascii?Q?AOe+QP1K0O/KyWTQXUzwrKOStYr9eUFEonPwUl3e?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec612d9a-6158-49f2-4253-08de1ed1bf12
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 14:18:53.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjQmkhmnTECDIhV+YwiuAwhH6n04O45EC11tkosxV7tcTpmhW0uLLx/dwjY18v+LvBOKtqFG3fXwUBvZEdN0nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDExNCBTYWx0ZWRfX3cYsUBSFtL55
 GqyfEoTDnrr+0tdOr4nSPQQGpwl/u5UCpiuRJmF47H8lhaFA2Ybq5rv6Mt5q84PEdM/98GT+njT
 +25FTtpwpe6+VAsVBz6hYs07OfQzHX7uLuThTj9mBGQkhY4KXVVvhhSVDuFsEVpvHsjlm3//PoA
 cIfj+/d2PxAOZiOVLyQCVWRcrw5nz7ydfjg6vAZ1e1IbNCAE5qVrCGZkNPiN3CI7WgybF9awb5q
 1kALvKMo/bULtiuPsh5I3TrIRBg2dXw2X2WCH3D/GNbeSyADu6uXA1pB3WDWgCYmeZK13Op1S2D
 GG76hPyEmlxkbBP2f5AzbBzDz4pTRg+rLlQy+kNfEC8itGaQZHl/cozbv3umoTYs5NLZW9AqOyy
 IZa9vJPi4d2acSyBXMrMc5peBAn35g==
X-Proofpoint-GUID: scMVM9E-z19XZsJAqeNg3ywFvGMmBUWm
X-Proofpoint-ORIG-GUID: scMVM9E-z19XZsJAqeNg3ywFvGMmBUWm
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=690f514f cx=c_pps
 a=xx7W88v/Jz1hHwbI4fXbew==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Vb06sSnQF10yVjDUq50A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121387

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version menulibre
INFO: Current version: 2.4.0
INFO: Latest version:

After the patch:
$ devtool latest-version menulibre
INFO: Current version: 2.4.0
INFO: Latest version: 2.4.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
index 71d3ab4d29..4c52249fed 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
@@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 SRC_URI = "https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593c9f"
 
+UPSTREAM_CHECK_URI = "https://github.com/bluesabre/menulibre/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/menulibre-(?P<pver>\d+(\.\d+)+)"
+
 do_compile[noexec] = "1"
 
 do_install:append() {
-- 
2.34.1


