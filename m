Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8974C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.35957.1640677104408111140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=J274SB/L;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7R4HJ016446
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=mEdr3l6a4G0geTIBVykOEeuJ4GfbbX9gOagAWpurV5M=;
 b=J274SB/LmjKh1HEWUkWXMvvkkZLXnCAlOSCEPyq/2b41KaUTF+0YrqPWAk3KognbhxVo
 QJA2HtVkeSYUJTJYAdyoJqqowSpQqMyigVibYweEwOSTt7c7vi9AE0+MYsRRJpKjyWzP
 o0m1erwtJnhssCGNwkqRkgBzvscHHOKBmJRBe23pQq6cvmSG2BDJfEck06a5tjBOABxR
 P9vI+OjMC1Bkp7b7mbs72/CbF5Z343XUz4j1N2j1X0xOpt0pTvPCBxifEFCsEBbmEpUQ
 svUfnFb2Csq7y8EFeSQDnf2aCSUm5FYQEUb5AOR7S0yOyj2Hjp057vp83kCKi5J25P/F nw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7f230dy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:23 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cMQ0002117
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:22 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7f230dy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Dec 2021 07:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USN36tY4wo36f7TsY3i1M/lCmuKULydTpK4ylqJFi1Nja5j5F+x2JpbAtl+FVch12GLqjkwebtulqiXKeSyPQ46U1Wv4n/Rp6DuE3p1nzfcDZMF7LNo/vdsAq65nzYsL7OCK6RySh5rY/LjNjbLdtl9SaGWfoF3t28xo+FnMYTfUFKtFuqZvTjbzirNVMdotb24LA8ei5LjsKlIutzA/5pCnfGLj16G10yWkdi+pj/k+1OYAOd5cb6fdSb+yBIMsFZP/Qb8ZouBss22XbseBDy94aKdNe9jKW6emKSbUGXe0I0+HqTHrHQCAVW2BvLBpKed0cXHWsSf96MfFMHrWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEdr3l6a4G0geTIBVykOEeuJ4GfbbX9gOagAWpurV5M=;
 b=G2P8JGFGMwPXrW0wabF7zfHciEnk5ZAMDhdiBv+HDQQ2Ui5sXGDOVmDVreW1MlWX123p6WgfBaLxsT6/Z7H5QJys1CxDM0+mVjbH/PZB7DgziDaArlT7OD2eyutsrZdmkf6vDIec7c3bDmYnD4eGxlpO2YIRlVkm6ErSIzYns3ZeceBY8KSQoPf0q6EZSq7quWVZg93BUlGYFEN91EtF/jmbQ9wLWtKgtdMupbm08Z+1Ng4Kv07EWuzsM+2RhM6BsjvaT1C23ZW8khTroBEZpNnMgyNrn6S9GVrPL3dvuiuxg9eNMnyzQjonN8BCFK5Imjb0CZ0/EsLSsiU/OMZD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 07:38:21 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 02/19] libparse-yapp-perl: add
 recipe
