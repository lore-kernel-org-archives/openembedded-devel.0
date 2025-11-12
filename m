Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2936CD13CF
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13702.1762955078517604925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VDveuMFq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6jPt82526302
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=haeXNWDQQEP2WmCZr7rCdF6BmPp1kP3gCd8KoUIRrEQ=; b=VDveuMFqhufq
	mrndjngZB1X9A1azkJrTfdSZtchZmlqd2N7ld3C7urx0GtX9rarM85A8XOLkYnjh
	CO+okABXu+WLd+xJinooZZ3aW0nuRTSnn1YVI3H3OcQ4SWfGfcY9Acb3w4xke7on
	moAU9x9chcjzFEM78ZxyKhRxu6elNwgcxfJGPwpAzeFo0BwCh7YAlXr9QMI8vTf7
	q9m/XCTaeoCIYk5dfWYhq/fqKBThGjZ6SYPfMuTUiafm97hWCx+3zff3411/lDPS
	ohStpfml683XYqFmd/75VY49yZpeQvMY2oCqPSM0c37aCFAywx1yuP/sb7MvcYET
	s3cDHXuMAA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu958y9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHWC9vG98asCPSFNZKwMRw7aVGauSp78+dgI1yOd0csRepPj5mE/5f3rwZZX8deH4ADbyAfzR08/ZjrIbKb/Oh2xauhh1VW8YAygVB8rq/ji/ww00F9oHBzr4EtnVUO+2i1rLYL3rjWetRFqpvUETbRIzO711ZBoWj8gD/460TSYjpeNPNVVQyGGGMOXhkHZQXDgBW6gDrCq7m7cvQbwcpSmXC0HZolvfAmzPQQEdXjn/94nPuDMoq8Rl6d9ozKjYVzvHuYi50T+1Ya6pwRzuV8gyhnXXeHrexflNFMD85muE3rFuSVwM6xsM0cF+cNtH1s2T3Sr1DuZpKlFsDuPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haeXNWDQQEP2WmCZr7rCdF6BmPp1kP3gCd8KoUIRrEQ=;
 b=x9rJqjh0s9slqp/OzxUwUgqCH5RIGIAOhcrgJ/cgPUWGogWnbDMmaVPjqMk/8F70QQnOyQ4/6yNVtnYIzZL5/uNGFH8RJigpuhDxoFHdhWba5ZLIYNT2bY4g9pFabLaEGEAgmUudVoAymQYYqqZ5z0YbIdn5o2LUZ3PKQm4j8mzDyNE+2bgjauiEUwsUp21DRbFOJrNM5v59Xtc9fw472R/eghF85g8FRPNa8ax1JFHxaPx7BS5oLflvXqdLsbBWCEWmqqHt056CD1akgSNYG+AqxvYuBBk8cWVoBWAl8rE1KMzCz5R07wowAfLpshB/hFVIH/sSGpslJynICC95gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:36 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:36 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 10/19] libgphoto2: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:43:56 +0800
