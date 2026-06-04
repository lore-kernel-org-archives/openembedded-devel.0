Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48101CD6E75
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 20:53:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.988.1780606414799826271
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 13:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oJhnu1NF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0615eac37d=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654KPcYu3757472
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Jun 2026 13:53:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=CSAH9qaGk+hiitHGTnU8
	9yBy7TmyrjcBe0yruhoiWgY=; b=oJhnu1NF/C1CdTeC1AreoBRmv0Juv8XyKa3w
	CK9d7jS2OAvesur/8KUIjT1GT+uaWcV0RqLHyezDUK2pP9C7MuwezNaWepvzPqtY
	mg6RVG0Y/o9vutmNHl9rWDhY3RlviajAjy/4Sny2qr8OPVPPFhj0zPRayyiU+8/8
	LCnWM67pnBrFC0JQqnNC/m+TKumZ7lP44c+6hYIKqRDnsiiJS+SXOZoaNBM9Lnod
	LM2reHtx8drKgHdpDtncK8w63bn/V0fqvZCtLt+xeRYDKaYkwKhraYY+gwu5F04z
	+jS/D57EYIijDFVrbg6zgw5fFoIl3MXgOoJYllxAbryL1oMEgw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ek5m31387-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 13:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJztxhG6+qQEMneo6H+aBkUBQkKxdN6FUAInPTDkK6r/d2VxYS65tKupWORHSt1q6SaC3kBAZ6D+nduNVqtny+AIB+zezK8YPAyEQYE0DuhB32bZrxHw3gCIJjzximnEj+jDy3vAlbgirxkFao5p+0QS3THwouxSyMXgGsDcGh0q4Mab09Jci2x9I+QXpw3yfN3kicEQ7jk+v0fOZrgfA/jLHp4CfZQqZtPxh+3CkdNLWhKUo6p2xd7MLSK0+0B0M36lGXbTeAUiRU/zC0HATdpK9EXPRu+vMDCSvh8d5JiCpQoIgkYf7sEe7Ks9wNpj6XbGbLAq32lcJ+su8t4IbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSAH9qaGk+hiitHGTnU89yBy7TmyrjcBe0yruhoiWgY=;
 b=CIhpgZnhlldwT1HftKPbpb8TFfzIhLT461N+WeFg1pirDqQZwzaPkK/nj0+rZRcIvADGBNaYerGamK6SI7CPSj4JloOWkVkOS5AikPtlJiryCBLe+YzTnZfQHK8lXGrPNsUk+m0QPo0pvUV/qL4D15CMMFappMKqMXl5WenCpWp2c0pNpXo7Q/q2nqCujWv9fCAyKJoRKglD+RFHQqMgGi0Ygxw+4RL4dhOgbewBq4DE34GGGtC9Xrs4NvOrBK1CxdqeBoH5YFbWPfv9AxHqavbc2APwY/Vwuxgu9tgv2g9A1te92+JWiFTdFqqc7iT1+Sqc5Y3IMXi3UN345Shndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 20:53:29 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 20:53:29 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org, Randy.MacLeod@windriver.com