Date: Tue, 28 Dec 2021 15:37:49 +0800
Message-Id: <20211228073806.868759-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e460d4ac-ea5e-4836-24d2-08d9c9d505e4
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4539FF488A291D14D5E77BBEF9439@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QCzZQI7podImQOXgEJb0P2lGnwB7snx3ki5e3PqXZ/kXUty2FlLqDL92FgXivqeiqAwubEZNG2V49LtYfqfRACYGLmKh/hJBh9FvzG5+Ts9eaw8m4vqt8AnDV9IqL5YoQFus69WBmBch+hS4zKnkJOqJQBpwj931CNfWU15UyDdVyrxOhcloNvrqK+PFc1XSFiTtNYpG5wQxIwg00dq95yU8owoaBdgVMR4CIgm5A7DQfNOFiKj7P+OkNH1p/xaF8uzjlp6qIglIPeo3FgYEYLHLA/j8JAnl8LcNeuR86uqqh0hFZlJNugGKM07/X/FYLxMSHBPMhWJ5nx2S6On+Nd0wTZTZbt9qpNWuktdK6eRb/PlqKrlnrB6WgGF79abO43i+0OsevczuKJjkskEF7O+zY75lOuxiRqWdUdtjQmEYVgvTs7chfJbZr9sRRn1OjUZCMI4x9T6bvPy4/Ou9Jg9sEMIhBYtRLNDqvrL6G5Sv7HpUuhW7cPiEJ/cZjNiWOpARwsFao4X5w+JvqoxWnTmDMa2fwsvm2Rh9FW4frhRZspdVh7/i0DfV0bNryfaSQNYDHGm4TWRUi9zvh5dYCRCnllghPiHkkqbIo/c/lrEr/2HAXNWY32OfK2WypW8uk4+TXCNYyqx3obVWGschFkVFggvxjBFTu/QLkwuZrzbkaZqXRb2tvTHB7Z2XnwTKDh0asV17IjBEJhO0tfYnLX5OzkyXIJipMbFkYQfsDHZULG1lqQlVY9Wf2VFTdNdjJDeoSeNKqo1+zRj72Fa0wQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8936002)(966005)(86362001)(16799955002)(36756003)(6666004)(316002)(2616005)(508600001)(5660300002)(8676002)(6486002)(44832011)(6506007)(52116002)(66946007)(186003)(38100700002)(1076003)(26005)(38350700002)(6512007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MORtYf4OaS4pybmjQKEZ2ybBG5wmLyMw3KHloOr8F3JzRYoTdvYOA90PJLBd?=
 =?us-ascii?Q?5Jrt6xPMomD9DAIAnjyy3sIlZXblvr+2B+HoTI6bbhdCpS3UDoumbE5dUVDA?=
 =?us-ascii?Q?aNIqp8LWR/SNEPudqYkPRcajypc2fVFL92PrZAr74cL09errUUjCz1m2V0SV?=
 =?us-ascii?Q?J3PN0GSQKmRm1HQaHcpqXPvMxS85z0niWn62M5L316PwisVDadF6ZsDps9Cd?=
 =?us-ascii?Q?w/6CzApjOwYFT+ykxL4lHJX3nqRep3vlir5/3j2k13k+UT5c7Sq8WKyPAA3r?=
 =?us-ascii?Q?4Zsnx40InkcUna5mY5SaXx4ZfiLVNzJMYWqR2fFgOW6SVDkF6YO58iS1qmEc?=
 =?us-ascii?Q?oz6YQNl69ggCmHvrdy7gEE00/P97yeN9itAVtdx1/+va4hxsJ2CpXpHoesrV?=
 =?us-ascii?Q?TFBgKleP/6X8AkoUE9QCcsgfIg+tFrxt2gI35T0GlVWkVUfrGRZBHME2ZZg3?=
 =?us-ascii?Q?uZiFmohFQMHfeB8YNJ2BWxHvM6lYzaaRCcnCkDe0sAUH897hipJql2BIrDM5?=
 =?us-ascii?Q?ttOoFBIvD+ijxx6fercjEdi5nIXVW11+pEoBSMYKikOiT2aBFy8Hy4xhe8Q3?=
 =?us-ascii?Q?+rF0dagjQjP9wkPLytXQx4thHWRy0ctmRcTr8+OeAnHhTVG+C/I3gP81VetB?=
 =?us-ascii?Q?t81UTWXyq6ck7FcpV+xpB73GFXUMCYaHMNERSlP/0ZunD44OHXceIAB3VeJt?=
 =?us-ascii?Q?Zo/4nxHLYUxqYLQQBkvNhiydJ3uGdKBzpmHPzgeUrIFYAvcF4FrB1RdJwA6D?=
 =?us-ascii?Q?zf3EMyHqB2LuRi2f5D7AimrPHjxZZZKPuUG2QwJLYeOcuz4OaY66NCjgnNIQ?=
 =?us-ascii?Q?bkPRixVnJ/AHeynXKwJ0EEQ+5S+2biLw7VQ86bx/csCPFt6wbiO8bVHnbvC4?=
 =?us-ascii?Q?GwEe0KdA48Ma15HGt1CaIWzC6Z8lxysMccDZsoVGrSPkmozrqOQVUEuEYOHC?=
 =?us-ascii?Q?6wYXiYYWxwz0PnQR2bZBAeoHoqJIS3w3q8qq2iXU1FT3rY42FX2wnVS1x1MZ?=
 =?us-ascii?Q?x4ecJAKihpTjbGTyOelKqB3wHexe9kdwgdMjINLD2hTc4WNPoKyUj28fNGAX?=
 =?us-ascii?Q?A5oMmcKtVFqspXe6J74kqtsZoUXmwEvdy7uOoAKHlKqojlmAQnv35mm3E6Yu?=
 =?us-ascii?Q?D9n5wsTP4M/5XX5NXu+36Lqqvm667gWDrX64n0AAnno6hvIhffnnuwSO8Ehf?=
 =?us-ascii?Q?cgh9K7IcPRMV/rcphXtdDBJSxQDJWxZJojnHYpo6K47fkwaMqLqZ2iiW6EG4?=
 =?us-ascii?Q?h6/VkgJ/lWMNwrAGUuh8AzLPF4wzDoSSuOYkBrhda2MmDdYtiBy4FqaCGnZr?=
 =?us-ascii?Q?jdrx3/mWwBwfl7rad98EYniYU2xjlJXSch+CkI4MYtbeHK7UY8EuDgOpk2FY?=
 =?us-ascii?Q?XMfZD4G5CoZYeySVkc3p1HVftEiQrX697ygYfmBiDfQ0A5rkbZnhNnvwTXlc?=
 =?us-ascii?Q?W2InfG2IYZaUjs8nn+V6XqfUx4DxRn6JU7uPuG4wFL3IJOLPHK5nLV6ppa2Q?=
 =?us-ascii?Q?J0GXSwdVSk3uX1gm8ToLTgY7Dj7yh38jFONimJFxcMUV0p3sHGXHzzynWuP5?=
 =?us-ascii?Q?zsMFHTVrgE5S2wTNCEzm5u7qKaBmrHWddSB5hAp9XDMheX5DMIwLkRqjGK1N?=
 =?us-ascii?Q?BShyMr+rZGjQwkOgkcrusQY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e460d4ac-ea5e-4836-24d2-08d9c9d505e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:21.5363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zAEo9yagjTL1Vf52SvemAW0AodBBjjabg08juo8s9KH9AuLX+IOO2p38wXEz3HCTkZFN2n7Sa6LkuUkfW9uAaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-ORIG-GUID: BE9lz_tUkUN0VN0RQwX4IlHeEuN6KmQw
X-Proofpoint-GUID: 14go0cppP6fY8SU_secnNJYOg38OLouc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94529

This package is required by samba 4.14.x:
https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba#Mandatory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../perl/libparse-yapp-perl_1.21.bb           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb

diff --git a/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
new file mode 100644
index 000000000..27a7f9da7
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Perl extension for generating and using LALR parsers"
+DESCRIPTION = "Parse::Yapp (Yet Another Perl Parser compiler) is a collection \
+of modules that let you generate and use yacc like thread safe (reentrant) parsers \
+with perl object oriented interface."
+
+HOMEPAGE = "http://search.cpan.org/dist/Parse-Yapp/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://lib/Parse/Yapp.pm;beginline=508;endline=521;md5=41a4542fcde97a600c9de0d782a90256"
+
+SRC_URI = "https://www.cpan.org/authors/id/W/WB/WBRASWELL/Parse-Yapp-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "69584d5b0f0304bb2a23cffcd982c5de"
+SRC_URI[sha256sum] = "3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5"
+
+S = "${WORKDIR}/Parse-Yapp-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.25.1


