Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570E9C433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:52:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10792.1641581553364003126
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nuMDdrCO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80067cba28=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 207IZ6wq027774
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jan 2022 18:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=7b0AxtU/ehyq58K+15PFzzkVoIPzcuHftfRaDu6tLqM=;
 b=nuMDdrCOAhKHJc98Co9nYYW78WCNEn0tZfCGwOo4iNj4gxzZ5Uz92Lb/As9ogGYoeaX/
 hd2m2PEwkOgYDNSScaQHP2aneiKIH6GC0ZK057qbnjaHDczeDZkO1JAhisddDhoBHbTz
 RDQz2g7cTJ71qJnQhU9i2GXriBxJkApUGCPYqM7DL16g3idFgXTFxl02fV+9NRdvdCWf
 qITw/Wl2I95/3iSzuiK5L+B42Z9P4H0KI99u2wM1wlMHO0xMyRJ7F0X64WJSV/aI3LWZ
 MlEh4/4gtHuE8nvuh0Lq5yFIzrSHdsFsnZCTmnw5TJaTHDExEj4TGIse7nupg4nflfWu sg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4w88tf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 18:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9pHNQHYMAyQMqHG2ERUwW7Ly1Gc8ZaFFGJNe38jL3dV1RAnREYF+HYBtoT0n9DzEy5QnUVxOTwzY3AH1FuMhFQ2Gkctjq41i1MsxuE7zhFdLuQ6J8Z2lsfQaOrwwiZXKwHZ0SakJocAa9hxaIO578Bu42leCW7dljutjjlfQLL8C//RC0N1K4YnfPNZs0HElJnt612vwJ4VR3im7cO0SX/JNw6+K3L8xNUK4GGxbOelC8vF2k2VSy+6QZQ7TUlJHZzNxlYDBfbtVB44shtyUhKgdbDgWO2yZZ30VXyaSEeFFvuyj+vEPoYseF0VvSg5xoU+ApQhSfhP0/pbeQniBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7b0AxtU/ehyq58K+15PFzzkVoIPzcuHftfRaDu6tLqM=;
 b=bkqn+CdNm3Nuvz5yP0O/K7xKyVNpmHDv3OBotd9ZJkgErnXIPPrB9gYavmhI1t7H4OXx0PZp1SRYO7dlBZYvnU1AJGGoiKPPRdu98vyrEKfM6oq9KPhXjRiQe+g5e2L5hUcudUarHyFMhDc8yCtbXMZzEcgU9B5MBZ/F7z3Bs/PS25kczxQV6CJAQJXE7ZlfTSzZVTVMuTR3STDF4SXU375YJzqsR3YYO0+jF2xD0LKVVW+0/rbPvNB8Str3JxikFPrNDgAivizMd5fVV6zYV7Q+Ft93+FzsIXT1sj4dYBiBWEc2Y2oO+ByBH/gCviGlGe4anPpX6l/CJlVlAjHYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 18:52:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::2c56:bbbb:8def:1f37%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 18:52:30 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-django: upgrade 3.2.10 -> 3.2.11
