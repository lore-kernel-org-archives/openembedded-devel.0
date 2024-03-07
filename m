Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B99C5475B
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 01:17:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12793.1709774219639328957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 17:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KJOb3+9P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3796226880=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426H3S8X007780
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 17:16:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=1laK0qJOtge5xxxhWo
	a1CSK2yUn9Mch+OMuPOj9ryJk=; b=KJOb3+9PcEv4kfSmcj04PxrbTimMIM8OTd
	Iu84+t/YOmXdjAsVGclOKewmZrIHNg9QC8t16bUNzWXkdNm7MAMEh7va0EniVjxc
	BxacsuFchl+N1O8CWfP+PJFoILQyyvmpqLn22d48eVTgXMfLEoE3uElqAJdxFhsV
	1fmZX6bj0Ab4bg3mbnbIUhWYZwv7Vti/LPc+1wED7QtlKcLsEy4/WTaRFht53LJR
	Bp0YidPfwGyxiBGIS7cXcuNRbpXwsz0h0UJHlHNx4ZYsm+iSOH69VDZbb5nCFRai
	UxsENP4e1umhSbvATE2l0w//jGksVrM2bjszsGlKiWijGZn+L3xg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vfmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 17:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP4Eg41RrBHJDPLII9SZ1DqndCNRObpBtiFX2n8PrM3SVI3p394szfCdxv9EmzO6pMRxmaY/wtM/UtWmogk3lwJ8zLNCPWBSTDx796BJ9ZpoS6CzJxW5+IlWmSGbQCyUHgDHXxMqqCtTnKX7urQDziO1RXG4CEJqdagWB93UBN/wwDuv1DIeglRWHFHPzZOPWXcDcjM7oNkUCBQfqU9o+5S7ObIXb/frJXOLcShqSbmi5gUoyQKmkrZHDo983yRjY+QnNZ7OpfzJIbPtzLsuvP2LTzb3zeTp5vvcegbi6ai10QOPuEWHjFJPqRVrID8jrWoDbASbqEamtw9cTO5rsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1laK0qJOtge5xxxhWoa1CSK2yUn9Mch+OMuPOj9ryJk=;
 b=OHd7IIEJJlUa2xL8v3OZqrLAVn29Dida7Zo0LsNUBRk+Vdkdg1gHw0YKkK0j3RvrT0v1dPv7X2DIgUspLM129DhA+gVF5BZJiSE3PsAEVEmYFFMxJAZvGCl11T0nLtQ05fwh+wtpbPO3m0qogjT9xFjVXj/TiO8L0KEbOYi7D0jc/bpq4VVKQeFrRAOJSgJg+XeDH5MWkYSU9toYO+G8ltS1aLf/ZSnDIFLySXhUBi7IPIJfqKVvRE+pt5Zw3KhXFG5nv3d8EuAOMO+eC1w8ECbCyWAw0CENZ1978R0YJTEKuGzDpuQBfIkRgVlgpxwdj6pQ3/+bzXShzsBKG8MZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 01:16:55 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 01:16:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: 1.44.0 -> 1.46.0
