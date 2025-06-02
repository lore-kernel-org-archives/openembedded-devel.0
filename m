Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5250AC5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:04:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43725.1748847874750039200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8248fd1b17=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5525Ta54005041
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Jun 2025 00:04:34 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47019m1b6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 00:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wb11mldf/lNELG+IToUJTRZIubUdvb7ipRcpGt6ikk1b+4JpuxPAMhEqGKmvoeW7FX0Tl9cLU0VMcSi6AwsLDqDQCdS2vRF5eH95AvBF3Y7jzwFMUuf013GuNmSW0knacgaCw995aTTnYch1fadynMMv9IJlvFjfZNPf+ipo6p9U6xhgAGzA3q2Xan3EFfuiuADqa52OJLAtegYejGxSZbTyMmg/PENtez0r83dW21/yvMuqlvDQGMA2DFsLvySdIY6ZLtRJD173ilURQuwGGExzW1fRV4UueAADwT8lOdUF2DnwKX8A9+xbNt6fHb9w1BHuw2WayPsG0xiHew4rpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7D+oGwxSY448khKTZS8S/3uZnFI3djJtvtRdPo8QRk=;
 b=wjJ1Q0KcT2TkM0oECA4PBcHwd9a8DGA4oT1YLHcBvcgyZhxFmpX3kijOda2xb3uZXN+oXF+lMHoeKJjqTncH6sIz8EsPdA/Xv1DBvmJmepZBXCTVwyNWpmVk9kNuJnXbxqElbDQnOj++nT3sYLXtmCTI9N6n4XSymxv9x6wiMP/CGujJgedjsPRVadma3n02lmEqruSjMB2PzhdhaMqgc9e+2ikljesdoo1itfMuboIh/h1ocW+n/TGJ+i6V9g46ic8guzzoCyRGyPKKHFqns5cSe4LN6ZeDuvx0PfBZ0UnMPBGIWZOVkSdBOPhK9YVdgKGsdjT7qd3T8f0Uty5qbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Mon, 2 Jun 2025 07:04:31 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 07:04:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 4.0.3 -> 4.0.4
