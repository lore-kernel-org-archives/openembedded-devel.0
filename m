Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76306C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:20:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13668.1635261651146451607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UPT2Q3Ro;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5933dbb02a=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QCUksp005715
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 15:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=TrDiZQbrx5ZkAM7KU8oN6QZ8VgpXoNOPQZ9cdj13Ia8=;
 b=UPT2Q3RogM1yuFgkX2jGZoQjpXxnvCpt45+usRb0qlW6tQPf9GQwgSmMUzIFQbFZWORo
 goxskhsDVJJfhCYlvLXpVMNHWhQVJ6Q+kmblpybpPjkI9RvMEpX/+M/Zx3Qfb2JAqD46
 vsT6aYdggLaeIUj59r5S6NjRK0t3cSig0+IZJjvV3bMPGrTOAZifzjWNN0TAwAA/vwQG
 RXSRQCxazNDqh6fP/Aujr/K3V+SDXm9yS2rMSZir/YUJw2T/E9gVpkS0ZOKzQxNamZnW
 lFOnjeukE9pLTWH5cKfbsEE4nGsTJ6Dnuz9ca8UWpULQyOSHBLE081NLAm8FfehNoc12 fg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bx4rcgms5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 15:20:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1bwLLNk27G1CFGkwTIRoiGSD7JmkNq2Sy5S4HfbYX69xs1ClMyihREBn8wuEnUCOrcDS/CgT57XK0clIMyZ2npsrcGodkl2xy7UkZQQLvapAlNBP++EggArpFVMYeR/pEQI3eAQ29PHWeoWnSL7n0ApYXO0fHj1gAcbi42fsayxksWMnu8BAyfQzPBUZK9UJ6gsr1kNss3IytKiEvbfH2PE7YMNJHfkiQQIvtAFAQO1FYfWbZJoFiA2xDA6vYOLkxaf5A6NFP+THYDTu3IwhNKQs0x56Z+Lh/mf1aQC1rzQQ7aAbI0fNM/pjIB1zj0XeeXDgrxjORGvNHFSV5MPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrDiZQbrx5ZkAM7KU8oN6QZ8VgpXoNOPQZ9cdj13Ia8=;
 b=HM1IzXGOb9QOup9N0CoHAZ3qI2G/TH7KzESl4g7MDqp1Sadw08lmxZSA6zG16qMq7rB4TQuIoZ0Bdq3cPAxALaKipp3dJB616QBTCTufDL9UiMJhCFxzhAWy2bEctiRBdCCu7yrXYU7XJJilbs4+wT2pJsaOVyKdSt7mg05IloOWKWm2oSz2aOnPronsUZN3QXUC12qKU2iLtB3Giljp3+46XA8noldu2Lxg58vlXhmOI1lXostXsdKx3xnwl5zNARcXusKhh3qq7d1SuvHuXeccTZjdM7j8F+7uQtnket6GK+e735FYulVfm6mtMCmnuA6WMKG3Vi/Eg++z9YIGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 15:20:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 15:20:47 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-cvxopt: upgrade 1.2.6 -> 1.2.7
