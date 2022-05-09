Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1BCC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 20:44:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.941.1652129071001079769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 13:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UO4P7EyS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2128e521d0=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 249JZbIr012637
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 May 2022 20:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=3yrn+zcTxAy6EXSRlMxRpYbpDYkbrtPE96oz1bmOV0M=;
 b=UO4P7EySC6y2SHxUnBaJzFPv8FMruVzv4y97PgFq1mdqKE/wdc4djoQGthl6I0vnh465
 CNJZbYOFK+cx+nhcMqSX1c5eMMQYc5XqNT2BVkSbwcYUn42r8g4e0npkCb9PAcL6RGwO
 4/YOGF/sVrkP6Iu6fcTJ4yv4CSSFzHokKeiTzRj0NPfGg1uwsNRieyvnkSDe1fh/FNpq
 CY82KeKpJp12vDTnTL/AgAtLF/hpn+xNQHEmdXFgeiVYhPqytpYJ5VSwVu8SPxl50MBi
 6Ep7xuhQ1lOIggd7N7AYIl+hx+6Tg3RR5PPjF4tTi0DvAlFSJadNC9Vb5uOY5u6kxyTU 2w==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwfr89n9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 20:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZc8d1Urc9xTEQb1vmbpjG53EVnxSUju2j8RUbDp/GJ6D1ER/qapFt8zQRSNO64tohcVo0gwfWZgPnjeWRyNiVvOMzHTzmS81Z7mbnSYTO5Q3AGwQz06C/iM4SLmMrDdp+NQtyFRaxKC22sfR292TEwaYhxdKV7I8GE3uz+N0GWPwvombLOXnq2qFS9UxqEJUnIlK5JbsH1+cWOQuk4VDuxyGT6v+oRDy/XMa8HwhbpdYRg7jsNedrDgcd6Ky6zSmyMd2dxa2n9Cly0q0paBDLM592oEKu/kPahwNtaq0NtS2bJiSg784GRaCOSq/LrTRMqYduWdm33eTcjMEZIntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yrn+zcTxAy6EXSRlMxRpYbpDYkbrtPE96oz1bmOV0M=;
 b=S+J/+M2de1yCePYeLz+rXr/HSbhMauHfbwocFjRTdXbQreVmVB6zfiIgbPnUS+k98vDw2RC2tZJB1zP7U1uyBTxQHxeiqxkrtACcwaLrfYj01y8XLXbrJ7n46EdnygFQ6eABjQn1nWje1nRt7mbU+yIt2IzkROXI0GatdGGf6RigbSEU3+UmT93OjzTSr8Kwm/pCRdSqJraL/HPR/2LQVhC3XOAY8DAGnYKraCTNDV6AZC72WBuqTjMRF4KwINLda4x2lO1ROOS8QGeYEdWrqN5eWFaQCW/SgaDxTXWO27cbn8mV0NSefFzqvagU+vlPuHzygcCyxOshwA3JHGc4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by CY4PR11MB1960.namprd11.prod.outlook.com (2603:10b6:903:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 20:44:27 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::b854:f057:e8f9:f3cf]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::b854:f057:e8f9:f3cf%9]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 20:44:27 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] intel-speed-select: Add libnl dependency and extend
 CFLAGS
