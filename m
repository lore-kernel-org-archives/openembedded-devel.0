Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9E8D31A06
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 02:43:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2170.1768358612267636388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 18:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SauARN5n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5474b6bc00=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DMpSgI518362
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 18:43:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=L/b39xbsekpoJi8B1con
	0vhVKisybWJXCtJfjCPZV+A=; b=SauARN5nhGaqcVLBz4j4hqsP6jYZPuwqhTMa
	hJom5wsmtwGS+FSL3nFD5vrOBomPEBY07j9YgJ0gRh57hYqre9bZOB28bkJ0jZzO
	ZoXpfWE+WpQIDrnRI1dCpxBr1bROCB6duvszdOdnSkbH/jSy7TnDNfnybdxLlJmW
	hAdP04H/+OTKam+TDa1go3oSxV+a25kCCcuikjaskA+Z04r1YlJ/p2lGuyjU7CQU
	hhDhgxmxa9F6fRpLdbKw1vbHdztaxFjFUE0G7iNKsqyIBFcg2QNfQoNVSmINoyMl
	JXdunOOt0GyPKm45j1t2vrqkhBGubRt8WnUaOEy84chVBw7ELw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5funt0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 18:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpePZ/qlXpHcSPkR1ePjtDwTQ/MRIuKisAhRwlDs+ILuYtn8xU9jenZT2GwK/ldpnLg3Dpumrp0u4GRqoutp9qRLnHoq+YZu1bxMnhEqquJg+brIm7rqc8wtn3vMiO63s3DwpIOZ7FvQFWOkeraxE5lb4nN4nE28uU52tHSMTnKtTqnuxpsfb/VwTKQEj2qbY6up4Q33T3a0xaYD9KYQJgzeK54WDS8JrPcTW1TFlbgTtmp9UbFConOLxl4zDET/DkzTEwgDinBd1m30OgfLLUH+MDB8DQcClYGyshuRfyJDlriP7dzl2QSKPBut3vqA+enqupdtZrsjPan/uHDi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/b39xbsekpoJi8B1con0vhVKisybWJXCtJfjCPZV+A=;
 b=SiLBgy+7Q7MW6rr9eHrf5iTDS+NptwTGVFmvXg3TQqRWfnCTW1iy8qa32NXW/Wom7fyxDLsvem/5xaQi6pVDUPbruh5oWmYfTgwRs2Ftv2klqgMxQuLXH3FUg3Ds7ha1yu7ZGmxx+GmrcXN2svSbJD9T8oPsbVPKIBFqG+g57erNzo6P62NfCSqPAVFl2nVIAm670c1p0McdqaYrA/6ll0nXmcQOGwqE1sRLJ71idMVgYDO52fPhxJdKlpQNbetVCgcpbSphK6qxI8d/MSo0Z6Fl/L78RIvN9sZunOw0SYzWUfO62Vfw42xeaRORG8SVVFQCRnBDN9zFepx/uXgnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 02:43:28 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 02:43:28 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][krikstone][PATCH 1/2 v2] python3-django: Fix undefined _lazy_re_compile
