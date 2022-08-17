Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B879FC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.29961.1660748980175236437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eedSYqrB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HCuEpJ027654
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=WuXCO/cqO8FTwSj8Sjg6e4wneGqu50hWCb+ROICorsE=;
 b=eedSYqrB11coI901hjfyMUfZZLWHNpqtLrdw93iXa5d2qbgQa9j+9rbFj8+Af2lGVq7R
 vZv/MyKJIK+hQptXcuamT72awVq/3cNz4CB/tvlqd4b3i/QzfE2cPkYTZ4fseZPZIWLT
 FpQO/4yYz8sqWZFdbvWxKvydSyCAsj0jA0KXjgPWdT9CFqDIULpjhB9sdxi6DAh1wfts
 T/Z+cGKxzB2D+W9OZZT527j9DKPfoNVj2AvgRV++KJDH1G5p1uNuzp2fisGfEjlLEN2P
 TCliK5F3TiFdTAs8aLLlle8KzuW9eN7wHrtQ/RNjzerSnSbe2yJE9M0dHTy9ZgTCgHRm 8w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160uk4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:39 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF2U0c012695
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160uk4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 15:09:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Udv3xGVwDKA7JEwWXrShPO20jcrbZCNkEROqbTRuGHtTAGemAjbLA5FCqSKlVbQi7ZULhDuFqxD5+1JwbKH9C5JKs4Agk0hYgOqgf9sZrMGafRymEEGXsB67PTaW3cdrbn/tz5BftgwuGEvta4kBL6TK5iEUxYGfTdsKSXPagEa9L43h8GO/EUi51ssKFN4LAWMI+6esiFGlpEZerzk96GNKLikL3WaMPFUk6SnVv7Fun68pWYOYQHhA9KPXPUpBLSUqM+SvOoj5hr6xDwnP3qCMCncZtnh7nEw9GtTSKlxB40RnZZCQNpNJtUm6V4xI/IIBEvek5HtVRUOkk+1sIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuXCO/cqO8FTwSj8Sjg6e4wneGqu50hWCb+ROICorsE=;
 b=IqpmFk/Cmh4H2p5GI/TSaBszV00OoOFRHOisHjRmqrpDRF81L9fNI7XNbNh/hSQITZc8n3Tj4CLafRQ3dapiOIASGTH3Vx4h+oU3cRG3ZjBbIeQ+H5iHxi8EPNyykyvyDiXWMFGNOekcSfwp8c0AHZljTJatO61m+YecKl0MrRclyOVs+0Lr838joxW/HDyxvKJFWQDp3siYaOqLa+mz9UAzdg8wRjq4rHaiqQzGBJd7YOZoZYg44q/wscYBsn/GC+pXWYjJ2En9AiY96ojxjoTz5lG+kBnFw9CsXpIyn/OlKCA9IXjJ4K+IfxxfGm5AYk2baKVkrx4k9WuzLrkPzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:35 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:35 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 09/10] libproc-waitstat-perl: Fix LICENSE
 string
