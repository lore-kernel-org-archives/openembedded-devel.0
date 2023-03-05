Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC540C61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 07:27:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4987.1678001225768625887
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 23:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Uhq6I6zE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24288e7293=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3257OoJP023694
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Mar 2023 07:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=w2hPOA9l8K2Do8PMYe2MhzDfwHILBeqZEuPuc//NDNE=;
 b=Uhq6I6zEil/dPNi9fjKTWd7Wckeuu2cySHLvTFX2A11rD4QmzXjrIkHwitOmX69hZcYX
 xpMabGBQ9WngGVeXzQcJWqxkYn8cikKILTsvtcUf2EkKpIs/zP539AliKjJp6O9ChYIT
 KNMBnHyyAsS6Ddt44Zgx4I07PMm6AwlaauB+ETDne8YrRJ6KIJcb61iKJc39UP+Og4Zj
 s5y9Ijx49HITAJvlpECQk/0Rhz5CTN6L2IaulsbZoLOTG0fqzCy6AM+GNNIojc0VdC3Z
 4QNN2j/0ChS0lwvY4xHYbluY/PmL4eGmOk7OH73087f/tR6KVeosK9OlcJnaDsLtKCuc +Q== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p3u72h2fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 07:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvYbCAhfAKxVhEOWF6U381rWgfea6ZlaW1q/KYjIFZmRGhXUD8fL6F5c8ef4DQB3LaxONsym/YUls0xlYW8Ku4+Xn5TdiD5vs4nnwVnOMIvOdCy61ZXxXXBCWmO1IPgxSHJG6agTuA34UvvNGHoy91vIThQBTpN0uDkUB7d5vVr5vceL34FXHIp7GY5rHIIDqu1OjArqeV2QNWtOENLbxR/+DBtfcJmjT8ICF3vl+g1Jt3Eq17DulKLLl3Sy2Mg5adf37mD7vcwvjaD1KtYG84DMdH+fV+G8qKGvi8UNunEBe7+oOM06vVHFaDKCclPsnY0sxI6MpuwXbP6Z+ysqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2hPOA9l8K2Do8PMYe2MhzDfwHILBeqZEuPuc//NDNE=;
 b=EFcU9N3wi4JAN/FFYKBVn//jmh/7AdNsLYTjUfGXzaYdsaM6kMp1W0ZFJrvEWJE3ycOJYDvQy05ZzTFByMu8lBQ5WhIdFYy0d6OV9JWdh1bO0B0/6wSRN/FZNx6AKYvNqL4Ieh6DlQi3K2yln4iGGWG9XsRs1YiUFqW0sVnq24cBfdDWUpF9KLr8IbjLsz4EToRkh0LK+FHY54UvyYOHp/gATL14IbAKY9iXTQUURozwkA+vBNjWk0o2XE0LIouoA48N6H2TMfMfD1CdUm+tF84EfnwejvuWGz4LCSwNDelMMauiBKQx/HFiskb5hf/+z2UWbKvPws5UkB7gpsvXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Sun, 5 Mar
 2023 07:26:57 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.027; Sun, 5 Mar 2023
 07:26:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] frr: add UPSTREAM_CHECK_GITTAGREGEX
