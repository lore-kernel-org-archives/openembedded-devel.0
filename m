Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2B5C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 02:17:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6861.1632968245103229213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 19:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fS4v6crH;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5907fda7fc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U1ileD012823
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 19:17:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7qTMEcDlT4SX8GyI11HKcx+vl+hhbD4RdMWux6fuTSU=;
 b=fS4v6crHGsT5GcqDKMuW6V2q6mesMN6tAdN0uuRniODH+ap6dEBu3BiReiHEeJ1jQmZi
 vs908OTYBYHXhKeF7vb3Jr8Zha2azocBZ84v3gfN3gsPympqoEAw/0m4RKSsORMPsmlS
 FT5E5OI/mePHsywvMVOuPy1EKWIEi5Dq5NT+6XlNnx3bSHbJe+ufNVg6ga9EuLkRatUu
 G314As8Cz0+dCf7e2ya8aRIbkMDtHCv48xEuQK3kDWCZnGPoRAdo4EmggvPJ6MkFJdRy
 h3qPsy6jJpnG6vSC4g3gsfHMKCyA2InZ1Oips/NkyuOK5wP6Nw0L+TNREKGPsR0t1xib YQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bcceqh917-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 19:17:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmgGCjdsuuFq96OTJKqwRTzsXcrK83FkBOpyW6R7FTQu3+bP+lyn+cVtm+VhaD9vW77Pzh4CSywSviqi7VwBJpyWn4WkU6XVd17eQPId6VSkwA2BMVFR7AN26kp+YLuKDG82lCCRzOknEVwJISSbPMrdlvDPtfw78tCcQS9Y4dnhMlc6UPOrTa54PRb/sVQ/2qn/qdCmB6vLhgmt+c1F99PejfqloszDm+y92LjwP6yuIAkDZ/mo/CjDeM0VzEQfu2Jop02lWe4V35FmUvIonM3q/mL84PZlys/gtMkx78eP0vq1Zl8eL87V7l9CnhauA/pg9OQwfMmruH7LV3TlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7qTMEcDlT4SX8GyI11HKcx+vl+hhbD4RdMWux6fuTSU=;
 b=GM74DAhzL2FI+E1jI9yqJiiwgI9XHTnLjeCg9ySdivOTVpQD4Bx0c2u/h7siYVnsbkIhw2JJn/PJMMCGV0k3E5wbKWicCcKJmTG8arwBi2rHH0cteIhrZSg2xxoiuFdV/dmY+CKy14NaxMQDZ1NRLUBornBVGKMFmI8FC4TW6N3dq+y61H5harYJwx1uBpySrnSYDJUkNV7VP3TrkW0RrqFJPaL1kThflhlSPrQWa7ywVUCO9YOcT2jwdQHxReDQKIGL337ee7/Bv4PnrNvDOvmdNhU3iHUuUE7e3R7PWAVsYqiCHvzTjtl1kkYTlB2gPxmcLHrVpnn3zpEBvtzxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 02:17:22 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 02:17:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 5.1.0 -> 5.1.1
Date: Thu, 30 Sep 2021 10:17:08 +0800
Message-Id: <20210930021708.184244-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:202:17::19) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR03CA0049.apcprd03.prod.outlook.com (2603:1096:202:17::19) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.9 via Frontend
 Transport; Thu, 30 Sep 2021 02:17:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9534e60-7f5e-4080-3410-08d983b86fba
