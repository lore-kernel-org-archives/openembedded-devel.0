Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61725CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:43:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8976.1755593008852172741
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0326228341=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57J5Q286673023
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 08:43:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48jgy6apjd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 08:43:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9otHQDlWzw7Gis8YtoCWRhDieRxCY9jF01NrbWWRd+4y9zjtUR2X4Obi1dvfkIbUqnBMAxUtgY7w6pzHYWBOLAAZuNocAzdbKa1kNHTj22T2zxF6b4nm05IFY/O6ONRiAG3RKyUyEU95Th5/2TjBcGb9Pg/Qe60rOMm9K1V8iiqIstn3HDx/xK2vq7yIDi4YD2l2zjc6Q+eltg63ht9AUnr662rEpHXfy8PsJ7I0jTNJmGXbComjNb9KPBeHNh0AQXQrgRTlwY5rIF7yvo3FarsB88jW9zJFM80QvfF89T4062mqXJpc4tjiGPoXLVwVslgG5gsHXPN051AKioG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWY1sDOl/eYB3frx9m6Dl+eq5xIfwW69klwoK4brVgA=;
 b=Qm1LL7LGJpH50/O3S8/f0GIFosmok5nLG7zXqdyif0QU8pQCXBvBThZHKzCPjRMeE5ocW4X3LRtLr+Q3mHzuvD+mpQp0QX4FmqMCgBo6WxPIlkOXUK1t3J496QWelHYgqL0P5TvWXWz2R6m6E+idADpBZTWgS+a38mDusNxlbfIDRQ/0rVeeqEt0plL4fmhCfdlTOEeKU/5xBVCEo4aN7XjdFLBtg0N9p6jynoPsjQUWG5PzgXT6EnBfx03Ff6vqpoPalapePPO1Ar0yfKAm5O9KkAzNaol7gq+X4+SZxJWxTqve2yc6m0/SslFvDnrsk0E5jODFK3PQIclpAA8x9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 08:43:24 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9031.024; Tue, 19 Aug 2025
 08:43:23 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][scarthgap][PATCH 1/1] python3-posix-ipc: upgrade 1.2.0 -> 1.3.0
