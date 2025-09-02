Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FE0CA100F
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:44:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.71870.1756799092719225231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=INxL2tRc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=134031fe91=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5826N1YE2421652
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 00:44:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=cllSdQpD+cwC7NFWi1kGchpDBBrcvZ+1vh35ts/sKwE=; b=INxL2tRcwluG
	r3CWcXojkMV3s2g+ENqUnP2Y+MpYcqFqAtpJH/jbYXB2l1+2Wz7FbmEf5Lr5f0b0
	TeXSTc+dxeW2s5XLRd30uSnhG13XxzuDmy/3TCpMrmSLdXk8JUNtP39DxqZ/j7QB
	coKq4Nvv+zo2ch21NQBBWUBEfyxSFaxRBv3Djn2Jvo4jYqmt5BAVnqj80hBIr7qj
	CcLWEEfz3XCh0SsVOcEEU0HVX/x29eGwPKrTHibkPsOIW3zkbTf9JmMs5YrdY0M7
	p2B51jkGFmyWx7BE2Qr4hcH872daXGkqiPYe4CNio2n5M8rbYGkBWKMW9jkt0QkQ
	NM65TAI+Ow==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48uvjyt92e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 00:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbGBhSYoPNcyzEoYcjytU6kO0+m4fVTRpnKsMSoAlMTyc39Qf+BteRI22rjx4Flk3tXbm6cpY3JHG1UszfRZHiFONtZOegSYe7AFD08B5SU1OnlsByfkDzwZpvaj5HSr1brHL+Ij9UycOA5a0WmSAwEAJRO7skjdtExq+ulG8V4qaUwnlynQ2MjUsPa6EzA4w+gHlxQGDdmutwe6041HvHFsUIjO+6VmlsPWJ+Sn0rO6hzVEzrt6zRRkvLJENoaR9VYOQoI/AR8XlkyA/QcEcT6psXRZ2O9EF13OCIbCZnGGYrproZH61xiZx9ER+nUm4Y9eG2ZNgEV3dr7BAsdxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cllSdQpD+cwC7NFWi1kGchpDBBrcvZ+1vh35ts/sKwE=;
 b=P4d4gtY1u/zeMBR1DRMHS1XpIAwLrmwOnzRH/N/NerfGB6WA7EMeNm2GT5tLYmQBqsqryldl/MTXothuQJFvVjEhqkQVSE2iSc3Af2+L7LzBqbJfcVkDPDcJIelR/R8ZxSjt/u/lYg/Fg5sNPNiV/Ee7V9Dc2QDOBYCSawJXsKshI7m4Hzsxu9A1Tt3xTu+YljyJNu/SQyifGLqYTacX7gtx9WHw1NcdAm1oYtSB+koDaBtN4RH/0oVSJQlRkF2QP3wJ5lyJjeBFUkFkzPP+m+nQAlC/T8RIICqqF6JYvjMN8J80ekCP0yVXWzQdigYWfj7EInw+zGrJEOtzQc/9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:44:50 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 07:44:50 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/7] gnuplot: fix CVE-2025-31178
