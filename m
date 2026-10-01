Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96475CA5FD7
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9566.1790856321015994894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kakE9dL+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Ecf3955562
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RkBvrhbP3GS5BxGxNayltpOONuvjtk7KgIzJFg0+huM=; b=
	kakE9dL+OXO7gU+oWUEMvp5XL5vqd6OprsUmmESIzMkGD/TfKd8kKGvdd8SH9EXl
	SkelWBw2CWRdGYWxeFLBR/XdyI+TpbuovYepyLTNWxsrercqv1A1z3syE0XNU7Fz
	PYreDyrVK9849T7ckY0WvViHgX/bT39u16cKpQCfI6DF4MkJ+e0rGl3w4X9gc+b7
	8P5CWZNqv8vXuBEwLtHBRTWzuxnxznIS7l+dOydIvriGu9wjUB+gAn0lXvrrYm1m
	6ZTGDeXYNIG3Nn9aJYihCZjOEdnBSoMEZ1Y4MYK9I6fjDpEYH0FRH1x3vH+mHVbA
	NMTQCd3p/Mqa4gnwPE45/Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gaqw-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=je8RB5EA5bxYqCrPF8mOW2RVPJyfXz7prFYQQcwzL4z6HBJMll01y//SDWlqpSb+GamN9RYdYDf4Gh/tBSIjdCtrPs6hVvz/w0Su7UOjm/izYVJ/LbRQe46mOpkL/6KpV2CuOK37vrscgwJZR8WREJqpDTf04iXJDnQOi9BP69a6YGxuiYwC+ywz/wB9hauDOgFYUebYh1kAIq3iR+UfBUqELWtCf8uEdfLe7GYxRpdSGWl6rTKJpmsVP0v6gr37/iX/hp6F3xrH5Cp/eZS58BIw40iNz/hKmOUA+cRjAhzhCg92DsHenOVIO5b205jfT90islF2RtmO9yj/eVsI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkBvrhbP3GS5BxGxNayltpOONuvjtk7KgIzJFg0+huM=;
 b=BaoFZrVsiZmPuE7HJmc+UqNOuepiRYsSbrB8PbjgiWbd64R09yH9V5xJofSF7KFJSwwswXKmc9G5OzFIVJWt2mEoR7i1azYQlP7aLgvOQ5Qvxv0sHYAazTFSh079tXIvqlePOlKxZ+00SF0XTjjR7Po6WCvMbOY3qspHmd5Kby3vKvdvKqH5zsEePXHWKtFKoXprbaQnBbDG5ts3VcUJlf3zfJf67gfnu0klgg6QaYjkkqS5vD40OUkbW8iLCqQRoRbCHz9QREqU+DKJSWdt5Bbe0Ov7IsZKvSNZcKegohHJuAzaYRSN488fw+m9qWWki3KsNt2l26VIGCjyFA3xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:05:04 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:05:04 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 10/11] strongswan: fix CVE-2026-78134
