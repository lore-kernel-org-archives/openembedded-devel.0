Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C09107529C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7483.1773914173058019670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X7joX/E2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5n2gs2534518
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=cAefDlI4gX3Z7FKSd0CxTgToPi6umRjLBUFNOrM6G2g=; b=X7joX/E2IBF0
	onlR2LlaD1B6L8nEHXXH0LgXqzpEKBUn5JJDw8YuqtZxEm6G4I6wT+3g0xdjbeBc
	xg37CoLHqwX8rQoWQjpzABnI2MSuvZGoyvKP86gyXaS/m8W1vkO2XCDjDEyF5ojN
	8bCgMNBpOZFqvIHDjQITSpVLMv0BsvUA7YF3a2W9/E/6IUCslRjw41KA1bhRhCp+
	SDWPgaH88wJMY3v0mWjvC5woLi1Y0pRO3khkA8mr6Z7RjVGT0b7KL8eqgxKca4IF
	32Wc0+pCaFj7hURU6jLHykRretmgQkGFPr24sFtBnmEFITxIvDYFld1+Iq4CXaxH
	9AmuEBuyvg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dwy47-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvgPbfPdqry+S74fUR8uLd5wzc6CSyXE+RqjjAk7N+yCQ//moBW60qnOuTIj/Ivh9o5z3U4N8ut8z+sh+b+Xo8TiBPgXgFL6TgGt9+79Lbb6UH2mH6bEMq7pJcaz3/Loe0rJAe5UCGHTtjETVg7QtA9Z1QFqhjudxQ3Ibw+RKdjgvalJGF/WRmZxCVJqvgSvQ24uFXUi3UyDA5FeclH5fIQNIm8tFhE8Ox/OseDLezMjtBcBBZlawAhFYLMS1iGWIt+b1HB5Ycg0f0hpqCIZUkYCsx+qwI7cBTjOMBDH0EnJ/80ZNsCbZSidCeU0QGUvlj1IwW9nEEO396v1plfUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAefDlI4gX3Z7FKSd0CxTgToPi6umRjLBUFNOrM6G2g=;
 b=j1H8yQVTRQ8QSHGjuNeRdMF74jd7W+xAaf5RWO/lh8FD7kCP0hZFvryzzOMCDTlTpB2q2miKnpVAwpRRfk4xmus5TirOmAJ4m7YnMZdKM2UdeFb4jNkyZNVmgNsITV0SMrSd/nRHpFWGe+WYgfWC0Pv4jnucrLpdYk9NYa6kGDJrGUgQ5Yr2AEM9frlF/v8+Ec5S71UenJr0E7b5mMxXXGNwNinI6jtpM2qHkfDR5yWRnMIeivM8rBx5TNUyMTE4XREU6aE4+i3b5eW8NpWC41NRAOyowsculkP+GMZzy7iMmHFXzCRvZKDowC2Fj9NmDOw0nLK+54dxLdjgPyMbqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:11 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:10 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 9/9] xfce4-whiskermenu-plugin: upgrade 2.10.0 -> 2.10.1