Date: Thu,  7 Mar 2024 09:16:43 +0800
Message-Id: <20240307011643.2354657-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:404:a::24) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e177901-95d6-4f8b-b2f4-08dc3e444624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wNplRpQes4JknwD/cswYOFm42rUme3nJaC62j4GHyAVTJjsDddeOMM01rSzOPaDbLix08kPvw3HYEjWDxgCTstSexQDIL1AkgikThIPfYJJ0G8cKuC5pZUgLY9axYNpqGyXFzF7bnCe6fyerBICbFza0SHWdBTr2jHRNqXZABMfJmzRWRw3dOkzazg9uIHY8uQljLUzCWNfiEK30x9+NLjnWDvJxSHKVhYDbowwLPx0DAbrk+DYSTkrPHTRCWPhEChl9ZIAnBMk2y5Qm52KyvXX7M3PrSBBk3zhtpC7lMkCfXUCPQiapdxRoR3RSgEVjrAa8Oh4oZNfFIsRbH8TqxBSTrW6blMbMuLCMBzikX7/ma+kP4kpLCMwEqZ38Njbjk6oQTLJU9tlgeBPt6feEN6gpHJSlaeo5L/EoxxHd2OliVKmEWsI5OcX5x2w8KnWwoTMz5TymXRbHFaAAss1VIwq/4G2MuaacPnmadZrzkixsarscP8L/zoNxPaqh/2YSyvVchqtjabp/bMzoRAAWXYlpe5/UZIaULg34vRAOnZmGF34XtBVEhfQAXuiBIV4167V7kA+rvvI8+hawC02VSilI+rYx/cDVG2iqo6rkKPgkVH4OCMt9bF8TTh6OvLiWmmLOhX6mm+Qp/AC2qqgzfJ8LrzMFx4wZCZPcC4lBNAY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DTl/QtZ7Uu53ehFkBKGobQLzwgA7631fX4IJIeQJTxWrh9yzbQhSrZIH4IW4?=
 =?us-ascii?Q?1uP4wirekfbOZbIIx/xNYQ3YLJ56EI8JVMbWhTA7+AUc31guq4Q6sB9F4vml?=
 =?us-ascii?Q?XAJo5/vbuADkvJiiR+8x+vxrhOqH3RfANqN5AqVIv8HNtoOeZ1ku/Axc0s0u?=
 =?us-ascii?Q?kw49ZO00o7SDwofgmOm0ZA1xGJWlc73+FhXo8dGGnTRWhLXnn2IxDUlIi8tB?=
 =?us-ascii?Q?pEJILqdY7DRbJHTwo2QJ/kGTdoN1ssFp8fbEn2nGn4woKYknceeQWibmwrU/?=
 =?us-ascii?Q?B63Hsc2+XIcD592Nv9SyqDiLLqp5bm9miq/zu3bNgVJfpQlJHMZS39ASk8A3?=
 =?us-ascii?Q?gyqmtrUZngfG/kKPwrr7qtt3kn0OlThINXtLi0zzRd9h3fmm86OAH6glfJJn?=
 =?us-ascii?Q?DN4a2M8+Y6iSXa6YAfoX3RniDmGtzTw6hV5myv7JahZGZYyEPcb8FMtXNNbV?=
 =?us-ascii?Q?p1nfmSXdcdsO7LN5zyYRev+/IyIS3oawA52AZEhlQR4s+IxdwQUCY95HU14r?=
 =?us-ascii?Q?oUt+KXGD/Y+3YCvuAUgPpBuq9D/b/Q349UksOZl03kgrOCB94JNRROApIM/1?=
 =?us-ascii?Q?VGutOQu3uM6e7F0pKqZrnOsj9Ztxp6bQ8xlDKGpo+CL2Z8tp9+Bm40P2MAh6?=
 =?us-ascii?Q?fGPhS4LX7gBlJYC71/f+urhTObqnlEVlo34KGn01p6Px8s9zE4/rqeh1HgXn?=
 =?us-ascii?Q?5g8dAfp++q2p7C4gNR7xDFo5LkgOwehggBXXt2W5A+EPPAii7q4ucbw8d1gN?=
 =?us-ascii?Q?TlJcPkizpJ0Eo7Z2+2vkNIbF2yViWGOGaGaKwdYssbvD5YtmFKirK4X/RuFh?=
 =?us-ascii?Q?XbPDKYykc1HBgA5a7kGcAkHNvQkMY18k1PkVRcDG8UwZtozCLccqAI4KFo4C?=
 =?us-ascii?Q?aVI+ZZXqukLEbqD1I1FgXdtuhNANz16thoIGwcd+5CsIix5NB1HhrBG+jc5W?=
 =?us-ascii?Q?7U74jmHk8SFOC1ESj/XOYk1H7Pa4F2eAIWnPebwm1h+Tu2Mdt8GflwuTOxrQ?=
 =?us-ascii?Q?b+2guk97sLhanPapgxgK6wNDto1mUV3Gg+Efo0jgP5UxoDLAzYze+4PfrVYx?=
 =?us-ascii?Q?aD7cJr66nmEV9miSRVOX7iB1kAwC+uS6NYRMkhOzBDf1HqsquDlEPIboSrUe?=
 =?us-ascii?Q?m+STLpyjjC+kUiqDtrQvfahJRjtiUMBuB/I1RcoMriJKy7Dx4ZO682dQHJYg?=
 =?us-ascii?Q?9YibXXD5999Y9oT2uhLSs72gLmZWQR74Hkar1r3wrB/xHseGJtM+YzH8/Cn8?=
 =?us-ascii?Q?7wr4TvKDxik97WgjwvQUxZuHMhxbd8ky4+RSHeBAxvlEH2WORnmGt6MDxZUn?=
 =?us-ascii?Q?rQ8Cg5hk/I5uCeIGO17vc6V1QkNRD2Vrk/csp3hw4G5QU58VpoSrHOIJNUVh?=
 =?us-ascii?Q?wqdP7ztrmctQ0NHp5A5Mz7skEW+vkSUHe9Bz+dus+alUTf2aYDoguVWC8V1R?=
 =?us-ascii?Q?d8jYqbZctnPtxOg2QLfagkEZEFNRYtY2iQtWea558YwZlJ9ZWNueTQqvBSzb?=
 =?us-ascii?Q?DxBrokrFWHptWMIuUKGDiCt1SugIidL9pEMfGyG/iaOlvcTw4oILsTJjOvNn?=
 =?us-ascii?Q?Ml6epxIf/qJdQMbbwwuFy/hx01XRQZvge95QcjA2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e177901-95d6-4f8b-b2f4-08dc3e444624
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 01:16:53.7041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mv5B1ne4hxOFK5Bqi1uxaPeD3VrYNNfCkcIyScX4RBj2jKRQ6utRfU/iPo4OHCe5mXliNg07hqFrYxLW0dZEZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
X-Proofpoint-GUID: TD5wCrnTwpCT92bxB3fZNGTIUgNN4_Hd
X-Proofpoint-ORIG-GUID: TD5wCrnTwpCT92bxB3fZNGTIUgNN4_Hd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 01:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109184

ChangeLog:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.46.0/NEWS

Highlights:
- Drop build with python2, python3 is now required
- Support randomizing the MAC address based on the Wi-Fi network
- IPv4 DAD (Duplicate Address Detection) enabled by default

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{networkmanager_1.44.0.bb => networkmanager_1.46.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.44.0.bb => networkmanager_1.46.0.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
index 07a85b68a..be30154a3 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
@@ -42,7 +42,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "edca09637d182f806b3b12d8c5623d7badbd73ccca1ae63be20d2f298779fb9f"
+SRC_URI[sha256sum] = "722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.25.1


