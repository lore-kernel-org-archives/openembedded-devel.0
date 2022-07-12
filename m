Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52792C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 01:30:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.3904.1657589403059740291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 18:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RNHG4XDr;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=41928365a7=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26C0rRGY030088
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 18:30:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=RnDF4wcLUsA6h+CAzZk5PbTXn9pJbJw2E7/tE7fOU/I=;
 b=RNHG4XDrTYNXU2pwteRAylzXct+rZJsNpx1paFj57rpdKDVx+6nh2/dMH2NFSEX5QWED
 AxSbGgkHhNj4X+7/v7hBpWwobuDMfQjxTpz4qVBGtYpyPFeoKU69gmlQCb9cTsclq9Hr
 yY5vru8r6RZPwt3f+pHtYKyyNILD/1YUf01SIV3NNiQ0B/K1JlnPgMWGb4fdNRZLarxV
 Muq14RDnygP8A65JYARNIx/6hSpQqY5ld7yoFPKHxquNpxq05+O6t0e7dE46LRiyX5qF
 UityiKeCJYLUtfVQTxP1BSJ90AIpN/ZmE9PMHFYs20CwKbYZ04KyarPg5xNAjnRSeeFQ vw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h796ksqc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 18:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvD5XQGhWkbIpOdBqY2/MBAF8j2dxiQCYTFwe6MxnV7n6yzJEC7m0CbNve1dEi3tYVXxbKOekrc/DKDOENNkrt0ZfvLkR1pTMmH3VL85gY1EwlZ9h4Nqh4MK6Gbw4AwpOGZRNfmVleSgDNvmVI75STTWD93ZdBDSoIIcqDNBgEtRpALjIps7GXNQTmYgVGOeIpwXySnNM4TB53W5mSGpVAk7dUcniRw6i7QnkaDF0+Rpc/pU2PMNndfZjYE76XKirykRvYVw3dIKVY5JTUSC+KQcVfAMRxVgS0BrWSFfxgbmGAEZmhJfBeO82QQXBJYU0d3W4n6sZNZyfqCTHzMFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnDF4wcLUsA6h+CAzZk5PbTXn9pJbJw2E7/tE7fOU/I=;
 b=bxW9lM6BZinuyuF3AeWRBAJCi3KuZ0I7efpAT3/2o9cg1l2YYhaNsoeSQxeg+IwePbWj3QkQ4o2rlZS6mEKDP7g04EiUi0o/YIw7H1YwNWjnsAEyF6q9W3q22Tg+CFi9Vf2qPJ+Eeb+If/KfPnE2JC6jQc/GUYAfUNGkW/5erG0gZbKOqCiZfKbWs3q3hzKT3B7eCEBmJWxTP1U3BJJZEEyVj20QfPs/gojA9me71boCwRq+OQp2WmRbXwSRsPu4GGNygJcF1iOtZLsgIAKwI7KLmUnVJpxPMO8qJ2ZC6t4FJpVypHV06uFsq/E8dou0R24l0nwsUj1OMeqFNBuWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by BN7PR11MB2658.namprd11.prod.outlook.com (2603:10b6:406:ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 01:30:00 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::5986:e5e1:9cc8:cdc0]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::5986:e5e1:9cc8:cdc0%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 01:30:00 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][kirkstone][PATCH] protobuf-c: update to 1.4.1 fix
 CVE-2022-33070
