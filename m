Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1E0FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:12:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10910.1777374729242936549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 04:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q5yuChOg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95785afea1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3dxN3814786
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 11:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SWVb7JAYa0wGIeNP5PiI
	n4qryJCwS9J9S2zAdgwI2nE=; b=Q5yuChOg82w9Ph6zETbNm/pQm4t1xcncDiMW
	T9UQJuY4E4OFQnZWrpHXApiq6rYw5D6VfgXJshVxoOgnNR6uCC/v3EcqU7BTXut5
	UzfC1R3gBq0b6koIMCzqeTQHlz5OUGPQo4CAMlIXULxBNz4TaDKevAmNZNvWXcAd
	xlQc4m0sGFMGjYwsGn7eFMicdbN9fVqxMpa+YMEhuudVqHe9kgbWzKK1iZ6Rziuu
	B6v+JSO6OS1z+MUwraqH1QnmRDgk4zk4v84Fck49XnUTQO+T4+Y+2+QCWbjO4fV+
	8iVkbzO4GKNs5MDUSO6heM+qWwDuXhtS4ZDGRADyRKC4emk2nA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drmk6uakr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 11:12:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQBvLOSkcrYcC8TsxNhZ4ZH/115UA6f747bWzniQDMcNuXcSgMkwGmCu7Y60jm/Pg2raUERqK7lf4h6fh6VigAmslRQTxbjtXlkNEuqJr6YdTJU+a6zNgUmszloPEh5AlwoBO4DJNzjwDNwVQyla2m+KfHDPxV1B+G+YbwuujbHo91kSyUT4Rpmx8C8hyJiKMELXbDgrgy3ojh9aoS6DdVDMN1Z/4w833Gvj/kDhvlTqTYCjoyxdXectPK9uns1KP4ARa2VzX+BD3kH47IInIwN+uLM6FQmxIAJ2TefCBe3atwaumAnH5YWkAkUYv2dfeUgpEKqZl+V8ZLfBHzvH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWVb7JAYa0wGIeNP5PiIn4qryJCwS9J9S2zAdgwI2nE=;
 b=Xsr4qj+8qjSwf3sQ49jEhhAYXhIX4Cb3eshuWBLPqALuHZy2nf+l8pUTESCuQvVkkdgbEwil/doB7lQ/JAGpwMHHYweZVKPuSdTAOBXwgcxi8XQeIpeFH5lL3cxttXomKrRPYTUVhXpbrQtBxIer/oyxYz//gSVYUHkXM6bficZH3DvwxTMYFFRECbr4jVRgr+D8qUoaCkW+t18FsEH5K6iHoXy6WdGcU4Ftd/iAUFLHfkVsYd41YgFl6fXbqbzoz35CjAtLn6TwBRNLXzMfm0cp/e3LBN74Lv+/+QQ8znEuyQmzX7lXn40koYtOrGXR7RC5HDeKHahuVH3NQuGrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPF8EC896901.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::844) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 11:12:05 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 11:12:05 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] webkitgtk3: fix build on riscv64