Subject: [meta-networking][PATCH] dnsmasq: upgrade 2.92 -> 2.93
Date: Fri,  5 Jun 2026 02:22:57 +0530
Message-Id: <20260604205257.2772910-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|SA1PR11MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 5945a993-545e-4aff-006f-08dec27b54cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|5023799004|11063799006|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	e/jCi3Q2t4CS7ZRpz0eOT+1Vw73eh5WfAp6Wst1c0DIRsnSU2P9Ag3xzT9ui8vmVfejtrOO5/jtQlDTaDT7KdKERlv/wDIAOcn/moGi4Cv175z3czarlVD2Q8ZA2xVcrbkwuVi7lbs2HTNhdyouCE3w7opwrk3HMMZJ/Es9QYs2s1OTr9XxStRGl9qIAsvCGyMbcz+0TdDO5AczbM67Z7AqD6PrnJX1UzwGw0x15cgl4FXWZuhqISis4Xne9BECoIMK+z00LW/JjVBXss7tT7yaXrHuNATZw3pakadTAYB5D9FVfFRq4Fo1QvSaC4w6TOla+nPo5TKkGYOI3qfsqKYLTH/zTzb426JXWzS4K1gW0X2+mutZbWlDL53gWSbtmKCia983hRkK2gXSqositZBXIWYHow6Fhu8bj9OVT8zbX5fwdQmxaki9amt9bvxUXkLKqsXRoIsBkxm1wMxwyjAqA2QXNRCnkw1z6ahnxNYqPFfT8DZazKSJVz73T9zAl4vk25Gy6xZewdga9GUYpjGsJjoy8ZFrgySABCmoPKNKWQdkOIkzYl51z+v/wTKII/IU1Q1/+QpGcD47xie5XDdTk2/H3N4mXjXq5MN4YH59NcNjfa+W8WaVQCcV1CQqR3T36iaqzWRy0FVb23f30msVTAmJYGF0+ZMFC7+6oCyrreXLWJdfCG+snlEwr43vPT4oht05EudJceCpJiLptVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(5023799004)(11063799006)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?agh/OMDJlUVywQ9JsC8TW/Xoixr2S2/6NAgGN7wJiXst9O7X6gF6Za4A7PRC?=
 =?us-ascii?Q?GL6EszKqdcdehkitR352WN/PDQz/0CBQT56FTI7zCMlDXV0mSjBdiKTKzZ/z?=
 =?us-ascii?Q?zH2znE1QiOAFUh5W8Cn9xXmFGuaEOM/E5gL+qWWNF19UCccUkNgvgYohRUfe?=
 =?us-ascii?Q?/CW2ara80BkWo8cIIexdncDM852ScNZMXHC3jw99c7DNMHa706z9vaK9nuzh?=
 =?us-ascii?Q?E+P+kiU9siEOHQigoYA6mLcqS4FMFEMA7Memt7hpouD49u691zFmyr6sLfHX?=
 =?us-ascii?Q?SG4MOtUaP9mfg7+KV/V3PlqeXepk5iX1doxAdLLt9g9LTmz3b8Bth/pDYB0D?=
 =?us-ascii?Q?OMXqWo8b0hNo43yoaP4NeGwxVZAcabAA60tW8qgguauVEody6hAyq7fTR9Oo?=
 =?us-ascii?Q?RNtQs3Onm7MuJ//heIu5clzOgQpxP9X4g1bLocDw5BDFKQminqpAK34SwFO/?=
 =?us-ascii?Q?JRpIT0z266D6Aq37iwcrHGEf860wvT6jhDaTqic6K/9sZ7N+Klnnj5FLHbWL?=
 =?us-ascii?Q?D4Kw5uyEgaI/QsG2XsLNOPeSF+rnZQKKcu73SerAIvF/u/f4oJfnN8YIVWUD?=
 =?us-ascii?Q?4nmj7CPHwuiiGEZjEU+quTuGaGDVSjmyz++ra/KwmWceLomZ/d5++J616vNV?=
 =?us-ascii?Q?cZ2JwTHcZVq+5TJJXoiFILt/4mE1RoBY3zOMhzH9L5CDM6rCTYOQQFfDUVIK?=
 =?us-ascii?Q?+gxeoR86IqJKrLhm8faKiBX8anIOSdX9nnHjAcDkdzUyZ/2S4ZhdAKZ0+C75?=
 =?us-ascii?Q?rj7NlbCQ4dMisf754mRBgm0Lx7pCtClygH6qSzPFrDktYQiTOIdH4iU9jf5s?=
 =?us-ascii?Q?KRkF57eOW3LVRPbqGCd1ATmbBa4Wnri9lfAy72qtta0CvCINGwLo77GyHbER?=
 =?us-ascii?Q?pRojKuUy+Z9VxuxmuuvbYQQSANNnE+R1ECYTJjc40GdtY7a5UA4L+krFcc9U?=
 =?us-ascii?Q?COxx36/sE+1JvUzXTqnLppdsuCc2GmVJ/AyFyennfxXLjACb0x34wFGcAZbE?=
 =?us-ascii?Q?CSfo4dCZEICiRoc5CbEBg/tDWmA0Qbk/cEFuU2IFGNqkkhjeX2PZlD/I+OUt?=
 =?us-ascii?Q?2b5xnYZTu4SVKGxPJleaZWYVmU+0UO2L1IuHrtSNn3STjIclow6m56OIkySK?=
 =?us-ascii?Q?xhsVGLELQ0GQFHgAddR+8nlNrNjLoRkm/M6CibDj4xn7ahZmhwZIBK3pQXDQ?=
 =?us-ascii?Q?QGZpL5Ki0M74yAgnmeqs8oOi8YgXojr1PScUUp+IlASyMwX8Z7AZB+546nLl?=
 =?us-ascii?Q?nvSa+MTeUBBPdJ0tlq+hif8hhRwp/DPvlNy68Dy7WlpVh930s8F4zAO2xnll?=
 =?us-ascii?Q?zVEaa+/7YV0JSJKj6NHGZPjUYzy7AGcmI7DmC4stGgc6LoBJ4WbEo4uJBPqV?=
 =?us-ascii?Q?/4/jjrC3tnZk1ru1/oFMscuXAqy02Oyc3mwXaFHSRzx/w82DJcEZ0CRdw/hZ?=
 =?us-ascii?Q?U0gU6so1eGDK6Fv16KTB/8AgRveNxHPj7J/pLUDIHMm/YRAO70Mf7URJsiKS?=
 =?us-ascii?Q?NCEy3Z+XJIieUWDZzbSD7dWGxFZKXmw2gBxzXUGpoS4F/Cvzg9n5/QtqbbAD?=
 =?us-ascii?Q?GAklLPuF/zMFIjpvhJv7Io2m9/wrJFEPoP3SpoCAzvTqRNks3OZ3UNB8r2yB?=
 =?us-ascii?Q?YCLaTZw2O76UX5h9gbs6994MgaTvLE3Oj6yB+MOepKNIY02AN1JcZnKH62Lp?=
 =?us-ascii?Q?iHfO32NXA/DFHbruZxZ5wevCr8DFlsqbsHBaxIG+6Mu2wPSxeZL34JV9e+72?=
 =?us-ascii?Q?Gh6Y0/fKYqym5Bw9zPF6ThymWdBm3BYM2jrUC75ntcnq2YTo9MY2?=