Date: Tue, 12 Jul 2022 09:29:47 +0800
Message-Id: <20220712012947.381745-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0211.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::19) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d656400b-4149-4e4d-3e20-08da63a6096a
X-MS-TrafficTypeDiagnostic: BN7PR11MB2658:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aWI8tG1U0CJauHVngGOLE2B2wPmnd82kEdTZC/lQEZNo6T66PDj4Bjf6QrZMy0lE5Ed+3KetPSnAq6LDm9aLaukOSSJK/1UsMZt1LcR1DhVQPjDzjGjflovO8cZn7SBSaT3aUp4vETgo9d5oapBLWzqU6+Yp2vwCZyhFUB3U+vwUkEWwIASCCK/fQ+xEOkmXO2swkYq3EgqXOTC2/aqaK/VrSivAxuDO6KBZJPXe4uKgMuCmED0lQjbU7nj/FiZH0wKz8CH43V1cXRSbVZ3toIkj1wN1AYI3VXu3rKRZOIBqxm66W18zBbmY3i4+/AJasyUT877JFuFg2d0Npx5rtwmCCHNF1lY4YOxOm+rsRMnvejDZvOyzoWE1zh4YKIcklmESBTWUxRjODrZ4twvfx0W10/ZjrYPV+fpve0yfLnDZ4/JOgk34clWsEZnZRIDvcQw+cX4QxYsVbyj/o1OhIolOoZ52TCXJy+B8Gre5cI07lJc8wp8OwLdYF/6ReksUaooVOminZSl4fDSqBuXklWQwxHVsvtUQi7IeopbxLXBL4tBQI6xxBW0xdRUvPBz3To0vBgwzDR5+3HdZFWqrVR4m7/buJpHeZD2DI/Jjlu3dBv8xlXg0srWTmpa/V03E3HTSKRw5CxK76Np73t8KkcUQbXx774YLDNnIHV9KVIU+V24LhP7Z1pNgpENArdGPDZaR8DcTpbPpN0C8dzJMGUVd7sC8DWIguKv7O6zDmEZz4k+18+mcWHxt0LHxGfJLEOEIs030kUiZCqRMVpPqDqMrrga0SYT9gZ+ZZG0hCpUhmNOuTZ6Lhm8Xrz4KBPEN0hj0AbZtG2l0pAWhPfjacg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(8936002)(5660300002)(44832011)(86362001)(6512007)(26005)(2906002)(83380400001)(6486002)(38350700002)(52116002)(66946007)(36756003)(38100700002)(6916009)(478600001)(8676002)(1076003)(66476007)(66556008)(316002)(41300700001)(186003)(6666004)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rHt/IQwB5uX+5u7n8PVSm1gocbC7rtLoRNmvW+njgSh62KKK8klhJWXSqDS6?=
 =?us-ascii?Q?Rgb4DfCYEphAlbe3eiDwMXMYatSKuuIR3CuGdQxiQKRIoBopIO+IaXXuz+5E?=
 =?us-ascii?Q?GPdWMxG1vP0P4gZ/GfrrfZwqKgOF3rXY8ZfYNaatZJc51/w5MZUr0pI5INGu?=
 =?us-ascii?Q?Dc9LzI2a55rcU8k0NdC8EDw1+GP225E3YMqUOYKLyWtvrKz8MOi+JYp7OULm?=
 =?us-ascii?Q?9DKn7VVd5t+Kac85GGyLnJYtBBuPmEPKTfddeg7TkizMOkUGQNfmKkCKId/i?=
 =?us-ascii?Q?4X189bue+xaf8VXjtYLIyL0TnwLwWFfcCMKm/3/xWumjJEUIfkmXk+Go33VL?=
 =?us-ascii?Q?v4hZqqXVNRo9itBbr5AQfUmx+jRfhN75ZZMGs81JovuT0vr78NTzLuGb0KM2?=
 =?us-ascii?Q?NdHq1XZmAHeyxmh6o7o6n26t6Dkc1gGakaolyx7n5hJlXTHYjCLrN/WlFzmC?=
 =?us-ascii?Q?xuEeWv1aKJJD9qF7Bm07uNCKJJvA3uqU26AjqFf2MifvrWTYq1gzNk+xsIsp?=
 =?us-ascii?Q?dNiofh9463il4siCrC7gNWhajUZnReX91S62AapIgKvadWR7xwKxIm8lxYcx?=
 =?us-ascii?Q?y3NQLqIaKVoY5QHnnwWnYmsXON74G/9w1f1A2LZA7k4GP56tfcd0+fCMXhDw?=
 =?us-ascii?Q?mPZ7CyvHtjOvMFlNALD8HMO1v6EcLxtNJ44iSSvAgEbdbUEgI69H5yfyTGcl?=
 =?us-ascii?Q?axe3LjFkNEnltCT9/xjyzGR0fs335/iT4U2L9sUJADSSqrDwYXNUnBvNEowj?=
 =?us-ascii?Q?yMrNLe++y6264xkvyzEa09+Ozvbf+aMy48CYfG/PyOvMdG4BXO7p5Ed3eDp2?=
 =?us-ascii?Q?aU9HRZ1sbGRITWtII42wb1UDBb0BPxV/Blnu/7NVsLLzme2OM1JJ5w1aL6PS?=
 =?us-ascii?Q?TVSGqh/IkhwRSoJABrgnLmGxeCdNTT78fBNpVSsh5IkSqZehC9Ne6ZBCUzIc?=
 =?us-ascii?Q?PQEOJ8o3XTo3oVKNm9JXw4n/IylbFBPPpS6J+jT4JcWD3tCh302Ss7l0vB4O?=
 =?us-ascii?Q?Vxf0Hsd6K9ILWcawj/K9mg8g0/vB15v1xs1jbF1VhHhROXncumKmrxuv01Yb?=
 =?us-ascii?Q?M5Nr+ko/w3HM7K9WuJRyRcsqdFLDLYumQlOKTsrmsWpVPYMWe1AtHaCU/Tc9?=
 =?us-ascii?Q?MhTFqXO5IRsyb4NwhdXaMUAd/xoSCw+VnzriDC52mPwcxv7UStCQoe3kfatB?=
 =?us-ascii?Q?+STt6K8bB4f9xk7ZuvgViWprs1HfFAv8HOSe5VZYiOWSbXtkmjs6y6GMa1Qz?=
 =?us-ascii?Q?ajjkT2CvhxAl3NEdb1DZDr2u4JZKXZj4zA48SddO/w9pnTluaFMOyjmPH7tQ?=
 =?us-ascii?Q?pikLdeO+rQCZKGVazfsVVFKntCw1ZvRyKCowfjS01AGXnCMF9OV/xv+0axJX?=
 =?us-ascii?Q?E3ecZGK/qMA9/Zg2AqsSTBEZmpKLPTG9IKX68F6dFB3zqXA27KNvJF8ZwgNT?=
 =?us-ascii?Q?YuLWL9cR3vfQXm8RmdRmlv/Sq5/onWXWfYZ7qO/uu4CVqxUFOZbASIUM1Ehp?=
 =?us-ascii?Q?ROSNDj8qxp34lZCVANB/OwHyinMwI5DkTb8H1XaXAhHj/rak8iOjXbKhOlcc?=
 =?us-ascii?Q?Qj4dWBNef/dc3vykIMRexuhlId1WDlaciVOWDtsFpTBxBfaee3fWTdX3oOKN?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d656400b-4149-4e4d-3e20-08da63a6096a
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 01:30:00.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HXU+CLMKrsgEpKKU5AGSWAY+mvqZioBhuSFZGHmoOQ0lkFlyeYna3IhbF82kXcoEJbJ1PKnknds9fLYRNRPRS8Z3NO8/q3gllhSz+8yH+0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2658
X-Proofpoint-GUID: i3I_6afatBx2XkEyv3fENV3NzDwfp0DH
X-Proofpoint-ORIG-GUID: i3I_6afatBx2XkEyv3fENV3NzDwfp0DH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_26,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxlogscore=733 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207120004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Jul 2022 01:30:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97812

From: Wentao Zhang <wzhang4@ala-lpd-susbld2.wrs.com>

Signed-off-by: Wentao Zhang <wzhang4@ala-lpd-susbld2.wrs.com>
---
 .../protobuf/{protobuf-c_1.4.0.bb => protobuf-c_1.4.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.4.0.bb => protobuf-c_1.4.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
index b3423ba84..d724287d6 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
@@ -8,12 +8,12 @@ has been split out into the protobuf-c-rpc project."
 HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
 SECTION = "console/tools"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
 
 DEPENDS = "protobuf-native protobuf"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https"
-SRCREV = "f224ab2eeb648a818eb20687d7150a285442c907"
+SRCREV = "abc67a11c6db271bedbb9f58be85d6f4e2ea8389"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


