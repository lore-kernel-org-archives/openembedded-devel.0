Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C5ED12677
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 10:10:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14529.1730801442429278085
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 02:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1039f3e000=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A55CSBg026785
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Nov 2024 02:10:42 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjjfyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 02:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHbDv3Fj5ys4nyNTh3uVS3uRSFWmEnPUc14pNxk0pUNQbW9boc5IAHQXgVgj1M1pnRekMUAGLpS7CIEL48PNaZlrMYxADitPxcUV6G+yfREIW5AFP+74z9sZfoxhWZzdlB5xMCflthfm0m+Eh4XBv/FhVTuC6KewZDmSLZImWFitWeVj1gVyVkqAl1NZFmCt+DcaNHy0Tw16ZNkk5OxF6Na5aIgPklF1bqjR8rOQV4rSoe+92m5+yI37QvqPWVWsoeUV1q/gcAkwZho0Csccxh9kjeC25UI7q3WwE3QqOsgms2NAoAbKd0NIY4Iyc8H0X0L//BmJ73KjVK/brEWZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTCfnSHkXWadoihGWNHvUTw+IUYpGgt32Dkh/GZBKfg=;
 b=CTYfNfQvn2txbYV71g71Xzj+5BpdAsnMiunJE/rX9etHk1jOMlPkhbk6lzsIOXpIvmug+KmDiyegufdcrHl2Jwxn6IxVl62mCC0pf0S334ytQo/klUg510pTVrPKSJ+QIJNFg9zvVbuE7SfQFRLH9KgVmbNDB1V4olM6BPaOLjc/i6oYZHrfWbABIG+BRQvN+X5/5z4OIvyez9OALUNxurjYXEd2QdJH4cV/hM1uJIqjupN+p5BdMHpSkq4nf44nCcpkhxSGrRdR1YotNW3bTs9LDnMoR8R+r5OIsEtL7P3er6dajbJZWBDVtm/G6Kbr60ViG5VlVmlxAZf9Usl20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 10:10:39 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 10:10:39 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] parallel: Add recipe for GUN Parallel