Date: Wed, 14 Jan 2026 10:43:11 +0800
Message-Id: <20260114024312.1180159-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0d86d1-25d7-47f0-4811-08de5316b2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HyIJO1JxwA0R8WnkftWd+utSBYdQvGNhxZ5uqtbynj4fxhhsCC2kDH9NcMLi?=
 =?us-ascii?Q?VsUHLGjD1THnvwIzTAk8KMr+sxXrrOeBKoWyWh7dPZhNqlf1oCAOyWQpLJ9X?=
 =?us-ascii?Q?TT5U+gxuCjkcN+CwuMp35qB6R2nztCiNwW6whvs1ERuf067D8iWO8mmZBzlY?=
 =?us-ascii?Q?CVWj7prJL8BAx28dAu7fpxGz4/Pk9XufPgWVShoHBAcQbDzo8K92EM2Wktay?=
 =?us-ascii?Q?B680HhGZhAda4ndGfwMoSjK9eJcivlWezLchb771YE8tAIxz4tWjMwaIFxfY?=
 =?us-ascii?Q?tmgigfEQiFcpVtfObPzxBFOhAb7Eblf5fu6HZitRzTnNUI6HN88C42aW/2Cp?=
 =?us-ascii?Q?WM0o8+eR35bbKGmCIdCcI++pv5UUA8QXcQUBk+W0b2gdWHGfbg92OEyyj8gF?=
 =?us-ascii?Q?WDeaCSs1g8PUYGbeWCAmNIdpfSNM4kcNhrq3qb0/RGPpgufjbojINwWujh93?=
 =?us-ascii?Q?v76N/Wo5CYt8zpR6NO66iYQ8XHZL8GKltCiBBG+SUJrnXzTy6RFYALxc4LHJ?=
 =?us-ascii?Q?O6NEGwCjSsyquy1Fj/TZ0P2iqeTtLgFJSMADX81VpQQYzJ9tgRea5/qfxG0b?=
 =?us-ascii?Q?rOiMTZZS9CnpeSJQlPQ3we+CsvK5MnipiuDz+7Qcy1ZM0Fhfno0mPESDvV3u?=
 =?us-ascii?Q?LmQ0oVuCITVW/aj1nNijazuwFVBPcX4CBziv2c3noI5w5cNcup5MJ7E7+dWW?=
 =?us-ascii?Q?EgdSwR3HbqXGz/nR7okRLsfKVfWCDDe+kBHK3I2q2f5u8AR9Aj8YJro+28KP?=
 =?us-ascii?Q?/iuh20P4BIICFTT5vcVWqWwqEDGmFGlB5Kiq4JUxXi4j4kgaY2wvH9zHm3YY?=
 =?us-ascii?Q?V0TjV0HYrEdIX1MeMEMIxZyL9Fflk1owxnnI9Qr0s3QDYjQVQ2RRHGN3QsxZ?=
 =?us-ascii?Q?EPlgRwEMMZDXAKMWf/Ks8VMa/rTr+cmMEFnDrc2Id9pmlUClp3P+TomseS2A?=
 =?us-ascii?Q?ddc5abs+konnEeqHvVU3BzzkmBPqNW2ymRmA2/fB1Rjurcv9oUadEUc4lfk6?=
 =?us-ascii?Q?nYdd/s9MJzVmXFVgBEYWLB7/0OGsC30mkVDIqeFNuyfaKyiDiUP75BPHY52g?=
 =?us-ascii?Q?wrhD8wUG0cQicqUBI2vG5ebFrSwcP3EdjjkCy9X6FFuZUTgorL1f04lrMRzt?=
 =?us-ascii?Q?r4C0diWFuJWxru843U0rKtIQxE5omPUc+eib1V8cm6XcUm+N5pFeF6H/QCNx?=
 =?us-ascii?Q?hX86Av8IOyaa3r7EeSZXbO10BjL4bIqCiliw32nsb0UhnqWn0eEtDdM6k7yl?=
 =?us-ascii?Q?VlA/bFiWslH1G8YPdXgh/dnupjgHp6FLPJIZhh1a/WqBsyiOPvW6GtvOCH45?=
 =?us-ascii?Q?FRX3J9tzuKiTbajffzoDgcSBGHLPsW4sDBvCkmam4y8yP0xwA8ZagClYj46n?=
 =?us-ascii?Q?uXTcceFoV1wg3o0J1m2tEPT7bTuqCTiK2GCQqTewfVI3LqJ47nWZmNNJsUzC?=
 =?us-ascii?Q?oN16BwQopahMqcU/C8HHlmgw7oUYUegeN7FEuRPMboA34mrIlOICimwWizMq?=
 =?us-ascii?Q?OY+FEnWksL1t365I0co2gzEKZ7YUjdrtzTTd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M0NhNlvGbIeKmbFp6k6x50ONB/taTK7JkMcOORVFGLvyt0XRiVkHb1gt7RoK?=
 =?us-ascii?Q?lYu+Q3NrWrxc6XsxNPWFDzJCxMjrme/7LBOhIHWHogXmeF8Fw50kNxC83phL?=
 =?us-ascii?Q?sw63AattN+Br+Y4sseSZ3TCGnB02ENc2CryB0DFkvFo08tp1GTBfk3HcwTDA?=
 =?us-ascii?Q?35TN12ocB3sYf5AakPgbrR0JX1+xsOXTxgZ7fhV/pPeOiaGtx8n210fhCDyb?=
 =?us-ascii?Q?/XGh7Z937wUYeMPeq1xEljsZ2zGJUaz4NnGxQOSKhRUWvoA+IcV/C5D46opJ?=
 =?us-ascii?Q?0x5cPJKOAPMKLfZD9m8accLdzjetXCh/O0Ny4EZoDN6PLZLvSiW5OwRjQ2bU?=
 =?us-ascii?Q?hK44No2PggTky01F6TuM7oZNjDfu57l+ljshLpwomITaRiCzsWk0hJxZh6He?=
 =?us-ascii?Q?CSc/2I1LaGlBYPrqXxZ2RuPVXPWDT1nXWybSarbIB54+vbW8KCtUND18AyZv?=
 =?us-ascii?Q?fS/xZPq7fnNfPFyFjKTtmOg3KewrvwFqWokYJTeRdaH9gqmC2VJzBbuHBa1G?=
 =?us-ascii?Q?XNW4JE9Zsj/UAMuqiYvaWVvi/ZX8ax4NnXYr6ZXuBJRG5ZvjA1xVPYdBcddX?=
 =?us-ascii?Q?CINR5Sfsaz301Mq7VS60TsXNZYW6xBJ0Fv3LRE8stDriUchNyheJVjoQ72Al?=
 =?us-ascii?Q?Ab+fddmPqfr07BIiYdPdUA5DlDmUBwISVp2tJVRoGkeOpW/ZLd4EePVmy0ju?=
 =?us-ascii?Q?Kh6Klk7mXZjEa5WE69gHYTjcFz1N6GueDkvh+17OrSEFOUaUrWE1p3aTW7Gd?=
 =?us-ascii?Q?9dNsE1sVqYf6XzQLC8Rct8Xt9n8EBYNNk3ioaphX19dIZiWvo6E5MszASAGr?=
 =?us-ascii?Q?fJoY0MIDoUzTvRhJ1jFzy1lgRp2LWhur3BebAWOGOQzAf2xh+DmtZYQ/GkWQ?=
 =?us-ascii?Q?kYx82OpJk/2EVhCedfcSI4f16W51DerZlpJ74E2ZDTCIAuqYWTlDLddFKzLb?=
 =?us-ascii?Q?B0atvzMkwPGHGwZarVAOD6zpmwj813+Qq36xM4e3tgCQNCbmBvvSSNU8L97o?=
 =?us-ascii?Q?QniMZaQgczjxUKDuDP1uyIHpKszRx6hRR8ClKOHN7AvHzgXN2FBNhs4fYZKD?=
 =?us-ascii?Q?i+QP6WznbiqovHfQuYMctCNu3hsq61rsAyyE8rxN3eh1IkvqQQWaDXVJkXXp?=
 =?us-ascii?Q?5pMJ8ivsszsucxL+1dxtOKL0we0YR9HtypwfJOUHjDeB2ELD+G/RLa8HrXhW?=
 =?us-ascii?Q?ETR5EavhfRtCrmh91d3Ugzb9305jK+jhFhG/RZ3+lgZWrJc2HBHDjmnY9QT5?=
 =?us-ascii?Q?Udyhvc3Ch09oMAszbQhyPM0vj/AzULE+uFabHqY+415VcwxNVcQQj+vhfJYX?=
 =?us-ascii?Q?6GNDiLwFxX+fvjKmmN4psL4R1nnxsqN+J4FPmePd4THVKwkNq6Oavr28HPq4?=
 =?us-ascii?Q?hHWgFyUYSfw/HTiGeWv1UF6n8IWq8BGpoEGg18y3lccO4Mw6qfr5zS/d7l4P?=
 =?us-ascii?Q?tr2WBVO6/ozyEjE9mAl82MZkQtFwiiVLNvAB32J2T7IzNm3EgfQRp0z8KKuj?=
 =?us-ascii?Q?PcBWF3fzVrucoLrrpXM44zeEnEhTX5DO97ZJHWOEE9VkSxDGZyp0jc/UidvE?=
 =?us-ascii?Q?K8t9gn5gSVNTL9amwmT7bzovZVuA6JquyDIJ1emF3BXuivmMHyIVzyx+GQg4?=
 =?us-ascii?Q?z09RQSt9henxGZqpTLgj+hm0QeBBbxYGwychHZ/Rx81atmy44bB/iIB8HMZX?=
 =?us-ascii?Q?1kCyMR18wxHj7sth4EzDRngWox8w9AMJ8KQ9Vqy1NR3xD+YvCDXNUVw/LwIs?=
 =?us-ascii?Q?FHIIryofUAKofRt4tz5VWgknn1yYUqo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0d86d1-25d7-47f0-4811-08de5316b2a6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 02:43:28.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glTrKeDzq/Lwbgo4Adv0Gx/kdt+7Yg5/2KJj2jDIRdGSF7ZyFMQHSnsjzVFztDfm8DnKB+/vQ0mgFHfPPBo9lQx1VpREyGll+GZQH8SWowc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=696702d3 cx=c_pps
 a=j0PM1b0aAxJgDjDzr34Dzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=8uAe-gtA59Rue9El2esA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxOSBTYWx0ZWRfXx9v1x060IuTY
 +IsZfCYjGhAW5xqvA8xZF/lFm0E6BzN9n8U3y6dJU0vJxSY+H5odJauolsUjkliJtrIOuZucNaQ
 UqlUwy7L1Q9yxr2VR11XISrnHvJ+IHfL3IHdsxKsiT0jFO+ppf0ZVA8ryJ/yZQhu7VSBMwo1rUF
 gK0+kEPumC/tDiPneOjwQKgFv0arnF1JAV8xfX5ceys7sqMaZnbMnRPeFKkXYlNCFH/HNAYiXF3
 +cRXfV4vPYWCgmjd9M09XCfCvAMmaajeTobptV+xxdGbBx+t0VgKSL6Vn+LI5Pt9+LJiXsRZp+W
 9LIRgP2P5QcyJZD4G+ry4agK9nkjjETWIkWpW9KE+EdIzUuOeb6Z/RDNYNklYQjupMuVMcP1jmC
 GEWwVfVuKd33gdrxajRxPc3bfXxPJhBUYySNePIRWa409cW2KE43c5k6vyIuNoN/efcU+PyCXFi
 aqBE0d5jDHcibx6DxwQ==
