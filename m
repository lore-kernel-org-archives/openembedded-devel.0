Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6151C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:12:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28085.1701159122920067584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kf/yevMV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9696e8b7d2=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AS707jY000821
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=+Il/sp4WjQFoIvDzuL
	dmsEOj+X7DC5O5C+ITqAUSzaI=; b=kf/yevMVgXc+TDzr25pR364bfruX9vbcq8
	WDsQ9tgqoWe9RoNFOqRa5tmkxCpNSBdc8WGfWHGUT8rFnvhD1ehkvAmfRKy4aFU3
	jw8ZCzEcl0N7bT09u4Leoavumx11B9NN0b5q8G7Z4exNoruefumFQ07tR3BFgaox
	rN2RGZOSBfpuBCXzR5xOqkH034SbdXk9yx3pT3jS517ZE3GlcxiR5VruZivqjJJe
	HbHY5zesezQSXPDhqHja/9Mp9utXhv14CMjh0CwB2+LSS+yQvsBfkNXlILVkYG0F
	gwk+zMCTsVie2nUjb6qhiZTnTm0/EFhACr6YFvFDA+r/kBI78hYw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk64xjg1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:12:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+bJ2NH4ttHMSEKS5eHJK1At/Cp2ZMFixEcjy96YksO2UGERIYSsMtXtI752bqMVv9Zzg2itYfn/k50FAe2GWbwHIL8oVDArcvUWm2TuH+5lu6o2ehB96SFazHZAlPqf5Q/BMZEUo8fxuqMSDODB+qjGxtTst6M38+XdVPxNQIEBdLvU5wILHY0KYJ9XQZq9PS8NePO0ASde5AZITei+nNOiY/VXeEPOh0fXaEvVuHzTB7DTrHDFSc3wNLB9OlbO/qb+tMCR+h4x3CsFY8REI+T/NtkWTxQYxlAs4rrUBTNyhO8HG1SKTLIxvFMH3UP1jX74/7omc7fJuynrguvhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Il/sp4WjQFoIvDzuLdmsEOj+X7DC5O5C+ITqAUSzaI=;
 b=Z773PvVAMvkfPfp8iNSqO3XejL4Zs0jeQXqcd+l3F+USub8qgXoUa0gmmZG7F7DvM2d0PQNYjS7jZ25peYNhGYyr2vvMPsM5RkvUH4oKa04CdcYzD8K/GDjlyTpFCmQI7zuWSemqLkgIWfXunYUMBTXbJNI0gyL3M+UtL47WALYlPcoOYmPS3e+826iP+L4BmlOd2uHtnovI4WnqPph2dsjwUyrQT+Twr8utYsa/zqTdgulPpo1y4OKkYTYO2noMwrflT3xhsjNiAFzEVCuAVAjtBRmqWVxYcJ8Qh0qnHq3fodtkyAJizjYomvdIZSaFHC++58Y/rxT0AI3C1IksjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 08:11:58 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d154:edc4:260:f6e3]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::d154:edc4:260:f6e3%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 08:11:58 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: 
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] freeradius: make sub pacakges to runtime depends on freeradius
Date: Tue, 28 Nov 2023 16:11:42 +0800
Message-Id: <20231128081142.856885-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|MN0PR11MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0ead60-4313-4fb8-e6cd-08dbefe9b0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D0PiV1jF5dJBquKe3mZ50kSP+IKLNTdCOvrSIX/fn6WvV2f0iKMgbjtjcYH6XKFraapLjAsrrT6QbvdtGFk8YPaO6Dyev30cDbCgqbMoXqFRsRLsG9O588P3Mb4GikhtNJNYf3kLgw3M9WVeEeRvjOgyQkt/J8B3NMvfCiukG1TsA3OsHDJ9RnP4+xl/GobpJSOLxQRmbkp5VINYMvSIL/hzkj4X7nqibUOMgpxUbNOv4wOzRteK5hJNJ9d1HU7tGuZFwaeukcaiKJY0ktPvsI/XdNqOb5xxNdE3JAx2Kx9ZLsFkI73eGvbxv/lTkIGa4Qu+X8esAvIG0D/Py5xemvOAt+N5gn9YKvfA3sUojhZv+1H0XCEJU8WjOUjG9puwrldYOfqW5MwX9favjXD4Bo7AH5JntloWx1OA35s1V3Q/UjuMwV25xEJRviP/vqMp3uvPKUqlzg7ImZtvRJmSiTHjeyxA8WRsNJ34KpWdNKup77G6lbxyocPymsN3RHvTEh3DcIcZYiOyG2+EsJJsz/L/+kR4vR+ngFyCscW48zWOVAvgrOxEuV7Aq3y+16BDMju65/kjLgSbpbBjLHKkIzM+k6GIO+8C2FNeJOjRDw6cFU5iguM9nG13bAJMntmQqSSWxjQuJBblH9cpWwTb971raS4PEss6PXcOqBw8ugjuDY4wT/jkkUaF5QfKMSo2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(39850400004)(136003)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(109986022)(1800799012)(26005)(41300700001)(6512007)(83380400001)(1076003)(6506007)(2616005)(38100700002)(86362001)(38350700005)(36756003)(44832011)(316002)(5660300002)(8676002)(4326008)(6486002)(8936002)(66476007)(2906002)(66946007)(52116002)(6666004)(66556008)(478600001)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A6TZhVU6VQuMwIFUtDubXFLxw70JgjJVaieMtEsGAjViIUcHNyKT5rx4MoLb?=
 =?us-ascii?Q?6FAtLgrViQozZm/SEBQb/+itnAuS5+23rDTEyMoBnFUdzkq2782SGzc56Mi/?=
 =?us-ascii?Q?N7VlxxdHsOqMubelcyUtiZ769e0V0pqfdRc3hc4eAe5zelUafE5ptEbPtpfu?=
 =?us-ascii?Q?vkuIozadpm46EkI0lrKwdrKlkxV5Khm1SaOBpCNb4N3uT6NdKqyqMLMWzLIp?=
 =?us-ascii?Q?KTznxK+kGmSeUudqW5llOXTbN/Y2fZfh3qhqdowKTGgV6/aSzBIasLsVBFTd?=
 =?us-ascii?Q?7Usu7UKXhYGKjF5rMh3ipZ/LsHpryAALeVydZN9gI2AWn8t4yrXRr2WpWQoo?=
 =?us-ascii?Q?nkK4DCfgBT0XeonkYnKk9U3881uZsB4q9kqg/H2LysyAh1z5dwMegmHyyebn?=
 =?us-ascii?Q?VAsE0R5g16Lwd5w3pn7693RtQXy2nnpQEJHIG2neb7HxiF5pstTKqyatOTZd?=
 =?us-ascii?Q?KPLvQLsonkTlfDo93tuxSQ9sJx0nz804vNUltrlo7v6w1CXphpN15J6C/2xs?=
 =?us-ascii?Q?l//aXSA4rcM7LD2wvi2KwoW8tUE8dE4HFLOmiKzueWP+Us2ZpCgELb5GTE4F?=
 =?us-ascii?Q?zjGtQcN5Mo/Xk4ymFlaWRpMBRVUNQwdmvQhwj3o+wULh/rcH5yLahVsqH4Tc?=
 =?us-ascii?Q?g5kn3hT3uh0JWhjSelTp3wA8NNOkfxyZJr7RRGTEDMscoEWHVazxLqH1UzPr?=
 =?us-ascii?Q?jzeAh5M0zDF4YdSnjgINrDGShN9Ny4NSNOLgYLbnc+lTxuk2lXN6FqbNtr2q?=
 =?us-ascii?Q?l7Tj5qvbSVRsoh1KyIDqnzfJqsOG5rZLqiwhpSzSRnrGz0IGkeMHSmzSmksj?=
 =?us-ascii?Q?Z3Uglrv0y4SJdA5lNM044ARxAjxbGURlB5Il2mYLJswQ+JmchPenNzb0iHPD?=
 =?us-ascii?Q?qVYXQOILhadA5wyJtt08VZ3jmtZPdHREGsZhvTTeRNA1jmYVSDaJGwr+I573?=
 =?us-ascii?Q?Kc6dQQ4mTPuYQHi5qX6NyTN732RIuuLhQFNZuVyoOod8en7/9QDZYHb8ovJ8?=
 =?us-ascii?Q?gmatHYhZlcWFcNQRj/ipAlbjpEaAfVLrOT9SKWB7upqVjgeXdUQqYN7PhzpT?=
 =?us-ascii?Q?HfJ8O22WlMj96ICAW2GhV1NkBYOlri+2xYBjswQuq93ZZkdFuJaN6Tm39XsI?=
 =?us-ascii?Q?IeCIPwQRu3EIzM6pk0hDFT9rrUWSaQnhCMJ8PbQ+Y3qfyyOUwn01W/sg28a9?=
 =?us-ascii?Q?XLoZhwjIZ+4w8Yaj9g5+4rdsLIV0aopfmprenegI8dO7caB9uftR1Hn4218i?=
 =?us-ascii?Q?GHiKM/EjT7f3+4IS56geW0nmtiTtLG8Lu857J2mTBLaf+6FK9I8ZVpctWouz?=
 =?us-ascii?Q?lwLUNMVKDmKDDlB/y2rZZZvJBqE3o6PSD2TCh3bQUcnSJf0ITnKlVb+Ttpt5?=
 =?us-ascii?Q?6SZCo/Ty0L4KyFk3PoB0I2+K0enpTwdy0vT6cs0xrA7uHwZrTmsoPFSZ09Sw?=
 =?us-ascii?Q?EOm+InfsO0VCMQJotfHnmpPrnp1qTjuN17u3gShDJsnPRrfZO4W8zBgbyGKC?=
 =?us-ascii?Q?MGtv2OfWm96p4AMOoCwALJs92n5qqrnX30uVsTgspt8P2CXtIkXixPol+c4v?=
 =?us-ascii?Q?p1i3bIC/N29I8RDZ8w9kAjlL3RP7C8s4fnNuyAyAWxSyjO8gdgG8/EwZVbhF?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0ead60-4313-4fb8-e6cd-08dbefe9b0d9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 08:11:57.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I++3qQAP1DsIte82ZTgblHbO8QmmK2u5U/ATr34zg8/o2H5FP8hZ+FmYg/OuaNcIG2BTvdqXg39m0MG8zfiC4dCvLT7A+/zioyAc8rUjQMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6059