Date: Tue,  5 Nov 2024 18:10:28 +0800
Message-Id: <20241105101028.2967192-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SJ2PR11MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c38f7d9-123e-4491-01f0-08dcfd82190c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NwIo64Icpol+qmUR0nLX2uxOvfMOonkQYIplKvSEhC5jqj+7zYpMc7SYV8Lb?=
 =?us-ascii?Q?5p/2P+R2t/lk+y2HzLPWp8OzGocJMp0Oe4hnpEfRWenFOJ3unTKVWt4PHWoL?=
 =?us-ascii?Q?hMr7RpEx+PipIunxtidsQurcpmaz0uza53Fdi6IsLLHWCXDbdeRIwyQv2sWg?=
 =?us-ascii?Q?f+fVuPtt1XLEb1s0Q13n4aI546zH34Xb6P9hBvsWC2YoDlfDqFM4z2/07oNg?=
 =?us-ascii?Q?YeoAJe7WUgtv4QJo+98gUzJ0NngVLu4E6ocPQUlhzirvmQ9t3IZaxpll8mLR?=
 =?us-ascii?Q?gHwBably2PQhW7dqrYbQ+wqn5hfZVXa8QctZjEhjyscMuvxxn2H+BTsk8SoP?=
 =?us-ascii?Q?OFFn1mBNfc7PWEmZ1kd26nFg0PzKau9z1yQzJK62FWyX5HZzCWJCyeBOsmbT?=
 =?us-ascii?Q?4CQke64HkwiEs/RMwfEkv6HQEzWQKuK73jeTF7nBURhTCNwOdlS5fO9ILnEO?=
 =?us-ascii?Q?/1pQWSdgDIKC8O+iIqAcNHwxMWFfYVam1wQEIYlWZxfhHRcLEkcrEwQyzkqE?=
 =?us-ascii?Q?85kWPzUZvIoChykyRefbX9AXHna0GyQnZc2LIF8iQTNtSY7zAQU7RSTvnYZ0?=
 =?us-ascii?Q?xgU6S9IfKVh/qdLiuzWavH3C+3vOmsCYQGqCfUbGkrKdVZPEJZwplMddPZ5p?=
 =?us-ascii?Q?KjrnZ81xy7yr0b0PyWDJSGeVeIwY97fOJHloXdE49xKE86lRjPKWG3DerzcZ?=
 =?us-ascii?Q?g5WJ85pdv/Bn2imbbXB418enNfCI12AlLXsohHXK8RlmL5/sn2Z7X53GGTz3?=
 =?us-ascii?Q?VGHFj8XOMHxVJVTcsZwditj+PV1kBrol/ICvvMfTnvb+6C/Ri55LAjVCNbZU?=
 =?us-ascii?Q?sGRDPUgOFwU5n4XHQfODL9CIwdcdkSmstO68XB1hoquy2pJ/nLa/C7+3jJbE?=
 =?us-ascii?Q?rGh0UxB6nH6CCWo1iXY5jnt2nC5c7c+H3vsJZXkwHXl1+24RFNrpjSmF8WIf?=
 =?us-ascii?Q?DXDv/TUg4Jvsk/4kaHkI6dBbjblKWGRJTa3Psk5zRQO2f/k9SjjvM+IpFFxY?=
 =?us-ascii?Q?JUJdJr3NM0rR9LH2n5URlVLo4/L9Rjxu9/pwq9zu4VFteEX75X4dGCJIwVP8?=
 =?us-ascii?Q?YsEgy0NA040TGqmx05TQvSGM7piBJtHWVSWJwCLFTkcyH9sP80Vbh4eLZ4Vi?=
 =?us-ascii?Q?gS7242Pn4VBnzNOxfoPAXbAnpzP6hcGJuxh4DUKX5nGa/4SWqmfJv4V1dc2z?=
 =?us-ascii?Q?gd6+NzFJ56gMbYwT01EQlZEv9UEfYeLDKd/vBWHNq8fN/KKsimKQ6x9OL8Jc?=
 =?us-ascii?Q?HNCxO/UrqWBEQ0wSsIWGtzHasnxm6xLUeZtZYeNL8gFgxJaBt5pgVxODcUSD?=
 =?us-ascii?Q?Ni17ohffXOczNfogQu/ukdVOcgVvofIgoen7OZj3Wf2GC8/94XUIpgdXgy7t?=
 =?us-ascii?Q?LJBW8hpv0PANhrV/zK66HsDGaoDV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NgBnDpo6b8VyxJGwQ8hEynYk5RzwTAfVgQz7LrAPmmMstnUfVvRRr1kW9Cve?=
 =?us-ascii?Q?688Q333n7+2b/BhW2Q+N4bteZaCvcr2n7dpFCXH6jdpkgnx2kufdZJPs8cRY?=
 =?us-ascii?Q?i6MmWWxLfBD294JRpgBZhsrMjbzdy8ysLxCauFAQikE9w3pabmjOSbcgQihG?=
 =?us-ascii?Q?mwT96DxFtju08bKIXTdeXIt5inZO/s5GQPpQBYGrIOmvChLnhARKiUrcVGbd?=
 =?us-ascii?Q?1p9C2vDCxe2cF+Wou1Y189FttHp7YJSq/E8x07NMRy2rMwZFQlytnfvun7IV?=
 =?us-ascii?Q?eo9Yk8Ikjz/o7XBGAHi/wRotPKz9bZLvHEFciDlPTBme5H/8xzoV6RpACGLO?=
 =?us-ascii?Q?A0aoV6UVy5IhMesyMrVfEgasWzDSkzMQI48sBcWLMTCS2ARHOM7hVsU0MoRg?=
 =?us-ascii?Q?L/U7OKDy3EqZTG+OzCiSuyVbReqK86jbvrb4K3851YmLBlBC1wxAuq0FSeFw?=
 =?us-ascii?Q?mvxn09nRRZ2BT2QG0bVDaqrOg4ouRgM66qDopVb9lIj558Nm13AN+ssuqFhg?=
 =?us-ascii?Q?ZqUP2dCrCz2NNn7HdJafvduNDsSAwkgJV+Ocf6VLOQ7odcJbTpPIJNXOHwZa?=
 =?us-ascii?Q?t6cihnbZ4AvRyK7QyQ6wphVpwgLK75Ygm8gL2LCV7Fc9AoWt4/y8pFFe2hJa?=
 =?us-ascii?Q?8ZoIGSeqY+n2t6G903mGtDGDk6BbOngTFFPi9K5DTQc/IujvpS/5qcqxrejJ?=
 =?us-ascii?Q?0Zcpc+R57EAgIxoJ3Irpia3ow5Wh3kK3vD+j8o4Cnaocw18z3ZIQDH0Xamf9?=
 =?us-ascii?Q?hfrZ/GL5aeZ0Qrlu1sCJaDAUD0Ggaz+dOHz8VfRkK6LvtmAkpIFa94nL55uW?=
 =?us-ascii?Q?pWSQSaIzIC5IooooBnN51SfeFwi0wBShmeFz8RhIS/gtMFxl44+ujpImMWf7?=
 =?us-ascii?Q?NLMpUob8eznoPUZrTSGb6lZX94Yzuo9AN4I0YtRnNBmAAYO1mjmE1t6TJV2U?=
 =?us-ascii?Q?I7z5FKhM8bgLjzL8rxuTHTp3CeJprESe/lYUjdTtkhcaSOlqYroLKlXjlgsQ?=
 =?us-ascii?Q?olVeATCqELa+6F5+x9rRlclCQ83FveTlwLfNreKXLr/JP212J1JGSpyYooIQ?=
 =?us-ascii?Q?0f5zVs5oDKXrr5uhp+2lyOieDqbXDY3pQGZcNERDC+Rn5+WJJTS9C/6kPV5b?=
 =?us-ascii?Q?1lD21AjEfgb2oG4yMM8GsmWczN6rBIeQYqZ+L9PiNPEmqa2X1bclAC30z0Px?=
 =?us-ascii?Q?rmZwU46e2/4nn9w7JtDHymSvo9ZgGolIT5+t4E/ILKoP3SidJiNZJWNXdXi/?=
 =?us-ascii?Q?sZs1K9lQy0sZCiOUxejI70+R1hxUNZMhH4FuMs1n7w8GvvcVS09iIb9YtL8X?=
 =?us-ascii?Q?OnurawY9qxbBzuL3lh5wZB7rfXg/4Kvjr10u03cau9+h7pcxh3dKAw3O8FN7?=
 =?us-ascii?Q?OBHiwdQmMTz4l+eOkpRmEqF5zY2k7Tl/RXznOSUDuijgfrD4iuXr0mK1Ia4K?=
 =?us-ascii?Q?8AZUKsI6Cc3cZDRoYA/ifc0gOOqu4850O8h1jC/lViwx+es65uL9dbpuanSd?=
 =?us-ascii?Q?fotoPeD/80eIsXd2+gZvE1gwkxMYI3J/7RBptcelpHInu9vPzi9wqbS/QKbX?=
 =?us-ascii?Q?frDXB8wPUb/csGoKkRF0CMENNRfKcNt0Sm2ODRhddxXQaNUy6JxMzp71yCwe?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c38f7d9-123e-4491-01f0-08dcfd82190c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 10:10:38.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUxINPb5I5+qj3ccpan6YhTh88rUlywfW//OH67cDJWyR2mSZZL64fd6hisMIfCvJwVvrOOcumwLZFc1EamBTSwRju0lcz8hGg68kt0HOZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7546
