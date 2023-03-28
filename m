Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CCCC76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 06:43:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59996.1679985788286168389
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 23:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2451043720=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S6H3lw000762
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php642w1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:07 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32S6h6xO019777
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php642w1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 06:43:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcDbP3uj/wgDeQYGPwIeUtyiz1lcyiYNolqL2Iy5HkogMTqlWNRNJSUc2TQn2y18dRy2KnVf7NLAwThtdaP37D5vGpIQfyI0UapDZHevzI0dZ+sUdvA8jCof0YrkILrwX3wuz8rIkNcaRQ8sxqhbHnD1x6WxQvq4No/64I1+OVkK5YtzK5THSG7mOsISrvHp8NrihqYYjthmSs9mwcKpP1T33bGWiUjtOswOA3YtmbobeJFgwcf88Mh59kJDClUuZUFgL1cdRGcJRv3uQp6dwEM6LChnHyu2zCoevv0T40DY9wzJU5hBkJ1HPf9gJ2/SQQsT7p01ubeSf98wRG1gFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq5Gzk7jpUNagqbTeZqCJHNfOz/XbPwin4vcEUnLbyc=;
 b=KmNNkeODH7of/F1a5PFcuPfi5zL4CZvt+m8TV7HcmB1y8MiOWOU7zAcPRZUR0kkGGWpnIzNIEb3+AreY+DjCoWFT/vthooPhVaFr5oAMc8qPBq8yo2PDJgmB+itVfmzDGfk1xeuafR4z2r/QwQEY9sIDCLiGBOaqaWp/wEMD3MkPl615hltWEnKSB6m9k1tMh0f3/9SHXQgtsf6XhcjIE8Zul9LPO02PUGDxRBGgIcDSZRbzbNvS+XjC0qrm1k1gSlMRrOjCT7vq6rtEOtNVPE3/ONZcYpzoSFMAwB4qNPdnsHaHf1boTQnzRBGZgUCr7ZPWQ+FwVr5nr4nnYxWdVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 06:43:05 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Tue, 28 Mar 2023
 06:43:05 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 0/2] protobuf: upgrade 3.21.12 -> 4.22.2
