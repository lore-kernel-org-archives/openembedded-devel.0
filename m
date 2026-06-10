Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21412CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 11:43:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18309.1781091804871476298
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 04:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jvn6Iz8+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06214a54cb=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ABgkNt932412
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 04:43:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=CZ8biEjwgcnMXBlbRTKJ
	dOlrRDBCDFtPojC8sDFaRX4=; b=jvn6Iz8+/fehB7c7Gvp/HcWf+ZtD/cIH2Uuf
	Om5/o26qA+Eta8bT2ILhvgneBVrcIAlp6VAHp5QTdLoFQgaENGV/LSpz/qg+sXHN
	4CEKcATBTdb5Ii5tA0n7zqA95S89dlBw9FEiaG0T6zH8nSMFghzn4Mk6GxaxYX19
	iRxofV1s0jdUdCWhRORpGnJROzfmaj3KRsyrKWB3rN1e+ixpaibWOjXhMhPgF7Vo
	EJgAsHajzZvtJ8PLvukxDEmWVslM24PT33QL23X8TxwM0U/6IZpTvCIOZo5gurE7
	6U5D9pGrB7SeL+aqeyUNFIzgF5zyMwD/q2qTE2iEuyNUR0/Edw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4epwkb0hsh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 04:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLyQ0QKnc/dcvkY0pQiIbaLl2ughjBFsbfsNytnvrScZt4Nbl/4OBVpQpqSLZ6mZMm60RLxGrdPONpZjEvwVQr+n990Rrg54Zs09b5cdZOuQfdFBzjZex5mZnmc77w6YjfAxVXvzTU9AZXZvE9bva3QtXqeZhgxzCyfvsC5fQKR54VOdWry/wHsNlhx++kDhYRSQNhNnDWuEcBR7HxUPrczYJmQS9Nep15W4CQiFCs3ajH6FnUZ7s187DarfSRGO7WXQUcVtK/rIZcc+LwzOtowntovre2g0IOV+vlCWw9sX9YKVbDmd/iyzPF3BEhvErL7M8h0cBlz+0zMyFa3GUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ8biEjwgcnMXBlbRTKJdOlrRDBCDFtPojC8sDFaRX4=;
 b=tuM+vQYnkBdVuBhZTmJE/H6hvNw5KrRcPBfGMUccW9OYubjXqqTG4L3Bps0DGZtxqz/0++/qieCtKahrdYpPcKmx/KYrAiy9Chna5qNFxJ6aqxNGoPc7+5UCprwtHv9frYZn8CE0x54X4yXYCMc6pOQVex26xRnLXZTpi0q+dxVFEY101VxIQ5gdlW/hrdpL7uF6svcffRADFiYkcjJCBowEZqEWwIng0BihblFFhoe3s4t2AmWqCMFhGVLSfF6TJzjPhKC8wvDeK9lvpWTyjW5SkXpQyOoINs3kBfJpysL5Q9t1Qifjp6I7mjCI1zR5elaYBK6d/ShXIg36NCcBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 10 Jun
 2026 11:43:21 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 11:43:21 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: anuj.mittal@oss.qualcomm.com, openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH] dnsmasq: upgrade 2.92 -> 2.93