Date: Tue,  2 Sep 2025 15:44:29 +0800
Message-ID: <20250902074432.1068537-4-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
References: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa6be15-267f-4c8a-a49c-08dde9f498a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7BK0vdqatASImxYCdnu+1X2GN2l46raSZcl3KO9NseaBcTl8f0dcGCXB/OxV?=
 =?us-ascii?Q?GzM9w3Hqi8sTruN1b7nsnpv5vn6/AM7PnlT36XpsLgwqaM1YScZhCmCsMRZd?=
 =?us-ascii?Q?MWGGBoRkFGeW9hOEjD9V4FmsOVMzUlaC5J2KYdshnnMBckIIC1j/SXWZcWwh?=
 =?us-ascii?Q?IiRcRzL/oIebHUAN3xl3XD+aPpy0KiTovhwx71PSCvr5eRJIcRsybdltGjMQ?=
 =?us-ascii?Q?Y4F6qulOy1EKdHiJERm126lTBDUbaqZvVXWm/Pm2v0nTudD6KnfT9u10fT+r?=
 =?us-ascii?Q?2qF7jFtQ4BiDmsivSJc2ftUUlSsJX8U1NTmznzrhnDJkxlE7GEQMey/LUu1x?=
 =?us-ascii?Q?/EppUuV3lFFz160xxx//4a4C1HSG3uvDKHLzKPxn49azsBcMjomamsUF9AhO?=
 =?us-ascii?Q?Kqt6ZBijAl4wjoYAjL3PjJd+ZnsU/TT7vF3PP3xxsQbqLsUbM4XmoYSAY8q6?=
 =?us-ascii?Q?IT2lPm5dh3NC4UcxsHg6Pf1g4My69lGny+Rm03rAVhy8GC1+GOAlMMx4nN4i?=
 =?us-ascii?Q?Rp6g1YPqXcfzCq91Es/8u9xQlm1KY+QbSHyCsVw0+FXCetwJh5B7wD3DVDAG?=
 =?us-ascii?Q?TUZgjWfCSRkpjTvDhBIEv4XJn7hhC9RZKFVzUPOqAQVA+IJ/FLeJH4dKF5Xy?=
 =?us-ascii?Q?DxQfSdgK2eapcssg/QvXwFyAujHP7TwTcFopsVqT8SxTfQGhLZErr+EFlxeL?=
 =?us-ascii?Q?EQu+JG9XtIP24+bk3Oz/hnv+q3pUc3L0Vw9ZxaCqwdKK+PNk6seX+4oEW02n?=
 =?us-ascii?Q?2R5JwyARM9lgabxj1A84XFCc1h1k5aCZsHu0GrPkRY07ucugWHWst2po1zbZ?=
 =?us-ascii?Q?XIRaDQRMPlOkdyKcwAWAd43CimqPINVLW06DFGZvnyTo9TtnwgbY+238WIAe?=
 =?us-ascii?Q?pXwTUs76zcHgLy15hNv3xXgdAvsPvUImzaO71scLXsdw2agWCkevGH+Yf27p?=
 =?us-ascii?Q?G6BXPydczzmb0GqvGGYKFvfiiCBy8mxO+sXLuBa6abxWu+0VrY2ClOqNQ2Hf?=
 =?us-ascii?Q?tg0YLcxLt7SCiTXU8SZLhvPhophx2owg5Ed/baSpFE0A1URCj52mrok/qe2o?=
 =?us-ascii?Q?pZaAlpuSew6ZNXy9m5nLjnfiYItN3/Gk4vlJ9nbjhWBMmC+fr7xVMoUzLGus?=
 =?us-ascii?Q?p3pn5A/6mBdz4f6gtBH+7bMHmfDOzSqAB3loW94C8dvsBIo2jIbL+1K8huTP?=
 =?us-ascii?Q?tIe+2y7RmjeAfAa8jVujhyHxrJfn06VP7d6Z9csbO4xTTyMNcMyGL7hLQRqv?=
 =?us-ascii?Q?drfVldADMYftf0yJUif6SlRYedXzXtOREdH+N9273DPiPK9yCrJRz7KtIAGc?=
 =?us-ascii?Q?z+EdSKCEgolPHqReXcDTDtk3NhunDFXNPPn467u1JxqTHP48jiYHWExSpLln?=
 =?us-ascii?Q?bGFevkylDGsZ5Bim7VaTmgfrzAlctYv2WprIhOxPO8ca07OTffQ5KH7jfvgg?=
 =?us-ascii?Q?fKKUd5tR5dkaxuEF/uz4pxtdcoA74XqV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6OKcqNFdAl7380J6UnZoyt9gZXed1mMAPKzjKWXZKTJCL8xq1JP6lvp8A+uK?=
 =?us-ascii?Q?7mksIKV62Hk2t6VMaBBdOP/yXeBEyda7TNR1I4dMETghVlwOeUcK7KUXU/G1?=
 =?us-ascii?Q?6YMZetVLOGywDn2F+KebYx8iUqcfVMDZ52PErSDs+7GHK+SF7wWiV86afIMy?=
 =?us-ascii?Q?8Zt95SdTQIC8szWOP4vhDzVr8y+zR2qxVpVVCgzxZDKC19TBpR6NDxD70JhI?=
 =?us-ascii?Q?ej+cEhm1iIiByAulhYgxZr2yROyTufH+5a/bXq/eyD9w54kBDSsrCS6VR1pI?=
 =?us-ascii?Q?4avYSfPpeNJqBrR24Jtib1yJc6bzRKjm3DWPObRXkQEq/hiDILbZAS4oTv+t?=
 =?us-ascii?Q?2qrbL04b0RwDGDLjVuM4jpf+YvLZcYLoq0xY1YkvbiCVNdmKmd6UlHRAVGmn?=
 =?us-ascii?Q?Qh2eeNmE2UYyGOhE3bOo2Y5o/D9XsOjmCSlQj0DmpPfo7rSPzmc4xxsX9/GX?=
 =?us-ascii?Q?Wc+i2xDJ9OQ3VDTa0RnK8V7VpJpVtOUbIZYvZ9NPQ8OrQXFa5l11kT9UY7Tz?=
 =?us-ascii?Q?/Zmy+y6pBakUWjhfX6bu7EEPsZBRA3Yx5EzbZp0al5XIj/Z/OPrmi/rXIcjJ?=
 =?us-ascii?Q?eRqw6seYSGnIllSaPN1PgVtzbBfYVPEoMFKLowx8uTO5lKyTwA5PsaFWMowa?=
 =?us-ascii?Q?mQMhfIs36mg42PKk7Jor5TGBKMF5pFzByLZWAPrDuv1BFTT1MPO24QfWfi6q?=
 =?us-ascii?Q?Wex23uNafg1oZrEmgIKvhuddCLWjuT6k2OdX5ztzJMEX4h74s9wAdc7xXjn8?=
 =?us-ascii?Q?fMMLHqqJ3O26V9yweHU3YCBRhR5bggb6ay9yzOB+gT9oWTnIXFuWRGw4EqeT?=
 =?us-ascii?Q?QwH0qTIXDvz+ZJuRv4je4+0LUNaJb2/QmNCx/ctjqIE/8JwFxMtReZpN2vBw?=
 =?us-ascii?Q?8hDnsEuGPqw/mIn1+AJluXWgxR/9b+6r1yeRJBEdfIOALKZslIIGsY6eeYvg?=
 =?us-ascii?Q?Oj4PoUz5ljSAKMw6DAdLnFZzwi2KHZOrC4zZ/EDl7HvO+yCcNWIefCGnywbf?=
 =?us-ascii?Q?Iwe93kLj0gmhFjSa+4wnkmAoGN9UxGg2HV2UFopTk57Ze2IYNbpWq+n9l5uD?=
 =?us-ascii?Q?mUeOldUwfr+hDAj9izTSC38syGiFK9hAtMSCRZb5thZ8wQmrpFv5eHdFBdi+?=
 =?us-ascii?Q?FT5BOb95NjkCX0kDS6syTwxorF+K3WkfUDpxs2vPu9DW275jwU9lXv1eGvT9?=
 =?us-ascii?Q?f647HphwExHEqdRfE1cwtENKE4gNr8bxT68tYl2nEk435raH8EPeRSDPWw/u?=
 =?us-ascii?Q?HuZToH1LIkTbLZQJp0x+htTq2P00QzxBfeMNHiSWgdLrpOpXGFTirDxc0XEc?=
 =?us-ascii?Q?fwWaYbI3U2v12eViJ6W0v9tVm8Nt1h+dSasHPJTzlyPS9ZQ8gP0IZybyknzM?=
 =?us-ascii?Q?ra5QgPCYk9X+wacI4oAbpgr90PSEcYliF2aAhdVPiTm/SsuvJE+B27Ldhcvo?=
 =?us-ascii?Q?RhR8ipLtZhGDa+mEJJmjLk5TiAGWgakJ0PnuF0Q8ZQRik/iQQoHOz4M8jCYg?=
 =?us-ascii?Q?soHLjG9U8LcbdGklZvV83reTiXrNrrkkCiVnNuBNq49el7e/HnqztJDj1r0w?=
 =?us-ascii?Q?eVjZdYTwH9LhTY1hGr7kBvWE7vGT0ClR7KhkKKWATmlDowmBP1laYQbPFvNQ?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa6be15-267f-4c8a-a49c-08dde9f498a8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:44:50.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgrmWJZmH7TUeBec1V5J5kxjv4OMP7kSCVUaTzCnpydA0nH/fhGTKzNDaHI6AmDritbQW3L/vjjCQ1O+f5E+f0C8z/JuRrG1Ri+bEOUd89w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68b6a074 cx=c_pps
 a=B1juiKOSPdvfexZtvkw8XQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=CEfKEDxt_uDj1WFZ_n0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TlUyxevrbO18Ukud_tbsUOB_JY0PXv1i