Date: Thu, 19 Mar 2026 17:55:47 +0800
Message-ID: <20260319095547.3614749-9-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3cb804-1308-4702-b960-08de859dbfbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	y5IErjTvt75geKRbMJLkCHnJbhUNuag82TmHgFdVL4Lt2++AC/kvs+dJbhOHUKxLs09kbm0YAW6CmxcFkH84yjAEoofZW6tBH4Wz7G4cKQ47ERz1v0fImadSGjKy+7VgdBh9R2+MV9S74Ts1SF5sdo+L1NOHe9AEI0lHwb6odBDlaFZF3setdAmzHjhH7Go++rjHZBXeRo7dy27al5m/D3yAdTV90shAGstee2F6C0bKlj1SQ+p3Vtlpah0+vaczt4epKAIcaQXSUxowyK6qhVaMdjHsF93LqacO9SBhBMepr8wXJKhHZzEsPbKmVhYpXoqDt2inJDgHRhZSEFQgVUQRoOtgQ6/bH3ah6OlZ9MQL+UyWYNPV4PKNFt6rU0pnrciNyM6XJMLzoVPsurIT7TpjSF5phnLN7dcFfUXnTLkSW9ijdAnofgAixVa8SZT4dC+rlfoeschKhiv5YTySXwrvf9azbzgEBjwB+ieI34EIXCNHRmdbKKqUM1ladvMqWAmaQ/UXvCSkUr8QGQxP1X+ODM2166yI6EVdzG3KIY0nkatznSQaTy7ETyRdEPyOUe57NnjfKKcnSbqpEVfgpGWh+XAFfYE7CuS0Dd3d9YGiu9u+c5PZCgJYJzPW99pWRdELXP3qSy+ysbG6RlL01B0MV3tH63bk7pnUcVlA6KhLdz5+MUvS7U9TKOeRDuJpaUzS/oMW5mq20K6Qi3HZuR/nLE/Tzh3J/V7LoWBr+jGYoRs5CZSVPGAkVfE6kzatPVkygbPGKfVU234OElzWt23pfmTj3mMo0DSt1aPymiY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h4arr6eqvWezYKSamekbBTzsfZtID9KVpXCIybt84bcHVvHwfSux/OwQevyx?=
 =?us-ascii?Q?zrGG766Ju8FQLqyWU8XY2bga4nIs8bRpLvkqM679fg/ndjBJ0RHQAbwh+pk5?=
 =?us-ascii?Q?dXkdO0onDiN1nmW3j1ItuDDP0SPfKL1AztOKyNgC+MSde0xb6xUJMkVghKjN?=
 =?us-ascii?Q?IdgDZrYSgC10ultRCXpyo3bqN2BlJ8BHqrNYpe6zBciwncjBrlm91vt1wFJt?=
 =?us-ascii?Q?i7OO7L34tWaWf3KLAKfyR2O6aUlTKkvrTxOLdskfX2rfTboUymieXkQYKZqm?=
 =?us-ascii?Q?SmWXJ1496tMNTHPwKU6QL2tgIiAdse7bfht3PRBqPO8oHW2T/yGV4Ht1YJA2?=
 =?us-ascii?Q?oeIR2u+7csZVp+n6Fc8xG1OqQPNRkV/MYFkB7dYFbLijmBDRBzFF6pSA4a7d?=
 =?us-ascii?Q?g2a9b8m88u4MiYgtZIlQ1wb2ZyJfqgbm9nn1/sq7BxwWG+IMyHBRa+NnRi1w?=
 =?us-ascii?Q?MgJ+WVr6v5+CMNZpr6kyu2aKzTWBkws8ZkaRe6tNYcSbQEYc/IylOvMKYoam?=
 =?us-ascii?Q?L702mipdyL0JUh60AtpxYIvLBR1nF1V8oYplNB3zJYNkDqmZAy6DRdGZal+l?=
 =?us-ascii?Q?e74J9E5qcReGC8FpULmLghbAlesHBBUNuqBiR7KsP7qaoGamlZsq7KqZIsOu?=
 =?us-ascii?Q?98/uWSO4jpJdbcQNrFdktcB+FQc+yRkLdAJmXe8Vg7GBgtnb2i7+16Y327Cd?=
 =?us-ascii?Q?FPraMlf9ZpkZjhUfY8Gb5rPIPnlLuhN+9KQ5QfOKi9Vx5Wy+EPQOgb+4Xa0a?=
 =?us-ascii?Q?9i20aUDzGiJxF0MEvYGUsPkwflyE6ejnd9mpGIhGGVT5sb9usHyt0JTbzhNL?=
 =?us-ascii?Q?3/BaGPK9UE1tLWgyUc2ZiHfzR+aG9Be6JE0scUFUo+gJ/I8ds7QkBkcmyeRe?=
 =?us-ascii?Q?3fKxz68ipDF271XLDf5QAOdJnLpRGOfVwbwCzo7mSKpuVYtLvRhPKqXO7XhX?=
 =?us-ascii?Q?/UlbbNc9U8WzEfFxuHwKIVjFL8qRO687Yo+EVsJg+vSSqKU86A22cqLdPaTm?=
 =?us-ascii?Q?Uk+FplTsosYqZJOB1CxK/Z3372H7EoGBYyo9ltb8wHVp5RMe/toQP7BTyhjV?=
 =?us-ascii?Q?Rs5Dahqv6E7yATyPiSJgUDMcqyd0IdqudYvsKVHpYYdlYwudILjDN8+wejiG?=
 =?us-ascii?Q?ZmnLxIuqvHxl0BlKZnoJ+AEksJMO2oa6so8Skc+r62rLRPVuBEltNpDheTuU?=
 =?us-ascii?Q?J3UbcPAc5yxEAglT2P+bBnI14Eu63qG/l+ouj0hweyFmeMSXRaVVE5ONXIgw?=
 =?us-ascii?Q?anCeKIiieXucluHCG2ocbbW1gF0hz1WQReeGwCrw59KR41TzChemShGG+yxi?=
 =?us-ascii?Q?v7xTQouqQ5RHDJ5NbFFg5kEQzA7OKdcCfKql8sPXCH99/K/fOP3fRoLOlbpw?=
 =?us-ascii?Q?wZXvw7gp2PiFUXm90PfnM26AJ5ohMbDR1atSsvm7WtdRNVCFl78DcAMRy3Sh?=
 =?us-ascii?Q?FtkYetj2y45F1whIoolGTDW5Bnu+xpOecNe6VfhIfZy+QcD35qSxxuG41Bq0?=
 =?us-ascii?Q?D+XkSsF9SSg8d79l6HmjTjXw0a8hR2B9ZEPhgufcTbqHfOWgqNYnsr9jww8j?=
 =?us-ascii?Q?LmcVka562y5L3Y5eWU9+vxLG5S4Bb8r32Y7yswjt7kOb51REoSuoD5q/RTjM?=
 =?us-ascii?Q?+pUaudnk1ibAI309VhOfgUZMijMcjsXAOdjPsznHs94wJn4h774MojBfge5e?=
 =?us-ascii?Q?USqLQIfp+HV4RSv444tOMLpTo+N9V1pSzXM6mZuYzr1G1ME6xTcfCeazPJzU?=
 =?us-ascii?Q?YaShnbpwadgxpRpWrq08ygMhmQi7uZw=3D?=
