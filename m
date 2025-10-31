Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7438CCF9FF
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 09:15:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10981.1761902099253796845
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 02:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lkm7LjMN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33994cc233=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V4Cd9B2338908
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 02:14:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/R5by4YZGavmpBX0463u
	IfoID27x5aSACnW9KfEx6zc=; b=lkm7LjMNc7b1ow6ksTu8VPoloRIEyIS1wTo5
	lt1OaCyk6NgKNlFpp3x2PVmACAsd+GIh5jmxzUDpIzsvWZno0q1L2999JD7bgau8
	Y7z8z0p3eLPuE2oS5YPNrfO+6TIFB2V+oQcKiZwW22TJrVpTiES3jmE+gEuoxpF9
	OfsinA3lvF03U7HQZBBjndWqvbbpbdKaR1DGpENxuO/HDmrk3Avwupgy12VfkKtm
	5UyShLk0agn2Rt64Tm973zPDKXRPAdFz5GbrvVbNU63k6oUf4WTkeDb4oFfX9myx
	hrtCx1EBdOZ1MMG010abbCTUVpe47cKV83ay9H8y7YIT/E9HrA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012065.outbound.protection.outlook.com [40.107.209.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3wa1sqbe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 02:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8ong53NMWI+xzTk+j0TvZNghwIQyANP8lV2zPcbcXIhq/RZ9ceoNNXt3fok4tCd8CiusBmp1IJ+Hghnqw6WOCtmS069pTyWRNyhMB9dkPMiSpue7LzLt+vWbRZ+hl7OV4XrAfvCQ3M2V8uJLkG7ipYDzu2ZN6HdAonDpmXz0srb3SYFPnr1CmFJerlQ31OteJu3q4rmTknHTxpKsEYgztFw4zpSB7aCUn9dqiIvkBMEMG7N3zng+L9g7ADBtqne/zpzdkDmNNkDeuK1AgyNlFqzmpc4Q8UjMfW7fvrzRaKxtr6RQK7uUXerbwsjwIFwPz6udxnaEXBJ8eSq2SUViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/R5by4YZGavmpBX0463uIfoID27x5aSACnW9KfEx6zc=;
 b=vV1MoI+geqljJpspoNwQVeh77xfqR9c9xYF4xeePFldpDf2mYbIT1Mv7NjaH6rcHkZmkDDVIXjEYBNsXwqeWKbBW6gPdANw6Y9eME83Cu+mTGODBHUKouY7cTmgOUL+F7V/LMo/r4ehkx3Zjnb6FqonQWfQJ8KYty0cdxhIVmh9x4cmZaWi49VZMwJECGdWLCz+d3vdx0OGxVu0ke5jkQaxyrMBIHZTBAn1powqOsxc7evmXvOzsVQQqmRn5WePakY0zSAqbXbu1mN+MmaeBY5ZZdo+ArGc4xpb+MzzuhOQW3JSFpc3RPab7XGu7AnYY0WWgWoIlsmVCQ7T/gL0XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:14:55 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:14:55 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] opensc: fix CVE-2023-5992