X-Proofpoint-ORIG-GUID: TlUyxevrbO18Ukud_tbsUOB_JY0PXv1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA3NiBTYWx0ZWRfXxqLQ2iKKaSOE
 JejABSZml2AdK+2YXhsnrPA5gURNSPye52tDuW8VIPPGPYt3JwFyXApprBnDKTpkc6gE5VETAaj
 5+ycQNbAC4TLii8+fiyPvJKVyyPYH2YJmpDlHsidh7ZRXfAgQ2lvMhvmLUPhGFFKHEasFHYQAUn
 9iH5mc7uI10lMoIBIlTZdFB0a/bBUqnIcFrFS91DkAuoI5iq/EgInqQ5YIeZhpDyYCYPB98pvVu
 b7eNv5Vmd6/4eVHu2/yWaR06TfcIlorQb9ktWDG6gKoOihMBQtnaaguSHJFNo77xEYv3cCStgys
 5oaL9JUy3/cHBxQjiIb6Dv+2tfIRVRWWL0vxygrYXerTRiV9zUi8f8vZ9dM5AA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119172

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-31178:
A flaw was found in gnuplot. The GetAnnotateString() function may lead to a
segmentation fault and cause a system crash.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-31178]

Upstream patches:
[https://sourceforge.net/p/gnuplot/gnuplot-main/ci/b78cc829a18e9436daaa859c96f3970157f3171e/]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnuplot/gnuplot/CVE-2025-31178.patch      | 95 +++++++++++++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31178.patch

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31178.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31178.patch
new file mode 100644
index 0000000000..c783d75180
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31178.patch
@@ -0,0 +1,95 @@
+From c625576a4e086f8e3ad6f23559052494465722c6 Mon Sep 17 00:00:00 2001
+From: Ethan A Merritt <merritt@u.washington.edu>
+Date: Tue, 14 Jan 2025 21:23:19 -0800
+Subject: [PATCH] use snprintf to protect against garbage user-supplied mouse
+ format
+
+Bug 2754
+
+CVE: CVE-2025-31178
+Upstream-Status: Backport [https://sourceforge.net/p/gnuplot/gnuplot-main/ci/b78cc829a18e9436daaa859c96f3970157f3171e/]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/mouse.c | 19 +++++++++----------
+ 1 file changed, 9 insertions(+), 10 deletions(-)
+
+diff --git a/src/mouse.c b/src/mouse.c
+index ef8f14d71..1571144ce 100644
+--- a/src/mouse.c
++++ b/src/mouse.c
+@@ -168,7 +168,7 @@ static void alert(void);
+ static void MousePosToGraphPosReal(int xx, int yy, double *x, double *y, double *x2, double *y2);
+ static char *xy_format(void);
+ static char *zoombox_format(void);
+-static char *GetAnnotateString(char *s, double x, double y, int mode, char *fmt);
++static char *GetAnnotateString(char *s, size_t len, double x, double y, int mode, char *fmt);
+ static char *xDateTimeFormat(double x, char *b, int mode);
+ static void GetRulerString(char *p, double x, double y);
+ static void apply_zoom(struct t_zoom * z);
+@@ -418,7 +418,7 @@ zoombox_format()
+ /* formats the information for an annotation (middle mouse button clicked)
+  */
+ static char *
+-GetAnnotateString(char *s, double x, double y, int mode, char *fmt)
++GetAnnotateString(char *s, size_t len, double x, double y, int mode, char *fmt)
+ {
+     if (axis_array[FIRST_X_AXIS].datatype == DT_DMS
+     ||  axis_array[FIRST_Y_AXIS].datatype == DT_DMS) {
+@@ -473,11 +473,11 @@ GetAnnotateString(char *s, double x, double y, int mode, char *fmt)
+ 	    r = rmin + x/cos(phi);
+ 
+ 	if (fmt)
+-	    sprintf(s, fmt, theta, r);
++	    snprintf(s, len, fmt, theta, r);
+ 	else
+ 	    sprintf(s, "theta: %.1f%s  r: %g", theta, degree_sign, r);
+     } else if ((mode == MOUSE_COORDINATES_ALT) && fmt) {
+-	sprintf(s, fmt, x, y);	/* user defined format */
++	snprintf(s, len, fmt, x, y);	/* user defined format */
+     } else if (mode == MOUSE_COORDINATES_FUNCTION) {
+ 	/* EXPERIMENTAL !!! */
+ 	t_value original_x, original_y;
+@@ -500,7 +500,7 @@ GetAnnotateString(char *s, double x, double y, int mode, char *fmt)
+ 	gpfree_string(&readout);
+     } else {
+ 	/* Default format ("set mouse mouseformat" is not active) */
+-	sprintf(s, xy_format(), x, y);	/* usual x,y values */
++	snprintf(s, len, xy_format(), x, y);	/* usual x,y values */
+     }
+     return s + strlen(s);
+ }
+@@ -886,10 +886,10 @@ UpdateStatuslineWithMouseSetting(mouse_setting_t * ms)
+ 	strcat(format, ms->fmt);
+ 	strcat(format, ", ");
+ 	strcat(format, ms->fmt);
+-	sprintf(s0, format, surface_rot_x, surface_rot_z, surface_scale, surface_zscale);
++	snprintf(s0, 255, format, surface_rot_x, surface_rot_z, surface_scale, surface_zscale);
+     } else if (!TICS_ON(axis_array[SECOND_X_AXIS].ticmode) && !TICS_ON(axis_array[SECOND_Y_AXIS].ticmode)) {
+ 	/* only first X and Y axis are in use */
+-	sp = GetAnnotateString(s0, real_x, real_y, mouse_mode, mouse_alt_string);
++	sp = GetAnnotateString(s0, 255, real_x, real_y, mouse_mode, mouse_alt_string);
+ 	if (ruler.on)
+ 	    GetRulerString(sp, real_x, real_y);
+     } else {
+@@ -2116,7 +2116,7 @@ event_buttonrelease(struct gp_event_t *ge)
+ 	     * only place, if the user didn't drag (rotate) the plot */
+ 
+ 	    if (!is_3d_plot || !motion) {
+-		GetAnnotateString(s0, real_x, real_y, mouse_mode, mouse_alt_string);
++		GetAnnotateString(s0, 255, real_x, real_y, mouse_mode, mouse_alt_string);
+ 		term->set_clipboard(s0);
+ 		if (display_ipc_commands()) {
+ 		    fprintf(stderr, "put `%s' to clipboard.\n", s0);
+@@ -2129,8 +2129,7 @@ event_buttonrelease(struct gp_event_t *ge)
+ 	     * only done if the user didn't drag (scale) the plot */
+ 
+ 	    if (!is_3d_plot || !motion) {
+-
+-		GetAnnotateString(s0, real_x, real_y, mouse_mode, mouse_alt_string);
++		GetAnnotateString(s0, 255, real_x, real_y, mouse_mode, mouse_alt_string);
+ 		if (mouse_setting.label) {
+ 		    if (modifier_mask & Mod_Ctrl) {
+ 			remove_label(mouse_x, mouse_y);
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index 18f98aa503..7dfe4b6657 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
            file://CVE-2025-3359.patch \
            file://CVE-2025-31176.patch \
            file://CVE-2025-31177.patch \
+           file://CVE-2025-31178.patch \
            "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
-- 
2.50.0