Date: Wed, 17 Aug 2022 08:08:52 -0700
Message-Id: <20220817150853.2823101-10-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eb01455-ea19-4dac-7431-08da80627245
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dqY7JOjTy1jluTwAwRn77U8Od1EsTO9ahg1T0tAzH8nOKJyOYNjCj8ikuTn/PQzPdyhO32+X3Feg13xOLVLknM8WJkhPx4Tltc1lNlRzkd01Kc2vO52v0Dwy4FlW/lMqEgHSVPbQX0wlXY3lk0oP4RMozwPkY/4Olo+mk/EvjqMEhJqdXnunAo41juL19zMcSbBdm6PdjvVXCB3m8n8LmARY3iZPNCZZp7f7w9dI+RK03r8Ny3+C/ehBf5ZP6vMQMuDlGXVvtkI9DJSiSW988DoRE1gXShJAqxyNDt3pryD3mhgPGEpeYmIUsg+1wh4uZ2ZVlezOy+dePHJNsBwoWrzvBHBHZYfxfiopldvPPz5uGVKgSny7hnDiuZ8zDRfMl9oUJ4JxHvR6UFSn2M4a9SvLESA5/qnapB20g7svcjoRnCaJpGy+CFO57wd4kNzZbGIfTqrDKW+2yNi369ySnXhjx+rzfzXPVlj1BItFhKbJxCrhbPNcWNL25S/V+qpYfECzeXpf6gLYc/g0cUwCYhlLMHwmJEnKy5O4l/FO1Dqyixo08k84EU5Hhfmltkl+UHwvYBZ1RVfRty/E39qjBk8L3/lLggOZtX7hyC3c0oC7Ep1eMSGOGwZMdB2fyYmQt/jDucwtE01pYq2hoiy/QHYyn4qo3nodQOhIqSUvK956/RcDLwYKzuMaK0EywN3+0CDqYcwoWqE6TaceLC1DZOlNVgPvgJN/LD/a4JoDQg55OEI0IOC+k3jplf9gXDDNnNqcoXce8niULJ46gyrYk+BMM2vfoRcqCBmF3qADh6SYdElhfgXGgD+v4rxNF0hx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ll8EVec1lBSa7vup7JoOvxbyCTw/93vUaTDF0VGEa+S2L8/vERsKK2GZ1Zw5?=
 =?us-ascii?Q?B8RsSk5/G8mffjBtN+VfJNqI6Opj1FVXeNqOaP7zDvUguKNXrtk1WK/4A930?=
 =?us-ascii?Q?nbpKmzFXBNwSMXxV4o3O53aAxSNAc/t8dIPkPNCAWf1F8CNa4JDQ1NnQJtii?=
 =?us-ascii?Q?98uTKQ0oHt2vwzt7lmM3yiEFlygKUGUP8u4Fb64TG44JbD+AoRWrD3C8um8X?=
 =?us-ascii?Q?xiruehWP1tPnCBOYkIyzNrxnlEVyKLmQPhrJJKfWOWA2aXsqFWytXMEGX8Mx?=
 =?us-ascii?Q?1ahuTUlyesKD8pOhw0Eas0odG87J0gpftiJN60hvmrrEFQiYU9/w+GUsBa8f?=
 =?us-ascii?Q?FzasBWwvlFb8JyOEbyKNYB9ec9JwgEJGItbKk+MlHd3+TVU3LG4LoGID5Sq+?=
 =?us-ascii?Q?5FCITcqdR6cSy7wxlN3fByVuG04li/qEqtaTmQ4l4zNdrKaQNBy+EGAwNA9j?=
 =?us-ascii?Q?dIVHIvrZWeMNemmbeGn2JqAdmaICq3RRORLECgp/9omBYcIV48e/iTvwOb4p?=
 =?us-ascii?Q?+ca994V+jd4t9UGI4AprWaZB6Jdch+l/TjUXwbwi1xETzCTzZzmAgcKD7EsQ?=
 =?us-ascii?Q?TKDV5sp/g81lmVTjtzaTJE+GbPHL4l0GpuYdAgXDDZJm6qkOtSG8dCSXkeo8?=
 =?us-ascii?Q?g0i79hRcdJ+9lkh5MUW9CGxVXgI00dj10ttCno7uw6Zc2dGQ73WY5Y+iodbh?=
 =?us-ascii?Q?+o1Kutt/Ygrf3MoNL/xJxfAwp5u1zHOaD1FtkgMViZnBMqPLA+rk0W+qWxxN?=
 =?us-ascii?Q?hy7MbkU/ASR8bl/jsjxxoJrl5PZkh0WEGTk75ifnC3Xb7333jqi1xbPigVW2?=
 =?us-ascii?Q?5xQI0F8xfVxSq8bb9H0hhHX4UN0T8nVFs6LCVaKEfiRdoWlqLvVYG3M2/sme?=
 =?us-ascii?Q?jDcD98eCd9kD2cJrSfWo9/4Du1DR4hh9v3HQ4Tv8lwL/BiSYGbZWYTR2IJ/0?=
 =?us-ascii?Q?Yzq74jzOqoBOC1G7z7pr0oWBfqvOwkkPpNlbVOcbIt+/U++fCuY0ccG4mcdt?=
 =?us-ascii?Q?X88/uWk5I7EATL7tqDXqn/jW6b6WG1tfLiIYeQinb6nlJf5j/BPU7cqKXImS?=
 =?us-ascii?Q?mEV0hXuuRG2X6WgWUo//0J2XogW7fUz8wJVbK0yRUd0pVUl9dY+YEy42BaTK?=
 =?us-ascii?Q?NPn7JS/1fdLcfWptNqMpk8Qua6CKwc/TKZ8+bSpmUb+Hkx3Uze54IHNRrC7d?=
 =?us-ascii?Q?P/0H2Fk5w3M8yGQYn9lUlxKY9WxaSZiHqKZdI7PHo8IpAJSZwKhrznSkLU2A?=
 =?us-ascii?Q?tAV8KxCN1Gn65d29swpF+7S3FP2bZJxFZ5pqUeC313ZPKpcHO+dWY/I7qTq3?=
 =?us-ascii?Q?CnrzXmpNYsSnI9zOiMDpN8VU8AnWvb6cn6DfcxxzJvEp5mLp5q/FDiZ8FkX5?=
 =?us-ascii?Q?FFlXWrIdFtSplQSRPaygg9aByHXDSqwO24VTbr88Big62zfWUKkzpoFBXNbv?=
 =?us-ascii?Q?FGaExpyPi6zA6V5jR4dKvWqt716rd03WsbBElxa0Vqr4L7OVd2qAqUbbui9Z?=
 =?us-ascii?Q?RyQMWsqYZmDFr0s6HJq16zyyyF5s7IQLy3wJ5MKHGOaCeiEsrV5pjsS1Jfy2?=
 =?us-ascii?Q?m9HTIGNQ4cJ7AaLCf5rpt+wg7NlzDKdhdHDmsnnjHqeHJ2YwUNf2R8DE2aGL?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1eb01455-ea19-4dac-7431-08da80627245
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:14.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Iwuh/fu2vYDuOZupJf/2L95H0huPfrxBBI1tqowpyMZDsaRjI+D5RcceKJz6Lxsv7A6UzxM9WA9BNZA9nhBZvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-ORIG-GUID: FOWMS1NZ0w3QJ0iDPpr6l_DQ8VAyyI11
X-Proofpoint-GUID: zypssoOQKRZedrSzElt09NJtPlGBizcU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98304

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
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
2.25.1