Date: Mon,  2 Jun 2025 15:03:39 +0800
Message-Id: <20250602070339.3632772-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f77f76-b308-401d-289c-08dda1a3b933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DF5UY8TupjcNe0206MT1RrSNTk7qUR8VcwWK219D10uL7+Xbeewlct8BKX8c?=
 =?us-ascii?Q?c1EVNRYTWkIefvBFQ31P4i380aBgFtvSoZjIi1kNVgMEp+8QyLlnidzUD/EM?=
 =?us-ascii?Q?JRwiPvOHWy+z1lwFo+oZpx9QGU8FmDHGqidv509TdhvFgFcGhpH3Om1ClWrO?=
 =?us-ascii?Q?PyQ2PZUKYat4yt2pQPCnlPDF5f+9jXbPsz/EL0fRifuIQx82xrUwLxZWeLhn?=
 =?us-ascii?Q?YrjzC/+xNWa70fuX+qe4f3WuYCsbkkp4W1EL4qqU9lREy7bSaR6YS+GfUchk?=
 =?us-ascii?Q?kES7wA/t6kezmOj5Sq8lcxdYrDgjQofElnVupkgIeFNAY18whcz9+y+wiXib?=
 =?us-ascii?Q?/5LTmKfY8tCxsqNeruT7xIGwnrLF/0AueDh29WewQWl9dEHqNmHsF6Smj0BV?=
 =?us-ascii?Q?IbmXTECl43EW1zO01sUm6zLCy8bDSyQipBwCq/3j8J4fvX5vnhU500bUFiE+?=
 =?us-ascii?Q?bJxr5B4EimY4wXWA7SRHJ883WGLolNIVqGsHdgHjsbne1JE1a6Y/sBWFZoxm?=
 =?us-ascii?Q?J/2N/Fv7/T4iLhrPbUZAdSKZJDW28IERysIFU+4fPSgkACakmNemMvAMxA9I?=
 =?us-ascii?Q?Q+EtfFtuiMexLIzFNPUBdlV2AcEQJlVNtwJhzM/ZZHkXJb+E3UP63o5z51tA?=
 =?us-ascii?Q?0OMYZmqJSIaYCP6/uWCOdXWMte3hXwpV8zGgsIYCXE9ry/K4LVsoFuR/U8qT?=
 =?us-ascii?Q?1pWhMM6O3+335ra0SG8obgWF5+7Ui21660wY5iRrw60z55czCNn6tRCNcvD9?=
 =?us-ascii?Q?eWEgAMtl1AR7d48cfxVGgtk/hPlnQv+uMK9o3lT8orWR9BonmApSVv7Ig0s3?=
 =?us-ascii?Q?jQiDy8Hb1p/fh0jDMUX6yfWOJtCaq4p+C1kNSkj7JelpzDGDS5/37ANvWNNh?=
 =?us-ascii?Q?z37IZjB2fAEn1OEXjEYD5OSLaJWl1aZhQDsvuky8bbtw+QK+tdVHoTcRN9is?=
 =?us-ascii?Q?L0sw9JasKKr+JN9aNzMnaX22zUI0JSGQiAT8TY4roRuQwZ7QUkk1RnI7MbpA?=
 =?us-ascii?Q?Xf0q1pERmbEcDdDobegl/QcM0Vqa+rz1/15VkrnyrDE+8Bz2WxoPufulcxps?=
 =?us-ascii?Q?8rPMhZzMBrc/LZX7ihKo/INdrdA+n5edymGYlu/jh8uHqDC8LFe2nLAX1OVF?=
 =?us-ascii?Q?aXAJN/rAEG4XKeiftz29yGe0oHJSzevuiVtvd70IC+G7P6sFEJmLF2JuTfhF?=
 =?us-ascii?Q?N1ahQ+Nm7uNA/LGZOcdH2F2gsw2K5WHkDs6MhdvxnsEGKJzg7ExygwVpF7R4?=
 =?us-ascii?Q?pmAdvRCQloZxi40yUIla+ohdJXG01J8flhZoJtNQFN6u/F+X8i5K8AqvNLTd?=
 =?us-ascii?Q?nYAwvLIY36ycf0aNELcIvPML/+SBrbFPBlUVPGddAZeIdl+iq1+eYiLcwLSo?=
 =?us-ascii?Q?OJxUB+CyxwaAGNQg6NGG8a1cPLYk9Nf4NB8iFydG1qbv9jI7d4HZyhXyADom?=
 =?us-ascii?Q?7fiJxQRxgrjd708EQ9YoOENJWbz4XRMHFZIBP9EuiDq20K14B2AdTA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HyBf5cr2zj5f3Ye35fjfL8lMJx1YGBDXwsC210T29IWFybDU7lfEIaOS8iiq?=
 =?us-ascii?Q?T0/mW0pCCMTpDKyg7e51ku46gFCFoZVrKlyXvfA4AV8s2VNXWOROK+xVQsJm?=
 =?us-ascii?Q?0fpqpU1gXulMCSljgKSOCQ6sZC7lJrYyO4H0mSmkOniYEXtyzIIomkyZbCxe?=
 =?us-ascii?Q?+wTvacWIpJALL5BefP8Vhcssi+DjU57f79wsaILw2JXqqfexUWk2IHFETHnY?=
 =?us-ascii?Q?lNOgEjujsrGixwgfkdlaynucvhXQwMBfBLdqVrMUL0Sdm7QrlN4mmYwSy9x6?=
 =?us-ascii?Q?/RvvCaLSR4JUlQN2dz/dlow4MjLlQVgj+v7bC18RKkKKvjB0xfQavrOv0oML?=
 =?us-ascii?Q?aUV3WLSc8QbGdeCU612hW+OnW6z44AX0p32h5LNhwmQ3Pff/FfT6r2fLbhKv?=
 =?us-ascii?Q?fQNIOEzAF/ZNP4fZQEWSKdskcahE0Sy9cgLfht5oSGE+I/H6jtUZGZhDycoX?=
 =?us-ascii?Q?pBftw3BIhCUDJuyfS9PgAvcwDm5NDaLQH5APAmJtjayBY5aIUwKy6xLDteKU?=
 =?us-ascii?Q?N1hq7+O5TorR4AGH/5f4mERDB1s7vXoVTmcWhcV0yKxnTjZr+doT7QCKlJmq?=
 =?us-ascii?Q?f7KeUZ2WESJCAfR24i68q49lFH+/iumMvFzWe9HP+j8kRznlx2GmVcaTXzPy?=
 =?us-ascii?Q?y0jcxiOql+3giZvBMWNx/SV8YYr8ugdWsqb0auS5KYN8p/vJ/ljDKDX9Dg5b?=
 =?us-ascii?Q?/uL/P9rEuGYtJ6CiKJL35nf7c+KLBKkRs1OJ4FG/NQCeX82aSeImOpSbQW4v?=
 =?us-ascii?Q?iq7WrQ/VZ2tpzti06Ps+gFnl0aogHQcXwAjQlC3fssmIxzM5NX9MTV8JjIYe?=
 =?us-ascii?Q?7bLhHvYQw8i7bkia4n5KM4/bLJRTB1x3FhbSVDVsgUHRocwnrkRRbvD+aqD+?=
 =?us-ascii?Q?OTfZRTW30HRLEBcJmqLhYbbslKM9gm2oF0js0gpCjiGtfxuYc6U/9XoKZjpl?=
 =?us-ascii?Q?HfFswP/kDdIoLGAsRGIXpzji79aCOPvCLBdqg2ZNIMeaUPkL8kv6Jc6+nPP0?=
 =?us-ascii?Q?WS7sXa+GLFFIkTadRsivzbIyoIP0SOnQz2zrRynbnn/+bMTdqqaI7f3rRR4p?=
 =?us-ascii?Q?lHW/lHEEkLyHaDYL9NMExVE6OZlA14W5sMoSCmhBdcAiNd8u1Ps+iYfomAwe?=
 =?us-ascii?Q?xn7PTPF9WBLVc4UMUE3+dlRs79aO9l6NVNJnevPeV3wadgVnv3+tWCeLkc5N?=
 =?us-ascii?Q?Ndwft9l/wcPSVAjTa/SMpoe/EWaY5yIfoVRwbSEiCHGaVI0ocYld/lmhROZ0?=
 =?us-ascii?Q?KSC6AoQMJu2ECws5gXP4BHlePHsrCjTWfadWa4T8bKm5xaipr5xevSogCoBE?=
 =?us-ascii?Q?urEFH0fQW23yfa2Q7bbPYtPPGI013clTSlymGWexzeMWzzQosS0Ozdcy/LlT?=
 =?us-ascii?Q?EDjYymSzBGAfthC9ASgCJqw4RnhGmRqji2JDPsjmeYS4icuuN4APgyBF73u3?=
 =?us-ascii?Q?Fwq0lsUGvI+93bLrlJCtQLU4+h8U2WKHSSGSD1CNBMuh/znAQpLnwhB5JpVh?=
 =?us-ascii?Q?LmLeQT1Us0A1xaqI7ashzTvF9xLnCZTZA7yFX09F8iCdgIYV83xV8CZfzcAo?=
 =?us-ascii?Q?TONOSw9W4wREAGZAsFQhSDvFQEcjy+ab9U+vw8Yc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f77f76-b308-401d-289c-08dda1a3b933
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 07:04:31.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5z5d+xFLDgJajRYrD+r9K2hCMw/+cUm07emv5QiKE8xLeJ3lX3EPchNh50Nh1EIA6HCRtYiMsQKjXVmL2t3xSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
X-Proofpoint-ORIG-GUID: XgXU5ZwpJa52PmKXhlB-UcEFzSAY0ipe
X-Authority-Analysis: v=2.4 cv=SpqQ6OO0 c=1 sm=1 tr=0 ts=683d4d02 cx=c_pps a=3w+TbvVJ0pkczneH0cxqQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=oipQQ5Rr0Rkjn5Io5H0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XgXU5ZwpJa52PmKXhlB-UcEFzSAY0ipe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1OSBTYWx0ZWRfX8qBfvwqgzWbv P2op5jPywvTU2rjDqz2zMTbmFc5OLNpTTFhlrNE559rdyhRNYwC53Ij7gUVa4NmAxY/sbMuH+Vn ZDc9gAFRVl/KF1wOakFmI1tw2AHdcZgjclV3InblhRCBT9G4N9t3FTWxHKiiprhmU2Fw8W6+E6l
 EwvpM5XXlk975N/CEvaQMs0mKjtubn3qI0y5iALxsiQ2C1kADzsPKov9TMCYQHV+nqMxdoV8uXI YhVXVlob9d1CQYxpUyGRGGh9deIp835nZNIO1ZTN6n5Xg1gErUom+HYSYxy22DBibFLj8Hp3vlm JWfKKrgGJLlJryyRb0bSsDbnAmj+P+0Wcny3mwTPb4jpSdnFC5Anky/K/OdLifyyY/oacRH9SIn
 HafNaT0v1QdH8Sg1Hb06m+YlTuUn9K8Mu9MGRj91VBmh65BGqFNulHbxdjFgzTh/inXWSOo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2506020059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 07:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117696

ChangeLog:
- auditctl: update io_uring operations table
- update syscall table for 6.15
- auditd.cron.5: Describe time-based log rotation setup
- auditd: Broadcast a warning on startup if a system halt is possible
- Fix audisp-remote segfault on connection error
- Improve locating last event if ausearch is using checkpointing
- af_unix plugin: fix string mode support
- Remove const from audit_rule_fieldpair_data &
  audit_rule_interfield_comp_data
- Add various updates to the experimental ids plugin
- Add glibc memory statistics to auditd state report

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-security/audit/{audit_4.0.3.bb => audit_4.0.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_4.0.3.bb => audit_4.0.4.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.3.bb b/meta-oe/recipes-security/audit/audit_4.0.4.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_4.0.3.bb
rename to meta-oe/recipes-security/audit/audit_4.0.4.bb
index 356ee6a84d..952a362698 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.3.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "51d154c5b7ec91831cbb89fe6ca54d8eb7ba344c"
+SRCREV = "81dcded2ed9e407dd1357eda0bdc0855f06085e6"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.34.1