Date: Tue, 28 Mar 2023 14:42:46 +0800
Message-Id: <20230328064248.4049456-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CYYPR11MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: b13f4055-4c33-4be4-fc06-08db2f57af10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kdipv1cisArxHnegVAKRFBdSM6i92YGO7jzJyVhKzhfS1cqibdnxG2mKOTvcwU+C9qWS7QAKn8ozJFTSqzJGbcQDvZp9+WNeaALqx3cK3TybYghVLvWrmSqQ49LMjdrB5UHxsFQKgv0gygu8t8Joxyl7mUgdbG/5sBVgEZ6Cz2BAMzC5GmVZdCBkGHUeOzKDRGTrxUgVR3WE240ocBJi1o6h1pXGrBkI84H6BDMQoKHdVO+s/ei7ixJn3V5KU7ANRf+4o3r9V2R1Z5Pr7ucV8e0CZpGYaFWLBhciDirSbtNtTyle6z/evPGuu6EiVMQtx/iOxcX3lQuGXf0OI0mxGSw/xqioCzN6yTQXBFrxCytq4XQen97yk32xHQuRZeKdVWs1nWBJ143K76dM8vwsPLsqDpdTstJxZTU+GTjpxPVVsXxE/77aB/+gkJEQRkySfnFmKvPsmiXWWG7Umi8BHWrTao/UYRELQzsqkTpCCe2MSq+Hhh3aTaf69RrA+0huWg4OkahYwLB19SbtfnOtRvPKEVD/U/v2/DM8GDElJlG8ZdcBCYPlcVUoNI0iXA4QikMS0BcpG4SPjM4HqZZEn0XMynH8zzz4sRJIj57hW6A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(451199021)(52116002)(8676002)(316002)(66556008)(66476007)(66946007)(478600001)(38350700002)(38100700002)(2906002)(186003)(6506007)(1076003)(26005)(44832011)(6512007)(83380400001)(2616005)(83170400001)(6666004)(5660300002)(41300700001)(6486002)(966005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3W9fd3ed9WzdSo4eyrOXHotw/HUDjJjqnY3gP8iuxG4oMJcUzHqMkSR8Oj2E?=
 =?us-ascii?Q?iaqg0J7imjZezuNxW5rPKH9r7ZaZTZbvSyFKNgckNrdIu5wgnu+G5L+WHCYl?=
 =?us-ascii?Q?OQ91rv2RiCW6moPd5VwNbmMhhi7/wPq6p6uYDPYuefcLbMsfNpen21RI4J2B?=
 =?us-ascii?Q?Liz9SsfaMUfQs8sJlxeZxyj/IRab9WJihPz+bJ0nGqktfW0aH7jfItWzQfOV?=
 =?us-ascii?Q?l8Q2Nc0hynJw56fC9JAkKSSDgd7GvRpr0Z5UpaGxohBCLMD9jO3mXk9bvJ2D?=
 =?us-ascii?Q?hL9NcYcyRTOi5nrv8/NTKxPrZFWuvX7ajmFyiQzXJUfc6HhG7WuiK+TmsFUE?=
 =?us-ascii?Q?3G6MPWJwDeV7JzG5WP3vRXckW05++SHO2rN6gr6OpQ9TD/EWFmpzTWr6fEI2?=
 =?us-ascii?Q?4ZSmmA8FBiR6LRLODcrD4icV7h/gltcv4hOvPPmyEPzgTvo0MANi60Ov3ArU?=
 =?us-ascii?Q?rebphCe0Sv4k7Bne/G5HIrVwXd5p7Nn60Ndt8LYEgPSy3KUf0oKxWB+nzYvM?=
 =?us-ascii?Q?70PJ4+TWr8ZUU+CRzD10ZNotCKiuWh04epNnk+3xGmJnWtNooU/i/khfgmer?=
 =?us-ascii?Q?ACSwLDC7HsCuwervsUIYhxWdtJbI8HTxyI0mwOuW0YXPMNlmPIj+vqnEbLhj?=
 =?us-ascii?Q?3xPJiDp/35jzDJv3fzScJkpYpfse4w2EYVbXFNKUDMZnTWGvyYYApPTKIkLP?=
 =?us-ascii?Q?4sejb13qiG3YIKOLcpUppm3eRUi8kVtftoLyDhhnl1L/QpUUAyVsdgnJYe+E?=
 =?us-ascii?Q?TeWOg8YL7gG2VBYzOwN7chwb5WpOYWDADR14TQfoWBpJumn+TzESu8VubaQJ?=
 =?us-ascii?Q?K/kGJ7tuz8OzmDilxfY99Z8Zdd3z/l2LiOcvlvgHsB7oIYHqgFk5DwWJTGMC?=
 =?us-ascii?Q?YWDZWz46oOPMBrGEo/SlcCLcF9fuz8tz18lSAdiEIi+EL1U5cnFuc5ip0HvM?=
 =?us-ascii?Q?IxM2Jl02lszxfMlBP8aF4SRAa/hpDphug+e2l4y/JFUNcHE/YK7VcGNq/M9Y?=
 =?us-ascii?Q?YM3kuJ2K1kngVsFm9pZOB1S5CNePqikuUhsUmmgBxn7hFqNRJDld0CD6CCZF?=
 =?us-ascii?Q?G+uw1e39ObgPVrT81DXEqydrw6/DWrjKFwNRuk1I27bKMZiHPdie8UKu+84I?=
 =?us-ascii?Q?uk4QxmBM3KCz6Av/+Ev7aY0QdEsB+BAnBNJf+Kd1hKvYDgTJ6ozIKkKn/SbT?=
 =?us-ascii?Q?04NgVH6FeoD286Gz4ug8qfLd1HmmHo7SeWkA5bKYp68SVv2sF+waFtpuWoa/?=
 =?us-ascii?Q?3KyROie103bShi6Iobnai7CX0tCkW7SdiRtFClj0ATHhCiFTI0m3F7dF6kU/?=
 =?us-ascii?Q?V/P0yMi9jxrmJti4ui8fBxR7InmH4K7eXRucqb/y/cvbqAe9tvzU4NiGX5yj?=
 =?us-ascii?Q?E6QeBuUmUPLcoVKXzX1BBq1HGL+4icXa5IRmkP+gxCYGEF1mR6ObY7++vvDQ?=
 =?us-ascii?Q?W/Rm+ywPO5JgcheAwUPfZgwfsrGdyU2CacwiW7ST9ft7dkXy5fGf9Yx/fji8?=
 =?us-ascii?Q?vrfIhKVuoUQCaxK6r75rembpNoAaiiAgapJO0Jdmj5nkU9CuPvthEuYp7N7Q?=
 =?us-ascii?Q?I7hbXCHqJB8lImtu6F3gPSBRuyJ6BVifxAsnvi9HER9V8VMeZuPTJ8DllRE0?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13f4055-4c33-4be4-fc06-08db2f57af10
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 06:43:05.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLHOBLMg5ifxttyQ09tB4bwvbYPTrieb6SwCB7zMwl1T5WlMBUQ9+PYHySozEQOM5xRsmjrBoBYz5f3NiRQY2v4OgjQ4073/dREVQC5Nvog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
X-Proofpoint-ORIG-GUID: opXFHDNnOLQL7zef41RWdHEAuf9GqYpc
X-Proofpoint-GUID: Pg_VsWckySrQKroJNxIN-mLmeegRdL_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=819 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101795

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The v2[1] patch for upgrading protobuf from 3.21.12 to 4.22.2.
After upgrading the protobuf, the package protobuf-c cannot compile anymore[2] due to the latest version
protobuf is using c++14 and some of API name has been changed, so use another patch to add support of
protobuf latest version in protobuf-c.


Ref:
[1] v1 thread please refer to https://lists.openembedded.org/g/openembedded-devel/message/101784
[2] https://errors.yoctoproject.org/Errors/Details/698756/

Xiangyu Chen (2):
  protobuf: upgrade 3.21.12 -> 4.22.2
  protobuf-c: add support of protobuf-4.22.x

 .../0001-add-support-of-protobuf-4.22.x.patch | 332 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   5 +-
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  15 +-
 ...protobuf_3.21.12.bb => protobuf_4.22.2.bb} |  11 +-
 4 files changed, 353 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_4.22.2.bb} (86%)

-- 
2.34.1