Date: Fri, 31 Oct 2025 17:14:45 +0800
Message-ID: <20251031091445.2662463-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0302.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: c71d0e2a-4e44-40d6-96b0-08de185df4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CKjpPIxapwGr+IrzKaWLX53YIBqvGd4JoiLegibeKEWVCKVVB+guuXhWX2Ru?=
 =?us-ascii?Q?YffKMFXV77vk45SQAPsr7nJu6HJQmPxMx+WAyEeAmdpGfVRznHotQFEO6vRX?=
 =?us-ascii?Q?S1kKXh/wS9TlhA0Rp2O2Nq4+b9XcPq9SZezxdYwDmjN0eErKgahc64QsC7rd?=
 =?us-ascii?Q?JvCe4rvgmlk0zVMFBZxNezoty/X+63QABfGgAz0IwG6nWV3eVGXsUe6udByO?=
 =?us-ascii?Q?+Z3uL9smj+S4C/DtBLgS/xAmPZ2zaVtsBnAUuiPhENqg255e1r2r7o8QhvDH?=
 =?us-ascii?Q?2v9GAC6srGm8f8h3XxB7km1fKBsH/7NYjTrstuHaOyCYrmbuqHX2a6smR2U7?=
 =?us-ascii?Q?BmU7rnNI59sxTkU6h5SlNPowNUb7AHbpbiiujO6iaV0fg5wfMwTy4PmcsRmV?=
 =?us-ascii?Q?VFeZczUfyFpSnEmHUPGcmP+ZBZVsKEnSQWKK6B4zGkfoxgWKjYl2QaggIpXM?=
 =?us-ascii?Q?siX8KCmxYkFS0/JQJtGcWHEw+PcATuJAWOuOK1GpsPsl3toK9D7+4j4tRTED?=
 =?us-ascii?Q?iSK0yX/Ppckd0U459IC0aYrX7ejieI7rcUTRwpVeRZJZxTY0JmzbDseKc8Ul?=
 =?us-ascii?Q?bmAwxgCTpRzKJScAvtme+NntGLJSvE8JSQ33X79tJF3i3lrlN8RQPz1MnbTy?=
 =?us-ascii?Q?M6JsdgwhUgnaoECewB5Zmy2OLZCgvLiGVtXe6YurfVXuEHWycajmix7Huqrt?=
 =?us-ascii?Q?wxC3BkksXI9tkNa16g82PQGgvpl7WIjkkE0bgRwfpwg/kQtRZdHy9vEp6bC9?=
 =?us-ascii?Q?L3+4sGfNnyLCHOmbSF+uo6CXSPEaTSsoPAp8dLomFEqohLy7kRf8S7QUe9nO?=
 =?us-ascii?Q?kZACmE5S+Nsh43Q2eaLXSvxSbdVtvOlLTOevy43qlxkVblpDcmXTGgthuZgM?=
 =?us-ascii?Q?SOdS19+TjaQVuCoh8uqbtjAjBMyPwVCN64EG/AspUecO/S/Gh0cEKuwy/NPR?=
 =?us-ascii?Q?nqmE67Z2g1xTzA15pqIhN0SZ9fwrTV9/ZsbsiDaDoE9QF8CAxNSVC0c9jbP7?=
 =?us-ascii?Q?UnUEsyPvmRXF+d21YfYNZRNEO8sUhudnheH9qFYiIuRnj0mQdBIG3i2UqAid?=
 =?us-ascii?Q?esjgG8GWYqD8KNVXydeuBg0Bxfjq/mLjCnF/Qh6b2ZnnlOhOnTIcQuCl0dCG?=
 =?us-ascii?Q?xlCpk9R2owqF6ckmptR27ODER//dS3TBqKTxaITzGjE43XwytOYUz4aFv860?=
 =?us-ascii?Q?3BPdOe1FHVktNUwACqjhPYMAW2xp4ggWexDZmdzWWoNVpzab07Bh6w0XDANY?=
 =?us-ascii?Q?OTPcbl8au9SWPM1lpHymi+S5UKrFTkBnU83UWQVcoL9/s88uwbZrw6XDMSHt?=
 =?us-ascii?Q?v+kLDI46BRGoPGRBhIOsxVnGsVBLRqQZpS0BOS0k5gXtFU0wlHrK5lTcWAsh?=
 =?us-ascii?Q?bM9MHu9sSnz39MSy0HAqXt2Tc103L1qYCiS+INwWOOZpgUDJY7bp5tz8q+Ws?=
 =?us-ascii?Q?ivmI5MBgtObhMntjjJQGheCER/A57lDNFWTm5nf1zKG8w3Ao7hkGdqIrDDrU?=
 =?us-ascii?Q?vENIPI7EyQI7bRo4sGKBV6/d3sCBM2/b1EdfzJVufOT/y8e46vvMre81VQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GdxUkhlbK+LjLH0MsdYHMpFZctbI0xkjnQYN8qukbeDr5d7a9pCFcfXQFhVH?=
 =?us-ascii?Q?AVMxHN0eZLM5vHpa3sj4MCPjiMs5lavxoZO+kdkN5hZzNobtSrOAbNGlpfvS?=
 =?us-ascii?Q?YCCV5lmQZmYjrCuhZuTl1WM/Tf06yaxiaQk8Zd1v1dW98Hci6ZRSn0biq9XX?=
 =?us-ascii?Q?tde2+EQ4atgVdDurT/Kpc6phGrFNrhW6//NNelfufbGe07vz4WKYUPkJI3BJ?=
 =?us-ascii?Q?kIVRptt1po7qF3T7D1phpMw8w9Uv0W2yv3JW18E8DXeLS7TpQxKegQrVAcW+?=
 =?us-ascii?Q?Fib298yx6iJEvEgis67pNeqSKGRLVCCbzOT8y0dRWzlu/WxWSJFujRLzbXqR?=
 =?us-ascii?Q?UbUMi0bvtp+iuSy70UYBu7dsKGDOCgvwoJ2qxXBYFyJEoayRHqxU3z9hkoHU?=
 =?us-ascii?Q?C2QsPNkQ07PvF4/biC+NnwZF3UebXpZF1mnCRUPN9d18/o+CP6VBzGVwC+fo?=
 =?us-ascii?Q?FBviqt5rUiUFfHp91kg3+TQT2GiNk6L5s9EmD0k6mdxZaHlUeOEHXVQ0jnW1?=
 =?us-ascii?Q?gyfSb9QzdUU/JfY+9F0QpZ6NR4V5wJBOqOekfRXmKEH+ijh9bpn1wdorZt8Q?=
 =?us-ascii?Q?OeEjrSqqnr+SIbO/4ePYIDd12tpgYVJijjT8ietxajMelQqAqPdhBVFXkERd?=
 =?us-ascii?Q?GtqJ6fGHKkDgWk7LSbyO/ei0XTieCnnCu8UUeXhCo/9WdYNjdv/ouxNnYFFy?=
 =?us-ascii?Q?WnPPhmPWwv3A1SkOiCmjfaVUpX+IZwHeshx9hqCUUXU7XAf5fksM+FVC/EcM?=
 =?us-ascii?Q?FlS2BpxbGxzltPns1GwXgs15CNXsk5QB61NXt54q9UzUSHzaXocpP9xDbqwr?=
 =?us-ascii?Q?jLkWL15QpX1Ss6Z9pNR6f2rScDVGDthUXJv7W0zxBJNZo3+9DeqRzy2kugmd?=
 =?us-ascii?Q?J1olCzrZchb3e8n9Or4lbaxJk66KWg78kto5zxtxI/75EdXu3+lOT8GW0G2y?=
 =?us-ascii?Q?KlDgB0dKtlGVc091AYocT6BLHuRuZc8Ayzffwus9tCISPfFyOISBqXMOTgSc?=
 =?us-ascii?Q?zjUXfZMkd0yt86cpPmIDFWRKPhAHv2hSYtp2Rqs0mXseym9VKazgfwclUHKg?=
 =?us-ascii?Q?s3h9f3RcmWscZ6Lyy2QUbisWUEeEqCnt9jt2zhSULwGTxOmQ8SWMt+7IXVpD?=
 =?us-ascii?Q?vzr6wGIR3UjqBn+Pz7h1wCuNvCqcSPBVU/Cdq+j3C3k6LjYNPYAZ8199A4R7?=
 =?us-ascii?Q?Fk3HZvKsxBtC95pCKUFbFc2GnTEhvtpjS6n5c81J/XOO/7xzdSfcJet74y1J?=
 =?us-ascii?Q?FKimTtu0Domprky0UwS4FzlPbQ50TRPpQJg0QWpHOwrwfsANoIouCrjxwpKM?=
 =?us-ascii?Q?EFNcfTMTnq4TjAi/EzdUE9ihXLM0Fbb91nIdyRNmJTyBl9y/x5yOOokn/FY7?=
 =?us-ascii?Q?OVy5l6FHWoqXB8A7lbL+2Sgt4m4XMb2ciesMl9/oktDPPGfHBlyoKqT2lkc6?=
 =?us-ascii?Q?iZXKvaXF66t1sIvQmZSeEIkcQNnWaKVKDZHkWtLewaPeDpra0kJkxVOZgcjy?=
 =?us-ascii?Q?Y5/5GYXNwc9+W2S2c0K2EDdX8nrsNkvw3GhQ2uK5UR/T2jNvPzC4q18EN3f3?=
 =?us-ascii?Q?8boZhOjIsVeCdXX4Xcu3C8rk/UXMwUnNLqbGk4Cb5a5gpNkCHlxOSJoAL2+J?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71d0e2a-4e44-40d6-96b0-08de185df4db
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:14:55.6408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNKGpaqFaTW1fbaggt3JDDHsJLwBncDlKEOX/6iadCUQXqhJQAHI1b7jOlK7fM1S1p+FT6PFpz+1dClwEjm78a2UE+ICYze14L62/QAXoGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4MyBTYWx0ZWRfX6dFAYNcRjl3p
 3vVDcdDq6pRWOF0ORdidQ6zeMG+FqLaWbWfUD6NtYQypQObiDolqypg48kGHQ4NuCE9KAaY/iFl
 n7O4/XY3s5Tfj9BSt8BxP4ckidOu9+5z7bluUOOj82o/fDXr/e3XTtPYP9mrOtw5igCUdY2Sk1z
 fzHsl3g2I+MOnwmC3bC5fcDfEBzEuw/rosZI1DOc/yDdcEPLY3VLMIVZBh+SBuWiHT1a5P7xW93
 xmyErBak+LA43/sSYa12nkyTThpcLmvuy9hypWYkeh+k9ye6cVd89xdN97HKd5UzxshhyEtq5CW
 IFON4vUz0ko2ayOAdp4t1ShPLNxw0X2wicxrD2BuGa3bzC8Wc2iqPi8YD/6diw9xuqxKl3R30cN
 RWkY7//7So00enUx6PHrZEemQfoHoQ==
X-Authority-Analysis: v=2.4 cv=HODO14tv c=1 sm=1 tr=0 ts=69047e12 cx=c_pps
 a=uEqrJT4jjddHaitOG1ym6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=OfLzFz1RBshwlOqTEi4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DyaEEjJJVItlmL50_7dZYVEwwj0adIyZ
