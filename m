Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC0FC83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 01:18:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2533.1753147121738825312
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 18:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92985992d4=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56M1EfCr3024581
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 01:18:40 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqmr5px-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 01:18:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PV9LxJtDE647AbByV9OIpbK1JtbNGgwzaoEXkXkBPiEbuUXe2G80Nq1JLRX6cE4qnbdqKlz8EO9NoGoO3JnTfNDcUeZz+6IwxHjmVP+BDm0h3XYXWgxgFcAy8aDHXMllCDJdejlhLeeIqKBUVy+ybxvgTz3WKNdLXuYJgmFt/TwwoshGTEe0BnyKZdxG88LS/LwVjUAs572jENZUL1XOMh5wLWaBCiJttpwJi8zdoOQQIlkDE7NRKsDTB2ZsMNTmA4Waja5R9R7NilI7UCamSfKVkeb2qzSKN4/IkbBhTCv5/0jsXziryIIKDcnoME8hqAXnyCqnd9llYm3dSDyEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNugjMieMrEfGh2oYRHz3RKNMHRgXRztQTZikk0ljsY=;
 b=bOaO5vcE1EADzHOdLRJf9Ay+ITDlU5K3LoF1e6hh8DBs6ahTjTvFdEK4PNacnUnZHD9k3o1gIuy9rPmefIesAd6t6BtMMrBKhUeZ9lMKGhqLSjYrK07ae0HsBZriphRgcd6bqi4NjQvijT/kOCUP4xxUVmUFpNlCao4486FSi4FuqUICtu5LKuoq1FkNpMee2snf3I8GBquT88u8eM8OzQ+Vdj1cPcDMfujF8UACR8b/wFr7RZb25AGXXS60iKV2z66QPemErAU47vRBJMoaxP+/Lkh8CH/Bespk1j+Ftdr795AOQDRI3iqVCNZ4UKSm8DUtBoXL5LAqNIm7qtWyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 01:18:36 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%3]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 01:18:36 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] thrift: correct the SRC_URI