Date: Tue, 26 Oct 2021 11:20:29 -0400
Message-Id: <20211026152029.72671-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:32b::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::60cb) by
 BLAPR03CA0025.namprd03.prod.outlook.com (2603:10b6:208:32b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 15:20:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da71742e-d950-4e94-b967-08d998942fe7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3480:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3480EF30AE3EF0D915BB397D9F849@BYAPR11MB3480.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U3VUx8o8D1DQn28uDrHGo1JVyd54/Wu0AuTl1Mt41Irg+EJo628cQ+G2iftl2gKOQ3hDZX/4/2gABhoHi9S2eMRzi4IxAJZRHjoKRq+EGsbMiCVdGzB8XbJXcScLj8IPBLePnQUaSNMYuNxA+u+et5xGcL0a2qZiMaLxANEiiN6QES0a3OJzbkPfylilcnwyBD/fllxrqhsBC0IlBcAc+6B2J2gBw2xGifhKQQne8222jCNHg1zIfHs73NtmVxeWdkGQwl/Vq5cYbMaGaNW4XsprCsbefTJJ4cl5mGESC9TA7bme0IdT6YMXERYwd/JFk6MwMQUITe3rGBFN4A5bcpzet9LdKYemc1fNk45rL0Po2mvK/TF2P1W/AiJXw5jqOfyL6lJwP4iSzpyO3AauArJ7NQ7phghS0MIZsu4yeRw5s00ZQL+rBnLaUId/5dcnSjm259e3eSkz3cjHDxk6Um4VGNNoS/Ivu3pk3PfzQDuHg2zvf0lwZybFQPPMJKHznbU0Yf/pQ1aZHd46ImqekdU5BIGSPMuozP+mxmPKXNgkAL9P1OFrhjRAbGsS07dXN1uUqeHcCJzeoj0D8NIk86hYH8JoRZZNJ9F86Hh0rrW1qU1EyPJOI33G9dolPmGxgs0Ln6xftJW3Dm/DKNnoeg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6486002)(6666004)(36756003)(86362001)(5660300002)(2906002)(44832011)(66946007)(8936002)(52116002)(66476007)(66556008)(8676002)(6506007)(2616005)(1076003)(38100700002)(6916009)(6512007)(316002)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wBRMkkX4z2L8mNxwIn/5YbflVr26Tsos4jKQvLnNDDEzRD6RNJjgHYBmx92O?=
 =?us-ascii?Q?PiCOFFfs2mYCAx7nJWWPHUXRRWR6D/ZUqNKU3LHyJehk8yZy3/VO109eNv4Z?=
 =?us-ascii?Q?G3nOfw5J7kudtwnMkd+l/Q3/aIDIH6+Njjl2x79sRtmXwDWQFUmd3Eu4QtXO?=
 =?us-ascii?Q?+mNYpB//ySqO/N6t6JE4K5lYxt9jWUBccl7yJHZjZ6NOylyDDLnCiunHbitJ?=
 =?us-ascii?Q?21ZXYPvq01rUa3mAXe2kckPJ4ntjLPwXyl+2Vvk53hu/a8THLhBXfIRF6uuk?=
 =?us-ascii?Q?fJn/Gb39XlFbUE0QN3JAz8pTKtFqy390WERYISaU0Nn43oITqkFgJs8w0KUM?=
 =?us-ascii?Q?xLwklgPYUUAkQ1yPtpagUy7JMK0Do3Xa44kjm6/xTT/Zpy6AIuZ/uyKuNC1n?=
 =?us-ascii?Q?viJ4gAskjPWSWTKB3wiQOaPx7bXjRiPIwNTD8OXEoJVd1XZHn3eiXMHZbDqh?=
 =?us-ascii?Q?Gk8OngprUC2r82wMmVwA4yvqjmDT6j8gDiXT3diAtK/ou6pGBLr7lAoxGXBZ?=
 =?us-ascii?Q?sMSKUPovCSwNhxV2Vtn95JuDN4B4mtD8/Je/ezZcyueIQuquXJRgZnRq8GKk?=
 =?us-ascii?Q?mB9COGFsA98EErMEI4mnDLqraLKj6B5+GjjkERf5qJWrHG3BVA398zW576oT?=
 =?us-ascii?Q?favMABRx9nFfUBSxzkPek+IKmxkxxDq2uar59pExGIP5j6Msvhgbu0ucfF4c?=
 =?us-ascii?Q?8kXOQ5TvL8akLFs+eHr0j0j4EbeH7jhtOWkvH4vEqNKEvRMa+/NR1UaCkCq9?=
 =?us-ascii?Q?uC6T4O0v9NZWIOdNf5/WDMfXrNGdP/T8KEcnsPc0sNMFmevld8aqDtZ8VkPK?=
 =?us-ascii?Q?TmrCeuSuvMXDxWSruT6OZOriRnnR/EsC+tOgu5UldLOxUJwiiXlwETLhG+6y?=
 =?us-ascii?Q?0hN5/RmYxLuc609L9BCmVk3zzya6O9vMsB+aKXKAOmYeTbx3bZtc16rra6W+?=
 =?us-ascii?Q?XFSZ9fF0cHhD2+jaTMxU/gUuCAQ2UIbc6mbzDG43jOS9+Z6br6Z3yMhRG9Md?=
 =?us-ascii?Q?hlod8qEbx3/A+C+QVxdiXOnRD5o+wP3qdQMKBdptOW4f9h2KoaWITb/L7z91?=
 =?us-ascii?Q?xYsD6P8ABGGoWVHDCB8PJ+PcmVh4iljr27lvIe+ejDLMYZ1OWhMOvBWVShcu?=
 =?us-ascii?Q?JA/OYwmqDNqeWEa2YoFLJS1uI/8E1/3AWcnDeWXei+Rq7QjaF414gl6E5nL1?=
 =?us-ascii?Q?E9LixdzMUGktC8HFKao11h/uaSbQRRElFRLFcKsMId/Z75rlpK0u+p5CCPSZ?=
 =?us-ascii?Q?H79oYMI8VwojN+KTHd/AGY5lcxlicreOxrgKqH9XllztM45CYsMPqe9VflQV?=
 =?us-ascii?Q?42Cc6y/6XccX/DwqR4pKAEXvVDVfj/bwa3i3bV9L1DUk0LQH0et07nodoot7?=
 =?us-ascii?Q?3W25tAyTqc39vGz9Ql5n20/Vg0gXrLPfZFmqVnK/c8ZBMgq9xznfXzBXf7LC?=
 =?us-ascii?Q?Jn4M9iuTQ9bMNndiZIXyyQYnPAMM207hxyzDCml8XTMshG9NEUGvINpvFkWs?=
 =?us-ascii?Q?qwORCDO3BROrbPB+v/lgdQV8AWTxW1WXLSgBGcLgY9mLSd38TKHCwXQRKJ6V?=
 =?us-ascii?Q?gAVLmfriElU4TiC3oAUPqfE5xgebcz4qlkLFD+rMVr8PCdtpSS37iUwTUEUZ?=
 =?us-ascii?Q?hPgpbOeGASl0uFmu+OIpnJtoe+oO9V2+9ulQKB0uDD9k6tq2J0AZnE18bOD6?=
 =?us-ascii?Q?XRaMALhblTKy4GMl3LVimDkwnfnCogY4dakRIdVK+8Du0VKh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da71742e-d950-4e94-b967-08d998942fe7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:20:47.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M8Oo0xtOMVSR37q7jZhgebZwGoELrpjzBfru2UQCU0kXPTCYgbo8yl+UNLoyqLjq+QWxD8UF/KJYIEDeDv+5Y0VsvUg2cR9Sx+Rxn3j5P6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3480
X-Proofpoint-GUID: cEy9eCCbKPBqPUR4_QMvoUi43D7wVx0t
X-Proofpoint-ORIG-GUID: cEy9eCCbKPBqPUR4_QMvoUi43D7wVx0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=823 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 15:20:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93602

The upgrade fixes a do_compile error in 1.2.6.

Release notes are brief:

Version 1.2.7 (September 20, 2021).
Minor improvements and bug fixes.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-cvxopt_1.2.6.bb => python3-cvxopt_1.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cvxopt_1.2.6.bb => python3-cvxopt_1.2.7.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
rename to meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
index cc017dd83..3f35149f9 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba1a8a73d8ebea5c47a1173aaf476ddd"
 
 SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
 
-SRCREV = "60fdb838e0bb2d8f32ba51129552c83b55acd2a7"
+SRCREV = "d5a21cf1da62e4269176384b1ff62edac5579f94"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