Date: Tue, 19 Aug 2025 16:43:05 +0800
Message-Id: <20250819084305.344778-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=y
X-ClientProxiedBy: TYWPR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::21) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: a82e2d7a-4648-4f1a-34cb-08dddefc7521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V0eqodeLUVjVoE0PqamMsV92a+IDqttRMxfov+q5EL8cX5VJsCRRd1i8ng8i?=
 =?us-ascii?Q?qYGSXJ49ECw8FKvC+84O9uI5lqZgy3dqafnR59JVEU/priaivcpKL8Ebsxty?=
 =?us-ascii?Q?lOXUuk0qxLFKh34ElGyGhjj0o9ywQsFhHUShN5SFIRhEpuG4+4kveoigvc7w?=
 =?us-ascii?Q?wdvTULG0DF9bbZOaKm9gN1FZmAxUNUlUeY7Qap4PhllEBCpdvTn5ZXuk2JTv?=
 =?us-ascii?Q?u1DNhEdkrjQCv9Xo4MhcY/geSA5tLC8Cf2DlpJUxxD1sEnYwdCt/pxNxeCwL?=
 =?us-ascii?Q?H1GiiEaN1Qr4ZXs9WuEhmKqaUrQZhuWIEmHOA5syTzAplNWfO8e/dqxiuze1?=
 =?us-ascii?Q?y8d7hq63bcZxve0Zb0PYZTej9emFwB5NFDlfd+ILLj2OI7XUTeGrqRQ3xZkC?=
 =?us-ascii?Q?I4EBqQ7H5Zv6AkENBtt20yjkOtTWxTKZV1DuRscUS96x0uCGz+aBE46dG24f?=
 =?us-ascii?Q?M5/8dVs3EMobpvojwkJWN8qS1fCWqIbA1VyYkJyIdoa8weex35z6BD8F6C0C?=
 =?us-ascii?Q?TJhO2er23YSlNSW3+gB1SOxDzt9bH5STM83J2IFLv1MzjARYsinHIw3Q9ssG?=
 =?us-ascii?Q?ptYsAMLFEVlftrNDRxQmf6cJQLkLqez5SAL94KTQqd3VEkaEWOrpwh8Qq7D7?=
 =?us-ascii?Q?ZSiCs1QyASmkddOe5rIaXtgScdllVNOCjQiMKPbDn3uWkUT8dIt3wQT7MnsQ?=
 =?us-ascii?Q?gkQI89B2NdNNueqv/kK2XA9oegrWoVE5ow73IFu1Z3W5LXoG1Dn/Xd7IpvJE?=
 =?us-ascii?Q?GzcaDJ1ysBUdVbL7t+NMZS84TM9nsut91c1KdCFQQgjmxLOaH39s8zhUPgpk?=
 =?us-ascii?Q?7UAtUNsMeINWISxHFmON3BY6degdIEs/MztFq87Dw8MxjauOI9hsLU9Ucpb7?=
 =?us-ascii?Q?wH3NqTL4/UGIeUX0P4BucVxEDYAfQGAf2WjMlTU1iApORONQBLT94FmHW+6v?=
 =?us-ascii?Q?XmH4LG+0gX0m4JySpJIsIrZ1A7x3+EooSbRwTuj/HeIjO4RuxudrhtnzXko+?=
 =?us-ascii?Q?N5DKcals9Be3zuJYUiCwDBcFCXzAbvudyFBQ1VT7TP1uR3i8PkkzP6OSQmxK?=
 =?us-ascii?Q?nsGx8zh1gXXwU74+wCD8Mm2+4AZJ1Ax+FuprDSZ/GvZag9PRv6jJZ2P8h4W3?=
 =?us-ascii?Q?OSM2UwT37mTtRJrdQxzDe5afFd42FMvM9pQq8nvP2O45BqcxP56J+AzWTpQi?=
 =?us-ascii?Q?Twr5bvcNd+m9dSn8GxtYY+r2Eabvkt1AmDpRqUXkMVNVomkqW7s4WykcS5Pm?=
 =?us-ascii?Q?Tdh1AUXLVYKP6LnzlxyJmbdSTF2YWQFrVAT5KSoBrk9AkKn12ODzCgPpki2S?=
 =?us-ascii?Q?Eb/5zmcgUEn566ZPIox1Zo1fh/4+SiK6sylsDTbjJHZFBnXzgvjJ3sShYQey?=
 =?us-ascii?Q?sxLaA2s3QIz7EIiMtDgxkLiN5BaM8F6ypYgUMCVXUsvZWkaAlzj8q3YZi1q2?=
 =?us-ascii?Q?45d44IjDkskhQo4VehoeIrf6Yqz3XRLw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8Z0sAvNxZBApR7gOdtiUWkXzU01uXdwGSLUv/mFajzt8MKPM6LtrlqYsl7i/?=
 =?us-ascii?Q?SNJzWgc5GSuLbQw/egvd5u/jgK5ewjw0dlaOwh3dqLFfSLRfsUkq8LcCBhSN?=
 =?us-ascii?Q?aQ4fspftPdzNW9CTJaxq8SEyg7TJO7iSuoJbi1nVsnu92Aq46UxztBIqicnP?=
 =?us-ascii?Q?6MehOqTdUIYfwQBPFL/o1Wm1GMPcWYwhCnNT0726qNX0DiDmOJXXPoQFuFOe?=
 =?us-ascii?Q?avnqbwM5ROt4fkjTLb8tMvkbs6E4hvO0IBNQhtkOorofHVV4dih7BDfBPbSg?=
 =?us-ascii?Q?UlKrTm3by/0eUyF9g58PgLraCU4E7ZkoIPuWZGcNyCOLD4ICN8Fpy87XiHsM?=
 =?us-ascii?Q?xQ79RFFPuemej1H/MSPhQ5rk8n3mUj6U5B4iq5JOhuLOJJTjuDSAxk04VXIE?=
 =?us-ascii?Q?MX4+ey/kASTPN6SL2iEo4nMdNMN2rPm8q1UsVBi3tkGf+aFjQyYAg6UDI2uz?=
 =?us-ascii?Q?qlbvHECiO48grJgFJfivmSbmhuP9R+wSXCTrwnsgulvTC9c0DyWb91xCVnJK?=
 =?us-ascii?Q?W9AbajXfMEQc+exQyuuZ6I3bAZE8FF0Eic7vGifnih5xfmdhUX8E1G024Mse?=
 =?us-ascii?Q?LmvlVZreZVsAFFKOr8STJaID81JibVvOyiJRLmhSJuiLOEKHVEZSUgtB3jal?=
 =?us-ascii?Q?nTnYo7bjxBHvXaHM/5ME0oZMtl0hYLhug7/Ow4BSjU0LU9zo/gtYT85tpojR?=
 =?us-ascii?Q?+mXg9FWDZOuRvVy5pkJRTDVXyiWZIQHKGvDO4iRAPpWYmWXUwZIdrKxvuSCE?=
 =?us-ascii?Q?s/nJUtlO8/lf6mAB/b9Mk615i19JQuEHG/SiyO6lyg+NKaGJA6nsU+ybbVxl?=
 =?us-ascii?Q?Jdsleifgj4O+IUbp+DGnelPXpBOa8m0ZnXZC150c9jgjt5Wj19eAx012E7fG?=
 =?us-ascii?Q?vnG6Fa5trgmGK20XbecgeaPObzjyAUNU39A7lo9wp1TpPoyKMhsJClrnTHoL?=
 =?us-ascii?Q?ipSgF9RaVp+VEsN76GDAaAVv3d3YLoZm88E8gYRgD5RNGjrmE/uLfSAPEDg3?=
 =?us-ascii?Q?PHW6n7XAdcqFnhERwzni2HNspRFBvEvCYZaTGRnOcBQ6EQ7KgL1/TCo9ScW1?=
 =?us-ascii?Q?jsCLsKl2d7fwL3U34q33s6J5PFYx6u1yTk7RPHn5fwTYnNCwvphxrCkIkK17?=
 =?us-ascii?Q?TcC986KWA/Zw9rHOmjCKffi/SPoJ2bzQ4wjFmit1BXkAG+1O/+Y7K1EPngTF?=
 =?us-ascii?Q?GvxQBttZVQn4AXl98deNxCBddB8KszpRFueMX2mwaoK1epOHFbhJ9GWcQwrw?=
 =?us-ascii?Q?G2tfVhiN7t3pK9haPeyVSPgh1xUA7XRg2RM3iz9Darh8OQ8ur9MdHv8uvitj?=
 =?us-ascii?Q?vX7BR5i2fHKvxkzfdW1q+tTT37JUpODnZp/NqotN0wxbvu3VzEXhrMDEMaaM?=
 =?us-ascii?Q?tJ/iEck6tfjf0pIFr9KWlpwTI07mKjgP+/qkPPngM9/WXYT3e0yv8XEct/1d?=
 =?us-ascii?Q?D8daKpZbn0AsCvven2D2hJ6CUZoDA/bdMdQogGYglSqACmDOiwG0VR9cxDtZ?=
 =?us-ascii?Q?pT+wapI9LdjlAn9AC+6kYvy6uBTCQBkqlaPn5vxgs8SPJmDcHE+tOAWIgQtt?=
 =?us-ascii?Q?l02gsHoCcgdkxUhZoUXL3F+Ii2QjBr54lWslW9GBJzQmXa5IjI2pI57dV7/h?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82e2d7a-4648-4f1a-34cb-08dddefc7521
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 08:43:23.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJUnLZBfaiJU1g8eXB7n8aQ+wNaY4RkNHXmkmTXlkMOORvX+T9a9FUQBM7eSC/VQWz6ELzVxQpqGiysF2vUU8g0ahst2ak+a+6h8bZbK7+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
X-Proofpoint-GUID: rDDI_Wz7ZabKfC1jzgL8qBbG1lH2F0We
X-Proofpoint-ORIG-GUID: rDDI_Wz7ZabKfC1jzgL8qBbG1lH2F0We
X-Authority-Analysis: v=2.4 cv=da2A3WXe c=1 sm=1 tr=0 ts=68a4392f cx=c_pps
 a=HlyQU38uKvjEFfVLWvsgaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2gxSeYEUM00A:10 a=qf4gfuq51q0A:10 a=2OwXVqhp2XgA:10
 a=NEAV23lmAAAA:8 a=uZvujYp8AAAA:8 a=-w5ALONIAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=nSMyj5dgf6qOA3tnOn8A:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=NK6dRPDLI4cA:10 a=SLzB8X_8jTLwj6mN0q5r:22 a=C79KhC8RY3WKb-qt5qOK:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDA4MSBTYWx0ZWRfXzLN4ElSRTCZ3
 VorRRJbwXZKNh6zQ+QvzYJOZtz11olvqq8alLrzMY1/KBb7QrVAdmPjZmjPvf7a3p/cr/rhj5e2
 yLim4eJkRoWRjAFypz8FNI4lpiR1HsyuUt1yOxaX1HI971RnUbkXnR+ivFD35kIErUxdFfSQH66
 nqlLCasYzvi/PfDuBPcZHWbeyAqXwaanhaUmQ/HCgsmR9Pt7Wvky7NV0eVdONWQVQD+ba9GrMKk
 bWq9yUg2qIcnNWkcFBE/DKZptal2DL5uK25vXEvVg3CdBz2X6ShrXJV/Igolq8tyxI//XBvvsup
 UfHDm4+1ZgBaT2JI+VoZDdp/6QYo0TT3fVRdQMs7fhw0yMOTJSWe7BYuyZ1Zxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57J5Q286673023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 08:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118999

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Remove following patches, they have been fixed since 1.3.0.
0001-build_support-use-source-filename-instead-of-foo-for.patch
0002-build_support-handle-empty-max_priority-value-as-Non.patch
0003-build_support-use-does_build_succeed-in-compile_and_.patch