Message-Id: <20251112134405.3706508-10-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 41469f75-d67d-4bb1-bf8a-08de21f19e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vM1OI/7hSy9wYvIWXn8f3hW1aZbabxuVTF267eRmIppi3QeeLSBTTUDwdrpv?=
 =?us-ascii?Q?AlQlqARc/HG9k6g9PJopv3oV9Gpw9sKp6XgUOfjJLogKKO+Yz2hdWyoVcnvZ?=
 =?us-ascii?Q?7saaHz4U+hsKvcl5RIFVt+rqisziIrX8j1iCOe9bzfob6OR6CZ2I+jG0x2M6?=
 =?us-ascii?Q?GNokasVudDUq1mgps6vZBR7OtPGGtqZojMUkWhw3Ek7A5TpbhRtSIooZun5E?=
 =?us-ascii?Q?5Av5FkatVYvAEyCbAh6/2YkgWPFbFh1cjNMo2AU9uLqS6aBfrTFNQQLJB90n?=
 =?us-ascii?Q?oa8jaDkS5KRSYCycBKa7+0pw2NciRON4UTRajrBCMAPd9svBal1oWCxYCfQ+?=
 =?us-ascii?Q?RcomfNpOtRYz205dHa5+0zsH8bicHARITqVZKUKVA4raabyaJnsxVTqsB44V?=
 =?us-ascii?Q?0bkV7Phs0U3mYND3T8MEkgwMothqGh0d+ldPzuQsykO/SxRmmMaHq+Y/c4cV?=
 =?us-ascii?Q?NYcKwnzkfAGEw7WH5aE3S5M+vJlNzAy+ecBto5TBXnoIK22E4F2oBqEUebEJ?=
 =?us-ascii?Q?gcRMUKxzvGZFdypr9OJmwPyIOxck5OlbmmTh0jdTZs5jR0q0D8JhGgXv+SOv?=
 =?us-ascii?Q?4uAsnk/9dP8c/9PY4K+jhITJSvFmbWOtTZD9uQBZSn5UCQbIPKNYqZZwTjzD?=
 =?us-ascii?Q?O4buvbaQCWLHjGe4Cg6u+rS9ReNcMwN+9sO19Kt4wPewwXIsQS2K6PZTFonp?=
 =?us-ascii?Q?Ru4oCsPa8AVuFlHYm2/OrRIJS6vi8gpFIHsHLnNomPvXHCh6MuiSyXHx00tb?=
 =?us-ascii?Q?tcfc+3xsvwXD9L5UMmbTt2JdN3Tb0uP5v/CdBGHQEJ8I/5wSfQQ4pVTWcJLb?=
 =?us-ascii?Q?3lY0LB7I2zs1BP6G/on2nPS/4OM708ey1GeXlVWjEqg56DScSYnJNIcRS0+3?=
 =?us-ascii?Q?d3o1cUoC4DYixKbnuKjl5kKcQTR9rNiXnk74YLKnZ5lE5Ck7v3gJPWfd+YSJ?=
 =?us-ascii?Q?B/CboTQxjaWVSu8Fv4bR2ZILsaw2Puwjt2FE0i+SGzoq3Yvu3RapByl4WpqL?=
 =?us-ascii?Q?36Y+NXfqO9/+ECXaTSWq8+hQ2z1ybFF/kskSBj6hVvAq4lKsPThKHZjM+qFl?=
 =?us-ascii?Q?OcXZkNgZruSg8wURRgamLIXwXqHtX0Ehi894l97oauGxckzMW3wUz9MF8AAQ?=
 =?us-ascii?Q?VibkvRSuKFcPAj4cwbjhxibHfC5d1mpWpsMKQEeoCmAfaFITAza5broluLRd?=
 =?us-ascii?Q?fmXnC6fgd/aOf+4GA5bUv68zAtp/S4kq1MU224DVdtjCkxM+/X7kleVNtMXQ?=
 =?us-ascii?Q?0GqGee+nFgtpJLgjIdaVUdrJHt+3TfKu3uFN8G0UXr5uemMFuOm3k0/Yu4ar?=
 =?us-ascii?Q?Q8oqxlt22k17E6HDnxE6jrJbHsV7iCJEJ2QFZnxDNxUfke9EEYNVM7mLJQJX?=
 =?us-ascii?Q?MiLxAeBDS339d1OI8w6z5njj+2TRfj3EpbkoWwKkCADvFuQDKYtIhXG9Eo0w?=
 =?us-ascii?Q?sZlNaL16nNcZHMOPX0+Y9p1LBttX7Dvvt525IoAGMDKa+qme3bb8VcOoPl/J?=
 =?us-ascii?Q?v9RD2H2M74kszG1mdme6JFSxN4gaG9DhjzZW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d3M+/NONyILr+hWAxBqBL2wJM1jI9fi3KdaDRy0D+xbcB6t9slydPGveux9K?=
 =?us-ascii?Q?HvYXvkvG7PKqs1xl0r5YhExB+PszCs4Lr1lSCWv8zEUi6PjFMA5mXGtxsjnm?=
 =?us-ascii?Q?5+oGPwOeDmU5NGu3G6jbQ7cbkEHWj5+gLrgXd7CGAWi0Lf2XSs0B64sc2h4A?=
 =?us-ascii?Q?uTtCuqFkBhTLUuuaoRYXrDysWGW6+Lv4Z2V2IiEtcfslGqHISNk2hK+RHFZY?=
 =?us-ascii?Q?r1d3GUe+VOIlYQrJFxLGBb1XNNL0hsiFbwMscnvjop4pDS6zv52Vm9w3QEcM?=
 =?us-ascii?Q?Iw54rTW9HmNrRFGjDF3XciI8MEKc7EcJPJum1hnWXQqkUxRfUAirX2G8v6O0?=
 =?us-ascii?Q?w+u4YnWXoEmrot7m0w4sRRbg30SHgQBvmYI4RIR+EFe2hk3/mZeqznsxDibo?=
 =?us-ascii?Q?6IjTkn9UmapqNSbsORvotVL72y2Kwk4GOAytp9WNYN5QCMj+A65f6s144yth?=
 =?us-ascii?Q?2wiqVTBYJw1dfAKuvGf1kYM+isNmn4D5EMlrIR2engBMCnwq+wwvOPftuGHt?=
 =?us-ascii?Q?+y9OlqAJ3OqBsSLJuSbYJmtkHOUcUwanxolqdPga38YHYUrsBhKGf7uNVdpH?=
 =?us-ascii?Q?GsX0PYQhqIU7K/ZU7cpNK3yuWe+H4hMiu0/LLQxIezGa6M6niiKjrchlRge9?=
 =?us-ascii?Q?WVnywCwqlDAttmJFhn0k9UGWmhzf6u5mtAdOMmppciEB9Y5eMYmKYuuT5HpR?=
 =?us-ascii?Q?lH1QuO3xIKdRSdtRGw82T5dClSqXSf8syI94XzsS4N6pJoBRriyGcdRaV0+h?=
 =?us-ascii?Q?xJyuJtA9p2yg+SG4thjYiAo7mFh+nSIy912l3yeEgH9AYmJWgzdBSGVPum1v?=
 =?us-ascii?Q?wyjZDL6J2j7h/q7IbUyOGbsR8GVSV24eqD4BvvMsxfl20J5lVzrSOHFXJaeg?=
 =?us-ascii?Q?RETWSUNKmSDcbfrSQefzskayAXq6OI0LyVcsMhq0uq5vQEiyY8NkKrdUiKax?=
 =?us-ascii?Q?/YOO9xqPIdeK7gZ2WbCa22Zvxy/tnnHKUPFZFQMMwm8j+lyqhSpBA8sPGOdW?=
 =?us-ascii?Q?JpUsyNQ4YB9BYaOvUE2hp1Hq+bmux9xCAl39+k6bwTj/+UpBERscoKtRdhBC?=
 =?us-ascii?Q?dsL4Uzkqj+l0gVmVPR546OREK82cL1gdgDgR6io3GegbwFHluW/nCMx5BFEA?=
 =?us-ascii?Q?d5jeTKUcPUdZs5+INvTb5qxjQO3KQ5q6C5h5YTS6qG/KRTBZDbqBjFMQyrz3?=
 =?us-ascii?Q?RJoei6/psfP/1Lzm/I9QPhOb3+8tZ5hD4NDLc2VV2X7gup1qf1it9jm+Wr1G?=
 =?us-ascii?Q?vv6RVqT176DIMndF7mlrNaJ//m5FcXJssuHuSbYsEg86MVqBcP6EB+f+gf3R?=
 =?us-ascii?Q?OaKvIr9ifzaPksWIfRKlatUG8GsBfGjIB7vW0fYRWTo9Ibtz5PbvDZ0JPBnU?=
 =?us-ascii?Q?/ycG1M0owq7IKcL2z9NkX0oAafDPjVwp52DgK/QXbVVGK9rpAsRaOk9OLAY3?=
 =?us-ascii?Q?6ihrpHWSQ78GG1I5zh02Eap+3XzDpsJE+4UFfLKQgw7gGTF9uDfZN2qhsCXM?=
 =?us-ascii?Q?e0fy4BRAfzsXcKfDIDNBxvFK5M6F5EnGofLeoPHJ16evxHKfGanzlfuLzYZr?=
 =?us-ascii?Q?E0Oa/5/GShdXrW92WQsmMaN/RD7CVIbLygHXjkyn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41469f75-d67d-4bb1-bf8a-08de21f19e1c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:35.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8mxiWVOHWJD/VNP3X/PDnzt3HgE/ihxanLD1DY2X/xLhUthVt54hHxrGJUcD4osP+EpB2vsu6oKzGD5SXW9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX2vnqLOhZCQ9i
 NbGsRzZcEhrWrft5V9Fymr63KT+zHd5ge+smyOvEHB1qk51F4CbWBTtMnmKytMMTReZhhGJqD0n
 2cpYyD8C7VyRvd9hqDNVpaBve7Zad13FGnqLLEb88/XXzWOnHYvA34/bFZxtXBY7XJEGVcuipJc
 IgP0uq8viOKGlDFIphK4+lIUWGj4qlSf+a1QyOt7SUjd1hIT0HOpWjRIUmO8qjxbiQUu85sbkoV
 O+xvJzQRmlCuw8Q+cVwNCmkk7UGC5N+ERp7VvK1n+1/CzbekxS2As4fU3BrXxLG5wjlRYxWC3Q3
 Qy7+kiy236dCs5J5aa4HIkLYe0Inpjo3A6L+cNR/OWCH4DzKiTI+uB0QIcc70wBnc/9zAcnwQPO
 Kncttjinm1obhUz6id6pwtpfpzi3Lw==
X-Proofpoint-GUID: dyRuNs8hPzW_atRfveo74y-8JPzoqovc
X-Proofpoint-ORIG-GUID: dyRuNs8hPzW_atRfveo74y-8JPzoqovc
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69148f45 cx=c_pps
 a=0joluOkswiQ4lQw5hT3+aQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=L7rMfQJdP8yPwGEyN-MA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121539

Add UPSTREAM_CHECK_URI to check the correct latest stable verison.

Before the patch:
$ devtool latest-version libgphoto2
INFO: Current version: 2.5.32
INFO: Latest version:

After the patch:
$ devtool latest-version libgphoto2
INFO: Current version: 2.5.32
INFO: Latest version: 2.5.33

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
index 0fe2feca6e..20e0645d21 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
@@ -15,6 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
 "
 SRC_URI[libgphoto2.sha256sum] = "495a347be21b8f970607a81e739aa91513a8479cbd73b79454a339c73e2b860e"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gphoto/files/libgphoto/"
+
 inherit autotools pkgconfig gettext lib_package
 
 EXTRA_OECONF = " --with-drivers=all udevscriptdir=${nonarch_base_libdir}/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
-- 
2.34.1