X-Proofpoint-ORIG-GUID: j7ZUGSFftzEwbHt1IWLXz2qo-L35ibd1
X-Proofpoint-GUID: j7ZUGSFftzEwbHt1IWLXz2qo-L35ibd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=954 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311280063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107067

Otherwise install packages reported warning at do_rootfs
...log.do_rootfs...
  Installing       : freeradius-ldap-3.0.26-r0.corei7_64              1235/1236
warning: user radiusd does not exist - using root
warning: group radiusd does not exist - using root
  Installing       : freeradius-krb5-3.0.26-r0.corei7_64              1236/1236
warning: user radiusd does not exist - using root
...log.do_rootfs...

The user/group radiusd is added by pacakge freeradius,
explicitly made the sub pacakges to runtime depends on freeradius

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.0.26.bb   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
index e38ef2b04a..e3730cfaa6 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
@@ -286,5 +286,12 @@ FILES:${PN} =+ "${libdir}/rlm_*.so* ${libdir}/proto_*so*"
 
 RDEPENDS:${PN} += "perl"
 RDEPENDS:${PN}-utils = "${PN} perl"
+RDEPENDS:${PN}-krb5 = "${PN}"
+RDEPENDS:${PN}-ldap = "${PN}"
+RDEPENDS:${PN}-mysql = "${PN}"
+RDEPENDS:${PN}-perl = "${PN}"
+RDEPENDS:${PN}-postgresql = "${PN}"
+RDEPENDS:${PN}-python = "${PN}"
+RDEPENDS:${PN}-unixodbc = "${PN}"
 
 CLEANBROKEN = "1"
-- 
2.27.0