Backport a patch to fix dicsovery fails when CC contains flags

License-Update: update copyright statements to include contributors

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f2dc694c52618c04880b28aceec48ff3a853558f)
---
 ...x-cross-compilation-error-when-CC-is.patch | 53 ++++++++++++++++
 ...e-source-filename-instead-of-foo-for.patch | 50 ---------------
 ...ndle-empty-max_priority-value-as-Non.patch | 49 ---------------
 ...e-does_build_succeed-in-compile_and_.patch | 62 -------------------
 ...pc_1.2.0.bb =3D> python3-posix-ipc_1.3.0.bb} | 14 +++--
 5 files changed, 61 insertions(+), 167 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0001-build_support-fix-cross-compilation-error-when-CC-is.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0001-build_support-use-source-filename-instead-of-foo-for.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0002-build_support-handle-empty-max_priority-value-as-Non.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0003-build_support-use-does_build_succeed-in-compile_and_.patch
 rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.2.0.bb =3D=
> python3-posix-ipc_1.3.0.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-b=
uild_support-fix-cross-compilation-error-when-CC-is.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0001-build_support-fix-cross-com=
pilation-error-when-CC-is.patch
new file mode 100644
index 000000000000..c78d4ad726c6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_su=
pport-fix-cross-compilation-error-when-CC-is.patch
@@ -0,0 +1,53 @@
+From 01134093c9150248f9ea8890a41e922159593a7f Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Fri, 8 Aug 2025 19:30:16 +0800
+Subject: [PATCH] build_support: fix cross-compilation error when CC is a
+ multi-part command
+
+Fix the following error when cross-compiling with an environment-defined=
 CC