Date: Tue, 22 Jul 2025 09:18:16 +0800
Message-Id: <20250722011816.2402292-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0113.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::14) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|LV3PR11MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e473e72-2be1-4d95-fb71-08ddc8bdaec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MdWtROsgiJUIXWIW05vZfTha3G8h8ojuBVT0FejP3ZvZWOyqotX81OOrqcoj?=
 =?us-ascii?Q?GB1NOM4FMNIq0nDeMvE33orxEEyCoYpOR4s5HZfA6+1IG8nZ87pKFw8hBb9C?=
 =?us-ascii?Q?4NvLI5gxz33HwSZmsud2nwcyGoZnQDgCpz++FzfXKaJGr3TEgE9ebrM5VJ1c?=
 =?us-ascii?Q?Re1k7D2wucPhPr/MikXuVejD8qVC9mC8XlGuNqfZB0IHP3DizzySxkHqBx1W?=
 =?us-ascii?Q?5RezwvJjaf/ItUiyIeHfbn2pxazgQavPuQeeBcxGCiB5Vc8b1+ytyPxUNplR?=
 =?us-ascii?Q?Po7PySJBWAQDULnEaFsIHdmWm4wlNZ5XXjnGfR+nf6CXVt7vAPcCXkoVk3mE?=
 =?us-ascii?Q?1Pjd9Hog7so33IzRWS7nbSFMWwWQcA7/VjDLj7ru/X4QvNXPuGpRLm8yTZOE?=
 =?us-ascii?Q?MB10gmYDr0hsrgo4Oh6myVMRTJrpALea7S8jONLhfPJLeFHgiMGfLYdxftYB?=
 =?us-ascii?Q?nw2OWXDPPTIehDfPf2BtAdjKd2EU6yEd4BEf9fbgbizg1ITt1kawZsP/RkoL?=
 =?us-ascii?Q?gGfEG5iZo7uYKhxmFsftY6dKL22BCVxbyrTcH4yH8im0dbhctS9ieYJfNmUe?=
 =?us-ascii?Q?Qf2134C3xWanmp8MpFP/jov2z0TLa5n7QVMARS0I0iBxCjip0HMVLWOawSrQ?=
 =?us-ascii?Q?IPYcrtoSAS22xUo3vWVQKpPgVUVwppK5jO9WmRbLICkWCJvyqmvn9D1CZnIf?=
 =?us-ascii?Q?oK0qVH4qYAJCPM8ss+iEob3ZplbvJCSRf4eL1+BITVI2PiDjart0J64f/zWg?=
 =?us-ascii?Q?tZig1wcW0kVbroGQcPC0k1VeQ4GZr9yu8qmp2rhLgrFIDYVb8Jz32EfN9lTq?=
 =?us-ascii?Q?AJTVbgXS7SkPbLpxKZR0u37TDuhpvnzvKJaO76daw35wps6M1RtLlHPdegI0?=
 =?us-ascii?Q?dUNtd2WS4s01lZ+VUhuSDWL+iC0QGoAnDQ7mKayX4eEg0eePhsjy69ZUNBv3?=
 =?us-ascii?Q?JyO0AM7pkOgrzLD8T7IpsmHcpNId5SQnR2LXP3EcSdL6l7mDZnc7Mu8jS13s?=
 =?us-ascii?Q?GN7DC+3pqQ/mYl0FUvpEzglddGDnLwaQ8tzIKBwxwagqRRCPy60wVgLTCRCk?=
 =?us-ascii?Q?B6YRQhQiATxdYV8PHpH3ihdwrC4g1LJoPspR4SULdla4EGiDxFy/yYDwLQCj?=
 =?us-ascii?Q?N/M4v2KFOJeSFgh6JL3pTqO3PLWd5v5g+rsZXIXu5GPae9AIufRnHI33WO8z?=
 =?us-ascii?Q?4sA/bZM8bio/HNvlHyx+wUle7N7Ff2FVIpAtX5nG2lPQtuxW4wvwATEGHJ6H?=
 =?us-ascii?Q?TCeN3o313kIdiOQnTRUfodAuOMKgUXFkjGfBwhQZxAt3ikDKuMMkjh4J41cc?=
 =?us-ascii?Q?sDndevbq/GK0TftcKUK3OUiktkCYFPlDoK/mrxLmHTlQxkO5hVh/gwGEFs8n?=
 =?us-ascii?Q?2HJX60YpYuHrnG/+pNmtt5Lf5sQIdHfegPYBum1Slf2GkV6+5ER1+oG2dftE?=
 =?us-ascii?Q?A7PCX9MNnveINFIEC7shg4M2zeMHMthM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5EAnkrvXiiRJF+iIrH7/coF/Wmw3iw0aVKeQn3SZUIPJ6ZRYFeogMrw6AQLP?=
 =?us-ascii?Q?V/PEuVCL8nfNsS1SYuNtqf9udJQsI/Qge+gT0/cbEoNp0peHUqrM0ymOo+yW?=
 =?us-ascii?Q?2yCL6E7IzcYTMUdbb1FgZ91oMUa6flxF0e4hpILqdvfOD8/Oj58apfk4V1aL?=
 =?us-ascii?Q?V+ZsnOCAXCfeVxb1Fp1Viw+VQGp4+ESm/sP+UPeihIcwxdSEM8f38ARjEYJX?=
 =?us-ascii?Q?umSUMEiLCzXmx4jelG+Q0aWaYiMj6XtnghQkD26Icclhf0y3QfU4nV6wkXaF?=
 =?us-ascii?Q?Uuzw+5LpVIbknEDaFV38xREvcc84pTmGmsdEcYjIeIm+kCO6oir87xhXIFrA?=
 =?us-ascii?Q?rS6o8rPtG4PFDGsFAboNThbPS9QL2w1xcJ6vDjOdLlu0/jFehimUbtU9GYY+?=
 =?us-ascii?Q?y0V5oh0mD1E7UypORtF0BOPxRDJtw0a9/8tk43FfJ/Qesbdre7VcVfmZ4/Z8?=
 =?us-ascii?Q?eMdy8/19yEsUTOO66BMD4VctDlcBsI4jJAWDJI5km/r3+yvsRREKIcxpE9+l?=
 =?us-ascii?Q?0VFZ5ssyEzSfE0/Z6NzNhI8l4YfL52IfTUyzJY+LgW6GZiqstYu/3DkKDItk?=
 =?us-ascii?Q?psvYTBP+57mKDsEnkRbmhEl1DzcXfuIVPpxsMPxtMyjE++eCxWB9RMnXhKd9?=
 =?us-ascii?Q?2evZH98wZfU3jBFxb4swpqPY9frdzuHOgtSIWC6auMABiiSMj4W1Q7LxJ/oS?=
 =?us-ascii?Q?VnbEiNO9oOqGgltjC+MJHz/63ComouS/+iGWXElcrf2TOL17i9Uubbg2poQj?=
 =?us-ascii?Q?bcRf5ydOUt1TglpIv1HKNSJVyqf70Dm/I7MT6iBeaJ3vVzQQpC4VNr37FJkC?=
 =?us-ascii?Q?sdCdGgY2rTRLo21ikXVFKgR30128OHHKUIprqe6jP4LBsVEEstYtaMS7GZnL?=
 =?us-ascii?Q?1dhCxcPEPKowFsM5ahU/gawoVeLo1Nd5PHFoAMM0XhdvEYvfJfx3vB2AiXYB?=
 =?us-ascii?Q?CYm+3YJO0LfXqw28rb/W+nqjSCca2cGPnN/rqX05Zf+lYvIaTQbJjEjRet5e?=
 =?us-ascii?Q?UB+lMjw44egg4oHsHv8ObZBRB8XScCAns63C9JfPlM8HI74b3MltV66vSCrj?=
 =?us-ascii?Q?Nj9z5jm0eVMOjkuQ+D7IjVoXLodunefEKXwjLdKo/BmKqNx2/l7w+aR2IXWO?=
 =?us-ascii?Q?V4AgJJFk8wl0aI0kqugkhlppl7/hSbLCxMh/P1MgE53nL+zf6gQcdcXaRVU2?=
 =?us-ascii?Q?xhmpYUR7Amr4cKLHwZMbo++OEP8pVJNszLlFickSc9XRy04cIx4AHknl656y?=
 =?us-ascii?Q?b/QyGslz0ziizxdWeRGBylaADzygZVeMRNCnFUi31ECmJT9Ll3xKRDsuWDae?=
 =?us-ascii?Q?j2CMMDKvQAZFHU2VSDBIPTbU0khmplQrrNxA1G7HxivRMefoCOb4WAJcAaan?=
 =?us-ascii?Q?cFGZWMcrATUYTgkh9fA8p8xTQbytn/+zraYOjt2IEn23DPi+QMSpf5otN4l8?=
 =?us-ascii?Q?Oa7i0+FerZQvNy6k9CfjZZQ1i2Dm41OElaNq6e4UkxQX/I9zUQagJaKtPOJh?=
 =?us-ascii?Q?jhy9uj6wXHhEB0Z2AIpMJ5ja/1PQ9YHKqA8mU6km77MhZrDlc1SoZ0apaN8K?=
 =?us-ascii?Q?+GrC8WtV7P+iqDSh0o6igNSefgyac5FiUJit+6SbA/yiHIwdyiuuXXDxwKZ+?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e473e72-2be1-4d95-fb71-08ddc8bdaec6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 01:18:36.6144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k55iQr64UJJcBJ4nuemN5fLte7duHfWg1mtEWmlDR23LILJGOUA637r226RhCfaSJhqNX8xRLJG8FZ91YfL+x25FbK/tq60DjU5St0J3bv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
