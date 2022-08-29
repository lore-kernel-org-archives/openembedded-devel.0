Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E66ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.72069.1661786678858618767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TG+JsquZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TDhOxx009749
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=7daunOCiEzZYA22Snkfre3MHveFOQEHWqRfn/XzVm5U=;
 b=TG+JsquZvahQM5OH02bTWbbMny958FelMwNI4By14aERuSNxehe7PzIlUUvNiBw9xyX7
 gJu9195vCaAbaRhTwf2/gyoLn4yczfCEAqdzUFq9aoa3fwonGtMoXIaRnzSF6a3jSgPk
 UnPlO9RTrmcE39sBYaKakh3TV2N3NThW7jmDhwgAdXQv2VF7GKJrJSQXs1k6FDLw99oa
 o+bsJPAKf+c00dzD61ThTxj0JmIoKhv9QgHqHbpWvXyO5ymH7neasLfwzhZ1A7QxagxY
 ClGeImiOt1SB5pS3OMR08lTIyWsYbM+Qawv1BrbSW7Mu+sKonZls5yVNsbK3HQQ8Asly LA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hswg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:37 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFJeFQ026042
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hswc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kwe2W9r+u9Q2FI6BNLOuBLFgU6KWixl/qoIGpPx3KeTOI/a7DQdK9p6GaiTFoFwvRXU1udqEKf2ilZYZqfT2sJxobWhb1/Hs4wKZuvDj3sI+5tYmoii7XLk3ycD/EmSWydmHgBxj+y5Zisjjg2SAFA8Bt82Ercc5ozyJCWjZwpF8dK+QmAkZoNtbouE9U5ZbgRmO2wRfpSp0oAStb9Otd1HUGj9VrBG7h/plMj1d4IZCuCB3acW+cz63laYi6ros5AHklQaOtfwnLqfoNx1RM9M3aS17ik/qB+5yS8yWR8IX0E5kaCMKx40UXZCKSeEH/YzUiAA20vsTV3fYm9k3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7daunOCiEzZYA22Snkfre3MHveFOQEHWqRfn/XzVm5U=;
 b=nooG1DR1jDujKXsyGjPGkg/Zz7fyLYavMKPyin8kMC/e3RAntiEaWxk09I4HkNQN1us2a2q55ViqaqdnoqlbZO93G190oh9Oihnl+nRpDUmsLs1IsLVIpAUDAJQrWJyY7uzLZ17slh0UYf7omWdWM07og216s9U4YDIEvSKauYGtFaWA/MfDFbKXF+Mt2OhS5uZhOq0VGv7ZZkp2SwzAeor8QYdgkE64iUEVKFLGgfNWqZVkwukraTUxz4aj/aJP70v10tLjRku4l3eodr2NPHYELfFX191VmhW3vKc2AYNuRDcugVLZb9fcMFi1mggdWkoMpEW6SWuPlw/d5z85UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MWHPR11MB2063.namprd11.prod.outlook.com (2603:10b6:300:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Mon, 29 Aug
 2022 15:24:35 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:35 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 10/10] libproc-waitstat-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:14 -0700