+that includes flags:
+
+FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-wrs-linu=
x-gcc
+-m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2
+-fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-se=
curity
+-Werror=3Dformat-security
+--sysroot=3D/build-1.3.0/tmp/work/corei7-64-wrs-linux/python3-posix-ipc/=
1.3.0/recipe-sysroot'
+
+This happened because the CC environment variable was treated as a singl=
e
+string instead of being split into arguments. The fix uses shlex.split()=
 to
+correctly parse CC into a list of compiler and flags, and then unpacks i=
t when
+forming the subprocess command.
+
+Upstream-Status: Backport [https://github.com/osvenskan/posix_ipc/commit=
/0113409]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ build_support/discover_system_info.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
+index d1b171e4f602..1c3741f5577c 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -1,6 +1,7 @@
+ import subprocess
+ import platform
+ import os
++import shlex
+=20
+ # Set these to None for compile/link debugging or subprocess.PIPE to si=
lence
+ # compiler warnings and errors.
+@@ -49,7 +50,9 @@ def does_build_succeed(filename, linker_options=3D""):
+     #   - Some versions of Linux place the sem_xxx() functions in libpt=
hread.
+     #     Rather than testing whether or not it's needed, I just specif=
y it
+     #     everywhere since it's harmless to specify it when it's not ne=
eded.
+-    cmd =3D [os.getenv("CC", "cc"),
++    cc =3D os.getenv("CC", "cc")
++    cmd =3D [
++           *shlex.split(cc),
+            '-Wall',
+            '-o',
+            f'./build_support/src/{filename[:-2]}',
+--=20
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-b=
uild_support-use-source-filename-instead-of-foo-for.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-fi=
lename-instead-of-foo-for.patch
deleted file mode 100644
index 8bb726708654..000000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_su=
pport-use-source-filename-instead-of-foo-for.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 09cfcf7de2aab873a13949d5a128ccfb9e54732d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 5 May 2025 08:15:37 +0200
-Subject: [PATCH] build_support: use source filename instead of 'foo' for
- discover tests
-
-* helps when debugging the issues
-* use the same order of CC arguments in compile_and_run and
-  does_build_succeed just for consistency
-* use pthread in both compile_and_run and does_build_succeed functions
-  it was added only to does_build_succeed in 5ec39f7af8cfd8525d225b1302f=
a93f7133b3849
-  not sure if it was intentional
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/=
77]
----
- build_support/discover_system_info.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
-index bc4d174..6d059d9 100644
---- a/build_support/discover_system_info.py
-+++ b/build_support/discover_system_info.py
-@@ -60,7 +60,7 @@ def does_build_succeed(filename, linker_options=3D""):
-     #     Rather than testing whether or not it's needed, I just specif=
y it
-     #     everywhere since it's harmless to specify it when it's not ne=
eded.
-     cc =3D os.getenv("CC", "cc")
--    cmd =3D "%s -Wall -o ./build_support/src/foo ./build_support/src/%s=
 %s -lpthread" % (cc, filename, linker_options)
-+    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%s =
%s -lpthread" % (cc, filename[:-2], filename, linker_options)
-=20
-     p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=3D=
STDERR)
-=20
-@@ -73,7 +73,7 @@ def compile_and_run(filename, linker_options=3D""):
-     # Utility function that returns the stdout output from running the
-     # compiled source file; None if the compile fails.
-     cc =3D os.getenv("CC", "cc")
--    cmd =3D "%s -Wall -o ./build_support/src/foo %s ./build_support/src=
/%s" % (cc, linker_options, filename)
-+    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%s =
%s -lpthread" % (cc, filename[:-2], filename, linker_options)
-=20
-     p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=3D=
STDERR)
-=20
-@@ -82,7 +82,7 @@ def compile_and_run(filename, linker_options=3D""):
-         return None
-    =20
-     try:
--        s =3D subprocess.Popen(["./build_support/src/foo"],
-+        s =3D subprocess.Popen(["./build_support/src/%s" % filename[:-2=
]],
-                              stdout=3Dsubprocess.PIPE).communicate()[0]
-         return s.strip().decode()
-     except Exception:
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0002-b=
uild_support-handle-empty-max_priority-value-as-Non.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-=
max_priority-value-as-Non.patch
deleted file mode 100644
index 54c8ddaba7ae..000000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_su=
pport-handle-empty-max_priority-value-as-Non.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8fc46d871639dbe799f6ff0a61b046412ef5dcc6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 5 May 2025 08:16:30 +0200
-Subject: [PATCH] build_support: handle empty max_priority value as None
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-When cross-compiling these tests they fail when the host cannot execute
-the binaries built for target.
-
-On my local ubuntu-22.04 docker container running
-build_support/src/sniff_mq_prio_max results in:
-posix_ipc-1.2.0 $ ./build_support/src/foo
-bash: ./build_support/src/foo: cannot execute binary file: Exec format e=
rror
-which triggers the Exception in compile_and_run and returns None
-
-While on some other ubuntu-22.04 containers I see:
-posix_ipc-1.2.0$ ./build_support/src/sniff_mq_prio_max
-/usr/lib/ld-linux-aarch64.so.1: No such file or directory
-
-and the compile_and_run returns
-b''
-which then causes
-posix_ipc-1.2.0/build_support/discover_system_info.py", line 244, in sni=
ff_mq_prio_max
-=C2=A0 =C2=A0 if max_priority < 0:
-=C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^
-
-Handle the empty value the same as None to avoid this.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/=
77]
----
- build_support/discover_system_info.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
-index 6d059d9..f8a3c83 100644
---- a/build_support/discover_system_info.py
-+++ b/build_support/discover_system_info.py
-@@ -223,7 +223,7 @@ def sniff_mq_prio_max():
-         except ValueError:
-             max_priority =3D None
-=20
--    if max_priority is None:
-+    if not max_priority:
-         # Looking for a #define didn't work; ask sysconf() instead.
-         # Note that sys.sysconf_names doesn't exist under Cygwin.
-         if hasattr(os, "sysconf_names") and \
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0003-b=
uild_support-use-does_build_succeed-in-compile_and_.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_buil=
d_succeed-in-compile_and_.patch
deleted file mode 100644
index b36d1cdb3ae1..000000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_su=
pport-use-does_build_succeed-in-compile_and_.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 760374e778fc28193cfea1416a739e206f9201c6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 5 May 2025 08:28:56 +0200
-Subject: [PATCH] build_support: use does_build_succeed in compile_and_ru=
n
-
-* avoid the duplication and building the sniff_mq_prio_max.c twice
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/=
77]
----
- build_support/discover_system_info.py | 27 ++++++++++-----------------
- 1 file changed, 10 insertions(+), 17 deletions(-)
-
-diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
-index f8a3c83..f6e6c8c 100644
---- a/build_support/discover_system_info.py
-+++ b/build_support/discover_system_info.py
-@@ -72,22 +72,17 @@ def does_build_succeed(filename, linker_options=3D""=
):
- def compile_and_run(filename, linker_options=3D""):
-     # Utility function that returns the stdout output from running the
-     # compiled source file; None if the compile fails.
--    cc =3D os.getenv("CC", "cc")
--    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%s =
%s -lpthread" % (cc, filename[:-2], filename, linker_options)
--
--    p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=3D=
STDERR)
--
--    if p.wait():
-+    if does_build_succeed(filename, linker_options=3D""):
-+        try:
-+            s =3D subprocess.Popen(["./build_support/src/%s" % filename=
[:-2]],
-+                                 stdout=3Dsubprocess.PIPE).communicate(=
)[0]
-+            return s.strip().decode()
-+        except Exception:
-+            # execution resulted in an error
-+            return None
-+    else:
-         # uh-oh, compile failed
-         return None
--   =20
--    try:
--        s =3D subprocess.Popen(["./build_support/src/%s" % filename[:-2=
]],
--                             stdout=3Dsubprocess.PIPE).communicate()[0]
--        return s.strip().decode()
--    except Exception:
--        # execution resulted in an error
--        return None
-=20
-=20
- def get_sysctl_value(name):
-@@ -211,11 +206,9 @@ def sniff_mq_prio_max():
-     # ref: http://www.opengroup.org/onlinepubs/009695399/basedefs/limit=
s.h.html
-     DEFAULT_PRIORITY_MAX =3D 32
-=20
--    max_priority =3D None
-     # OS X up to and including 10.8 doesn't support POSIX messages queu=
es and
-     # doesn't define MQ_PRIO_MAX. Maybe this aggravation will cease in =
10.9?
--    if does_build_succeed("sniff_mq_prio_max.c"):
--        max_priority =3D compile_and_run("sniff_mq_prio_max.c")
-+    max_priority =3D compile_and_run("sniff_mq_prio_max.c")
-=20
-     if max_priority:
-         try:
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.b=
b
rename to meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
index 8147e4108b72..1da14bc3afa6 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
@@ -2,15 +2,17 @@ DESCRIPTION =3D "POSIX IPC primitives (semaphores, shar=
ed memory and message queue
 HOMEPAGE =3D "http://semanchuk.com/philip/posix_ipc/"
 SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1a4f3bd729df04bf68f66ef877e9c=
7c9"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3d8df223c2614dbf1aabdc1ca23c=
c10"
=20
 PYPI_PACKAGE =3D "posix_ipc"
=20
-SRC_URI[sha256sum] =3D "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529eb=
c881cfb2aedb3838"
+SRC_URI[sha256sum] =3D "6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d20876=
910896f47d353448"
=20
 SRC_URI +=3D " \
-    file://0001-build_support-use-source-filename-instead-of-foo-for.pat=
ch \
-    file://0002-build_support-handle-empty-max_priority-value-as-Non.pat=
ch \
-    file://0003-build_support-use-does_build_succeed-in-compile_and_.pat=
ch \
-"
+    file://0001-build_support-fix-cross-compilation-error-when-CC-is.pat=
ch \
+    "
+
+# Message queue support requires librt for proper linking
+LDFLAGS +=3D "-lrt"
+
 inherit pypi python_setuptools_build_meta
--=20
2.25.1