X-Exchange-RoutingPolicyChecked: 
	li5UUMqNLeAP26PyfqF31qJkyEn+82SNnmXMditXD9PguNYSVh1F9BtHb+G7kff6q8c8ak/zojFnshvF1URdK6tD3Fr+X7qKI3Dpdmyvbx+PTs7AAnlChuaVy5oWRs7q3whgGCp1niFOrBvDKQeKjkZfnj79qUTZ7+D9C5f04okhX8PiygTT5hB+IjiM9XTpW5McvmL4o3cO2wlNhU25PFeDVGCLT8U0HF/zKNOEa5SnidBIVZbn0kwqVIXIQuboDqvGT5Rhi3rBuBfLbzcnAjwyqaS0aFpOCR5cMJlT5pcKwPzxeXLgyCMIylHJGjpVviWi1UeLJeFrnPOSVFCxow==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5945a993-545e-4aff-006f-08dec27b54cd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 20:53:29.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUaLhyYpZE6IDRY5TOhJCiTzX7+UxmRE4duTNF0qqReiExqzPseU5jN4EPM9wS+u26Wcu13tz4gQ429OaXtJdJuk1ploM8n+bM7C9pI5E5Jp4mHvhjNBT9F8VFz3GdBl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIwNCBTYWx0ZWRfX1IDNGKj4DpJi
 N8Uiq0VFnxpTa1HhLDzk20NesxsfF14MazS9UFGMqTkRN/TMUX+StxNPlNa3CXlzT6Q1Zh3Vokh
 +5snHFqcr18O0oHRuxx44Lu8xRBf0pQCyoVEezaUwE+5jYdP1ppMuAc5uyvE50UVbTOXT+MbOIJ
 Ih1THQWEmXbwghNZipxKkKaLEqdjJJBI8HI8MhtptXps6WLmMXypUtm1i2lmREY5JpdcC1tXXNj
 +kiGw1+Gao4PBPIAK/qwxpEM9NENpl8OP1+6FkYGw8HTHiUrzdmbx9IOAeXFZrS/IlWVGfNni57
 ujo+kXulMIjt0eRbnli5VfouMAk/VXPgId6ddxnYvODr+G3NFor0IH4Q7S7l24TxstBhXLiSvaF
 CTaM9HSXIiuV1uNRXqOfadaQhQSGD4o0B9PCAs6KwZM1AWfkmW2dLAMnXYRE00XOd+GSwOtcTud
 gtOIb6CEgYFlXRA6K0A==