Date: Mon,  9 May 2022 16:43:53 -0400
Message-Id: <20220509204353.9804-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::28) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 371daa92-ceda-440b-38f9-08da31fcb575
X-MS-TrafficTypeDiagnostic: CY4PR11MB1960:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB196086C0D65F479223E62F25EBC69@CY4PR11MB1960.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N70hMq4W1XAAF93QUhfvgsU+nlVvskfhl/olydbRBudo6XiX8Np5GFBrJTVxNs55tQAhLmhl0DYNikhxq5OfpqaIgPB2LXS1+Y1HWErsp1J2JyvZaVoFUvA/q7K0fp8EUfRKRr95PJXaLde98FrrCw+WTjbuDvdeDqwYDJDoiGcSqW0UQF+y09lxa8wSX/RD23g+Ac5wW48m8zd+Y5CcboJX7uI9voTOEE1Au9kdvTZ/gkRoCHidICGl0aZFhTSasCnPBnshG304HphRaBA4lqVvTdHruy6KSXCORvYga1IDl7sVvtBSsXeNE5W4wUyDf2iXZCgyNybMQMsP3H1z9xjPkKaCoVt4442H4iiY7/dK2iBAoIWVx5RttaubdM7WYIeNglIPs3DpHXRuD4tY6p0QDoY6iyUS6GMKFmvaf1i5EGdkq2SZUerGf8yW+T5uK2Gzx8ys26U6ovLqn2fX818xM8hhNXI1phzzWorjBQG8WCVkg8fMdLk2NeGWR4ZeSKr0FK/3IIWHgHcqbVUCKLF5Z5Xp8EYpRALpdZEzsfxFabsYsXaZQvvlWJemOaGxnFBbZWPgkJkyd0lm0eVrJdfETq8aALG+Msx2SgZv0ZHFvK8ufIGFLSrZ2tHiAG5hYYtrl4QM5QFxjvECOhG46KnMq4XCLzlVWzDDhozsrTdm1Lych1BPvjt3aVw72+jcdeqTGrtJg8GEE7msVh6QEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6666004)(2906002)(2616005)(1076003)(6512007)(26005)(44832011)(36756003)(508600001)(5660300002)(6486002)(8936002)(38350700002)(38100700002)(86362001)(66556008)(66476007)(6916009)(66946007)(8676002)(52116002)(6506007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cx0vFYp0JaDTuAMDa74EikAsiLwkbK+VFAneSyz7ATAEgWxPIpoBEvIww8op?=
 =?us-ascii?Q?fwwhPgYrQ/UwkWfja8BJ7K7rHavhJIWa3e2HwtlPV63SJs0JP0SJ/Pgw50E6?=
 =?us-ascii?Q?V3A6rAhLqvG5Z4INBlLN4KC4+LmSypkj4TRbfcYaMpuosffLDUtufPwAreQk?=
 =?us-ascii?Q?q5Qlf3roPLNRqN8NVy2ueUlLfj50vjxHhgQE38zf5Y1DWU0o32u2mexNmcvu?=
 =?us-ascii?Q?aDkjPO3U8ZN84mJBQEGTIutUJYQLPa2Rixb2JqoI6++dEXGuDfHEABZLXKWJ?=
 =?us-ascii?Q?/Yr83Kf46Lp4ixOjC98/VRifUjOX2ufCq16YnkthF61s4HzZU9aayBlFAkAY?=
 =?us-ascii?Q?GGJBF54WpkfWysZBGsBLvVbv2aaDnXd12xRW0a/z7EWz28RJim4KVB7oPBHK?=
 =?us-ascii?Q?VdoRJm1mw9Z7fPdSk9C/Pgojyg3zwSPYK0iuTkxZs6KU/9PCFFQttbdiDFEl?=
 =?us-ascii?Q?Uvb5R9m14jU/u7KTdqcCdPNvRpipzzITrR38YEiPBt0SxetIHKibzrFmCkbC?=
 =?us-ascii?Q?va9kNUmkWsbgwG7dUCb6Wirto6vQPqQ0M/6fXoI9ACmyFgqHx7JNg+pOR7HT?=
 =?us-ascii?Q?TCWgT0LF2yDMZW81RaOcJjIz3GRn0JwO7eAo7w4pBksY7mgbYESGwTSD0qwF?=
 =?us-ascii?Q?Ze5yHgB6DtpEhVFsmQihLcqrU98z0UcZeHH65NrWpNVJgrCnWFIQ1p151HDa?=
 =?us-ascii?Q?Bc7ImV82fhRwL1m1rCuxp/0WSVRCWOhPh0aRCAj9vUDi8t5mtnwL0Nst6HX+?=
 =?us-ascii?Q?DGJ22OwC0ncjkbjFrPrqmOS7PNwzHFKFVIJVq95zzV9dqDlTm3S1Tu0RuYCI?=
 =?us-ascii?Q?SfXUL4LA2wTQP38YH4K+3q9Whjd9aG/awrnJlaYLQ85knCQxty+sP5l+lIBt?=
 =?us-ascii?Q?QsR+WIFKNHUdQjxEfLVx9sqd9Y7+vnlvi6deCaGjRm5ADMg+3vQ5sgO8aD47?=
 =?us-ascii?Q?4MzZSWa3wf2DxrA+grWO55Xt0i1YtA3T+UHUQC00UWSc9jWTpoSAVNAT94Ye?=
 =?us-ascii?Q?9VUxQH9yM4ADZl1N4+u5pGHSNDp7stL3Kl+L59goiGCfl4xcjGPRA1zuNKls?=
 =?us-ascii?Q?BYKbGga/uMnn4Be4BKL4kjZ+cLuFiV6CcKW+XeMV0EGlWdjnj7BXuq6T/R2E?=
 =?us-ascii?Q?sm6IkJa5hxxnfRbv9qhTnZhd3xxT1ahEiJBDeH3LJVmc2H4Fd81P6Rv86sp9?=
 =?us-ascii?Q?EuPXV3kS/SwB7fH+WvetviiGvDAoxWnSd+g6zXBS+MIPIuS5P8qNmfbGO9A5?=
 =?us-ascii?Q?XRmEE8Am86TRZLswHD8eCMXO9m/Ckf5cw5bVU/gQpUNIf6Nkmw7WnwykRETl?=
 =?us-ascii?Q?Lvd3fJrqBdJjdeZITXrNJpkAEKDZ8SA9F3y0s09FhamAvssXDLXWknWl9TFf?=
 =?us-ascii?Q?BSalKZ/fqTBID8yxf/JUqei2DBOt/ZbYaMC7LO3q6T2kQTQxU2h6hH26TtvI?=
 =?us-ascii?Q?RccOR6r0zDKrIBYVd1cRf+adPpwWiwMEQ8hVWxSAwbkW+BmE402JOjywxR7l?=
 =?us-ascii?Q?rP4UL9+iDaa2/iEZDeJdmFFWaGjIT0rMwqCiLwpxurj9r7Y+rLb74D1PUJqk?=
 =?us-ascii?Q?6MD0QMm7AKISv3wV40nxyKaBuddmajbM0LlRoGF0K+C7dxKb2OwAMIjq9WhI?=
 =?us-ascii?Q?y93PIi0tFxyOFg+n9Z3SqLtLXHr/s7lVDh6Jjg4lqt2P6sXj6TbhvSaFyMYz?=
 =?us-ascii?Q?AMsAXe0/H5qox1IN9PGVrhXpVhEPoH7gbndmy6/QOsoYXqYF2QqTr4HquhUa?=
 =?us-ascii?Q?FE0+iNWTBG+hHRePUrAn+b3ym5OVn6k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 371daa92-ceda-440b-38f9-08da31fcb575
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 20:44:27.5049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CEXWZXzCiMesZ58aF/WAGGb70MfQRnzyLFRq/iPnop9D0omv0TxOxF2NvK4qB5/+586OO+QvhVdppIshCQ5O9z7rtfQzE2sKyf+vPp9QHT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1960
X-Proofpoint-ORIG-GUID: ohlhXld4ddh2Swv75hh7ZGChcGdN_cgU
X-Proofpoint-GUID: ohlhXld4ddh2Swv75hh7ZGChcGdN_cgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_05,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=424 lowpriorityscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 20:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97021

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Add libnl dependency and extend CFLAGS to include the libnl3 directory.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
---
 .../recipes-kernel/intel-speed-select/intel-speed-select.bb    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
index c895e6c1d..23ea0d8aa 100644
--- a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
+++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
@@ -11,10 +11,13 @@ inherit kernelsrc
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
 
+DEPENDS = "libnl"
+
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
 B = "${WORKDIR}/${BPN}-${PV}"
 
+CFLAGS += "-I${STAGING_INCDIR}/libnl3"
 EXTRA_OEMAKE = "-C ${S}/tools/power/x86/intel-speed-select O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.33.0