X-Proofpoint-ORIG-GUID: DyaEEjJJVItlmL50_7dZYVEwwj0adIyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 09:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121229

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2023-5992:
A vulnerability was found in OpenSC where PKCS#1 encryption padding removal is not
implemented as side-channel resistant. This issue may result in the potential leak
of private data.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2023-5992]
[https://github.com/OpenSC/OpenSC/wiki/CVE-2023-5992]

Upstream patches:
[https://github.com/OpenSC/OpenSC/pull/2948]
[https://github.com/OpenSC/OpenSC/pull/3016]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2023-5992-0001.patch     | 359 ++++++++++++++++++
 .../opensc/files/CVE-2023-5992-0002.patch     | 269 +++++++++++++
 .../opensc/files/CVE-2023-5992-0003.patch     |  41 ++
 .../opensc/files/CVE-2023-5992-0004.patch     | 109 ++++++
 .../opensc/files/CVE-2023-5992-0005.patch     |  63 +++
 .../opensc/files/CVE-2023-5992-0006.patch     | 118 ++++++
 .../opensc/files/CVE-2023-5992-0007.patch     |  50 +++
 .../opensc/files/CVE-2023-5992-0008.patch     |  37 ++
 .../opensc/files/CVE-2023-5992-0009.patch     | 123 ++++++
 .../opensc/files/CVE-2023-5992-0010.patch     |  75 ++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  10 +
 11 files changed, 1254 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0001.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0002.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0003.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0004.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0005.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0006.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0007.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0008.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0009.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-5992-0010.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0001.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0001.patch
new file mode 100644
index 0000000000..4798ab56ae
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0001.patch
@@ -0,0 +1,359 @@
+From 9c14d6d996e526ebfda75de7b577255acf7ad86d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Mon, 13 Nov 2023 13:54:54 +0100
+Subject: [PATCH 01/10] Reimplement removing of PKCS#1 v1.5 padding to be time
+ constant
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/common/Makefile.am      |   5 +-
+ src/common/constant-time.h  | 128 ++++++++++++++++++++++++++++++++++++
+ src/libopensc/internal.h    |   4 +-
+ src/libopensc/padding.c     | 102 +++++++++++++++++++---------
+ src/libopensc/pkcs15-sec.c  |   5 +-
+ src/minidriver/minidriver.c |   4 +-
+ 6 files changed, 209 insertions(+), 39 deletions(-)
+ create mode 100644 src/common/constant-time.h
+
+diff --git a/src/common/Makefile.am b/src/common/Makefile.am
+index 83a40e1c2..c4cfff185 100644
+--- a/src/common/Makefile.am
++++ b/src/common/Makefile.am
+@@ -8,7 +8,7 @@ dist_noinst_DATA = \
+ 	LICENSE.compat_getopt compat_getopt.txt \
+ 	compat_getopt_main.c \
+ 	README.compat_strlcpy compat_strlcpy.3
+-noinst_HEADERS = compat_strlcat.h compat_strlcpy.h compat_strnlen.h compat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h
++noinst_HEADERS = compat_strlcat.h compat_strlcpy.h compat_strnlen.h compat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h constant-time.h
+ 
+ AM_CPPFLAGS = -I$(top_srcdir)/src
+ 
+@@ -40,7 +40,8 @@ TIDY_FILES = \
+ 	compat_report_rangecheckfailure.c \
+ 	compat___iob_func.c \
+ 	simclist.c simclist.h \
+-	libpkcs11.c libscdl.c
++	libpkcs11.c libscdl.c \
++	constant-time.h
+ 
+ check-local:
+ 	if [ -x "$(CLANGTIDY)" ]; then clang-tidy -config='' --checks='$(TIDY_CHECKS)' -header-filter=.* $(addprefix $(srcdir)/,$(TIDY_FILES)) -- $(TIDY_FLAGS); fi
+diff --git a/src/common/constant-time.h b/src/common/constant-time.h
+new file mode 100644
+index 000000000..40c3e500c
+--- /dev/null
++++ b/src/common/constant-time.h
+@@ -0,0 +1,128 @@
++/* Original source: https://github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/include/internal/constant_time.h */
++
++#ifndef CONSTANT_TIME_H
++#define CONSTANT_TIME_H
++
++#include <stdlib.h>
++#include <string.h>
++
++#if !defined(inline)
++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
++#define constant_inline inline
++#elif defined(__GNUC__) && __GNUC__ >= 2
++#elif defined(__GNUC__) && __GNUC__ >= 2
++#elif defined(_MSC_VER)
++#define constant_inline __inline
++#else
++#define constant_inline
++#endif
++#else			       /* use what caller wants as inline  may be from config.h */
++#define constant_inline inline /* inline */
++#endif
++
++/*-
++ * The boolean methods return a bitmask of all ones (0xff...f) for true
++ * and 0 for false. For example,
++ *      if (a < b) {
++ *        c = a;
++ *      } else {
++ *        c = b;
++ *      }
++ * can be written as
++ *      unsigned int lt = constant_time_lt(a, b);
++ *      c = constant_time_select(lt, a, b);
++ */
++
++static constant_inline unsigned int
++value_barrier(unsigned int a)
++{
++	volatile unsigned int r = a;
++	return r;
++}
++
++static constant_inline size_t
++value_barrier_s(size_t a)
++{
++	volatile size_t r = a;
++	return r;
++}
++
++/* MSB */
++static constant_inline size_t
++constant_time_msb_s(size_t a)
++{
++	return 0 - (a >> (sizeof(a) * 8 - 1));
++}
++
++static constant_inline unsigned int
++constant_time_msb(unsigned int a)
++{
++	return 0 - (a >> (sizeof(a) * 8 - 1));
++}
++
++/* Select */
++static constant_inline unsigned int
++constant_time_select(unsigned int mask, unsigned int a, unsigned int b)
++{
++	return (value_barrier(mask) & a) | (value_barrier(~mask) & b);
++}
++
++static constant_inline unsigned char
++constant_time_select_8(unsigned char mask, unsigned char a, unsigned char b)
++{
++	return (unsigned char)constant_time_select(mask, a, b);
++}
++
++static constant_inline size_t
++constant_time_select_s(size_t mask, size_t a, size_t b)
++{
++	return (value_barrier_s(mask) & a) | (value_barrier_s(~mask) & b);
++}
++
++/* Zero */
++static constant_inline unsigned int
++constant_time_is_zero(unsigned int a)
++{
++	return constant_time_msb(~a & (a - 1));
++}
++
++static constant_inline size_t
++constant_time_is_zero_s(size_t a)
++{
++	return constant_time_msb_s(~a & (a - 1));
++}
++
++/* Comparison*/
++static constant_inline size_t
++constant_time_lt_s(size_t a, size_t b)
++{
++	return constant_time_msb_s(a ^ ((a ^ b) | ((a - b) ^ b)));
++}
++
++static constant_inline unsigned int
++constant_time_lt(unsigned int a, unsigned int b)
++{
++	return constant_time_msb(a ^ ((a ^ b) | ((a - b) ^ b)));
++}
++
++static constant_inline unsigned int
++constant_time_ge(unsigned int a, unsigned int b)
++{
++	return ~constant_time_lt(a, b);
++}
++
++/* Equality*/
++
++static constant_inline unsigned int
++constant_time_eq(unsigned int a, unsigned int b)
++{
++	return constant_time_is_zero(a ^ b);
++}
++
++static constant_inline size_t
++constant_time_eq_s(size_t a, size_t b)
++{
++	return constant_time_is_zero_s(a ^ b);
++}
++
++#endif /* CONSTANT_TIME_H */
+diff --git a/src/libopensc/internal.h b/src/libopensc/internal.h
+index e7ac63ccf..57568d311 100644
+--- a/src/libopensc/internal.h
++++ b/src/libopensc/internal.h
+@@ -166,8 +166,8 @@ int _sc_card_add_xeddsa_alg(struct sc_card *card, unsigned int key_length,
+ 
+ int sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_dat, size_t in_len,
+ 		u8 *out_dat, size_t *out_len);
+-int sc_pkcs1_strip_02_padding(struct sc_context *ctx, const u8 *data, size_t len,
+-		u8 *out_dat, size_t *out_len);
++int sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned int n, const u8 *data,
++		unsigned int data_len, u8 *out, unsigned int *out_len);
+ int sc_pkcs1_strip_digest_info_prefix(unsigned int *algorithm,
+ 		const u8 *in_dat, size_t in_len, u8 *out_dat, size_t *out_len);
+ 
+diff --git a/src/libopensc/padding.c b/src/libopensc/padding.c
+index e4940ea2b..3a8b81c3f 100644
+--- a/src/libopensc/padding.c
++++ b/src/libopensc/padding.c
+@@ -32,10 +32,13 @@
+ #include <string.h>
+ #include <stdlib.h>
+ 
++#include "common/constant-time.h"
+ #include "internal.h"
+ 
+ /* TODO doxygen comments */
+ 
++#define SC_PKCS1_PADDING_MIN_SIZE 11
++
+ /*
+  * Prefixes for pkcs-v1 signatures
+  */
+@@ -143,45 +146,82 @@ sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_dat, size_t in_le
+ 	return SC_SUCCESS;
+ }
+ 
+-
+-/* remove pkcs1 BT02 padding (adding BT02 padding is currently not
+- * needed/implemented) */
++/* Remove pkcs1 BT02 padding (adding BT02 padding is currently not
++ * needed/implemented) in constant-time.
++ * Original source: https://github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/crypto/rsa/rsa_pk1.c#L171 */
+ int
+-sc_pkcs1_strip_02_padding(sc_context_t *ctx, const u8 *data, size_t len, u8 *out, size_t *out_len)
++sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned int n, const u8 *data, unsigned int data_len, u8 *out, unsigned int *out_len)
+ {
+-	unsigned int	n = 0;
+-
++	unsigned int i = 0;
++	u8 *msg, *msg_orig = NULL;
++	unsigned int good, found_zero_byte, mask;
++	unsigned int zero_index = 0, msg_index, mlen = -1, len = 0;
+ 	LOG_FUNC_CALLED(ctx);
+-	if (data == NULL || len < 3)
++
++	if (data == NULL || data_len <= 0 || data_len > n || n < SC_PKCS1_PADDING_MIN_SIZE)
+ 		LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
+ 
+-	/* skip leading zero byte */
+-	if (*data == 0) {
+-		data++;
+-		len--;
++	msg = msg_orig = calloc(n, sizeof(u8));
++	if (msg == NULL)
++		LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
++
++	/*
++	 * We can not check length of input data straight away and still we need to read
++	 * from input even when the input is not as long as needed to keep the time constant.
++	 * If data has wrong size, it is padded by zeroes from left and the following checks
++	 * do not pass.
++	 */
++	len = data_len;
++	for (data += len, msg += n, i = 0; i < n; i++) {
++		mask = ~constant_time_is_zero(len);
++		len -= 1 & mask;
++		data -= 1 & mask;
++		*--msg = *data & mask;
++	}
++	// check first byte to be 0x00
++	good = constant_time_is_zero(msg[0]);
++	// check second byte to be 0x02
++	good &= constant_time_eq(msg[1], 2);
++
++	// find zero byte after random data in padding
++	found_zero_byte = 0;
++	for (i = 2; i < n; i++) {
++		unsigned int equals0 = constant_time_is_zero(msg[i]);
++		zero_index = constant_time_select(~found_zero_byte & equals0, i, zero_index);
++		found_zero_byte |= equals0;
+ 	}
+-	if (data[0] != 0x02)
+-		LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
+-	/* skip over padding bytes */
+-	for (n = 1; n < len && data[n]; n++)
+-		;
+-	/* Must be at least 8 pad bytes */
+-	if (n >= len || n < 9)
+-		LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
+-	n++;
+-	if (out == NULL)
+-		/* just check the padding */
+-		LOG_FUNC_RETURN(ctx, SC_SUCCESS);
+ 
+-	/* Now move decrypted contents to head of buffer */
+-	if (*out_len < len - n)
+-		LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
+-	*out_len = len - n;
+-	memmove(out, data + n, *out_len);
++	// zero_index stands for index of last found zero
++	good &= constant_time_ge(zero_index, 2 + 8);
++
++	// start of the actual message in data
++	msg_index = zero_index + 1;
++
++	// length of message
++	mlen = data_len - msg_index;
++
++	// check that message fits into out buffer
++	good &= constant_time_ge(*out_len, mlen);
++
++	// move the result in-place by |num|-SC_PKCS1_PADDING_MIN_SIZE-|mlen| bytes to the left.
++	*out_len = constant_time_select(constant_time_lt(n - SC_PKCS1_PADDING_MIN_SIZE, *out_len),
++			n - SC_PKCS1_PADDING_MIN_SIZE, *out_len);
++	for (msg_index = 1; msg_index < n - SC_PKCS1_PADDING_MIN_SIZE; msg_index <<= 1) {
++		mask = ~constant_time_eq(msg_index & (n - SC_PKCS1_PADDING_MIN_SIZE - mlen), 0);
++		for (i = SC_PKCS1_PADDING_MIN_SIZE; i < n - msg_index; i++)
++			msg[i] = constant_time_select_8(mask, msg[i + msg_index], msg[i]);
++	}
++	// move message into out buffer, if good
++	for (i = 0; i < *out_len; i++) {
++		unsigned int msg_index;
++		// when out is longer than message in data, use some bogus index in msg
++		mask = good & constant_time_lt(i, mlen);
++		msg_index = constant_time_select(mask, i + SC_PKCS1_PADDING_MIN_SIZE, 0); // to now overflow msg buffer
++		out[i] = constant_time_select_8(mask, msg[msg_index], out[i]);
++	}
+ 
+-	sc_log(ctx, "stripped output(%"SC_FORMAT_LEN_SIZE_T"u): %s", len - n,
+-	       sc_dump_hex(out, len - n));
+-	LOG_FUNC_RETURN(ctx, len - n);
++	free(msg_orig);
++	return constant_time_select(good, mlen, SC_ERROR_WRONG_PADDING);
+ }
+ 
+ /* add/remove DigestInfo prefix */
+diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
+index b86cb77c3..cea46798a 100644
+--- a/src/libopensc/pkcs15-sec.c
++++ b/src/libopensc/pkcs15-sec.c
+@@ -308,8 +308,9 @@ int sc_pkcs15_decipher(struct sc_pkcs15_card *p15card,
+ 
+ 	/* Strip any padding */
+ 	if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
+-		size_t s = r;
+-		r = sc_pkcs1_strip_02_padding(ctx, out, s, out, &s);
++		int s = r;
++		int key_size = alg_info->key_length;
++		r = sc_pkcs1_strip_02_padding_constant_time(ctx, key_size / 8, out, s, out, &s);
+ 		LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
+ 	}
+ 
+diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
+index 0c089feab..e4d693a09 100644
+--- a/src/minidriver/minidriver.c
++++ b/src/minidriver/minidriver.c
+@@ -4582,9 +4582,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
+ 					  "sc_pkcs15_decipher: DECRYPT-INFO dwVersion=%lu\n",
+ 					  (unsigned long)pInfo->dwVersion);
+ 				if (pInfo->dwPaddingType == CARD_PADDING_PKCS1)   {
+-					size_t temp = pInfo->cbData;
++					unsigned int temp = pInfo->cbData;
+ 					logprintf(pCardData, 2, "sc_pkcs15_decipher: stripping PKCS1 padding\n");
+-					r = sc_pkcs1_strip_02_padding(vs->ctx, pbuf2, pInfo->cbData, pbuf2, &temp);
++					r = sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
+ 					pInfo->cbData = (DWORD) temp;
+ 					if (r < 0)   {
+ 						logprintf(pCardData, 2, "Cannot strip PKCS1 padding: %i\n", r);
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0002.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0002.patch
new file mode 100644
index 0000000000..6f3ca502ee
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0002.patch
@@ -0,0 +1,269 @@
+From c5ffd28572765a957ecadc8593c0bf0a596f535f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Mon, 13 Nov 2023 14:31:08 +0100
+Subject: [PATCH 02/10] Add unit tests for PKCS#1 v1.5 de-padding
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/tests/unittests/Makefile.am             |   5 +-
+ src/tests/unittests/Makefile.mak            |   5 +-
+ src/tests/unittests/strip_pkcs1_2_padding.c | 204 ++++++++++++++++++++
+ 3 files changed, 210 insertions(+), 4 deletions(-)
+ create mode 100644 src/tests/unittests/strip_pkcs1_2_padding.c
+
+diff --git a/src/tests/unittests/Makefile.am b/src/tests/unittests/Makefile.am
+index 03019c324..4ef1c7206 100644
+--- a/src/tests/unittests/Makefile.am
++++ b/src/tests/unittests/Makefile.am
+@@ -6,8 +6,8 @@ include $(top_srcdir)/aminclude_static.am
+ clean-local: code-coverage-clean
+ distclean-local: code-coverage-dist-clean
+ 
+-noinst_PROGRAMS = asn1 simpletlv cachedir
+-TESTS = asn1 simpletlv cachedir
++noinst_PROGRAMS = asn1 simpletlv cachedir strip_pkcs1_2_padding
++TESTS = asn1 simpletlv cachedir strip_pkcs1_2_padding
+ 
+ noinst_HEADERS = torture.h
+ 
+@@ -23,6 +23,7 @@ LDADD = $(top_builddir)/src/libopensc/libopensc.la \
+ asn1_SOURCES = asn1.c
+ simpletlv_SOURCES = simpletlv.c
+ cachedir_SOURCES = cachedir.c
++strip_pkcs1_2_padding = strip_pkcs1_2_padding.c
+ 
+ if ENABLE_ZLIB
+ noinst_PROGRAMS += compression
+diff --git a/src/tests/unittests/Makefile.mak b/src/tests/unittests/Makefile.mak
+index 41762fdbf..a04086a67 100644
+--- a/src/tests/unittests/Makefile.mak
++++ b/src/tests/unittests/Makefile.mak
+@@ -1,9 +1,10 @@
+ TOPDIR = ..\..\..
+ 
+-TARGETS = asn1 compression
++TARGETS = asn1 compression strip_pkcs1_2_padding
+ 
+ OBJECTS = asn1.obj \
+-	compression.obj
++	compression.obj \
++	strip_pkcs1_2_padding.obj \
+ 	$(TOPDIR)\win32\versioninfo.res
+ 
+ all: $(TARGETS)
+diff --git a/src/tests/unittests/strip_pkcs1_2_padding.c b/src/tests/unittests/strip_pkcs1_2_padding.c
+new file mode 100644
+index 000000000..f9561b936
+--- /dev/null
++++ b/src/tests/unittests/strip_pkcs1_2_padding.c
+@@ -0,0 +1,204 @@
++#include "common/compat_strlcpy.c"
++#include "libopensc/log.c"
++#include "libopensc/padding.c"
++#include "torture.h"
++#include <cmocka.h>
++
++static void
++torture_long_output_buffer(void **state)
++{
++	unsigned int n = 14;
++	unsigned int in_len = 14;
++	unsigned char in[] = {0x00, 0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			0x00,
++			'm', 's', 'g'};
++	unsigned int out_len = 3;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char result_msg[] = {'m', 's', 'g'};
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, 3);
++	assert_memory_equal(out, result_msg, r);
++	free(out);
++}
++
++static void
++torture_short_output_buffer(void **state)
++{
++	unsigned int n = 14;
++	unsigned int in_len = 14;
++	unsigned char in[] = {0x00, 0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			0x00,
++			'm', 's', 'g'};
++	unsigned int out_len = 1;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
++	free(out);
++}
++
++static void
++torture_short_message_correct_padding(void **state)
++{
++	unsigned int n = 14;
++	unsigned int in_len = 14;
++	unsigned char in[] = {0x00, 0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			0x00,
++			'm', 's', 'g'};
++	unsigned int out_len = 3;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char result_msg[] = {'m', 's', 'g'};
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, 3);
++	assert_memory_equal(out, result_msg, r);
++	free(out);
++}
++
++static void
++torture_missing_first_zero(void **state)
++{
++	unsigned int n = 13;
++	unsigned int in_len = 13;
++	unsigned char in[] = {0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			0x00,
++			'm', 's', 'g'};
++	unsigned int out_len = 10;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
++	free(out);
++}
++
++static void
++torture_missing_two(void **state)
++{
++	unsigned int n = 13;
++	unsigned int in_len = 13;
++	unsigned char in[] = {0x00,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			0x00,
++			'm', 's', 'g'};
++	unsigned int out_len = 10;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
++	free(out);
++}
++
++static void
++torture_short_padding(void **state)
++{
++	unsigned int n = 13;
++	unsigned int in_len = 13;
++	unsigned char in[] = {0x00, 0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
++			0x00,
++			'm', 's', 'g'};
++	unsigned int out_len = 10;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
++	free(out);
++}
++
++static void
++torture_missing_second_zero(void **state)
++{
++	unsigned int n = 13;
++	unsigned int in_len = 13;
++	unsigned char in[] = {0x00, 0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			'm', 's', 'g'};
++	unsigned int out_len = 10;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
++	free(out);
++}
++
++static void
++torture_missing_message(void **state)
++{
++	unsigned int n = 20;
++	unsigned int in_len = 11;
++	unsigned char in[] = {0x00, 0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			0x00};
++	unsigned int out_len = 11;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
++	free(out);
++}
++
++static void
++torture_one_byte_message(void **state)
++{
++	unsigned int n = 12;
++	unsigned int in_len = 12;
++	unsigned char in[] = {0x00, 0x02,
++			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
++			0x00,
++			'm'};
++	unsigned int out_len = 1;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char result_msg[] = {'m'};
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, 1);
++	assert_memory_equal(out, result_msg, r);
++	free(out);
++}
++
++static void
++torture_longer_padding(void **state)
++{
++	unsigned int n = 26;
++	unsigned int in_len = 26;
++	unsigned char in[] = {0x00, 0x02,
++			0x0e, 0x38, 0x97, 0x18, 0x16, 0x57, 0x9e, 0x30, 0xb6, 0xa5, 0x78, 0x13, 0x20, 0xca, 0x11,
++			0x00,
++			0x9d, 0x98, 0x3d, 0xca, 0xa9, 0xa7, 0x11, 0x0a};
++	unsigned int out_len = 8;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char result_msg[] = {0x9d, 0x98, 0x3d, 0xca, 0xa9, 0xa7, 0x11, 0x0a};
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, 8);
++	assert_memory_equal(out, result_msg, r);
++	free(out);
++}
++
++static void
++torture_empty_message(void **state)
++{
++	unsigned int n = 18;
++	unsigned int in_len = 18;
++	unsigned char in[] = {0x00, 0x02,
++			0x0e, 0x38, 0x97, 0x18, 0x16, 0x57, 0x9e, 0x30, 0xb6, 0xa5, 0x78, 0x13, 0x20, 0xca, 0x11,
++			0x00};
++	unsigned int out_len = 8;
++	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
++	assert_int_equal(r, 0);
++	free(out);
++}
++
++int
++main(void)
++{
++	const struct CMUnitTest tests[] = {
++			cmocka_unit_test(torture_long_output_buffer),
++			cmocka_unit_test(torture_short_output_buffer),
++			cmocka_unit_test(torture_short_message_correct_padding),
++			cmocka_unit_test(torture_missing_first_zero),
++			cmocka_unit_test(torture_missing_two),
++			cmocka_unit_test(torture_short_padding),
++			cmocka_unit_test(torture_missing_second_zero),
++			cmocka_unit_test(torture_missing_message),
++			cmocka_unit_test(torture_one_byte_message),
++			cmocka_unit_test(torture_longer_padding),
++			cmocka_unit_test(torture_empty_message)};
++	return cmocka_run_group_tests(tests, NULL, NULL);
++}
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0003.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0003.patch
new file mode 100644
index 0000000000..52a73064dc
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0003.patch
@@ -0,0 +1,41 @@
+From 7266f151bb5896b9213d4cf0a298859a53cfb750 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 16 Nov 2023 10:38:12 +0100
+Subject: [PATCH 03/10] pkcs15-sec: Remove logging after PKCS#1 v1.5 depadding
+
+To prevent Marvin attack on RSA PKCS#1 v1.5 padding
+when logging the return value, signaling the padding error.
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/pkcs15-sec.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
+index cea46798a..b04856b4d 100644
+--- a/src/libopensc/pkcs15-sec.c
++++ b/src/libopensc/pkcs15-sec.c
+@@ -308,13 +308,13 @@ int sc_pkcs15_decipher(struct sc_pkcs15_card *p15card,
+ 
+ 	/* Strip any padding */
+ 	if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
+-		int s = r;
+-		int key_size = alg_info->key_length;
++		unsigned int s = r;
++		unsigned int key_size = (unsigned int)alg_info->key_length;
+ 		r = sc_pkcs1_strip_02_padding_constant_time(ctx, key_size / 8, out, s, out, &s);
+-		LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
++		/* for keeping PKCS#1 v1.5 depadding constant-time, do not log error here */
+ 	}
+ 
+-	LOG_FUNC_RETURN(ctx, r);
++	return r;
+ }
+ 
+ /* derive one key from another. RSA can use decipher, so this is for only ECDH
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0004.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0004.patch
new file mode 100644
index 0000000000..459e1d2a61
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0004.patch
@@ -0,0 +1,109 @@
+From 663dcbae0d92a05eba28ca56b80346b2fbe5a6d5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 16 Nov 2023 15:49:15 +0100
+Subject: [PATCH 04/10] framework-pkcs15.c: Handle PKCS#1 v1.5 depadding
+ constant-time
+
+In order to not disclose time side-channel when the depadding
+fails, do the same operations as for case when depadding ends
+with success.
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs11/framework-pkcs15.c | 54 ++++++++++++++++++++++++++---------
+ 1 file changed, 41 insertions(+), 13 deletions(-)
+
+diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
+index 4fc8f13ab..8376057ea 100644
+--- a/src/pkcs11/framework-pkcs15.c
++++ b/src/pkcs11/framework-pkcs15.c
+@@ -18,6 +18,7 @@
+  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+  */
+ 
++#include "common/constant-time.h"
+ #include "config.h"
+ #include <stdlib.h>
+ #include <string.h>
+@@ -4341,7 +4342,8 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session *session, void *obj,
+ 	struct pkcs15_fw_data *fw_data = NULL;
+ 	struct pkcs15_prkey_object *prkey;
+ 	unsigned char decrypted[512]; /* FIXME: Will not work for keys above 4096 bits */
+-	int	buff_too_small, rv, flags = 0, prkey_has_path = 0;
++	int rv, flags = 0, prkey_has_path = 0;
++	CK_ULONG mask, good, rv_pkcs11;
+ 
+ 	sc_log(context, "Initiating decryption.");
+ 
+@@ -4415,27 +4417,53 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session *session, void *obj,
+ 	rv = sc_pkcs15_decipher(fw_data->p15_card, prkey->prv_p15obj, flags,
+ 			pEncryptedData, ulEncryptedDataLen, decrypted, sizeof(decrypted));
+ 
+-	if (rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_path)
++	/* skip for PKCS#1 v1.5 padding prevent side channel attack */
++	if (!(flags & SC_ALGORITHM_RSA_PAD_PKCS1) &&
++			rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_path)
+ 		if (reselect_app_df(fw_data->p15_card) == SC_SUCCESS)
+ 			rv = sc_pkcs15_decipher(fw_data->p15_card, prkey->prv_p15obj, flags,
+ 					pEncryptedData, ulEncryptedDataLen, decrypted, sizeof(decrypted));
+ 
+ 	sc_unlock(p11card->card);
+ 
+-	sc_log(context, "Decryption complete. Result %d.", rv);
++	sc_log(context, "Decryption complete.");
+ 
+-	if (rv < 0)
+-		return sc_to_cryptoki_error(rv, "C_Decrypt");
++	/* Handle following code in constant-time
++	 * to prevent Marvin attack for PKCS#1 v1.5 padding. */
+ 
+-	buff_too_small = (*pulDataLen < (CK_ULONG)rv);
+-	*pulDataLen = rv;
+-	if (pData == NULL_PTR)
+-		return CKR_OK;
+-	if (buff_too_small)
+-		return CKR_BUFFER_TOO_SMALL;
+-	memcpy(pData, decrypted, *pulDataLen);
++	/* only padding error must be handled in constant-time way,
++	 * other error can be returned straight away */
++	if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_time_lt_s(sizeof(decrypted), rv)))
++		return sc_to_cryptoki_error(rv, "C_Decrypt");
+ 
+-	return CKR_OK;
++	/* check rv for padding error */
++	good = ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
++	rv_pkcs11 = sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Decrypt");
++	rv_pkcs11 = constant_time_select_s(good, CKR_OK, rv_pkcs11);
++
++	if (pData == NULL_PTR) {
++		/* set length only if no error */
++		*pulDataLen = constant_time_select_s(good, rv, *pulDataLen);
++		/* return error only if original rv < 0 */
++		return rv_pkcs11;
++	}
++
++	/* check whether *pulDataLen < rv and set return value for small output buffer */
++	mask = good & constant_time_lt_s(*pulDataLen, rv);
++	rv_pkcs11 = constant_time_select_s(mask, CKR_BUFFER_TOO_SMALL, rv_pkcs11);
++	good &= ~mask;
++
++	/* move everything from decrypted into out buffer constant-time, if rv is ok */
++	for (CK_ULONG i = 0; i < *pulDataLen; i++) { /* iterate over whole pData to not disclose real depadded length */
++		CK_ULONG msg_index;
++		mask = good & constant_time_lt_s(i, sizeof(decrypted));		    /* i should be in the bounds of decrypted */
++		mask &= constant_time_lt_s(i, constant_time_select_s(good, rv, 0)); /* check that is in bounds of depadded message */
++		msg_index = constant_time_select_s(mask, i, 0);
++		pData[i] = constant_time_select_8(mask, decrypted[msg_index], pData[i]);
++	}
++	*pulDataLen = constant_time_select_s(good, rv, *pulDataLen);
++	/* do not log error code to prevent side channel attack */
++	return rv_pkcs11;
+ }
+ 
+ 
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0005.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0005.patch
new file mode 100644
index 0000000000..a52b964306
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0005.patch
@@ -0,0 +1,63 @@
+From f7fc30b02090d657b9ba64cbb5168cb5a94592ef Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Mon, 8 Jan 2024 14:59:22 +0100
+Subject: [PATCH 05/10] mechanism: Handle PKCS#1 v1.5 depadding constant-time
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs11/mechanism.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
+index c5959b36b..b3fce1714 100644
+--- a/src/pkcs11/mechanism.c
++++ b/src/pkcs11/mechanism.c
+@@ -23,6 +23,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "common/constant-time.h"
+ #include "sc-pkcs11.h"
+ 
+ /* Also used for verification data */
+@@ -844,7 +845,9 @@ sc_pkcs11_decr(struct sc_pkcs11_session *session,
+ 	rv = op->type->decrypt(op, pEncryptedData, ulEncryptedDataLen,
+ 	                       pData, pulDataLen);
+ 
+-	if (rv != CKR_BUFFER_TOO_SMALL && pData != NULL)
++	/* terminate session for any return value except CKR_BUFFER_TOO_SMALL,
++	 * perform check in time side-channel free way to prevent Marvin attack */
++	if (!constant_time_eq_s(rv, CKR_BUFFER_TOO_SMALL) && pData != NULL)
+ 		session_stop_operation(session, SC_PKCS11_OPERATION_DECRYPT);
+ 
+ 	return rv;
+@@ -1084,14 +1087,22 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t *operation,
+ {
+ 	struct signature_data *data;
+ 	struct sc_pkcs11_object *key;
++	CK_RV rv;
+ 
+ 	data = (struct signature_data*) operation->priv_data;
+ 
+ 	key = data->key;
+-	return key->ops->decrypt(operation->session,
++	rv = key->ops->decrypt(operation->session,
+ 				key, &operation->mechanism,
+ 				pEncryptedData, ulEncryptedDataLen,
+ 				pData, pulDataLen);
++
++	/* Skip DecryptFinalize for PKCS#1 v1.5 padding to prevent time side-channel leakage */
++	if (((CK_MECHANISM_PTR)&operation->mechanism)->mechanism == CKM_RSA_PKCS)
++		return rv;
++		
++	if (rv != CKR_OK)
++		return rv;
+ }
+ 
+ static CK_RV
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0006.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0006.patch
new file mode 100644
index 0000000000..b9c1f8ce3e
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0006.patch
@@ -0,0 +1,118 @@
+From 224a5a9bb32a8eb575dc30f18004c069c62fc8b1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Wed, 22 Nov 2023 15:02:57 +0100
+Subject: [PATCH 06/10] minidriver: Make CardRSADecrypt constant-time
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/minidriver/minidriver.c | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
+index e4d693a09..37e576ba2 100644
+--- a/src/minidriver/minidriver.c
++++ b/src/minidriver/minidriver.c
+@@ -41,6 +41,7 @@
+ #include "cardmod.h"
+ 
+ #include "common/compat_strlcpy.h"
++#include "common/constant-time.h"
+ #include "libopensc/asn1.h"
+ #include "libopensc/cardctl.h"
+ #include "libopensc/opensc.h"
+@@ -4463,13 +4464,15 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
+ 
+ {
+ 	DWORD dwret;
+-	int r, opt_crypt_flags = 0;
++	int r, opt_crypt_flags = 0, good = 0;
+ 	unsigned ui;
+ 	VENDOR_SPECIFIC *vs;
+ 	struct sc_pkcs15_prkey_info *prkey_info;
+ 	BYTE *pbuf = NULL, *pbuf2 = NULL;
+ 	struct sc_pkcs15_object *pkey = NULL;
+ 	struct sc_algorithm_info *alg_info = NULL;
++	unsigned int wrong_padding = 0;
++	unsigned int pbufLen = 0;
+ 
+ 	MD_FUNC_CALLED(pCardData, 1);
+ 
+@@ -4570,10 +4573,11 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
+ 		goto err;
+ 	}
+ 
++	pbufLen = pInfo->cbData;
+ 	if (alg_info->flags & SC_ALGORITHM_RSA_RAW)   {
+ 		logprintf(pCardData, 2, "sc_pkcs15_decipher: using RSA-RAW mechanism\n");
+ 		r = sc_pkcs15_decipher(vs->p15card, pkey, opt_crypt_flags, pbuf, pInfo->cbData, pbuf2, pInfo->cbData);
+-		logprintf(pCardData, 2, "sc_pkcs15_decipher returned %d\n", r);
++		/* do not log return value to not leak it */
+ 
+ 		if (r > 0) {
+ 			/* Need to handle padding */
+@@ -4586,13 +4590,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
+ 					logprintf(pCardData, 2, "sc_pkcs15_decipher: stripping PKCS1 padding\n");
+ 					r = sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
+ 					pInfo->cbData = (DWORD) temp;
+-					if (r < 0)   {
+-						logprintf(pCardData, 2, "Cannot strip PKCS1 padding: %i\n", r);
+-						pCardData->pfnCspFree(pbuf);
+-						pCardData->pfnCspFree(pbuf2);
+-						dwret = SCARD_F_INTERNAL_ERROR;
+-						goto err;
+-					}
++					wrong_padding = constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);
++					/* continue without returning error to not leak that padding is wrong
++					   to prevent time side-channel leak for Marvin attack*/
+ 				}
+ 				else if (pInfo->dwPaddingType == CARD_PADDING_OAEP)   {
+ 					/* TODO: Handle OAEP padding if present - can call PFN_CSP_UNPAD_DATA */
+@@ -4640,28 +4640,38 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
+ 		goto err;
+ 	}
+ 
+-	if ( r < 0)   {
++	good = constant_time_eq_s(r, 0);
++	/* if no error or padding error, do not return here to prevent Marvin attack */
++	if (!(good | wrong_padding) && r < 0)   {
+ 		logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s\n", r, sc_strerror(r));
+ 		pCardData->pfnCspFree(pbuf);
+ 		pCardData->pfnCspFree(pbuf2);
+ 		dwret = md_translate_OpenSC_to_Windows_error(r, SCARD_E_INVALID_VALUE);
+ 		goto err;
+ 	}
++	dwret = constant_time_select_s(good, SCARD_S_SUCCESS, SCARD_F_INTERNAL_ERROR);
+ 
+ 	logprintf(pCardData, 2, "decrypted data(%lu):\n",
+ 		  (unsigned long)pInfo->cbData);
+ 	loghex(pCardData, 7, pbuf2, pInfo->cbData);
+ 
+ 	/*inversion donnees */
+-	for(ui = 0; ui < pInfo->cbData; ui++)
+-		pInfo->pbData[ui] = pbuf2[pInfo->cbData-ui-1];
++	/* copy data in constant-time way to prevent leak */
++	for (ui = 0; ui < pbufLen; ui++) {
++		unsigned int mask, msg_index, inv_ui;
++		mask = good & constant_time_lt_s(ui, pInfo->cbData); /* ui should be in the bounds of pbuf2 */
++		inv_ui = pInfo->cbData - ui - 1;
++		msg_index = constant_time_select_s(mask, inv_ui, 0);
++		pInfo->pbData[ui] = constant_time_select_8(mask, pbuf2[msg_index], pInfo->pbData[ui]);
++	}
+ 
+ 	pCardData->pfnCspFree(pbuf);
+ 	pCardData->pfnCspFree(pbuf2);
+ 
+ err:
+ 	unlock(pCardData);
+-	MD_FUNC_RETURN(pCardData, 1, dwret);
++	/* do not log return value to not leak it */
++	return dwret;
+ }
+ 
+ 
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0007.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0007.patch
new file mode 100644
index 0000000000..ccd44833fa
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0007.patch
@@ -0,0 +1,50 @@
+From 65f81aa8cdb8fa7e3c54165c9c800e6dae5591c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Fri, 24 Nov 2023 20:59:07 +0100
+Subject: [PATCH 07/10] pkcs11-object: Remove return value logging
+
+To prevent Marvin attack on RSA PKCS#1 v1.5 padding
+when logging the return value, signaling the padding error.
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs11/pkcs11-object.c | 3 ++-
+ src/pkcs11/sc-pkcs11.h     | 5 +++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/pkcs11/pkcs11-object.c b/src/pkcs11/pkcs11-object.c
+index c5cf78a2b..aae149b86 100644
+--- a/src/pkcs11/pkcs11-object.c
++++ b/src/pkcs11/pkcs11-object.c
+@@ -930,7 +930,8 @@ CK_RV C_Decrypt(CK_SESSION_HANDLE hSession,	/* the session's handle */
+ 		rv = reset_login_state(session->slot, rv);
+ 	}
+ 
+-	sc_log(context, "C_Decrypt() = %s", lookup_enum ( RV_T, rv ));
++	/* do not log error code to prevent side channel attack */
++	SC_LOG("C_Decrypt()");
+ 	sc_pkcs11_unlock();
+ 	return rv;
+ }
+diff --git a/src/pkcs11/sc-pkcs11.h b/src/pkcs11/sc-pkcs11.h
+index 3c6b92ba4..35c8d5eb3 100644
+--- a/src/pkcs11/sc-pkcs11.h
++++ b/src/pkcs11/sc-pkcs11.h
+@@ -226,6 +226,11 @@ struct sc_pkcs11_slot {
+ };
+ typedef struct sc_pkcs11_slot sc_pkcs11_slot_t;
+ 
++#define SC_LOG(fmt) \
++	do { \
++		sc_log(context, (fmt)); \
++	} while (0)
++
+ /* Debug virtual slots. S is slot to be highlighted or NULL
+  * C is a comment format string and args It will be preceded by "VSS " */
+ #define DEBUG_VSS(S, ...) do { sc_log(context,"VSS " __VA_ARGS__); _debug_virtual_slots(S); } while (0)
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0008.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0008.patch
new file mode 100644
index 0000000000..d50337902d
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0008.patch
@@ -0,0 +1,37 @@
+From 60f1966c06ed5fbe9e9e1edeefa2d280f5341484 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Fri, 24 Nov 2023 21:00:23 +0100
+Subject: [PATCH 08/10] misc: Compare return value constant-time
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs11/misc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/pkcs11/misc.c b/src/pkcs11/misc.c
+index c3f5bb4e1..c0fd07240 100644
+--- a/src/pkcs11/misc.c
++++ b/src/pkcs11/misc.c
+@@ -23,6 +23,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "common/constant-time.h"
+ #include "sc-pkcs11.h"
+ 
+ #define DUMP_TEMPLATE_MAX	32
+@@ -172,7 +173,7 @@ CK_RV reset_login_state(struct sc_pkcs11_slot *slot, CK_RV rv)
+ 			slot->p11card->framework->logout(slot);
+ 		}
+ 
+-		if (rv == CKR_USER_NOT_LOGGED_IN) {
++		if (constant_time_eq_s(rv, CKR_USER_NOT_LOGGED_IN)) {
+ 			slot->login_user = -1;
+ 			pop_all_login_states(slot);
+ 		}
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0009.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0009.patch
new file mode 100644
index 0000000000..d65555bca9
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0009.patch
@@ -0,0 +1,123 @@
+From e5f77a60bf22d76f695e360cc5c13c5c9ea8ba0c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Mon, 5 Feb 2024 11:30:11 +0100
+Subject: [PATCH 09/10] unittests: Do not use uninitialized memory
+
+Thanks Coverity CID 414676, 414677, 414678,
+414679, 414680, 414681, 414682, 414683, 414684,
+414685, 414686
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/3016]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/tests/unittests/strip_pkcs1_2_padding.c | 22 ++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/src/tests/unittests/strip_pkcs1_2_padding.c b/src/tests/unittests/strip_pkcs1_2_padding.c
+index f9561b936..990e94a38 100644
+--- a/src/tests/unittests/strip_pkcs1_2_padding.c
++++ b/src/tests/unittests/strip_pkcs1_2_padding.c
+@@ -14,7 +14,7 @@ torture_long_output_buffer(void **state)
+ 			0x00,
+ 			'm', 's', 'g'};
+ 	unsigned int out_len = 3;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	unsigned char result_msg[] = {'m', 's', 'g'};
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, 3);
+@@ -32,7 +32,7 @@ torture_short_output_buffer(void **state)
+ 			0x00,
+ 			'm', 's', 'g'};
+ 	unsigned int out_len = 1;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
+ 	free(out);
+@@ -48,7 +48,7 @@ torture_short_message_correct_padding(void **state)
+ 			0x00,
+ 			'm', 's', 'g'};
+ 	unsigned int out_len = 3;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	unsigned char result_msg[] = {'m', 's', 'g'};
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, 3);
+@@ -66,7 +66,7 @@ torture_missing_first_zero(void **state)
+ 			0x00,
+ 			'm', 's', 'g'};
+ 	unsigned int out_len = 10;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
+ 	free(out);
+@@ -82,7 +82,7 @@ torture_missing_two(void **state)
+ 			0x00,
+ 			'm', 's', 'g'};
+ 	unsigned int out_len = 10;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
+ 	free(out);
+@@ -98,7 +98,7 @@ torture_short_padding(void **state)
+ 			0x00,
+ 			'm', 's', 'g'};
+ 	unsigned int out_len = 10;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
+ 	free(out);
+@@ -113,7 +113,7 @@ torture_missing_second_zero(void **state)
+ 			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+ 			'm', 's', 'g'};
+ 	unsigned int out_len = 10;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
+ 	free(out);
+@@ -128,7 +128,7 @@ torture_missing_message(void **state)
+ 			0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+ 			0x00};
+ 	unsigned int out_len = 11;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, SC_ERROR_WRONG_PADDING);
+ 	free(out);
+@@ -144,7 +144,7 @@ torture_one_byte_message(void **state)
+ 			0x00,
+ 			'm'};
+ 	unsigned int out_len = 1;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	unsigned char result_msg[] = {'m'};
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, 1);
+@@ -162,7 +162,7 @@ torture_longer_padding(void **state)
+ 			0x00,
+ 			0x9d, 0x98, 0x3d, 0xca, 0xa9, 0xa7, 0x11, 0x0a};
+ 	unsigned int out_len = 8;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	unsigned char result_msg[] = {0x9d, 0x98, 0x3d, 0xca, 0xa9, 0xa7, 0x11, 0x0a};
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, 8);
+@@ -179,7 +179,7 @@ torture_empty_message(void **state)
+ 			0x0e, 0x38, 0x97, 0x18, 0x16, 0x57, 0x9e, 0x30, 0xb6, 0xa5, 0x78, 0x13, 0x20, 0xca, 0x11,
+ 			0x00};
+ 	unsigned int out_len = 8;
+-	unsigned char *out = malloc(out_len * sizeof(unsigned char));
++	unsigned char *out = calloc(out_len, sizeof(unsigned char));
+ 	int r = sc_pkcs1_strip_02_padding_constant_time(NULL, n, in, in_len, out, &out_len);
+ 	assert_int_equal(r, 0);
+ 	free(out);
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0010.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0010.patch
new file mode 100644
index 0000000000..2585406b56
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-5992-0010.patch
@@ -0,0 +1,75 @@
+From 0039fe386c996faffaa2cf2d728c176cc239468b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Mon, 5 Feb 2024 13:33:05 +0100
+Subject: [PATCH 10/10] Fix constant-time comparison of negative values
+
+Thanks Coverity CID 414687
+
+CVE: CVE-2023-5992
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/3016]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/common/constant-time.h    | 6 ++++++
+ src/minidriver/minidriver.c   | 4 ++--
+ src/pkcs11/framework-pkcs15.c | 4 ++--
+ 3 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/common/constant-time.h b/src/common/constant-time.h
+index 40c3e500c..3f4446d4d 100644
+--- a/src/common/constant-time.h
++++ b/src/common/constant-time.h
+@@ -125,4 +125,10 @@ constant_time_eq_s(size_t a, size_t b)
+ 	return constant_time_is_zero_s(a ^ b);
+ }
+ 
++static constant_inline unsigned int
++constant_time_eq_i(int a, int b)
++{
++	return constant_time_eq((unsigned int)a, (unsigned int)b);
++}
++
+ #endif /* CONSTANT_TIME_H */
+diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
+index 37e576ba2..e2be9e53d 100644
+--- a/src/minidriver/minidriver.c
++++ b/src/minidriver/minidriver.c
+@@ -4590,7 +4590,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
+ 					logprintf(pCardData, 2, "sc_pkcs15_decipher: stripping PKCS1 padding\n");
+ 					r = sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
+ 					pInfo->cbData = (DWORD) temp;
+-					wrong_padding = constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);
++					wrong_padding = constant_time_eq_i(r, SC_ERROR_WRONG_PADDING);
+ 					/* continue without returning error to not leak that padding is wrong
+ 					   to prevent time side-channel leak for Marvin attack*/
+ 				}
+@@ -4640,7 +4640,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
+ 		goto err;
+ 	}
+ 
+-	good = constant_time_eq_s(r, 0);
++	good = constant_time_eq_i(r, 0);
+ 	/* if no error or padding error, do not return here to prevent Marvin attack */
+ 	if (!(good | wrong_padding) && r < 0)   {
+ 		logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s\n", r, sc_strerror(r));
+diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
+index 8376057ea..8b0a63b10 100644
+--- a/src/pkcs11/framework-pkcs15.c
++++ b/src/pkcs11/framework-pkcs15.c
+@@ -4433,11 +4433,11 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session *session, void *obj,
+ 
+ 	/* only padding error must be handled in constant-time way,
+ 	 * other error can be returned straight away */
+-	if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_time_lt_s(sizeof(decrypted), rv)))
++	if ((~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING) & constant_time_lt_s(sizeof(decrypted), (size_t)rv)))
+ 		return sc_to_cryptoki_error(rv, "C_Decrypt");
+ 
+ 	/* check rv for padding error */
+-	good = ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
++	good = ~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING);
+ 	rv_pkcs11 = sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Decrypt");
+ 	rv_pkcs11 = constant_time_select_s(good, CKR_OK, rv_pkcs11);
+ 
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 52e29a5d92..30a9ae5468 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -55,6 +55,16 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2024-45620-0001.patch \
            file://CVE-2024-45620-0002.patch \
            file://CVE-2024-45620-0003.patch \
+           file://CVE-2023-5992-0001.patch \
+           file://CVE-2023-5992-0002.patch \
+           file://CVE-2023-5992-0003.patch \
+           file://CVE-2023-5992-0004.patch \
+           file://CVE-2023-5992-0005.patch \
+           file://CVE-2023-5992-0006.patch \
+           file://CVE-2023-5992-0007.patch \
+           file://CVE-2023-5992-0008.patch \
+           file://CVE-2023-5992-0009.patch \
+           file://CVE-2023-5992-0010.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.50.0