X-Proofpoint-ORIG-GUID: 4DdZNImR2qBJDMI2bhD5qQ__zjp3YDUU
X-Proofpoint-GUID: 4DdZNImR2qBJDMI2bhD5qQ__zjp3YDUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 02:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123443

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix the following error introduced by CVE-2024-27351.patch and
CVE-2025-32873.patch:

NameError: name '_lazy_re_compile' is not defined

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v2: update patch Upstream-Status 

 .../Fix-undefined-_lazy_re_compile.patch      | 49 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch b/meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch
new file mode 100644
index 000000000000..226aaea07a84
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch
@@ -0,0 +1,49 @@
+From f89fec5d58bc1684478fe23c29a34f17ca529b1a Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Tue, 13 Jan 2026 14:14:02 +0800
+Subject: [PATCH] python3-django: Fix undefined _lazy_re_compile
+
+Fix the following error introduced by CVE-2024-27351.patch and
+CVE-2025-32873.patch:
+
+NameError: name '_lazy_re_compile' is not defined
+
+Upstream-Status: Inappropriate [Fix the regression in the previous fix for CVE-2024-27351 and CVE-2025-32873]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/utils/html.py | 2 +-
+ django/utils/text.py | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 858a517d92f8..6eb8bc3dbf38 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -38,7 +38,7 @@ _html_escapes = {
+ }
+ 
+ # HTML tag that opens but has no closing ">" after 1k+ chars.
+-long_open_tag_without_closing_re = _lazy_re_compile(r"<[a-zA-Z][^>]{1000,}")
++long_open_tag_without_closing_re = re.compile(r"<[a-zA-Z][^>]{1000,}")
+ 
+ 
+ @keep_lazy(str, SafeText)
+diff --git a/django/utils/text.py b/django/utils/text.py
+index c474d5681eeb..e104b60c4f6c 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -27,8 +27,8 @@ def capfirst(x):
+ # text with only open brackets "<<<...". The class below provides the services
+ # and correct answers for the use cases, but in these edge cases does it much
+ # faster.
+-re_notag = _lazy_re_compile(r"([^<>\s]+)", re.S)
+-re_prt = _lazy_re_compile(r"<|([^<>\s]+)", re.S)
++re_notag = re.compile(r"([^<>\s]+)", re.S)
++re_prt = re.compile(r"<|([^<>\s]+)", re.S)
+ 
+ 
+ class WordsRegex:
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 24b86a3e262b..f2bb1de4f247 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-39330.patch \
             file://CVE-2025-32873.patch \
             file://CVE-2025-64459.patch \
+            file://Fix-undefined-_lazy_re_compile.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.34.1