Date: Fri,  7 Jan 2022 13:52:15 -0500
Message-Id: <20220107185216.3375-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220107185216.3375-1-trevor.gamblin@windriver.com>
References: <20220107185216.3375-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cb55130-891f-4688-7b24-08d9d20edb70
X-MS-TrafficTypeDiagnostic: BYAPR11MB3029:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB302963E5FB2F8E8481927B2F9F4D9@BYAPR11MB3029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ADGDAOrG7dzYGFpn7mCpcKhtZVp/Dic2u7ki9Z1CosJ1nG+OHukvi3nmX6gxNLNBZ71ePHWI0Ev942prj57tMnLtWjsYNh36D1/vnhBBAWW2jhPy036sPNzSeZfRd9vNGvUlbRo9lqH+qmyg6rklmCDcrWrZCHyRIzZwlREiiIlehVrEJcjTK+r8E4+Bk5MNANInV7LLPk7DmzSBeYWqp8I++8Qfz6nG7bqfvUaF3uHT5CFwdYR3LwVaJEbQ/u6ibxcDqtwccE8TN85Sxb0azs4zUfejvRLLb6loZAanrhtlXRZhQ9yd6sCZmwePlXeSG5qNy2stosh5iMGU5F3xwcZU7pgg+9NbtUd3hZaMkodekD0ImWpQiUihFwYLLgqUhrojtVRx7vpHv+kjTGdzVedOJRyfb3WZKwhVkNXuO0K2gT7h73opehqPqRYO31xkBORaqpKlzu6DWtHCgswaHvG1CtfMf7TJaAVhnJ3lbEkRLq5a6EuZ4MpanJFkd+naZqwt3/N4ka8Dq6e+xKAkd3F5AtuStF33tl0tS+Wp97DHAFjq5Z2EbztfFvRSApdOKf/HnmcCajqvjz3QKfvkfNlqG9Gkk6I4OvB+1lNM6Xd3W2lMkVEWWsuoDSZphnLKZRvbjYclrJGA2c13ONJF/V93nNbBR3f60NkUoOMA5vOAvurxbsE4llKIngGJ9mqjD1cpGXaoBxqHTqaMiEtR0XjFuwtA2XsDJvlIcuXn7IpaDRU3gOdPatmdKYNsueiu71Lx9+hDyJXO5CQN4RDG6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(5660300002)(26005)(83380400001)(316002)(186003)(44832011)(38100700002)(66476007)(66556008)(2616005)(86362001)(8676002)(38350700002)(6506007)(6486002)(52116002)(508600001)(6512007)(1076003)(966005)(2906002)(6666004)(36756003)(6916009)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?py5ZUR8R/nvZsaGDXhPlsR5jpMPaLB+YnhOdJEDF4JOnSKsnYgPGtjkRKNCi?=
 =?us-ascii?Q?S+zmNHvbMVVu7EAPyizGq2LowLEVPAoETO/Hs7Vctu2fXvse5r+A0q5YLm2f?=
 =?us-ascii?Q?0lohrQiAhHyvtjD6M+X7wcSttOcCk1PCqX3muSx+Jd4q8Nj1OpC8/kkYefYV?=
 =?us-ascii?Q?7/ecdL5LLT5vqEUd01XHGmJ0OztpxRXIeLEuRhM5rhsWVOcZVFCF5P630Q5p?=
 =?us-ascii?Q?jDixPtaKmZgvLB1lnVk1xYUjToTBGLP/KT/3PUOK6+NIZ8jkats4577wtlhc?=
 =?us-ascii?Q?8CLUO4RFKCGas2TD+MuMEDUGo+x0foeS1OOWC4UWJdZqJfctsCQTszFOLHmW?=
 =?us-ascii?Q?/4aJHJEwmoGr+9r1v2f5Hz4gVdUF4r647s2i/fQieHglbmEhw7kstgyHIBxc?=
 =?us-ascii?Q?sPYZpIvjEuEzY1rUqUoMxlWSTSXwfusngVcVaAuFncaOQTCmZWVsB5qr96jF?=
 =?us-ascii?Q?ANz2z/F69ygdfL3b54SFgZWRLp4p4WtevbPWIG2/PIc71Tg3YLCHnm4xU2oQ?=
 =?us-ascii?Q?keEsbPGTr/VgLPdCBZP0e6OFx4W/HHFQdPE98uruknnAM+qitjz5JnnewFNU?=
 =?us-ascii?Q?GLg3p8f6KSP7mENb33cHETtkQHg8NUq/gfoVkiygwSS8JZsrM6XwHlqeRgYR?=
 =?us-ascii?Q?fX3kFLNuoiAn2qGUYpdNLpDzcikrkq1UcJhdx+JN8SZQU0oC5l8Yi5+MsOwk?=
 =?us-ascii?Q?C3voSTkv7e0896souDf7d3ZukstXSk1xoTFh/Wf2iDQyJf+u2RChLMYpmp/C?=
 =?us-ascii?Q?wbMfWUiMBV4iGpHeVP8RZgdHqJ4LqmoX2lJOcCytayGM5h+bcIgbqWJpzk01?=
 =?us-ascii?Q?HJyjWhcTL8A6zALJ173nlfplfe9s/m+JyDE4HrDOXb56gmUN2o3JvyejZ68V?=
 =?us-ascii?Q?sE643/JNCv/K4sniTUpi8RwiAHU1BfQ8zh4QLEWRmmErX+VBo3hK1JbO7nVz?=
 =?us-ascii?Q?2TZRE27FH2yLVEsHYL5fOulQDUuuiEbUznzetX4GOsrQD70TvGiTT+L+7Hkc?=
 =?us-ascii?Q?N8oKkU1Z/wgAS5BHvSp6kPmtjv222BrtU2gx11yJu3mQir1D+Cc2c729lr0q?=
 =?us-ascii?Q?7eJIkWSBW15/w5/UmSpaFTNZtMV3RGTk3PyRBK2PCHwe55xKQZC9INYK1inT?=
 =?us-ascii?Q?lygmp1J4OFX8LqbXZ8HAJb09ElW0ovVrqeR5h/X2HBLUodIMvjpgAmNKPQ89?=
 =?us-ascii?Q?1Gp/BFNVtckYRWGcFf2pUaR2oTarvLwLAImffXzCmKVMjZ8T5slRRXy1XgG/?=
 =?us-ascii?Q?3HUd1GvphKMJ23mp1R8uRHPvQdngRIlqRNMX29AShMOT01Ts2uesEVczhPSg?=
 =?us-ascii?Q?vUTf8ujbv/STVnjhseuoyFPRyEmFWAgLIPiChrcRowlnDw1R0HGM83k8EngT?=
 =?us-ascii?Q?sz8fDbTeOpqHJiedwe2gxvGS3BaAGYoQWsMWtNr5emKDbuXqn2SWEVbp00V+?=
 =?us-ascii?Q?C1QWXbqEyUfV+tllPIHg0CZDejx52N5w4VmiAfFM1jLVtVAP6wAIfNAzKuIr?=
 =?us-ascii?Q?dzRnyOh7SnY7UwHkCF6x52aBkyBGabcvLH+a/plsd9Ce7l9bmluW2qUWMNgI?=
 =?us-ascii?Q?1yKF3GQX8R8lrSUaylDUwShvfeFBKeP86cHEreuR7gt1TSlTV98LiImECae+?=
 =?us-ascii?Q?SdOVu5pFuZl1lXLOUG4AFPoIQkW6a5J4bx9xvYiLm8dHOgjJXiw6JFtXR5O6?=
 =?us-ascii?Q?51n7Cw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cb55130-891f-4688-7b24-08d9d20edb70
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 18:52:30.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9DQ8kgDAn7P0pQn9YS63XfV/hBong168+eXb00nKL8HTAvaKoBH8IsD1iZHqYvfmzv91yWvcLdC/ThzZmg08HfxqYi1oi2MwnuvyBQiELGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
X-Proofpoint-GUID: EZ4yY2chfiW0rSBhMJMeklg79rFyzoLb
X-Proofpoint-ORIG-GUID: EZ4yY2chfiW0rSBhMJMeklg79rFyzoLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_08,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=978
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 18:52:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94699

3.2.11 provides fixes for three CVEs:

CVE-2021-45115
CVE-2021-45116
CVE-2021-45452

https://docs.djangoproject.com/en/4.0/releases/3.2.11/

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-django_3.2.10.bb => python3-django_3.2.11.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.10.bb => python3-django_3.2.11.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.10.bb b/meta-python/recipes-devtools/python/python3-django_3.2.11.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.10.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.11.bb
index 0c5fbb8c8..6b97ef49c 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.11.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "074e8818b4b40acdc2369e67dcd6555d558329785408dcd25340ee98f1f1d5c4"
+SRC_URI[sha256sum] = "69c94abe5d6b1b088bf475e09b7b74403f943e34da107e798465d2045da27e75"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.33.0