Date: Sun,  5 Mar 2023 15:26:47 +0800
Message-Id: <20230305072648.2432656-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1274af-a193-43b1-d679-08db1d4b0093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	322vmMOR3Eq5uJKuHwM059Pp620Z6/DxoRP9rVVLHHS1CNqdyC/RBSuIto6PkBlp/tMjT1QP4vBZTzDXVKhnaYQ+zVJx/gFkknkJN1VOfc0QrR6Iv7DTkUnWJOX4a6Khv985vk0xzP08vzluvYXEsUiyRSbwERbmSCa/P/uXndCQZ0pIZKnVNgufIJF2GCQpaxGfPjrgC1CDKniEObpuHz31q5Mwcz6unFh2XrNZAHcoUCbWj20aMyMOIgyrPY+tJg7P9T7kExkoO7ONLw+TazluTyT8JukTx76zaZMe2t9eMyvk5/v6x0+i2GuPOqlHV0d7rKoEgmpstejuAelKXUXR9zcu6kyaEHL6FhuhDCXcDj4nPKxLm25QvssZ8U3XHn3tk36txJQb7PHQM0iywOU4iQItTcs4wOIX7nVnKzf65Qe199SH38eZTuqjZxoFKBj+jbocSparxkssaGoLO5M2z0fyvqeBslcJI86vnwVwWa62LfwLkfDYwTuitQc+ueiQ1CQzJpv1FiBaLOkuAO5Tn4yEIVdzt32bYhRvcrBxcOarCvqEFJjOPDNUy+1eDs2ge/poSoWWiBH3plDo2htW1dMdaQq1vsL4rkyyYXH644WBi2mz8OI0lOtNFXMRWLAldwiIuC6VaVAGlKaN3ygOF7DTBLsgvE51V4GVhGPlV4AvaX8yYyNzV5NxOwtK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(366004)(39850400004)(451199018)(478600001)(6666004)(36756003)(316002)(38350700002)(38100700002)(6506007)(186003)(2616005)(6512007)(1076003)(52116002)(26005)(6486002)(966005)(5660300002)(86362001)(44832011)(8676002)(66476007)(66946007)(2906002)(41300700001)(6916009)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n/H3mc9Ta6NV2BsHtOMPWjPYfguad8NdAaw6XQaSDB6SD7PRkfdIXz7+e0Pm?=
 =?us-ascii?Q?jIPXJbexdWibanvEswFbcn5G+apZrG5tgZz+dlITlSnRnjDQ4KtX81TtCX3B?=
 =?us-ascii?Q?Wt0IwEprJF6p1GigzzKTXarqFCt9G5HITba28gU8O1xvYVa81xyjPhmRo8KA?=
 =?us-ascii?Q?rVDyCflQAlsEq6t7Elv95jJ11kFDcHpyAm8IJECh35arkg7gHWV/Lk2wrjxc?=
 =?us-ascii?Q?DGHfGnHp5Yui3VJdEnCPl1OwD3sUf/+uCBYwlOv2WbVHztxFeNDlbI9q3dHX?=
 =?us-ascii?Q?N4PHFGCm7JrEOQ+YqGpVA0Ws4jbUJKAYzxx4cYwZnADdKlBGn0coqcdsI6JV?=
 =?us-ascii?Q?fAMnLDnGpOH3ld2SqHLa3Vz6++h+gUZyl5iUD48XmRAIVIiJuc1HSv0Wq6xN?=
 =?us-ascii?Q?b4bzaqFTBou4G546T4YhwZDkO+x6i8nmZPQbayasWhrfwhRIGjAbr/xhNUGo?=
 =?us-ascii?Q?IhPZICw7c5YHHmAvlLgB9slYQsurfsRnvNzUXrpTHFzc6gTwofz7TxwtBObX?=
 =?us-ascii?Q?Nr4sUnltcCOjVZpl7KYxzR7o0lhlZb7LtHcFUru9RV37sorvCg4B26SkFY86?=
 =?us-ascii?Q?EPa9+UmsaJX5OcMGb56qHKh50at/6YLEujRpYobDEWuoAivB2yik8yD68ghz?=
 =?us-ascii?Q?qkHaE0tZ0ZKMkfiYAgMb1xwu+hqxSI6HtppS3Y2NXfWC6siYoiQqVN/DXCKN?=
 =?us-ascii?Q?Y+FVLwBj6dE3DiKJlN3dghNLX0dm+IssJuTTMMtitm9Z6/S63QaXt+rA6DJn?=
 =?us-ascii?Q?bdJIQGAYgF5VWcLVGu0yaGe61fi4BBVmF889x+nm2pYFcIwwMVuBvTHjvzam?=
 =?us-ascii?Q?ZCs5UvbLfK1h3yfjvcdJ2NrvkZ9NQcF2ycmnKbkIQJ6Dfo5JRYFbB847MXfc?=
 =?us-ascii?Q?8hUKkzk4isY9nsID65PXkCNxJK6JE9wUPPk2VPmJzoCNJdaDCQtUw+1Z4gWb?=
 =?us-ascii?Q?5fyIALMplH0YxdBJHdjs0r7dA4zXGOmaZ3TOOsLni0+I01CpRjx0jc8ae3bV?=
 =?us-ascii?Q?k8432gYxurOOtxacYR44WID2d9ulSH+ZlmNfT/B2cQTkLEUsGOiOlZ/a8SA5?=
 =?us-ascii?Q?qcOJi7qiAQWSER1ckQyoUM2gxpgD28TX9CJGZZI+CyXmsQMEph+oMQFb9DuE?=
 =?us-ascii?Q?Wox3Q+ye2nAsYWNWiPo35e1b8JavI2u+p509uX1jetgLObRD3KFR7gvssB0m?=
 =?us-ascii?Q?ZsJc/XfZOTK3tCtds4hCrEIfawlalbBrulP8oy8wiPfPOBxpXcbqTpXGSd4O?=
 =?us-ascii?Q?jqTmWXDedH97fsPd17q3/0e6YcXkrdE/73rqTLR2qLHCsRneqnkJd4Yc6Jxs?=
 =?us-ascii?Q?YRXVdAE3OSSNigJhqorxgLc8xtH45sGoprlSYbnED3diu6uYJB16InAQv7Gp?=
 =?us-ascii?Q?NmaO6u/1EUqhQUDbYTiLDFcBIvddxIckdtBgOkmv0DRFAw5+VX+w9GbR+qZ/?=
 =?us-ascii?Q?r0TDn+WWkmcmiNiY9neGEgILNLzgndR/yJDHKWeeCAUsfW4Ta3InQg/RAX0v?=
 =?us-ascii?Q?x4PQpjyGEm9QX8O9AH50XVN0d5UAzjirYhcsOTglPzm0hbNY6smRNtvweChO?=
 =?us-ascii?Q?M40hZBABoMKvtr2BVFSy+A148FAtVCZGAQ1OTPXp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1274af-a193-43b1-d679-08db1d4b0093
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 07:26:57.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ynk88Q6F88jPwGge9xJ+xISfZH+d4WyPaD5TtxA053dFgqGQmpq7ferg86XAbzgMdvaRNF7S/6z/svqDbNTMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
X-Proofpoint-ORIG-GUID: YYM29I8lXxLhPBETj3Z4MMLaj7pQ9j_2
X-Proofpoint-GUID: YYM29I8lXxLhPBETj3Z4MMLaj7pQ9j_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-04_14,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=730 phishscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303050061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 07:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101382

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version frr
INFO: Current version: 8.4.2
INFO: Latest version: 9.0
INFO: Latest version's commit: 16c38045b1a84f899da473398779cc593d82d2bd

Version 9.0 is a development tag[1].

After the patch:
$ devtool latest-version frr
INFO: Current version: 8.4.2
INFO: Latest version: 8.4.2
INFO: Latest version's commit: 9e25d07412e92bdcd1f69c4755dc7564b23023c0

[1] https://github.com/FRRouting/frr/tags

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr_8.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
index 2cbcbb3ce..e5082e2e6 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
@@ -16,6 +16,8 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.4 \
 
 SRCREV = "62ac43de9f3bc470586cf4f51fadf013bf542b32"
 
+UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
+
 S = "${WORKDIR}/git"
 
 # Due to libyang not supported on these arches:
-- 
2.25.1