Date: Tue, 28 Apr 2026 19:11:48 +0800
Message-Id: <20260428111148.632918-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:820::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPF8EC896901:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e388a0f-e312-4101-e910-08dea516fafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	2qUHJIM9Q2ZQ+9Y6egkUZ3YQlPr8ZZJPHnyh7nBMPRT9EHQN/gVMD1LYkBbw81r8BX+1GaIbBvEa/JkeGzVHzC0u/s4NPleFTqZdZvRmtibrhmAv9ZhFQhjuFTilB0kMVnOC1Zyk/qzIDDmSxeeF3UrEG/beclnl9UepBPwPlJKSX0OYA1wsqb5Vc7ndB7vYH5IdRrXufaBvmGGaR4lSYhDBjXD9ay04ml/mzvdx/sT5zI3flzN8WZn8hFyjFRIOj9wLagXeyBXLiqNg+mPzSNXxDvxuQKnix51GcIvExvQ6/u5zZRLPbazO2v8w6XiLB4t1B7pWJtsAMj1Iapyr4WIKUt//Mfi6Q4AH279IKY+dvBdlSDa8O+pEFJD50puuxY/mTgmtdjc1jFy/O/DnEtC/E5qOdFDPYP8XuHz97RmAXwJ9QQwsKL7uEVaaefuNIJDLQwUB+D2xLDRkr7rlzvzW65MbTZrlruIfSr+NTjNd15bCjnk1kgyoVslxLKpfkOpEFroGvoBTZ4WS1Vcvw8iF4SD99Qn3dCGVFE44D/EVdpRazNXgsP2r/3jHxJIYQQ6ohEEHF18wijc8LnYV7ojRYxgYsgiHLfdk/PikZTGd0pR5VZ5ROJk/ZITHU9n0pzZim+53v5mOfIOWNFuJ4qH98SjdKON5hdS5kdC0EmDnrsd7sYdHue0pgaD67oTR2FQ2zHR50tYZndqCZ9Bpf/7LrrQ4XjN/ZcmypfKzWqrkbEtIyZnT86t482PvU13rFsK09iHqKRW9tugsmP2I+DzP3zVbMyIjivHBz42mvRk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LGwTQ7edK1TNW7HoGiUOYgxsgJP+998O8/oKkaRwUniIkkspa6d8fai0q1Md?=
 =?us-ascii?Q?32AUiKThT6jdDqL7647RozAsH/dZ8STZS3elk27RdZvJVt89q4tt9BWNoUAJ?=
 =?us-ascii?Q?aThyyv3MK7K2Vd6Ji8Xz/mkzROfskaAfLitB7yMD6urOaXKllJLb9EPA/sly?=
 =?us-ascii?Q?Ed5FJHK127O5fZykLePeuT0NeZS+9D6mNRpoAjz7hukf4NqeSblkUr8731lg?=
 =?us-ascii?Q?p+ILfMybDKH9JWi/a34P50JAylj915bH2tFNIVdz38i4KFZdqeZnDa7maFjd?=
 =?us-ascii?Q?je3jSpP7Wslyfp9Q+v9CR8vflueoiEudc0j82dFm4kqv295Nr+8dhiXC5C2N?=
 =?us-ascii?Q?reQcnf2P5Lr5qoioo/iHNW4W1mkD4NiO8uGx8n/BQiIDiD7Koml1minY+qNW?=
 =?us-ascii?Q?kzzvThr8yB1qn8OBH38kAeQdBnwxxGdXaWrH10Upc00qNuawU9IbEgm284UI?=
 =?us-ascii?Q?1ZLPgtr5uC6knPRSdW+Gd+1+JQ82AdjnvPtIhALZ6sLz72PwJjtAxuCdE8bM?=
 =?us-ascii?Q?myXZbuDTyF7IVIqN/ryrKJc8GtbZoOFtb5LQQRRjQsyu09OPf3kzEXcnVb9Y?=
 =?us-ascii?Q?kVWVM7NEzbEeRc82PlU3TKj/AHf79ZVC8ZkD+nokoAwn0qHwuPOMCV4vuI4X?=
 =?us-ascii?Q?+3mUSW9XcPea2dSqLLULV7ctfq/hwEsSITmLPJn4pv3DQpIzTM+jMXqaSMpx?=
 =?us-ascii?Q?w6Ut7QYhOVSsc3LDbm8fux0dUxnuH0clMo97yB3K82AQLO/S67c815IBUiaA?=
 =?us-ascii?Q?RThlqHBK97Xh+PQGIfxIIXoeJIxnIygqmdpq9YfJqvrl3CBo0/mjgzz2NEZe?=
 =?us-ascii?Q?ATd4N856TJRBYhtnYG/FnVY8Em/1LcErsQeCGzhRqY6ZoBWfRVZpecDQLMbz?=
 =?us-ascii?Q?lUKBydF9DLRb8neTTmUFxyz7jSpG91gVGECDVcSjFo2fbWVIT4bynM/2MTma?=
 =?us-ascii?Q?2ZskcaO70q6lqkhSDrpXNegtsRLi2BSPqiuJlX4NLslRRegj0BEy8nu1i6lf?=
 =?us-ascii?Q?Nz82RiDh3LXQKH7KW0uM9N25j1TE0yCh8ib9q8ldawKhsgGuO/ntL+8XEQzP?=
 =?us-ascii?Q?RZWkK2jS5j/ieIM21CCUcweieBukHrIY5B3fBzjf/ViXCO46IsrTwRQzN7WH?=
 =?us-ascii?Q?Khnp9LncCtKkAHAmX8DyFNb6M0XEJ9muHNAuti2kV5QDeAJf3wKHZnwV3Y34?=
 =?us-ascii?Q?F+mmGhLURAyXjKv8kJSzkGR8Ylf2ZTvOd4dVe4x8T9ZlCCE4HoVQyYsXkqWP?=
 =?us-ascii?Q?epS7A84bPCRsyU2IPajR/oOGzNfnXPLznIp3NtZZje/6Hd5j5G9P/+gZHj8r?=
 =?us-ascii?Q?HebYnhTZrO4jnLyeFrLIrpCjrJ2JRiywDUyVtk+xDg6ul/LrzFJaPTKiMXUx?=
 =?us-ascii?Q?fV8IT9SQls+OLTQejA8HqOK3PaOGCFoGLMMeJGn9PMa5OvSmNWsI4Htx1dLI?=
 =?us-ascii?Q?baNWfxC8uX+Ls7tk0wC8Do+4MhQP9EiWIwZ1+wfwzoTGveGuiBx3p1GBoLii?=
 =?us-ascii?Q?r/elr093+TbiMGAsQKSxyF+hPRHdA7FYA2aWjptmtQm/N4sI/+9Ka6gxCtCK?=
 =?us-ascii?Q?fS0hI1rmFx6XjOepVDFT85jFIGH8pj3UCTliHPjq8haNsLptN33+qbamcR0/?=
 =?us-ascii?Q?0PoB98PqM3fZeqfZl4tDOyYt+7PwhOAA1D3kx1OfbF7e0CXgwSRGAj/MzZjQ?=
 =?us-ascii?Q?PTKL/rs82UfZIAhKDs+tlpGVee40SwSS5rGL1Q+DcaituUKbi+43EH2KWxpT?=
 =?us-ascii?Q?O7TKNFHpHw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	j+0xdAVCuOkgomadwamTNzQO8JbtHVf4jyURmt7eH0QNwGbE2+UpqSiV6T++fwX+oAmEwbAfQ04aNfrXnE9l9a14p/JX85qt1+ilzmc101ze1FGFHRb1RbxImL7gTRT9RpP49eRtF+X7qWr/ZAhOxxbsMjRuQV/0fd5vrz9VKbNonReTmNaKkA6lX+zfzrczlVj7DZGeb4TtIpBpRW2IscQov5+FlBFKF5cvTJwsltjLWdCYTTBa/sx9hvSikYDOk/UBQiFGpgqG0XUK0BhLGYDX1dOP6WrYAnzYjrj0iv0nk2bvNEaddmGudDVCGSETYWrPU7I8HszyS/RI6JXxqQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e388a0f-e312-4101-e910-08dea516fafe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:12:05.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ycdsA0yV3ynZ3fsvrnQd0S4MYeruF+Y1yvXrytchWH+EOr/3lvd+OHdL3xY6PQ5ev8QnIVwLcKVi5/yHVDEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8EC896901