Date: Thu,  1 Oct 2026 17:34:16 +0530
Message-Id: <20261001120417.1280843-11-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ba6dd8-8bf3-43f3-876f-08df1fb438cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|5023799004|11063799006|56012099006|3023799007|12006099003|6133799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	e7HGawykhyTmDoHXDMhkojOibwuP+7kfZ3ry9Txl+i+AO0bp0sSTthRCCfamON+kRYgOVBw/K8xtxAZqgWRA74CwT/s3NPDPhOmmNrymF8XaBEGgL+gEu5TkfFk5v50heW3+Dm4Ql1HIkjj/QuIEhSHg+bEokggYb4+mZdE5RPM00N4iMptZnmADd8lhCHW41lb+BReq7nkqrCxTGtkIdJ/ScXupKKE5JLbipCGb4D5BtIB9GQtz0v9ligkIR2yWCqFfhp+ZLbsZRlJobLOm3cvvuSisDaR26Jl7JHEz2mzxS5V2fc0djH+Cj9uFXm0LxpHQuWFUR4VrIn13O/3Rg38iRkmXwQxNJJ9iCVPRq7q7wg+GKWnDcIyiArlyBw9RnmUA6gGIU2N61lT4bQ1D6P4aCFg0Z3Bo4rkUfHG/zfDNzyxQftxoqK3kBWuFbx/DJ0ybir+XEIc/H8GBeY6zabgb3lpTx25iD/nGPanJwqEUhpEp5Dzr94wfcYdjrHWd8TjJPA4kw7Yk8kFJZpRajHYEGDfP4zUGOenRDAHzJquZwuORD3Q8RQxbrytrVNOw4ujEpvObbcVtS0Sg1gCkz0WAIB3aurVx/jJ8YuBwkrCqwdBPPDRL+ir3DstHrJS0qns12CGDczOPu1660Pn1EwpMfjSfHMl+ddmepbva9xo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(5023799004)(11063799006)(56012099006)(3023799007)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cPRHZZe6/bvMc+RW8GWve1soLLefSHxSlrcKGa0PkDTsHEGMZzzKQ5ybPn6k?=
 =?us-ascii?Q?uQFOI95UxphG69UEZ2jRvW99oATPXthvsi4mHgY0WtLbRh2JPduJMeAJtfm8?=
 =?us-ascii?Q?ipb/+wjX55nCbyj+959LX+T14/NJiFGm56I6Ds2hxgDHlee/9D807xS80WL6?=
 =?us-ascii?Q?ctutQ20SZq7FnrteV5tgfpv6WJvmNmnzNUmzdUqFnO74yVc73Vt9JvgZ+o8F?=
 =?us-ascii?Q?rZbl7UgkorfVEAT7nH+g5CuVoAoSoFpzUw08gl/JQDi2PCR2coG/bPmEj4p5?=
 =?us-ascii?Q?73vwF0eEeeyyQ1PzjKKE7A8bA/UjUeqMv5h+iG+MPymTF/hPK7VYwnVAx4Hs?=
 =?us-ascii?Q?GLEICIXWfmnhj7kCQpHtjG5RUlg5DWwp08AVFl6DG/tOO0kIrKJAPq8EWDPp?=
 =?us-ascii?Q?XX2KKw88HV2xXNtznW/80kMHM9E2t2daggOYuUI9QiAHTcEdTge2sM/aKrvZ?=
 =?us-ascii?Q?SMpV0iyAlYjhioV+iZaYYFabDzhRdyEq3po/njlbh+O/gp/4N7S99C5k3qZe?=
 =?us-ascii?Q?knSjr2CBpu205gCHmJkxxmNclNblyz72CiLvKGzfLagSuoKC+QIUGaBkvhPA?=
 =?us-ascii?Q?uhesN/C7X6M1ZeZfB91cVe728tv3of/Y3aCRYh4mS3Q8kF7wI2MupOh7zfBV?=
 =?us-ascii?Q?kOnBOay0NQ1SG2zbBukeA4HjqriksNim+vq1/3k9o+svJY9iKfR/lIDgfKD5?=
 =?us-ascii?Q?m+nVNpIknBtOzE1iqLFQHo6ayBUsTRI7wjHPtamh2kEkgIZJhjXC+7cGGjtB?=
 =?us-ascii?Q?hTMXJ/TutfJLhVRNxbkAfF27i7Z+Uft7sX3KZQugERICWXQJM6HRUXsq+xGM?=
 =?us-ascii?Q?IZqQoHFF0D9tCLm81JKoiEbhCwZEG9telKNuFJLj2AyQJxjgxMfid2MyS+3P?=
 =?us-ascii?Q?udH5cw4rgrM4TQ8kuHtw6S2WrXyBx4UsjzydKFYog5YaAA0LHJI2DPGWqGVV?=
 =?us-ascii?Q?VtYKOgdfYsMCbfm89jMpg+okbp97W7D26Z7iBoAwR2BhqflH9QrnniCPWrya?=
 =?us-ascii?Q?a1NPPYnQR4DloYHssDNJQ/Jyg+AXodqTO1+RGloLpplROyVEaz1ukW2Fd7l7?=
 =?us-ascii?Q?LNJ5Ln3sbTNVBBEVuMukih7wA0IPT1kFb9N4Sq1WIl5e7PFoEVb2dcN2cNfr?=
 =?us-ascii?Q?DPfvpM/3HXTme9ccsQcvroLZDD1YoZt7Sr+W4UKjd8llHk+SzEDfy56q+T2E?=
 =?us-ascii?Q?llBPLBwYSd0KjuFaLgCotXFbkRGHA9Xe76Lh4DqfpqMRz59TXawFEoDLzboB?=
 =?us-ascii?Q?RwrkJvp20jS5I+7iEPSFtFCyYb2BZyPuDoFJLWDVk/oLiX+TE5qHxE1kc1Ip?=
 =?us-ascii?Q?k3BvnGv+g0k+ARPAXuFJT2a+RaZfa59PnEhnRujOgXMN5TZoSYBUEDCBpDe2?=
 =?us-ascii?Q?JubCt79NpvVSGiDgE7V7QNdbi3mS+x3q+2O/PezXowMz+F3PckVwhQpI5JAF?=
 =?us-ascii?Q?A9Pbb7RT63qogCJ+g1mElh+Uh2RcNtfQHvESOr+I4Fj6M6AZHOmvVFVmFOi+?=
 =?us-ascii?Q?aIhqNz0qEeq1KIGALypLOYhBSY6Shz1r6RGyLot0kS0407ih4NVxlsRw/AsK?=
 =?us-ascii?Q?F41SM1Ds4SkJI1q+zXad+IpcGJArv770+BVmNwv/Z9fk7HX20UvZJfs2Ovwh?=
 =?us-ascii?Q?Yxbc51j5ieJTzeOWM6L/H4XtMIav3e77YNrEexKaBtkkQwROP/fo1JCp4w4P?=
 =?us-ascii?Q?7/ZxnovYROFagkZPFzbr+dav5H/2skJ3fYjGuRvC/cG0FY63z91akt4C9xKE?=
 =?us-ascii?Q?2/CpgPE5p/WNPFk7SFUU9vecYLwUq8mRvhPBPJ585RpsenN61lxV?=