Message-Id: <20220829152414.1757540-11-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829152414.1757540-1-saul.wold@windriver.com>
References: <20220829152414.1757540-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87f2e2d2-5f79-4707-f925-08da89d2944a
X-MS-TrafficTypeDiagnostic: MWHPR11MB2063:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rtfyRJU0Nh/ZnFY1PU02o2nfifsL5NI5zqhS7dMrY90E0letMllvjIeu/J/Kv2IGPlcZTnwooP5XQtG99M8OysjPSlG4+RL9ZeuOlOhxQ9mVtRVBLrNIhw/QprM9YBMU3nwddHfLsf7uXUZDGDwzTz6go94hMCcBZ5uyEOmAcClINrIVcGNoOnbZP6Jou/iXh3PrQmkMePuVGeYx65j0Q7SDxwZnZxar9RsWWTQvpkndrKakSs1lWSiiJIKTx3FskchCcB7tj+5KWXIJx0vkKat3o8mhK6YBI18p3timhMlGtqWUgUDOVfiHbo8dMRuJIbh7jI6Ue3iMCcSBfyQ4gyEksdbETdVvINme373RWNoE4sqxZsc3QxvC1RUuEozXlkZG3kE/2Y76eGVTrJCgbhrkK9h70DLAewgcruQIMoSRdh+itM8OLYZzTqIyM8ScJcDJVR8QPtCRbNolW5cmgFSnnhmbMsQKLKA8xIKG4cN042LyKGXJdWpZnvH2MRIzUzkcSkh5bcUtMOhFJA6zn5VkaGTqnfLA2rYFeuaNckSWfJKLKr4/+jgbuqxd9ST7BZS/efFC/5g6vh7QHfTVCzCkg5AKrCPRs9uQRPuE04BlzQpyT4N/2SM4FxiRM54ddBNBZcDk46XmYKfJNjLQCtfX6Dr1K4Ow1ubjrMezeGs4HLN/L2FbC5ClV+Tf5Aesa2AnMIKVmjeDfWYk5F1sWqr71STWTFDQfJ0ygxWxdb6U4ETu6ar4PN68L9N/vNn4ISj8piK6+ZnZpxOsyhztRkk1LlH5gw4tcIUOM26BjiA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(2906002)(4744005)(66946007)(8676002)(66556008)(66476007)(52116002)(8936002)(6666004)(6512007)(6506007)(316002)(26005)(478600001)(41300700001)(6486002)(86362001)(38350700002)(83380400001)(2616005)(186003)(1076003)(36756003)(5660300002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?15FfQXwbeJcOnSpQJClZPHbJoZumm9+tDcvx2aEmC4i2lRILSTuC9+TdZcrU?=
 =?us-ascii?Q?AbZQkbxjfAAu9XydjkvHhgOh5zVoXDWB0ah5GhAT2OHL7kzkW5kggfWwtBVS?=
 =?us-ascii?Q?CDJ7sIH8UtkjVSpr7fkJiW53nBWbeIEpK9920PSqQgMcqJDLonrXbx3Na7MO?=
 =?us-ascii?Q?YbN6m9EK7IMcdNn84UpBZfKFJthVsQYSkPq3peMYcnSjXquG2rIDZmW/C+5V?=
 =?us-ascii?Q?hLOjlf34YgVKWPLq0MsRSEz9s8Lo2jD3Pedu5utDNZsBl8DUQ9Uwmnj5lWFm?=
 =?us-ascii?Q?yej1n6qxWQA5laNh6wZXZZnXuh1lmotbVQxjEAjqeXW7ErcMMtKEPSoNU+Uc?=
 =?us-ascii?Q?LoV9QIWYEUwJnSF5TMEQb+1pmSPu/6xb6MspPIcgyY278CRFhybHN+GXw/08?=
 =?us-ascii?Q?+vKpHLafhbZD8fCM+RLpAjXzhGWuHBCIq7MiOdMNyIHwyapp1oQextghlaNx?=
 =?us-ascii?Q?J1fk8dkjfkygmbQPDZKCHYbyFqVk3VCWaXPdXCWwcev1rSgHix3VjAjwpFoX?=
 =?us-ascii?Q?rZo8eED87SO4GzL8J8zMM6J8caUOgEPoNKi3s6YJjPlpcmdbHeNwBKTEEnM5?=
 =?us-ascii?Q?tjvnU4/e6EfinLMySOt7KSmetJu+VHNtuatneBXcUcrkq5r/wSz6t1Bo0kIV?=
 =?us-ascii?Q?k4jtGGl16uyqKwePIzwB2/E1DKOCsepgvDE2DfZFWa0uZMkcw+ImY49MiyOt?=
 =?us-ascii?Q?vwSUc2FhK2Nxg9ulPuNmH0yhYvBRpKeJcAcyIAa1K0c8GkzCKdTEveGQSBC/?=
 =?us-ascii?Q?1s56Yx0lorVhOiCZa0gAWuFEzgEaTxNYC6ikBzc32NstY5BX5rS9NrdMKZBu?=
 =?us-ascii?Q?+bSE9zsg3ynXjCDVwoMeikjw/Mr9GFd4tVSMO2rF1GN7TmOB7xFpbDyMCaAJ?=
 =?us-ascii?Q?+OqlqeplTW8Ll7RzHRwJvLAZhzIWGAT4T1E1HUCWcywy22kuQ+Vvt0EtwcOJ?=
 =?us-ascii?Q?vUgSju56LqdzwjrikoZ5JR1S+trOdAJ0Sxk3Lwgv9De9ARLKTOSPMJ7ucL8/?=
 =?us-ascii?Q?/a8Y19tfGCoVMw4wUBKh44+m2dqWY6lek3smgvfkmlQYTnR3UjI9aJFpbxeo?=
 =?us-ascii?Q?RcMzSAiltDR/ZJsR0xxM2BS39zk75dvRWjz3sMhea5VMbsSthemSgOX/rp8S?=
 =?us-ascii?Q?cRLf+4Za/vckQa4Nn9n+FWOrnO7HTHz7H03HSfuiGKJVI+EMda3xnGDrtvty?=
 =?us-ascii?Q?Vz3zRKzl4SGJB72i+Gf4nVY2uxWqFEcfCD3xo7MHpFI0T2tkpBcK8od1qN22?=
 =?us-ascii?Q?QsagLELNANxMsfjeW9g+SsZzmeLI8bcdOINXzGwNsyUxIuFGgfDMjtYKUzvj?=
 =?us-ascii?Q?bU2Qu7tTEjr1Jwm5SIEhcysz6VYI0bglx+wNgdl607WoOVz1nAyaIB7BOr0H?=
 =?us-ascii?Q?0sxCbAy2UYpr4PuBRqLkUuzSIVfDnGzvRl1hiPfDFjGHIuDXYyuUm6Pusmz0?=
 =?us-ascii?Q?X9BjAJNxCgGygR1UAlSgQm1SAxNQRNTan3xhf1wV3AnGf8THj7He6OoxyHzZ?=
 =?us-ascii?Q?jfdwQYOHFd8bIbsolhpp7Op3nVawVX/1iXwaKdbb1+zslKod/LcNSeo3zAMz?=
 =?us-ascii?Q?Es3ErnMKOEMBfGrrCxqKBuRo1bre7iCZm1lUEz8epm6FAMRs6caOqvxSoedU?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87f2e2d2-5f79-4707-f925-08da89d2944a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:35.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RLz4qcsdtGgVdneZRJQ5uDOxxOe8fScRTQYX2udbJPIUn4Sv3x5/DbzUSrZGxDQJLO3nx6onX377t4HBS550LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2063
X-Proofpoint-ORIG-GUID: GBlaewkDqN-KqoagKc1IL-OdQHdeTpc5
X-Proofpoint-GUID: UJx-7e7nsFbjWv6DSzF6vpIN_HiRt-gF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98534

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
index ffd87ed0b..643a704a1 100644
--- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
@@ -5,7 +5,7 @@ on wait status values."
 HOMEPAGE = "http://search.cpan.org/~rosch/Proc-WaitStat/"
 SECTION = "libraries"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=21;endline=23;md5=f36550f59a0ae5e6e3b0be6a4da60d26"
 
 RDEPENDS:${PN} += "perl libipc-signal-perl"
-- 
2.32.0


