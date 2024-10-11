Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24B8CFC611
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:51:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6443.1728633106930730979
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B4h5fT011683
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 00:51:46 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sd9g9e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 00:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0fUuGJCReZmjomj/EMROdbqLdLU3XTBb7Fhl/9p3yeFh5R68xl9tyLHypjXuJfnI0LfdQgdnCbwzA0woBVj8zwxJ59SHDXF52NjcsyvNjwVeHo4QfaSuBlAqc+OLD5YI8zlqWoIUbWPuKGp1CHXGXyzK9NMNi4/KmsLys1AF12/ilxHaJDRfVnhTEVlxZCARm1D2WSJjjXLnACocDsNbTtI2iZ0aa0khLsIQlcrYL4SU4/XUip/OzXGGQ8hfA5rNMwI+hMBN299dQ+AtcHK9F0oyjxfsoitbMvNStKm+SJI5IcfICix05MI8pSDLudR43NhawSeT/QL0H4IGG1o5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPzsL1a/g7uKu/BbId4EYKqvIWLU4k30OTHUyp7c/ZE=;
 b=TYMPjx41fgpbdi0CrJSfzDQL2icfcn5tcbfv8n34B5dNrG/v21hP6/+JEEK+hhryD4DXUAI60+i/PDRZUYuCvLDwJedZirdyoepdI3g0YV5YRnTOMXa+WNHzL2wbEolP9/c0CSk4msyySg2GsxJdKrYVUg3ZSSLE6nBW7YF0LnjCN6yHXKOcJgB72WpF/2EvCTrgDrmOil0NnWSZj9K5fiDeN/ex6n7ULMKjzkIAZaKlQuiggBj6EQPRrwgvZw+e8a7QFXq4STN9aHsX5F1nI3zt4Zcs0KjsbGlo+kFhZCDLaLNXcqDiyiedjU0wtSM5bmT0mGfDMH7mJ9xllfkwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 by SA1PR11MB8794.namprd11.prod.outlook.com (2603:10b6:806:46a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 07:51:33 +0000
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83]) by SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 07:51:32 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] libatasmart: Update SRC_URI to fix fetch issue
Date: Fri, 11 Oct 2024 15:51:17 +0800
Message-Id: <20241011075117.2146003-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::14) To SJ2PR11MB8421.namprd11.prod.outlook.com
 (2603:10b6:a03:549::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8421:EE_|SA1PR11MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1c7162-c63c-4814-67f9-08dce9c98611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rCDn3oJWZeBFEWjwcTH6amDRG4GFRYovky+Ir5gwJqlCMCjZqeihuMs6JIn7?=
 =?us-ascii?Q?3uEAhNbJu6C9zdyFigjzCe+uysWIFCg1JOocT0iz1LhctYsv8EbyGpovVqLV?=
 =?us-ascii?Q?gFTjngEnS3W0LvAh/mOnrwrmLT9YkJUGK5DSTU7UTixZRNXhY60+qbAAdNRG?=
 =?us-ascii?Q?ew2FB4Pr11PPqKc6FiXF8Y1hfTNscpHVEP+b97HPzE7pEZbAjjYDdAnmFTyU?=
 =?us-ascii?Q?8ljZTB8HA/IcImG/hKWz2csGdmX3VK8VGO9BONKOLrbX0dEGGz1fi9aAi3Tt?=
 =?us-ascii?Q?cHzl1OP0g1k2i4KWTHZKJgAJ2JZNAH9HxOJKoIn7JRp1kJ9iPpTl6CdcUib4?=
 =?us-ascii?Q?luUiGZQLLyhW3XABfPWVqz+bZcIuNWWVYnr1M5432PBLd7wJubAPNswGj81s?=
 =?us-ascii?Q?aFBEIf0TCt40nr7+FVDPqne0zmSBTx7yxhdGSC/HJdDR2E1NiIoYl7ezd2zh?=
 =?us-ascii?Q?2aJ+AK935KT8rbDf8IKrqgoLguFhzv24LjRvu4u0rWlQ/TgveuZlQOEvvEhy?=
 =?us-ascii?Q?7o5xP4VB/XjtIfjvdjPL0aKHU7b4OVtaK/tc4cwJHE38LMJCe9OgzETOAnoL?=
 =?us-ascii?Q?Otmffshb2EFVuMHSqitnmuRy40KX874Lpn+TUxD9VZp8MoSfs/7CYXEEiBbs?=
 =?us-ascii?Q?WPTnj13dQxKDpXAv2FVli7lRW7olp58iimtwtKMB0HZ5/77dg9y8TqucCDDC?=
 =?us-ascii?Q?Rt7NEIM7i6uTpy4DGX8v0Siz35RDNlhkjETfs2fVTEhu5EyK7Q9t/z1PnlAw?=
 =?us-ascii?Q?EJnTJDdn9gfsUzH9ld8XUQ7loJjrHQYwT9xBD5K/8jA669b+1Z8QVRCKRwFq?=
 =?us-ascii?Q?lYVgafXU5vLvA9utaBOmoKeqK01zjlh1LTVNCyHI/PdkJA8+I+iCitC3GZwX?=
 =?us-ascii?Q?QH2RdvbNAt3yFszeUF8fQ/JkpmI1wCNi7Dasn81qRvbyJ+nt3d/BTOq5v4+p?=
 =?us-ascii?Q?EU79vUk0qZ2kDvdrbAgZw6rE9dwQ8jhAGJzyApw3KSgXrqI5bX+yXQLhGBE9?=
 =?us-ascii?Q?wdrEwFOFqqXaNQtygyjvU6Vdr8cjxJJe1kmyL00tzAbuI7GtmKKMkSdp6Tbw?=
 =?us-ascii?Q?byZ87Np17Mp3CxtRyuTjk1hrqNJ/f85X0QKPP554LLEs3uL1stGqii0WC9ET?=
 =?us-ascii?Q?amlZD9rQk6fa4Un587KQ+q9TPwGnLXXmXAY6zv9dSa5WKGOfniaBo5R7VVFJ?=
 =?us-ascii?Q?pqosaXDGCGkQvqExdUxU18sUql47cTTzQNU96djWNaSxDRLwz7R+9WpFQpig?=
 =?us-ascii?Q?7h6NEPfsTvub0WGIql8vRltCEVaKlbnA8d2J6hvUZ5/V5LzBg40LhJMC8cNE?=
 =?us-ascii?Q?gd5clog1iYHJoU8FvwmsJgHnQG8MybTJJX6A7jR4ujU0YA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8421.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YAue0lgOOx/15OEFBVyLs545EJlVb9x3uE3KjBvgiWnrMFVSA2Ry0HyXN3cL?=
 =?us-ascii?Q?RfAwqoJcLlU1gUqGV5qEVj5CqpbxoalwdIo/iFSqIAkl9ancYcI1kR2x4yH+?=
 =?us-ascii?Q?CXINGooqywRrPItVn1EzMUDjF4vc2bg93xnW9KzJpf2Brp7O4ApTMYRf/HKK?=
 =?us-ascii?Q?H6LzVX13ZlsDsnD7Ak3YWgfYnlsuHxKsKFekYe76NWfqriVig2hoE5+J8cFc?=
 =?us-ascii?Q?iR/hEj+NWeQ4stwwdi94SsgJHewO5n/MJgUokLUkmHQ2THExbvhM/zv3A6rR?=
 =?us-ascii?Q?JI3DWBXTW3h+2VHx6ipLide80gWSyiorq87hXfzPsdCgiJ0aLiNN5pkelrIS?=
 =?us-ascii?Q?oPnTANG2hzqmkI4ct639y9/Rsi/G51beeM2OPQ3dLZMwbVfm93stYLm7pSMD?=
 =?us-ascii?Q?09LFAhUDtl5FHeUw+4XSBXudR3W6ZnMqDPg3WFvqEE7N68tom0/9hhi9DHWa?=
 =?us-ascii?Q?xvAM7IHImO74LMKEswYrNHLm6cu8sqrJxKIVxeQHAqp1J/Xwtu0tLHttl5UG?=
 =?us-ascii?Q?mL4ssqWSViUVZebFSv23shXXuOYmUfVMcCGDe50HgGcY7gG19SfkdoHXbk+P?=
 =?us-ascii?Q?ynA3wtiPwkoQTmMDvsE72HEcNo7bic4F5J48J6CvEyEA6KHXqf+Qd4K/XycF?=
 =?us-ascii?Q?8TQTodyE5Im+qLdtaHYZzDl+Z5H8CkfrT6OzcLBHGONEvwyUzU4mfZRaLmoE?=
 =?us-ascii?Q?xoANu6T0qoljhZsyp5z4lu7+wtq1Y+ax3MGVnz0gV1UsFH6635ig3J2sHTzU?=
 =?us-ascii?Q?PIKFnX3ve2K0ONgU/1nxbaKWJVwEzOc6ZckmuoNJexM899MF9mFsvkFtqQSV?=
 =?us-ascii?Q?YNdVms/VpO+D8TrDCwO2DGIMe4msetXwyrjFxJ6aPc7L2fcPHXGtGJ3/NeEz?=
 =?us-ascii?Q?58lQPIJUIrwZ7OC2oXllakksfnbm1d1oWrCDzyHGBJwt4Zh9lVRSvcH/SykS?=
 =?us-ascii?Q?GZxt58EsDuNqECexgQywjjBrVhV24dzwonm8DG69wDM5mq3F6DeAhWDLLSDh?=
 =?us-ascii?Q?/5UykFMzKfSmms0eKsf/wLynIzy6Q6wjWU/UBRLOTnSPi5ByYgaRBXu/iwkF?=
 =?us-ascii?Q?RX4OizhHQcNKwaubmCWiWTh/1KZk565SpYFtbCF/9WU3yDJorl1BFsauD/07?=
 =?us-ascii?Q?+XlB465lsbpHz9He88x04sbN3q9cL7NYZdMy1dZGGmO8jkq9NFKvSpiu9BUi?=
 =?us-ascii?Q?+daKTc2M1ofbl/QvxBjC2QVUpRL4GlF1qD79vS0fe07KnFljTj3e4D2Bsd0t?=
 =?us-ascii?Q?OGgY4SDuhQ5cmwiGm82YLwxnSdVI3KRFX8bPxxdPaKC3pyK6TTjm5Q4Wp/MI?=
 =?us-ascii?Q?kcWV8Adi7RiffqOx3M7ZA+CfRCYmA8ZFz4yN6EMRv3CwFw2DnTt70xqSSXXL?=
 =?us-ascii?Q?7ds6pts3qa8TZmj9tvKvYMBCwSP0UdaPUNCKBV+rTsC2gjmQv9kQTc0or8rV?=
 =?us-ascii?Q?EllHYPPQFQjDxp/QZRHstzVowP8A0VlN4yWalOQeVmijzLzBE/BrYp31DRe8?=
 =?us-ascii?Q?YmJbccppHp0kLSyO0TituMlEn2KC/RLe9X9umVI4ThdX3WbDju+XesJ92kiI?=
 =?us-ascii?Q?IiI1X2aHq6DqHJBDxxxNJqFQkdNMaABhZmmRKnzl05DTRWm6wT19omaPXf6E?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1c7162-c63c-4814-67f9-08dce9c98611
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 07:51:32.8916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZfD2GpG+vYQdhS4ciInIehyZ0W5H+cPY+MErpoIdxymvitNGOe8GGgjDJwKkZx1Q2mGd3+NnfXlN6O2GQEkB5Uoc9XV8XFjV6KGDLgLMyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
X-Proofpoint-ORIG-GUID: EkW_XDBSCrBXehD4m-t80qx3dGo1bWc5
X-Proofpoint-GUID: EkW_XDBSCrBXehD4m-t80qx3dGo1bWc5
X-Authority-Analysis: v=2.4 cv=fNxr3oae c=1 sm=1 tr=0 ts=6708d912 cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=6xbm41ixAAAA:8 a=UB-e77jO6j7I9kU_8C0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=S5GGVp12ez9_aiSFvI17:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_05,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=714
 phishscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410110052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112788

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index f747ecbf7..8947b9fa8 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "udev"
 
 SRCREV = "de6258940960443038b4c1651dfda3620075e870"
-SRC_URI = "git://git.0pointer.de/libatasmart.git;branch=master \
+SRC_URI = "git://git.0pointer.net/libatasmart.git;branch=master;protocol=https \
            file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
 "
 
-- 
2.25.1