Date: Wed, 10 Jun 2026 17:12:53 +0530
Message-Id: <20260610114253.373541-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|DS0PR11MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 709303cb-c4e4-4771-73c0-08dec6e578c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|38350700014|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	hxIjHMDsS77QPT1dFkYwBpgjtlJbpZWGP9iponigki9JlvRxPfi2nliX2r1v1sdmCa9+b7ZEgC45xX22k+RdHXxzWGIPQ2w1iwamvY+tXz+1C5w2cbaewINruAxww1NzjoMVkO/L4wnaOOvqWnVTrSsGQzX1xa3IJ208x3vqBTcrRcCjIxrrxwVA/QB/krdTbIL/KwyHE7ddhGHWtM992XLnOMqN80GyrWhASEDKVuoND7vhLIRwqElFRBULIVXVm8XdyVqMgqFMWcSgwn9+d2kdkjuoJ6CvIaOACUbKUIBEBDtU84/rfqxB0NxTSiS04A2hJxWC6EI7mGLJeROuU22lcq5NQVRrPTrl6c3k4vV9S5y9vQpMf1Y1LmSMXy2g2huukOeb+daL4/RB7OWkx1XwrtuRdynpQKkdxtkjTQJqcJvONfPmFweRIzVIerdNSfM/kBFgq9K+3Kj5RxB+DbcN7lH+H2cGMEyRm73YrzKtNX7YTt+VcvuBLfiJ1XHvfznGZ81cBpLfkfKCfWaye5Sv6s3SADUWPu+BlLHaidUCF7kSAqbLFBRmMNvlbM98LkOVIxKeKD4cexbHIampufj850EK17rqQGTZzzG7ipLAEzgYU8850ifFLs47Glb9G/MC20VSiH2vBVgbWXtJk2rq+JhyIZhbczKVG0jsMSThPcsZ1//0W23Jm7J+q9a4PVjpp7s6IcL57G/76u99hV4aDvy0lMQxKOueJ4lMsjVtenPT2jAw8buCKnL3iEO6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W1qBNCSh14ulAfqjkPlOhnrvD9MCmvYdbGPwVIftxc9+xo01SjKBs5nfChWQ?=
 =?us-ascii?Q?cCM37JepDfM9mKlCycGT1EUhvcZOee6bHp2LYOQyQIBl6jAHCJM48iYhjDdO?=
 =?us-ascii?Q?1bkwjgcOOwqHJK6Pl+fBR9jH3/GLQEXCjv1uAsrVsIuaV1VzOcrRNW5b2iXh?=
 =?us-ascii?Q?COIp71QpPKLb8VqzAiTK2jnR7T4aPSyMmSc/WBGgPkKyZuJEQtfnzod+3Y1s?=
 =?us-ascii?Q?lhwAHngR1thElK7wKVSajQHeYODWPXDQZ+47G4wly/QA2a3B99Vsz32uQRxz?=
 =?us-ascii?Q?zWytPWa/Guv/9OgPTs/AgGeGD4FlZTbmSMeV2Xr3K7GnS4sra2WQPO60WpBU?=
 =?us-ascii?Q?3A6N0AZuBgDx29Ia0VUtRURyP5Om7sXcfjYOOcr07+T3UjSFafM3RyoMDiVZ?=
 =?us-ascii?Q?yOJtx+m061fHQOBMEw7DnVlqiV0kaoRaABWVJTP9FZzksEH0gebdIdjwDQjM?=
 =?us-ascii?Q?/29Y/4MC25XWOqAr6ANKG6dg7jdOkPBmvws0bBPr8eAlTtpOLDu8c04yJBoi?=
 =?us-ascii?Q?BBmv7D8AZnRKfoduMgg7RZA64R4fFcMz9lk78/bSnGwL7jeoo6NVzRIhXAk0?=
 =?us-ascii?Q?Leg9yByaFaMd8sbWyy7OfOygjSbhn9N263/byGumRfr+rvHwR2k7RONghamS?=
 =?us-ascii?Q?VsdQAYvD6HIqF+NYX9fZ4w/ohrCUDj/MHtbXbcXhKBQ8ryGqTJvc3Atfmywx?=
 =?us-ascii?Q?1ToIsJtwjb+Gc4iwJNLGBLjDv9cuqXTw5GdE7wVnlhYMxfSgmR+KTiQrGRLa?=
 =?us-ascii?Q?ZIo8lOhl0QKcuwR4QHTSq0WOqDo2HEQ7GMPcUIRGvfN6jTSgGVUAVa6ySpYA?=
 =?us-ascii?Q?4mXs34Ol6KBkZXTxhZAlyNSwMxTibFelE5t0tjY8CPsu/DEy1Hq1n3l1Sq/I?=
 =?us-ascii?Q?3O3RSkNCPm9zUdE4QIfV/Jyq+i/0FWMkVMth35nV1hgl42aYJjjGlkYGPb0B?=
 =?us-ascii?Q?isTYCAD9QsuuMp61Haa7FYoIkHj6e4ZvrnSNEjo3P19m7bKSHty5E5ZDXhBo?=
 =?us-ascii?Q?u22uUDFe2nMTHuO5NzG6VCCyjcosJWgUn5SrzO+9zLDFVPnZNsa08vuwQjvk?=
 =?us-ascii?Q?Mn+6XTia18niPojDZIdn7LB7tP+aSTTQt/8CblvX+tfxuuxe1JfCJMO3HMj1?=
 =?us-ascii?Q?ofc/WFa4ONLP3XZjmP1dRnvPVSfnW+YqNeYi3bGu5zxQnaNhaVAc1fsOddrq?=
 =?us-ascii?Q?WGPFPxkrkiPNENpQvVtehfPQKXX37sLcnF6kneRABDncr8Mdjy1zS8wRV5FX?=
 =?us-ascii?Q?3DVwGK+vsM+2xCdfzKlP94Xsi+M2G/NbruTjqDg0Z5QhniIpHGMkiZpo7ZhL?=
 =?us-ascii?Q?Lam4ZK10EgSVuAogiHwxEd2WoeU4DYGG6drBKHFI7J3JJdr6Iq9Etrfj6MSh?=
 =?us-ascii?Q?WOmtMIZaHSb7o3tWh7bC4t7cuhxY165QshimCb0buIVvhbIN1LErFWGEiNWu?=
 =?us-ascii?Q?yWzGR/5TJN02vRz8vgQ+wk/O/sScJjn50TMUbpfD9mjlLdjotxUt/jnQ/W9S?=
 =?us-ascii?Q?bYMlR7OKZ1MkD6JTHoGFizzY1Kwfmx415Ou903dIrUJKte1LCsV35gRiEyga?=
 =?us-ascii?Q?oH29/eAyEn7b6v0r5n+4Ks4M/22+E5RLVPc2CxOe7nXVQZIiHd5HGsDySMYS?=
 =?us-ascii?Q?X2JpXC6jgIUZQex5v8P1BwnmaqCrA4v/B9On88kH8acOVYuE8a5ojwUmHlzX?=
 =?us-ascii?Q?ix4CRPUmcBNAWD3MJ6x8LLgJRmaZn1c4aiyh4U5Jbip/HOWAEhZMpVLnRXg2?=
 =?us-ascii?Q?jsNV9n6Bl6QFXvHPx8L6Ha/ErDLoR2MFRcGVMf12HEIHdeJCDmhe?=