X-Proofpoint-GUID: Zp_UNKFiQZdeYGynoV_aR1KgoR9B1pZk
X-Authority-Analysis: v=2.4 cv=YvBdRJYX c=1 sm=1 tr=0 ts=6729ef21 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=IJXTklQ-Eef5ha3fy0sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Zp_UNKFiQZdeYGynoV_aR1KgoR9B1pZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_03,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411050077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113416

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This recipe adds the parallel package, a shell tool for executing jobs
in parallel using one or more computers.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../parallel/parallel_20150322.bb             | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-extended/parallel/parallel_20150322.bb

diff --git a/meta-oe/recipes-extended/parallel/parallel_20150322.bb b/meta-oe/recipes-extended/parallel/parallel_20150322.bb
new file mode 100644
index 000000000..e65cb0402
--- /dev/null
+++ b/meta-oe/recipes-extended/parallel/parallel_20150322.bb
@@ -0,0 +1,22 @@
+SUMMARY = "GNU Parallel - A shell tool for executing jobs in parallel using one or more computers"
+DESCRIPTION = "GNU Parallel is a command-line tool for executing jobs in parallel on one or more computers. \
+It allows users to run multiple commands simultaneously, making it easier to process large batches of tasks."
+
+HOMEPAGE = "https://www.gnu.org/software/parallel/"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://ftp.gnu.org/gnu/parallel/parallel-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "2c00799cbbc07a57b4c1411bb9fb787ef2d2f6d1ff491093258baf4fda0a52ff"
+
+inherit autotools
+
+DEPENDS += "perl"
+
+RDEPENDS:${PN} += "perl \
+        perl-module-ipc-open3 \
+        perl-module-getopt-long \
+        perl-module-file-temp \
+        perl-module-filehandle \
+        perl-module-file-glob \
+"
-- 
2.34.1