X-Exchange-RoutingPolicyChecked: 
	eXorSKqdEhN08a3Q6eLf8QLoJCwEIgaCXJnHKYskWzu/jMZRV/TtS/sqv+J455d03nZBqMD68v6mnu7DHKO1IMdtn1zl96+YjF4v0qutafZxhxnoPa1yC1ekDhLiULrQyuFQtZ/eiochFrbzGiie8ispUwTICRVwHNU6TR6ZzeKvPfYembK2Gmcjnsl7ReQeYrevrJl4x/mqMxEzXYfikuNW8QaJgMj+ns90mRP6zksKeOlnWPDxMc8/tB5auZ5iDhTilPshe190igB7vckdil92lGnHfYUJ1a0kN7MEK/BsOAVjim6iBZ5obq8tXczhjjnaRKEnlr33n0SmihNSGw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3cb804-1308-4702-b960-08de859dbfbd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:10.8592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+rl6SWR1PVv+mo1uqehyc6nIbc6hjJo40Sj2rrq9k1gvu6KsG/ZVF70gpUjUZw+fcaH3fDOPm3SjDnjxfCXmCxav/JfOEBG1/zUCgSOGp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69bbc83c cx=c_pps
 a=AQ8jqBFaYtg5UXnSSWtk/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=jjCQjaAe0ch43EaMaqcA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX1Z7bqWXW8Uu7
 PUa7yWf0SQBrmFqigfVWa06RBFoTL4ytBMRxm1HIHi3lEwst0XMsy4HrF+QPzdIW1FreJisiqFu
 MCyQaBE/X0CuXpwCi7QzMwVDOQ2QVpMXQULP4jfNxHEtH6ucVhGIDH8YAGuh9eDL+xeCjZclZCS
 eNp/22+qABVM+SrT4aXy7nzelo2nzvJzi6s/rkLmMY9fST6ujQUqP8IFyulrVO/3dgF5xuLpIC4
 kcxP4jCvMp6oCxGVdYse07/ZpXloY5ZmQpVEe2ZxLH+e2nA2YRIii603K4K/t3ZpRwp8UqgOOoq
 OmF2XH31Rw8t/xB8/9nkr1Wu9y3XfL7VKM1uBOOcvnz4mlToUc/CpeyvOh/6PutMQ5dQs5jQFso
 G0DBU6y/FQCAjzKOqZJ03mORPHRXH1XiYzxFNbdNh6w+zvBEAZrcDnRY7CRQLoGESob1XjK4t67
 li8jF4ZpiDs6525v9iQ==
X-Proofpoint-ORIG-GUID: FxGMluPmF0WDUm0lqXWyUIBI4ysvM4XD
X-Proofpoint-GUID: FxGMluPmF0WDUm0lqXWyUIBI4ysvM4XD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125391

From: Zhang Peng <peng.zhang1.cn@windriver.com>

2.10.1
======
- Fix meson to make minsize an optimized build
- Bring settings dialog to front if already shown
- Translation Updates:
  Asturian, Esperanto, Georgian, Kazakh, Korean, Occitan (post 1500),
  Slovenian, Spanish, Thai

https://gitlab.xfce.org/panel-plugins/xfce4-whiskermenu-plugin/-/tags/xfce4-whiskermenu-plugin-2.10.1

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...menu-plugin_2.10.0.bb => xfce4-whiskermenu-plugin_2.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.10.0.bb => xfce4-whiskermenu-plugin_2.10.1.bb} (77%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.0.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.1.bb
similarity index 77%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.0.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.1.bb
index 59f4bc9203..6d17c7596a 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.0.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.1.bb
@@ -8,4 +8,4 @@ XFCEBASEBUILDCLASS = "meson"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[sha256sum] = "c2efb3782816d44d421dcbee2900b9513bdb2469b695b776641f495601f33a10"
+SRC_URI[sha256sum] = "8b5a777a5d9df1f1c39b109ba8b2d045cb2cc02c41a9a297aa00dcb2a4520530"
-- 
2.50.0