X-MS-TrafficTypeDiagnostic: CO1PR11MB4817:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4817EEDE5646446E037A32A2F9AA9@CO1PR11MB4817.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CXrjEMzXUzo47oTJcDNt1srQWTgs91QmoXVodb7hTg54O6cHluVacxCY8x6+93OcV0aQIZVqg47wMamLWfn/pFWD55KE/LCZ6/dDbF4uiGDO8+nAjbRqwkRD/sJMUzC/GPhxngDYMAoM2tXXPfLw8KcXdOy/D22n4+zBiAFfENIXlzj1Bnz90FNLH4mq5+G6M8fOen9bSF21USqbL11Bgl37e/jFOcmRc/P5y4/i+XInKOGS4wwPLhHQBiefx0oJ6GB3yzUTOQku/iPtZ0Uk3AgFzq5mq8OQtTEFAQ6f3nMUzdv9njepaeEEU0NGHJa5vWQHHCxSN84FkGls+OJ26t+BdZB5aU+8msirTxieHvWO7DgdjKfDCtZmSo/iFRDlwfNIhM/Yp4vctMv5hUn3k8n3Y57EaBE033jhz7kRO/wOQRO6Qls30kibpuXg40CtcKV3bmpyMiEfSjjNgK1perWPxE62lXcizu9sEy0OuCu9zeI3WvLthvTxT49rzNA+pFZzdsRiTwdHQF/dlxBqZ4EQsn2WFWDqKSrQ8GTCy1RhXPL1AeePE4wfR5YBAPxyVibD1fXtjC0+anieTzfeT9TzhRZTwmCGP+3Kk6qEpSD6HasZyOotYMe8pG4ive7VDsvEYL2qM1GLVIMvs0/Q8ujR6R7SgWH4tjsxU559g2i9Xhtweh8X5OvjvA8Sa3vtL8+VYzmR977U6C4sZnHA5vX2O30tn2Ukp3A1Yejbu1BvC2kJ+eBNpv5oV4LWNV52qPUjxhRwm4/QS4qlo9sStnx/fgW6dbR1BQt2Ro3su1I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(5660300002)(2906002)(316002)(6916009)(66476007)(66556008)(6512007)(38350700002)(38100700002)(52116002)(1076003)(966005)(186003)(2616005)(86362001)(6666004)(8676002)(44832011)(956004)(26005)(6486002)(6506007)(8936002)(83380400001)(508600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3b+yPIQW0SCJe3Iw5Ptz8gNW5CV/LrXxF60ZAMF71hlvSQLTMCmrtWuF5ilq?=
 =?us-ascii?Q?6DGHvuyWtNIsfIthorCW0tVLN0BjIqn0iUqxfj0NSRARf7+s8CFAuT5CaCqq?=
 =?us-ascii?Q?JPdvL11f3D7EKoc+eCDERnlc2VxMxu+W3NhLRK4M/eMpkPyOrOvy6DLWiEYq?=
 =?us-ascii?Q?4ZofAp1qQMY5lF93hF90MJplcvfP5Ivah7JQWrUKZ3XKhkaqYpon5VtfDS+z?=
 =?us-ascii?Q?PPXiIXp8KCGEPb6O5d6UkEDsbOfDezxUFyXXi4kQqgDg83ONUXV/N/tILa/C?=
 =?us-ascii?Q?cOyIsxFhuXxnwS+w2huQxXc1ITZSWCaRppwo4Hg5hLwI8gVsidGleX0/kgfN?=
 =?us-ascii?Q?JGWOI3X+nbSJMb6KMVZFkY/X3Fifxt60EbOiwfgUCpIlB6ztRYoI6NMP/hif?=
 =?us-ascii?Q?I7rMXtnxiNd4c8YA48uM6kA+AVFTgEeQ6cQhwtK+Zz/F+zxbV3NB3jhJt6Nt?=
 =?us-ascii?Q?+xkxPbjk8DEVFh0nPpV4G7BgdMAUqbTAEWG9X4cnvn+at/Q7lkC/BHLRaXbP?=
 =?us-ascii?Q?PxjFT79kM73A57Wj2S61b1bXhO/Oo3Uu927MPf5BKypOVz0FESolrQUNjCXQ?=
 =?us-ascii?Q?8o4cAmVfPBJnxkMtTmUNOaiKA4UTK6ubDeKZt4yiCUoGF1HpTq6lAVEpQtHx?=
 =?us-ascii?Q?NXNTuJMElK4aHnU0zjR1UsOuAxAY/4BicO2RSzpRNXJofhOcM2xcKLoXyw7r?=
 =?us-ascii?Q?E49aCnUS/YwxuCkBGajjwSNraAZlE1ShGefd+q87dH9uTTWZRKU0ZmnAYiuH?=
 =?us-ascii?Q?IS2VPQHw4qQW5GWFjjdM0Rt/r3FW7J2Ux3le8gaUrO1K6LDZOCO3RTOen6Ne?=
 =?us-ascii?Q?84nMiOc5o5iJfeQ/C3skPkDDFeNufX4NrGvGWoAI3m6MDZZJjHeEmU8pWzN1?=
 =?us-ascii?Q?8YiYGDDwhp0x94qJ9M4QsKzaw5x1vgS5DjQk49k0XSPw/kKihL/WDYaVbr67?=
 =?us-ascii?Q?KivBQoJzVVv9CkbbJ+Nvcr0Bd+WZmlIYlb+Y8GcwhYK+1Z+2qtcQ2k/3iKOg?=
 =?us-ascii?Q?fOJFWgjikmj6GiaG6AoESpmD9z0ziLRzjJ/bcEv/wdNm+LJjIxzHo/dVejHm?=
 =?us-ascii?Q?qGheZX4kiAJq6IFEmjXiMC4S89GnAHVJiMj+XcoTIjDg7BODloSlm9fImNZx?=
 =?us-ascii?Q?Nai+wW0mO6c6wQtiYl8QoP5z1Z2Vqa4ZQmd28BXcwBtsesJbhzg275lXwv5N?=
 =?us-ascii?Q?0tPyFHpBr7GoLCtGeCLvkiqYBJObnTJhlJ/tu75o3dHTEgQS5PGvInlz0d3j?=
 =?us-ascii?Q?HszwwOLF6mc1HX9eBGfWfKOhaq0Qyoj8Qs9LRzNh385OjXEdDnpkqy05JmJR?=
 =?us-ascii?Q?zi6YZHMz8/4k4Ho6+F2wk1HR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a9534e60-7f5e-4080-3410-08d983b86fba
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 02:17:22.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SB6Ag8gOthq2SixS23fJea53K5Sz7/PtUg5pUF4xRo4bSJxNaIC2IyseFJzmSkpXuya+bbm0QxaQaDf1mSn1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
X-Proofpoint-ORIG-GUID: HX_Z_w20PwIooG2HzMLXGLq8rFRoHBCV
X-Proofpoint-GUID: HX_Z_w20PwIooG2HzMLXGLq8rFRoHBCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_09,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 spamscore=0
 mlxlogscore=941 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 02:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93176

Release note:
https://www.phpmyadmin.net/files/5.1.1/

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_5.1.0.bb => phpmyadmin_5.1.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.1.0.bb => phpmyadmin_5.1.1.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.1.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.1.bb
index 84e1da620..b64824c47 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.0.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "4587343e706c5434adf91c396b418731"
-SRC_URI[sha256sum] = "aa8ccf357f672012384df34e1c2bc70147476761c8458a0dad6233497e142c68"
+SRC_URI[md5sum] = "e73377b11b7d38fa3f3014f2799c5252"
+SRC_URI[sha256sum] = "1964d7190223c11e89fa1b7970c618e3a3bae2e859f5f60383f64c3848ef6921"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.25.1