X-Proofpoint-ORIG-GUID: 1gyF_6Bdz3khFZSU-SXlncUl1NpIYGCe
X-Proofpoint-GUID: 1gyF_6Bdz3khFZSU-SXlncUl1NpIYGCe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAwNyBTYWx0ZWRfX4OSY8fx5T7p4
 cGpW3A1YPQxnqBBW+wAmlptUzXiSGxvXoL+XIzdCmavDVMaALQPjI6CHjWAolrz1RVgbUqRhVub
 56uwwdw0S/H0ikvhHD90B4xe72Oyy54aPw2zjx7V8X8esLbBudmqhPFEZfNwXqSTBgozsYUpn0w
 2exdlYLibL6X0YhiUDH6MI+nTIJZ47+00+n0iZcO6M9JIWww3M7/Cwsz9lE951QgKxl2qPrNhjQ
 zOd5ss2kjG6UKA4sUO8UI5SZ7uo6A6R1vTuYqqHFqyRImO0rr+0S1127hPNfqdox8ECZI4zlvAD
 bf1yT5shAgiHAOvlQh+p+xouu0qRefpX1U7L8fieizp1K0HyZ9yJNEpt5P3ISJJD5xA1E1qNmH8
 BvnhiUeg
X-Authority-Analysis: v=2.4 cv=BbrY0qt2 c=1 sm=1 tr=0 ts=687ee6f0 cx=c_pps
 a=Fgaq4Ini+t1GsD4UStUycQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=WfeKMaGTvXcfO1SLQ6AA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 01:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118664

From: Guocai He <guocai.he.cn@windriver.com>

The tarball of version 0.20.0 can not be found on old SRC_URI.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
index c908eab7b3..14b98e6717 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
-SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
+SRC_URI = "https://archive.apache.org/dist/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
            file://0001-thrift-pr2755.patch \
 "
-- 
2.34.1