X-Exchange-RoutingPolicyChecked: 
	CKr0fURtKv9T78y3MqmMXwggF9cPNadt4n3fJoQJfvtSnz0kxr+RmWsOCNGT98FRmJm8sQNjxINpk7bLxXEf/LX5OLcSDdAplbPFKqSmkCJpXGPyWOGCkZ5Qp0gq9x5D7SIoLZdHDzPvAkZO+p2GGD0lXK4mytoC6PP/axvdeOP5z95uS4O3Mx26+GM+VOIyNGehig28L+gzl8qLiGCGVmvCQJ8F/jnHh2MjzW1Ge/1z9WpWRhKvFtzuv+99ZXyRqmeRqVH6DCszmZLMVxdxwBo3i6fyPKk+S2Q4s1f88qvocQKj0LW9FB1+pa8fKthk8VIcEr9JPzgWGlTN5WmJNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709303cb-c4e4-4771-73c0-08dec6e578c9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:43:21.1875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzYqbfPN2LjmQ34dWuT9VJq/YopowC9WpUXyi0UPsjr1if7HpxdIbm/uZ9TmP3hnDTBmOfJS8WBZ5mH8S0PYXj6DiEpAOKDdYolpppXJr7R2F2TGakRXWrRXVVC22sVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExMSBTYWx0ZWRfXzLq9LDV+f2u7
 WuqdbPnXLLVpnvRNJZqlDbvco7tx1piI8tJRi8VsGk9C0b0ZLh8W4Xe+YCEGcQGwjqOh7NUMxJb
 /q2fVpv1F6/xNpgYmRA03oOqMBpvuR5JiF/BXCYKjjVzFyZdOCQyqYa/Mh4ACp905q1+C/LUNP+
 MlR0O4joee1+1DbwmwYKklCFaPXDnE8iMkfbdn4g1rl36AiDNBMqayUXgU03uCU2O3hACbFP9Az
 onn6DXlPhrZx25P7ox+C7VcxQZsCFVjha7L5cAVSz8iv4cgQZOICCaFEqP4Pk+LGZSuIVMc6W0A
 klaYUkGyqWcmihJ262PJ6/ig4nm8jVjGw/QSIZ/TqnL6nrdACJkvRDHtS86lhGklHcwkBdYWr5Z
 a+0+QHyUtr7rgdobv5TDDmTCW1Ws03b4HgoJm3iuQVQmVxXvvuStwtO8f0Nifozq07+KpjrmND2
 1VwBUwZXe4vgy4qoMtw==