X-Proofpoint-ORIG-GUID: KvkQtXQJX0rDXlI5qsbmX61jzQ2Wg4Vh
X-Proofpoint-GUID: KvkQtXQJX0rDXlI5qsbmX61jzQ2Wg4Vh
X-Authority-Analysis: v=2.4 cv=RN6D2Yi+ c=1 sm=1 tr=0 ts=69f09608 cx=c_pps
 a=b4Rf/daEBCJdqA7qdazqbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=YAmfd00o6D4YvdxECCUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMCBTYWx0ZWRfXxaU1mqhyhlDY
 69bFobFL4SGJ5gMgsJ73Y9tF/g9yMFSsBFLN/OWbqc7aZOly4jbk7IFpMIZ77YPVaVst5jYKsZX
 lJr2Fq9Y7K5RqEvGLZ7veZDF3bBcqyipDUUWLvRACDZTEVfLb8tQ2xM2sKEROin+UGhPDMA0Xeh
 BKSvKXu2oD5rqVxsqNO6ZpMtfi7hQrRNwwk1ogKJ5RWgCeV3IocCcWH4a63I0a+IQU5UHLIs33Z
 oHkeUMr6ssYKGMb/UY6UC5jiEU0UMu1sWNvEmFCf4jjYvgoY0M1AZ42bnckS2FPwUkodEJpJzX7
 EzWFU3m1aTL+2Vr/FPmCELXWv5epR26z/7B1aKfdVVQoaHZs4KDfEtQ2HviNTNWgFaN+57BuLrg
 Z6yqyqJWgBuveSmCd6wfP/E1PZhJqGLcmarO5QhgOuKuz5zMidRp1ALmmA5Roj8hDJK2aFz2TMe
 xsAL+CJKwRFRXS3LLmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 11:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126656

Fix the following build failure:
Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
error: cannot tail-call: tail call production failed
  810 |         DECLARE_STAGE(name, arg, [[clang::musttail]] return (*list.fn)(list, ctx, src, dst, \
      |                                                             ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
  811 |                                                                        r, g, b, a, i))
      |                                                                        ~~~~~~~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
index c3f736568f..67f95620fd 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.6.bb
@@ -113,6 +113,10 @@ CXXFLAGS:append:arc = " -mlong-calls"
 # Needed for non-mesa graphics stacks when x11 is disabled
 CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
 
+# Fix Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
+# error: cannot tail-call: tail call production failed
+CXXFLAGS:append:riscv64 = " -DSKCMS_HAS_MUSTTAIL=0"
+
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
-- 
2.34.1