X-Proofpoint-GUID: hRm2DxFHXlnfMX5OOMZ_aRsa5oDZAXXF
X-Proofpoint-ORIG-GUID: hRm2DxFHXlnfMX5OOMZ_aRsa5oDZAXXF
X-Authority-Analysis: v=2.4 cv=CPsamxrD c=1 sm=1 tr=0 ts=6a21e5ce cx=c_pps
 a=8KrPlQlxEYnZEdstGaGrzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=7fWGnilLAAAA:8
 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=VBowi81kAAAA:8 a=AhbYoGBSbxa3e_gOttcA:9
 a=3d8uI0wEp6Yx22Y37K61:22 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040204
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 20:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127403

ChangeLog:
https://dnsmasq.org/CHANGELOG

- Update checksum
- Remove obsolete patches
- Verified build and runtime functionality

Security fixes (included upstream in 2.93) :
- CVE-2026-2291
- CVE-2026-4890
- CVE-2026-4891
- CVE-2026-4892
- CVE-2026-4893
- CVE-2026-5172

- Removed patches corresponding to the above CVEs
  as fixes are now part of upstream release

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../{dnsmasq_2.92.bb => dnsmasq_2.93.bb}      |  8 +--
 .../dnsmasq/files/CVE-2026-2291.patch         | 37 --------------
 .../dnsmasq/files/CVE-2026-4890.patch         | 50 -------------------
 .../dnsmasq/files/CVE-2026-4891.patch         | 40 ---------------
 .../dnsmasq/files/CVE-2026-4892.patch         | 36 -------------
 .../dnsmasq/files/CVE-2026-4893.patch         | 34 -------------
 .../dnsmasq/files/CVE-2026-5172.patch         | 34 -------------
 7 files changed, 1 insertion(+), 238 deletions(-)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.92.bb => dnsmasq_2.93.bb} (94%)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
similarity index 94%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
index c19467aed9..765287018b 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
@@ -15,14 +15,8 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
-           file://CVE-2026-2291.patch \
-           file://CVE-2026-4890.patch \
-           file://CVE-2026-4891.patch \
-           file://CVE-2026-4892.patch \
-           file://CVE-2026-4893.patch \
-           file://CVE-2026-5172.patch \
 "
-SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
+SRC_URI[sha256sum] = "cc967771abdafeb43d10db18932d6b59fd4bed2c69c22acf8cb96aff6920d55f"
 
 inherit pkgconfig update-rc.d systemd
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
deleted file mode 100644
index 6e42f32136..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-commit ec2fbfbbdaa7d7db1c707dce26ce1a37cfe09660
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Fri Apr 10 16:29:31 2026 +0100
-
-Fix buffer overflow in struct bigname.  CVE-2026-2291
-
-All buffers capable of holding a domain name should be
-at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
-size of a domain name. The accounts for the trailing zero and the
-fact that some characters are escaped in the internal representation
-of a domain name in dnsmasq.
-
-The declaration of struct bigname get this wrong, with the effect
-that a remote attacker capable of asking DNS queries or answering DNS
-queries can cause a large OOB write in the heap.
-
-This was first spotted by Andrew S. Fasano.
-
-CVE: CVE-2026-2291
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=014e909f787e808bb35daa546d3f8f3663918de2 ] 
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/dnsmasq.h b/src/dnsmasq.h
-index 254bacd..58be09f 100644
---- a/src/dnsmasq.h
-+++ b/src/dnsmasq.h
-@@ -479,7 +479,7 @@ struct interface_name {
- };
-
- union bigname {
--  char name[MAXDNAME];
-+  char name[(2*MAXDNAME) + 1];
-   union bigname *next; /* freelist */
- };
-
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
deleted file mode 100644
index 4a7673817b..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-commit 4fdb707633afe8028118bcaf39b4882f634b5999
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Fri Apr 10 16:24:02 2026 +0100
-
-Fix NSEC bitmap parsing infinite loop. CVE-2026-4890
-    
-Report from Royce M <royce@xchglabs.com>.
-    
-Location: dnssec.c:1290-1306, dnssec.c:1450-1463
-    
-The bitmap window iteration advances by p[1] instead of p[1]+2
-(missing the 2-byte window header). With bitmap_length=0, both rdlen and p are
-unchanged, causing an infinite loop and dnsmasq stops responding to all queries.
-    
-Reachable before RRSIG validation
-(confirmed by the source comment at line 2125), so no valid
-DNSSEC signatures are needed.
-
-CVE: CVE-2026-4890
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=7b151eb60609a0139474918222806f9bcfb4fe71 ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/dnssec.c b/src/dnssec.c
-index 4bb0495..3951620 100644
---- a/src/dnssec.c
-+++ b/src/dnssec.c
-@@ -1348,8 +1348,8 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
- 		  break; /* finished checking */
- 		}
- 	      
--	      rdlen -= p[1];
--	      p +=  p[1];
-+	      rdlen -= p[1] + 2;
-+	      p +=  p[1] + 2;
- 	    }
- 	  
- 	  return 0;
-@@ -1512,8 +1512,8 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
- 			break; /* finished checking */
- 		      }
- 		    
--		    rdlen -= p[1];
--		    p +=  p[1];
-+		    rdlen -= p[1] + 2;
-+		    p +=  p[1] + 2;
- 		  }
- 		
- 		return 1;
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
deleted file mode 100644
index e721f5ec0b..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-commit 2cacea42e4d45717bd0ce3ccfe8e78960245e5da
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Wed Mar 25 23:04:08 2026 +0000
-
-Verify rdlen field in RRSIG packets. CVE-2026-4891
-    
-Bug report from Royce M <royce@xchglabs.com>
-    
-This avoids crafted packets which give a value for rdlen _less_
-then the space taken up by the fixed data and the signer's name
-and engender a negative calculated length for the signature.
-
-CVE: CVE-2026-4891
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=788b4e0f6c05217981b512bed4e5fea6f8855d01 ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/dnssec.c b/src/dnssec.c
-index 0860daa..4bb0495 100644
---- a/src/dnssec.c
-+++ b/src/dnssec.c
-@@ -546,10 +546,14 @@ static int validate_rrset(time_t now, struct dns_header *header, size_t plen, in
- 
- 	   *ttl_out = ttl;
- 	 }
--       
-+
-+      /* Don't trust rdlen not to be too small and give us a negative sig_len
-+	 It has already been checked that it doesn't run us off the end
-+	 of the packet. */
-+      if ((sig_len = rdlen - (p - psav)) <= 0)
-+	return STAT_BOGUS;
-+
-       sig = p;
--      sig_len = rdlen - (p - psav);
--              
-       nsigttl = htonl(orig_ttl);
-       
-       hash->update(ctx, 18, psav);
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
deleted file mode 100644
index 01637601a3..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-commit 011a36c51438c986535a7248ed2e7f424f8e1078
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Wed Mar 25 23:16:35 2026 +0000
-
-Fix buffer overflow in helper.c with large CLIDs. CVE-2026-4892
-    
-Bug reported bt Royce M <royce@xchglabs.com>
-    
-Location: helper.c:265-270
-DHCPv6 CLIDs can be up to 65535 bytes. When --dhcp-script is configured,
-the helper hex-encodes raw CLID bytes via sprintf("%.2x") into daemon->packet (5131 bytes).
-A 1000-byte CLID writes ~3000 bytes. The helper process retains root privileges.
-    
-Note: log6_packet() correctly caps CLID to 100 bytes for logging, but the helper code path was missed.
-
-CVE: CVE-2026-4892
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=10e6b5b83e80749cba7b090d7780b29f908f0571 ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/helper.c b/src/helper.c
-index 72f81fe..2c12801 100644
---- a/src/helper.c
-+++ b/src/helper.c
-@@ -261,8 +261,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
- 		      data.hostname_len + data.ed_len + data.clid_len, RW_READ))
- 	continue;
- 
--      /* CLID into packet */
--      for (p = daemon->packet, i = 0; i < data.clid_len; i++)
-+      /* CLID into packet: limit to 100 bytes to avoid overflowing buffer. */
-+      for (p = daemon->packet, i = 0; i < data.clid_len && i < 100; i++)
- 	{
- 	  p += sprintf(p, "%.2x", buf[i]);
- 	  if (i != data.clid_len - 1) 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
deleted file mode 100644
index af7e4119e1..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-commit 434d68f2eb1a58744470698483a3ae09b5a9a870
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Wed Mar 25 23:22:37 2026 +0000
-
-Fix broken client subnet validation. CVE-2026-4893
-    
-Bug report from Royce M <royce@xchglabs.com>
-    
-Location: forward.c:713, edns0.c:421
-    
-With --add-subnet enabled, process_reply() passes the OPT record
-length (~23 bytes) instead of the packet length to check_source().
-All internal bounds checks fail, and the function always returns 1.
-ECS source validation per RFC 7871 Section 9.2 is completely bypassed.
-
-CVE: CVE-2026-4893
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=e3a26d092e47bf1d18aeadb758e4ca35c83b5f2d ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/forward.c b/src/forward.c
-index e2f64c0..208480d 100644
---- a/src/forward.c
-+++ b/src/forward.c
-@@ -724,7 +724,7 @@ static size_t process_reply(struct dns_header *header, time_t now, struct server
-       /* Get extended RCODE. */
-       rcode |= sizep[2] << 4;
-       
--      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, plen, pheader, query_source))
-+      if (option_bool(OPT_CLIENT_SUBNET) && !check_source(header, n, pheader, query_source))
- 	{
- 	  my_syslog(LOG_WARNING, _("discarding DNS reply: subnet option mismatch"));
- 	  return 0;
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
deleted file mode 100644
index ce6e0f464b..0000000000
--- a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-commit fa3c8ddef6712b52f562813317e6a997e1210123
-Author: Simon Kelley <simon@thekelleys.org.uk>
-Date:   Mon Mar 30 16:24:33 2026 +0100
-
-Fix buffer overflow vulnerability in extract_addresses() CVE-2026-5172
-    
-Thanks to Hugo Martinez Ray for spotting this.
-    
-The value of rdlen for an RR can be a lie, allowing the
-call to extract_name() at rfc1025.c:952 to advance the value of p1
-past the calculated end of the record. The makes the calculation
-of bytes remaining in the RR underflow to a huge number and results
-in a massive heap OOB read and certain crash.
-
-CVE: CVE-2026-5172
-
-Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=073082ddc0aba7b8efa15a688d6183463b65effa ]
-
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
-
-diff --git a/src/rfc1035.c b/src/rfc1035.c
-index f0e1082..7e05fb5 100644
---- a/src/rfc1035.c
-+++ b/src/rfc1035.c
-@@ -943,7 +943,8 @@ int extract_addresses(struct dns_header *header, size_t qlen, char *name, time_t
- 			      /* Name, extract it then re-encode. */
- 			      int len;
- 			      
--			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, 0))
-+			      /* rdlen may lie, and extract_name() advances p1 past where it says the record ends. */
-+			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, 0) || (p1 > endrr))
- 				{
- 				  blockdata_free(addr.rrblock.rrdata);
- 				  return 2;
-- 
2.40.0