X-Proofpoint-GUID: kicUZAgG0Lk-6fSEAIrN8zs2jyQ2_KDN
X-Proofpoint-ORIG-GUID: vobO2ayuxmZKgDPzFRnPNERjiHgEZuXI
X-Authority-Analysis: v=2.4 cv=afhRWxot c=1 sm=1 tr=0 ts=6a294ddc cx=c_pps
 a=OoozJeX7xWErQ10rRJiRjg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=omqxvBYPAAAA:8
 a=t7CeM3EgAAAA:8 a=VBowi81kAAAA:8 a=DaCLV3CO8siUEBp3gGsA:9
 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 11:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127515

- Update package checksum
- Remove obsolete upstreamed patches
- Verify successful build and runtime functionality

Include upstream security fixes:
- CVE-2026-2291
- CVE-2026-4890

Remove following patches as fixes are now included upstream:
- CVE-2026-4891
- CVE-2026-4892
- CVE-2026-4893
- CVE-2026-5172

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../{dnsmasq_2.92.bb => dnsmasq_2.93.bb}      |  6 +--
 .../dnsmasq/files/CVE-2026-4891.patch         | 40 -------------------
 .../dnsmasq/files/CVE-2026-4892.patch         | 36 -----------------
 .../dnsmasq/files/CVE-2026-4893.patch         | 34 ----------------
 .../dnsmasq/files/CVE-2026-5172.patch         | 34 ----------------
 5 files changed, 1 insertion(+), 149 deletions(-)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.92.bb => dnsmasq_2.93.bb} (95%)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
similarity index 95%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
index 37a89abed5..765287018b 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
@@ -15,12 +15,8 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
-           file://CVE-2026-4891.patch \
-           file://CVE-2026-4892.patch \
-           file://CVE-2026-4893.patch \
-           file://CVE-2026-5172.patch \
 "
-SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
+SRC_URI[sha256sum] = "cc967771abdafeb43d10db18932d6b59fd4bed2c69c22acf8cb96aff6920d55f"
 
 inherit pkgconfig update-rc.d systemd
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
deleted file mode 100644
index e721f5ec0b..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-commit 2cacea42e4d45717bd0ce3ccfe8e78960245e5da
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Wed Mar 25 23:04:08 2026 +0000
-
-Verify rdlen field in RRSIG packets. CVE-2026-4891
-    
-Bug report from Royce M <royce@xchglabs.com>
-    
-This avoids crafted packets which give a value for rdlen _less_
-then the space taken up by the fixed data and the signer's name
-and engender a negative calculated length for the signature.
-
-CVE: CVE-2026-4891
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=788b4e0f6c05217981b512bed4e5fea6f8855d01 ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/dnssec.c b/src/dnssec.c
-index 0860daa..4bb0495 100644
---- a/src/dnssec.c
-+++ b/src/dnssec.c
-@@ -546,10 +546,14 @@ static int validate_rrset(time_t now, struct dns_header *header, size_t plen, in
- 
- 	   *ttl_out = ttl;
- 	 }
--       
-+
-+      /* Don't trust rdlen not to be too small and give us a negative sig_len
-+	 It has already been checked that it doesn't run us off the end
-+	 of the packet. */
-+      if ((sig_len = rdlen - (p - psav)) <= 0)
-+	return STAT_BOGUS;
-+
-       sig = p;
--      sig_len = rdlen - (p - psav);
--              
-       nsigttl = htonl(orig_ttl);
-       
-       hash->update(ctx, 18, psav);
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
deleted file mode 100644
index 01637601a3..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-commit 011a36c51438c986535a7248ed2e7f424f8e1078
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Wed Mar 25 23:16:35 2026 +0000
-
-Fix buffer overflow in helper.c with large CLIDs. CVE-2026-4892
-    
-Bug reported bt Royce M <royce@xchglabs.com>
-    
-Location: helper.c:265-270
-DHCPv6 CLIDs can be up to 65535 bytes. When --dhcp-script is configured,
-the helper hex-encodes raw CLID bytes via sprintf("%.2x") into daemon->packet (5131 bytes).
-A 1000-byte CLID writes ~3000 bytes. The helper process retains root privileges.
-    
-Note: log6_packet() correctly caps CLID to 100 bytes for logging, but the helper code path was missed.
-
-CVE: CVE-2026-4892
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=10e6b5b83e80749cba7b090d7780b29f908f0571 ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/helper.c b/src/helper.c
-index 72f81fe..2c12801 100644
---- a/src/helper.c
-+++ b/src/helper.c
-@@ -261,8 +261,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
- 		      data.hostname_len + data.ed_len + data.clid_len, RW_READ))
- 	continue;
- 
--      /* CLID into packet */
--      for (p = daemon->packet, i = 0; i < data.clid_len; i++)
-+      /* CLID into packet: limit to 100 bytes to avoid overflowing buffer. */
-+      for (p = daemon->packet, i = 0; i < data.clid_len && i < 100; i++)
- 	{
- 	  p += sprintf(p, "%.2x", buf[i]);
- 	  if (i != data.clid_len - 1) 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
deleted file mode 100644
index af7e4119e1..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-commit 434d68f2eb1a58744470698483a3ae09b5a9a870
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Wed Mar 25 23:22:37 2026 +0000
-
-Fix broken client subnet validation. CVE-2026-4893
-    
-Bug report from Royce M <royce@xchglabs.com>
-    
-Location: forward.c:713, edns0.c:421
-    
-With --add-subnet enabled, process_reply() passes the OPT record
-length (~23 bytes) instead of the packet length to check_source().
-All internal bounds checks fail, and the function always returns 1.
-ECS source validation per RFC 7871 Section 9.2 is completely bypassed.
-
-CVE: CVE-2026-4893
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=e3a26d092e47bf1d18aeadb758e4ca35c83b5f2d ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/forward.c b/src/forward.c
-index e2f64c0..208480d 100644
---- a/src/forward.c
-+++ b/src/forward.c
-@@ -724,7 +724,7 @@ static size_t process_reply(struct dns_header *header, time_t now, struct server
-       /* Get extended RCODE. */
-       rcode |= sizep[2] << 4;
-       
--      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, plen, pheader, query_source))
-+      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, n, pheader, query_source))
- 	{
- 	  my_syslog(LOG_WARNING, _("discarding DNS reply: subnet option mismatch"));
- 	  return 0;
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
deleted file mode 100644
index ce6e0f464b..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-commit fa3c8ddef6712b52f562813317e6a997e1210123
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Mon Mar 30 16:24:33 2026 +0100
-
-Fix buffer overflow vulnerability in extract_addresses() CVE-2026-5172
-    
-Thanks to Hugo Martinez Ray for spotting this.
-    
-The value of rdlen for an RR can be a lie, allowing the
-call to extract_name() at rfc1025.c:952 to advance the value of p1
-past the calculated end of the record. The makes the calculation
-of bytes remaining in the RR underflow to a huge number and results
-in a massive heap OOB read and certain crash.
-
-CVE: CVE-2026-5172
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=073082ddc0aba7b8efa15a688d6183463b65effa ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/rfc1035.c b/src/rfc1035.c
-index f0e1082..7e05fb5 100644
---- a/src/rfc1035.c
-+++ b/src/rfc1035.c
-@@ -943,7 +943,8 @@ int extract_addresses(struct dns_header *header, size_t qlen, char *name, time_t
- 			      /* Name, extract it then re-encode. */
- 			      int len;
- 			      
--			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, 0))
-+			      /* rdlen may lie, and extract_name() advances p1 past where it says the record ends. */
-+			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, 0) || (p1 > endrr))
- 				{
- 				  blockdata_free(addr.rrblock.rrdata);
- 				  return 2;
-- 
2.40.0