X-Exchange-RoutingPolicyChecked: 
	0eIK+wP4aOgxghMfbiNR+0fuN3IbUwSJbbduS1Heo5v0oxJErkinlBL/JdFxEv8No/NcWsDAmYyEeAbe/lBbrN4A6XSe6gVJ2IDLDROW1I5Le9l9F0DNg9sLvHbBdA6S+pAJIYNnHBrruTu5FpOCTHPilYBf43s5TOBoz+NUtWdSSgfGPC2Pl1giOm2IP/OnifvPis4jgWOFlERmghNZAu25bL7J5UPDwM0rfTmeS3n/15khKg0ADZZiz2a5RBdt/ygPNpTjtj6puQgRciQm/DO1oyl0YHq+UHmOaUfMpiqZUiEOVcr8LES5YQeygJGKAY/UeZ6kisFkjFAYoyOM/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ba6dd8-8bf3-43f3-876f-08df1fb438cc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:05:02.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZpCJj087Oan8v5HFvbWpJXTO0AzaFKGiqvj9iMYGZO1ajzhGxyzaAckJihE/5O177QSX1eCR1h0OI+N5Z3fXRVi/en0wQ0Jf/6AhwvI3/ILqp4qo2XGwLaOtIXJFKEv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c80 cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=MMpcPSlh6HIoX9YATOkA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX6EBI5zbR7wmj
 VkqwR37e+u2ZOe66qcbs2RTacaQkrgjPI1teyWayd43/ZGHsDiAfhlk2AxB7KSYKTJA+zbZY/Z6
 kner4hun9Brl0W8kscA87XwD/pKGGXvX9jFE6eiJBXi28LV4OGDz
X-Proofpoint-ORIG-GUID: SSJoxAFJnSbpT4vd1d_koUpePLdzo26R
X-Proofpoint-GUID: SSJoxAFJnSbpT4vd1d_koUpePLdzo26R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX/czwMqEhzg4+
 tTGhW2to7RuwACOWhQsgO65BuZbJDHcse8w6obm+2uMzX5Zj0xDjmjcLMQbtnCtzW0Hu+oCVEfp
 6KDGcASCtrRqqp2rcI0fRzkyjlEWIbyMqDIiknyBryHDWcBdYf2nyHzTZbuVsF5XpBHtdnN5cL8
 GGmb/RlZfylLGWeOOw4FMzIVdlBRgcIQ1JTnyaipJK3rkWe/AytAXFRjWYI8bb8tPjvIDtk1EK+
 x1rum0QKSu2M0CbzRD6ZJ3xu/tzwSOCwSd+Ems767F5SRz2BxzTMwEKxOfsSByRK5ke9NADr+al
 S7gCiYoldn298FWzxCzz6r4GeauvJTqNBWSoZh2myIC6842uoYsH7JFmNQPSYKYBYU8XABlq5o3
 /mpICkFgXHT64XlR7CekJWqIzFgQAraa2hJLLnENZVkcVcBD6pb6ABANfqAFgt/XgPf6/rTk8w+
 WmAOh/oXxj0h6L17b6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130586

strongSwan (since 4.5.0, through 6.0.7) mishandles the
propagation of authentication details from inner EAP methods
in the eap-peap and eap-ttls plugins, which can result in
incorrect identity binding and potential authorization bypass.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78134]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78134).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78134]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78134/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78134.patch           | 711 ++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |   1 +
 2 files changed, 712 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch
new file mode 100644
index 0000000000..bf80457f4e
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch
@@ -0,0 +1,711 @@
+From 93ec5642432392fa183f1490ac391d0adde0b035 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 27 Jul 2026 15:05:45 +0200
+Subject: [PATCH] eap-ttls/peap: Return auth-cfg with details on TLS and inner
+ EAP method
+
+This fixes several issues with binding identities to the IKE SA.
+
+If the client is authenticated with a certificate, the previous code still
+used the client's proclaimed inner EAP-Identity when starting the EAP-TNC
+method.  So that method would potentially operate on an unverified
+identity.
+
+Second, if the inner EAP method overrides the client identity (the only
+one is currently EAP-MSCHAPV2), the missing merge meant that the outer
+IKE/EAP identity could potentially be unconfirmed.
+
+For inner methods that don't override the identity (e.g. EAP-MD5), not
+propagating the inner EAP-Identity could potentially have the same
+effect.
+
+While the EAP-TTLS implementation returned the auth-cfg of the TLS
+exchange since the first referenced commit, this was mainly intended to
+enforce public key constraints.  So it didn't cover the phase 2 EAP
+methods.  For some reason EAP-PEAP did not get that method at all in that
+changeset, so we'll add that now.
+
+Additionally, the EAP-PEAP implementation now forwards the phase 2 EAP
+method type to EAP-TNC like the EAP-TTLS implementation already did,
+which allows a more informed decision on the client's identity.
+
+Fixes: 0864a31d13ff ("eap-ttls: Support EAP auth information getter in EAP-TTLS")
+Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
+Fixes: 2a421163bf4f ("make TNC client authentication type available to IMVs")
+Fixes: 1be296dfb2af ("implemented the PEAP tunneling protocol as an EAP plugin")
+Fixes: CVE-2026-78134
+CVE: CVE-2026-78134
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78134/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libcharon/plugins/eap_peap/eap_peap.c     | 49 ++++++++++-
+ .../plugins/eap_peap/eap_peap_peer.c          | 20 +++++
+ .../plugins/eap_peap/eap_peap_peer.h          |  7 ++
+ .../plugins/eap_peap/eap_peap_server.c        | 81 ++++++++++++++++---
+ .../plugins/eap_peap/eap_peap_server.h        |  7 ++
+ src/libcharon/plugins/eap_ttls/eap_ttls.c     | 43 +++++++++-
+ .../plugins/eap_ttls/eap_ttls_peer.c          | 19 +++++
+ .../plugins/eap_ttls/eap_ttls_peer.h          |  7 ++
+ .../plugins/eap_ttls/eap_ttls_server.c        | 56 +++++++++++--
+ .../plugins/eap_ttls/eap_ttls_server.h        |  7 ++
+ 10 files changed, 278 insertions(+), 18 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap.c b/src/libcharon/plugins/eap_peap/eap_peap.c
+index 3573cba7c6eb..cd942f135dee 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap.c
++++ b/src/libcharon/plugins/eap_peap/eap_peap.c
+@@ -40,6 +40,25 @@ struct private_eap_peap_t {
+ 	 * TLS stack, wrapped by EAP helper
+ 	 */
+ 	tls_eap_t *tls_eap;
++
++	/**
++	 * Role
++	 */
++	bool is_server;
++
++	/**
++	 * Actual server/client implementation
++	 */
++	union {
++		tls_application_t *application;
++		eap_peap_server_t *server;
++		eap_peap_peer_t *client;
++	} impl;
++
++	/**
++	 * Cached auth data for TLS and inner EAP methods
++	 */
++	auth_cfg_t *auth;
+ };
+ 
+ /** Maximum number of EAP-PEAP messages/fragments allowed */
+@@ -113,10 +132,34 @@ METHOD(eap_method_t, is_mutual, bool,
+ 	return TRUE;
+ }
+ 
++METHOD(eap_method_t, get_auth, auth_cfg_t*,
++	private_eap_peap_t *this)
++{
++	if (!this->auth)
++	{
++		auth_cfg_t *inner;
++
++		this->auth = auth_cfg_create();
++		this->auth->merge(this->auth,
++						  this->tls_eap->get_auth(this->tls_eap), FALSE);
++		if (this->is_server)
++		{
++			inner = this->impl.server->get_auth(this->impl.server);
++		}
++		else
++		{
++			inner = this->impl.client->get_auth(this->impl.client);
++		}
++		this->auth->merge(this->auth, inner, FALSE);
++	}
++	return this->auth;
++}
++
+ METHOD(eap_method_t, destroy, void,
+ 	private_eap_peap_t *this)
+ {
+ 	this->tls_eap->destroy(this->tls_eap);
++	DESTROY_IF(this->auth);
+ 	free(this);
+ }
+ 
+@@ -135,6 +178,7 @@ static private_eap_peap_t *eap_peap_create_empty(void)
+ 				.get_type = _get_type,
+ 				.is_mutual = _is_mutual,
+ 				.get_msk = _get_msk,
++				.get_auth = _get_auth,
+ 				.get_identifier = _get_identifier,
+ 				.set_identifier = _set_identifier,
+ 				.destroy = _destroy,
+@@ -147,7 +191,7 @@ static private_eap_peap_t *eap_peap_create_empty(void)
+ /**
+  * Generic private constructor
+  */
+-static eap_peap_t *eap_peap_create(private_eap_peap_t * this,
++static eap_peap_t *eap_peap_create(private_eap_peap_t *this,
+ 								   identification_t *server,
+ 								   identification_t *peer, bool is_server,
+ 								   tls_application_t *application)
+@@ -157,6 +201,9 @@ static eap_peap_t *eap_peap_create(private_eap_peap_t * this,
+ 	bool include_length;
+ 	tls_t *tls;
+ 
++	this->is_server = is_server;
++	this->impl.application = application;
++
+ 	if (is_server && !lib->settings->get_bool(lib->settings,
+ 								"%s.plugins.eap-peap.request_peer_auth", FALSE,
+ 								lib->ns))
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_peer.c b/src/libcharon/plugins/eap_peap/eap_peap_peer.c
+index 95213a3286e5..f6c087ab2b90 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_peer.c
++++ b/src/libcharon/plugins/eap_peap/eap_peap_peer.c
+@@ -52,6 +52,11 @@ struct private_eap_peap_peer_t {
+ 	 */
+ 	eap_method_t *ph2_method;
+ 
++	/**
++	 * Auth data for phase 2 methods
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -166,6 +171,12 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->ph2_method->get_auth)
++			{
++				this->auth->merge(this->auth,
++								  this->ph2_method->get_auth(this->ph2_method),
++								  FALSE);
++			}
+ 			this->ph2_method->destroy(this->ph2_method);
+ 			this->ph2_method = NULL;
+ 			/* fall through to NEED_MORE */
+@@ -220,11 +231,18 @@ METHOD(tls_application_t, build, status_t,
+ 	return INVALID_STATE;
+ }
+ 
++METHOD(eap_peap_peer_t, get_auth, auth_cfg_t*,
++	private_eap_peap_peer_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_peap_peer_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->ph2_method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -247,10 +265,12 @@ eap_peap_peer_t *eap_peap_peer_create(identification_t *server,
+ 				.build = _build,
+ 				.destroy = _destroy,
+ 			},
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+ 		.peer = peer->clone(peer),
+ 		.ph1_method = eap_method,
++		.auth = auth_cfg_create(),
+ 		.avp = eap_peap_avp_create(FALSE),
+ 	);
+ 
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_peer.h b/src/libcharon/plugins/eap_peap/eap_peap_peer.h
+index 53c25cdd6bdf..7d169574321e 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_peer.h
++++ b/src/libcharon/plugins/eap_peap/eap_peap_peer.h
+@@ -38,6 +38,13 @@ struct eap_peap_peer_t {
+ 	 * Implements the TLS application data handler.
+ 	 */
+ 	tls_application_t application;
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_peap_peer_t *this);
+ };
+ 
+ /**
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_server.c b/src/libcharon/plugins/eap_peap/eap_peap_server.c
+index 29ab9b4512aa..388c3c6b40b9 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_server.c
++++ b/src/libcharon/plugins/eap_peap/eap_peap_server.c
+@@ -20,6 +20,8 @@
+ #include <utils/debug.h>
+ #include <daemon.h>
+ 
++#include <sa/eap/eap_inner_method.h>
++
+ typedef struct private_eap_peap_server_t private_eap_peap_server_t;
+ 
+ /**
+@@ -77,6 +79,16 @@ struct private_eap_peap_server_t {
+ 	 */
+ 	eap_method_t *ph2_method;
+ 
++	/**
++	 * Type of the completed phase 2 EAP method
++	 */
++	eap_type_t phase2_type;
++
++	/**
++	 * Auth data for phase 2 method
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -132,8 +144,11 @@ static status_t start_phase2_auth(private_eap_peap_server_t *this)
+ /**
+  * If configured, start EAP-TNC protocol
+  */
+-static status_t start_phase2_tnc(private_eap_peap_server_t *this)
++static status_t start_phase2_tnc(private_eap_peap_server_t *this,
++								 eap_type_t auth_type)
+ {
++	eap_inner_method_t *inner_method;
++
+ 	if (this->start_phase2_tnc && lib->settings->get_bool(lib->settings,
+ 						"%s.plugins.eap-peap.phase2_tnc", FALSE, lib->ns))
+ 	{
+@@ -145,6 +160,8 @@ static status_t start_phase2_tnc(private_eap_peap_server_t *this)
+ 			DBG1(DBG_IKE, "%N method not available", eap_type_names, EAP_TNC);
+ 			return FAILED;
+ 		}
++		inner_method = (eap_inner_method_t *)this->ph2_method;
++		inner_method->set_auth_type(inner_method, auth_type);
+ 		this->start_phase2_tnc = FALSE;
+ 
+ 		/* synchronize EAP message identifiers of inner protocol with outer */
+@@ -218,9 +235,13 @@ METHOD(tls_application_t, process, status_t,
+ 		DBG1(DBG_IKE, "received tunneled EAP-PEAP AVP [EAP/%N]",
+ 								eap_code_short_names, code);
+ 		in->destroy(in);
+-		/* if EAP_SUCCESS check if to continue phase2 with EAP-TNC */
+-		return (this->phase2_result == EAP_SUCCESS && code == EAP_SUCCESS) ?
+-			   start_phase2_tnc(this) : FAILED;
++		if (this->phase2_result == EAP_SUCCESS && code == EAP_SUCCESS)
++		{
++			/* only accept SUCCESS once after a successful inner method */
++			this->phase2_result = EAP_FAILURE;
++			return start_phase2_tnc(this, this->phase2_type);
++		}
++		return FAILED;
+ 	}
+ 
+ 	if (this->ph2_method)
+@@ -245,6 +266,10 @@ METHOD(tls_application_t, process, status_t,
+ 	if (!received_vendor && received_type == EAP_IDENTITY)
+ 	{
+ 		chunk_t eap_id;
++		bool peer_auth;
++
++		peer_auth = lib->settings->get_bool(lib->settings,
++					"%s.plugins.eap-peap.request_peer_auth", FALSE, lib->ns);
+ 
+ 		if (this->ph2_method == NULL)
+ 		{
+@@ -271,9 +296,22 @@ METHOD(tls_application_t, process, status_t,
+ 
+ 		if (this->ph2_method->get_msk(this->ph2_method, &eap_id) == SUCCESS)
+ 		{
+-			this->peer->destroy(this->peer);
+-			this->peer = identification_create_from_data(eap_id);
+-			DBG1(DBG_IKE, "received EAP identity '%Y'", this->peer);
++			identification_t *id;
++
++			id = identification_create_from_data(eap_id);
++			if (peer_auth && !id->equals(id, this->peer))
++			{
++				DBG1(DBG_IKE, "received tunneled EAP identity '%Y', keeping "
++					 "certificate-authenticated identity '%Y'", id, this->peer);
++				id->destroy(id);
++			}
++			else
++			{
++				DBG1(DBG_IKE, "received EAP identity '%Y'", id);
++				this->auth->add(this->auth, AUTH_RULE_EAP_IDENTITY, id);
++				this->peer->destroy(this->peer);
++				this->peer = id->clone(id);
++			}
+ 		}
+ 
+ 		in->destroy(in);
+@@ -281,10 +319,9 @@ METHOD(tls_application_t, process, status_t,
+ 		this->ph2_method = NULL;
+ 
+ 		/* Start Phase 2 of EAP-PEAP authentication */
+-		if (lib->settings->get_bool(lib->settings,
+-					"%s.plugins.eap-peap.request_peer_auth", FALSE, lib->ns))
++		if (peer_auth)
+ 		{
+-			return start_phase2_tnc(this);
++			return start_phase2_tnc(this, EAP_TLS);
+ 		}
+ 		else
+ 		{
+@@ -305,11 +342,26 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->ph2_method->get_auth)
++			{
++				identification_t *id;
++				auth_cfg_t *auth;
++
++				auth = this->ph2_method->get_auth(this->ph2_method);
++				id = auth->get(auth, AUTH_RULE_EAP_IDENTITY);
++				if (id)
++				{
++					this->peer->destroy(this->peer);
++					this->peer = id->clone(id);
++				}
++				this->auth->merge(this->auth, auth, FALSE);
++			}
+ 			DBG1(DBG_IKE, "%N phase2 authentication of '%Y' with %N successful",
+ 							eap_type_names, EAP_PEAP, this->peer,
+ 							eap_type_names, type);
+ 			this->ph2_method->destroy(this->ph2_method);
+ 			this->ph2_method = NULL;
++			this->phase2_type = type;
+ 
+ 			/* EAP-PEAP requires the sending of an inner EAP_SUCCESS message */
+ 			this->phase2_result = EAP_SUCCESS;
+@@ -407,11 +459,18 @@ METHOD(eap_peap_server_t, set_tls, void,
+ 	this->tls = tls;
+ }
+ 
++METHOD(eap_peap_server_t, get_auth, auth_cfg_t*,
++	private_eap_peap_server_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_peap_server_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->ph2_method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -435,10 +494,12 @@ eap_peap_server_t *eap_peap_server_create(identification_t *server,
+ 				.destroy = _destroy,
+ 			},
+ 			.set_tls = _set_tls,
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+ 		.peer = peer->clone(peer),
+ 		.ph1_method = eap_method,
++		.auth = auth_cfg_create(),
+ 		.start_phase2 = TRUE,
+ 		.start_phase2_tnc = TRUE,
+ 		.start_phase2_id = lib->settings->get_bool(lib->settings,
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_server.h b/src/libcharon/plugins/eap_peap/eap_peap_server.h
+index 3abe88bea68d..8080e9f23b05 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_server.h
++++ b/src/libcharon/plugins/eap_peap/eap_peap_server.h
+@@ -47,6 +47,13 @@ struct eap_peap_server_t {
+ 	 * @param tls		TLS connection
+ 	 */
+ 	void (*set_tls)(eap_peap_server_t *this, tls_t *tls);
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_peap_server_t *this);
+ };
+ 
+ /**
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls.c b/src/libcharon/plugins/eap_ttls/eap_ttls.c
+index d8ad781f0994..3df78bba4b58 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls.c
+@@ -40,6 +40,25 @@ struct private_eap_ttls_t {
+ 	 * TLS stack, wrapped by EAP helper
+ 	 */
+ 	tls_eap_t *tls_eap;
++
++	/**
++	 * Role
++	 */
++	bool is_server;
++
++	/**
++	 * Actual server/client implementation
++	 */
++	union {
++		tls_application_t *application;
++		eap_ttls_server_t *server;
++		eap_ttls_peer_t *client;
++	} impl;
++
++	/**
++	 * Cached auth data for TLS and inner EAP methods
++	 */
++	auth_cfg_t *auth;
+ };
+ 
+ /** Maximum number of EAP-TTLS messages/fragments allowed */
+@@ -116,13 +135,31 @@ METHOD(eap_method_t, is_mutual, bool,
+ METHOD(eap_method_t, get_auth, auth_cfg_t*,
+ 	private_eap_ttls_t *this)
+ {
+-	return this->tls_eap->get_auth(this->tls_eap);
++	if (!this->auth)
++	{
++		auth_cfg_t *inner;
++
++		this->auth = auth_cfg_create();
++		this->auth->merge(this->auth,
++						  this->tls_eap->get_auth(this->tls_eap), FALSE);
++		if (this->is_server)
++		{
++			inner = this->impl.server->get_auth(this->impl.server);
++		}
++		else
++		{
++			inner = this->impl.client->get_auth(this->impl.client);
++		}
++		this->auth->merge(this->auth, inner, FALSE);
++	}
++	return this->auth;
+ }
+ 
+ METHOD(eap_method_t, destroy, void,
+ 	private_eap_ttls_t *this)
+ {
+ 	this->tls_eap->destroy(this->tls_eap);
++	DESTROY_IF(this->auth);
+ 	free(this);
+ }
+ 
+@@ -153,6 +190,10 @@ static eap_ttls_t *eap_ttls_create(identification_t *server,
+ 				.destroy = _destroy,
+ 			},
+ 		},
++		.is_server = is_server,
++		.impl = {
++			.application = application,
++		},
+ 	);
+ 	if (is_server && !lib->settings->get_bool(lib->settings,
+ 								"%s.plugins.eap-ttls.request_peer_auth", FALSE,
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c
+index 63126a5c3a87..f8229f5e0ff8 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c
+@@ -54,6 +54,11 @@ struct private_eap_ttls_peer_t {
+ 	 */
+ 	eap_method_t *method;
+ 
++	/**
++	 * Auth data for phase 2 method
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -215,6 +220,11 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->method->get_auth)
++			{
++				this->auth->merge(this->auth,
++								  this->method->get_auth(this->method), FALSE);
++			}
+ 			this->method->destroy(this->method);
+ 			this->method = NULL;
+ 			/* fall through to NEED_MORE */
+@@ -275,11 +285,18 @@ METHOD(tls_application_t, build, status_t,
+ 	return INVALID_STATE;
+ }
+ 
++METHOD(eap_ttls_peer_t, get_auth, auth_cfg_t*,
++	private_eap_ttls_peer_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_ttls_peer_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -301,10 +318,12 @@ eap_ttls_peer_t *eap_ttls_peer_create(identification_t *server,
+ 				.build = _build,
+ 				.destroy = _destroy,
+ 			},
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+ 		.peer = peer->clone(peer),
+ 		.start_phase2 = TRUE,
++		.auth = auth_cfg_create(),
+ 		.avp = eap_ttls_avp_create(),
+ 	);
+ 
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h
+index 0c3d90a45b7c..69a8435aefdb 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h
+@@ -37,6 +37,13 @@ struct eap_ttls_peer_t {
+ 	 * Implements the TLS application data handler.
+ 	 */
+ 	tls_application_t application;
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_ttls_peer_t *this);
+ };
+ 
+ /**
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_server.c b/src/libcharon/plugins/eap_ttls/eap_ttls_server.c
+index fc97f811ca5e..e1de1bf63c3f 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_server.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_server.c
+@@ -60,6 +60,11 @@ struct private_eap_ttls_server_t {
+ 	 */
+ 	eap_method_t *method;
+ 
++	/**
++	 * Auth data for phase 2 method
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -220,6 +225,10 @@ METHOD(tls_application_t, process, status_t,
+ 	if (!received_vendor && received_type == EAP_IDENTITY)
+ 	{
+ 		chunk_t eap_id;
++		bool peer_auth;
++
++		peer_auth = lib->settings->get_bool(lib->settings,
++					"%s.plugins.eap-ttls.request_peer_auth", FALSE, lib->ns);
+ 
+ 		if (this->method == NULL)
+ 		{
+@@ -244,9 +253,22 @@ METHOD(tls_application_t, process, status_t,
+ 
+ 		if (this->method->get_msk(this->method, &eap_id) == SUCCESS)
+ 		{
+-			this->peer->destroy(this->peer);
+-			this->peer = identification_create_from_data(eap_id);
+-			DBG1(DBG_IKE, "received EAP identity '%Y'", this->peer);
++			identification_t *id;
++
++			id = identification_create_from_data(eap_id);
++			if (peer_auth && !id->equals(id, this->peer))
++			{
++				DBG1(DBG_IKE, "received tunneled EAP identity '%Y', keeping "
++					 "certificate-authenticated identity '%Y'", id, this->peer);
++				id->destroy(id);
++			}
++			else
++			{
++				DBG1(DBG_IKE, "received EAP identity '%Y'", id);
++				this->auth->add(this->auth, AUTH_RULE_EAP_IDENTITY, id);
++				this->peer->destroy(this->peer);
++				this->peer = id->clone(id);
++			}
+ 		}
+ 
+ 		in->destroy(in);
+@@ -254,8 +276,7 @@ METHOD(tls_application_t, process, status_t,
+ 		this->method = NULL;
+ 
+ 		/* Start Phase 2 of EAP-TTLS authentication */
+-		if (lib->settings->get_bool(lib->settings,
+-					"%s.plugins.eap-ttls.request_peer_auth", FALSE, lib->ns))
++		if (peer_auth)
+ 		{
+ 			return start_phase2_tnc(this, EAP_TLS);
+ 		}
+@@ -278,6 +299,20 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->method->get_auth)
++			{
++				identification_t *id;
++				auth_cfg_t *auth;
++
++				auth = this->method->get_auth(this->method);
++				id = auth->get(auth, AUTH_RULE_EAP_IDENTITY);
++				if (id)
++				{
++					this->peer->destroy(this->peer);
++					this->peer = id->clone(id);
++				}
++				this->auth->merge(this->auth, auth, FALSE);
++			}
+ 			DBG1(DBG_IKE, "%N phase2 authentication of '%Y' with %N successful",
+ 							eap_type_names, EAP_TTLS, this->peer,
+ 							eap_type_names, type);
+@@ -348,11 +383,18 @@ METHOD(tls_application_t, build, status_t,
+ 	return INVALID_STATE;
+ }
+ 
++METHOD(eap_ttls_server_t, get_auth, auth_cfg_t*,
++	private_eap_ttls_server_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_ttls_server_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -374,11 +416,13 @@ eap_ttls_server_t *eap_ttls_server_create(identification_t *server,
+ 				.build = _build,
+ 				.destroy = _destroy,
+ 			},
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+-		.peer = peer->clone(peer),
++		.auth = auth_cfg_create(),
+ 		.start_phase2 = TRUE,
+ 		.start_phase2_tnc = TRUE,
++		.peer = peer->clone(peer),
+ 		.avp = eap_ttls_avp_create(),
+ 	);
+ 
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_server.h b/src/libcharon/plugins/eap_ttls/eap_ttls_server.h
+index 1e13f55c4c28..3348706cf280 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_server.h
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_server.h
+@@ -37,6 +37,13 @@ struct eap_ttls_server_t {
+ 	 * Implements the TLS application data handler.
+ 	 */
+ 	tls_application_t application;
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_ttls_server_t *this);
+ };
+ 
+ /**
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index ade8dd4696..aa680d609f 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78131.patch \
            file://CVE-2026-78132.patch \
            file://CVE-2026-78133.patch \
+           file://CVE-2026-78134.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


