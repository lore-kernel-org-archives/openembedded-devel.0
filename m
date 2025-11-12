Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF7DCCF9E3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15441.1762959271034675103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lRU8I5k5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC53dYT3492130
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=D0KSczj5YiFPBlcgHP0jRQheqZMGqtuh199YLggAqkk=; b=lRU8I5k5bLIA
	j2Ilhy2gWw8Zvis7zyy0YUZalDjJJvhdCmJzIJjDn8IZDmCqdnM5jiIKTnegYuVf
	pfAZoRAI2ELWva9wwexd1Hx+pGJGlzZU6CEYZLiAhA7IeS456sRaJVBWfIVrwlmw
	tLPnp6i5h5UfnTZ9Q8v3SLWHKTc3qbwJrjh5z4TaHwP7hzPHhvUf7jb6SHZjJibE
	+ntRl9/N463E5IfkqFNKMmw+ztjV6K+9BJ30oUXqW4rquUvZB67DvAUp9ClbLVb5
	p0969PqtOhyRPe3ErBjgjMycR5QsHPoc6TUFC6u69urXSjrkcKqUGwaz0mqRGStn
	kl79pI6lVw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fvx-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBTYLdjD6CDg1NHdJZdXhp/nc080REFrKfVSSjYpHmSajgMmpj4Rer2IiZOjXzInbZtIuoE2VlmC9BG2oOAEPXgr4FuhVt/pH7SHoRB3U+PTtGRuRvoxEULznGt1bfbRELGFDdCNOBKUCYxsd6QyyStoFAD7etIk/qUFNngilfwWkLtQVeMnHCrtIsuHaA3pGzuKvaMeX6YPhMM2XDOo0Ckomgzm5weHYAYDCa6Yr/zODCkwqXo6PHs2H5K2ghCrPxRkVvSrXsH8FVtmYFERA9V1GAl4L7VouoJ/6mNx5S330PSogqEMOPy6ND8ijwyJn1WADtMNIlCM4/ghgoy6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0KSczj5YiFPBlcgHP0jRQheqZMGqtuh199YLggAqkk=;
 b=j3qkWML/7SDe60GXRDw21hdgD5te93VEn4XYfw/hxggoQmZNmrXIZ7j3XUF/joKc7T6d4/yEiFxNYA2tIsb2iY76Df2HzDKjM0kHoKlYJQcRY+jnDKH3J8NyAF4etdvBuyuDyPJLlTEOTJaJxRMLXBkdjRIm8Zk8WPeFICwDdJaYlamy8uJmuD9ousk2Ock5ACQrdoiuUjM9ONlvDmPi7TK+pr9qLV9fuUTcRHaLyvNhbQW+D4JhDJHvOgJpxJIcZ6A6vASR6xAwKWU353p+0roDYfGF+hkis9RSN4RzMcGodMU0Y0Ry+3+XqTYs/npGisoDT7knYA+6Leiegss9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:25 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/11] python3-pytest-mock: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:53 +0800
Message-Id: <20251112145357.3788595-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112145357.3788595-1-yi.zhao@windriver.com>
References: <20251112145357.3788595-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b20647-d2de-4421-53fa-08de21fb5f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YFFQwvFzRpaCo3LLVNlrp6oV3Qr0gDjaa+gGAjS0xIkGXK2rqSJj15NrptoX?=
 =?us-ascii?Q?KzYmo20PPXKHaVkDpyZ+nCc9vRH3Ui1pwudt+Jcz1HjwDK3ypWyTkas+4XtS?=
 =?us-ascii?Q?4EktxPbRTDmez/ne+5qIpaq0U/XvUS5b3IcO2ZOsJmSuBvbgHlFjSil5177w?=
 =?us-ascii?Q?gjRsLj3mpEOwBELDHEOSWExM/M8Ta2Da+Wgt58tAoHoBDBMSfyH81pXnOAKT?=
 =?us-ascii?Q?3wQYduNANNhtVckXrhgFik/k8dX4vc2CtWKI80ZHVEIPzM6aNxzm9KFEsCX4?=
 =?us-ascii?Q?xYTDq9yUkxaPF06c5K7ONhNZCvy9WWwJJ6LhphhMiwbwYCbaGl5jp8hyQzLh?=
 =?us-ascii?Q?/4W7zJ5q9zNOlJoYdVteCbqesL5cM5XA2CqKaa4UJkurUJ9hABkqSEnjIrCS?=
 =?us-ascii?Q?Sm98I3wGSklPJk3CcsFyyj0nm84x+zAQiNlg+oEA9578c0Lmyu3blJzM3R96?=
 =?us-ascii?Q?LFsBiD9sC8Umx1UXhgZjL9OdwlSilhgoPoh/oXGGtyy4aqC4j3Nxe5peg8Na?=
 =?us-ascii?Q?rSc7gZmEtaWkxHXccTLAgvC2Ipz9it5dla967/51BfTrCNQSmVQcS6HwxlD/?=
 =?us-ascii?Q?xzjc77b4nzTfWvL6ENIA1q+OnN87njgY5mOOPVEcGfHJlqeGH/TbAGStCVgV?=
 =?us-ascii?Q?kEVUtU8uAXRgodP8YO+WeGGUNHOGl1Qz7EJgD+kGUNyzqwtEjw3h9PEwYIa1?=
 =?us-ascii?Q?Q6f3yr+8hF1RMYma7wevRnaKffXdpBt86YoqNfpM6iBo+jjn21W2mFXaTYuZ?=
 =?us-ascii?Q?8qkW703Oosp2DL4XgFPu87nrBKsTWJfu2hrR4ekSFaYvROIOjdyAY1L9JdXs?=
 =?us-ascii?Q?3u9w/OVUKhoeJ79RKvf/Q9/vos6WT2b+jbUik4dTU0oMdlZorG83GVrh4O7h?=
 =?us-ascii?Q?mVa40xMcNDQWNg5ndYtKcuTh0x7PtPBNgJzNfd7gb7zFRdMNZr6BBJuyZmU9?=
 =?us-ascii?Q?otUJnkUg76JyeCInCJVDM2TGtYfJbwsk4Yke+3/OGY5eC7kEbJh+J+Dw5N/5?=
 =?us-ascii?Q?SDStFVjc+Y5Xi7/+9sKHIcrnM9IIvNPrtxMltJu3P+X2CivJqxMy3ZNuNZi+?=
 =?us-ascii?Q?mJ0eqwGitQEzqMs8HhcWaR6RNHQZ60IoKzmbgIlzdBB/eHARB/PkKEHdH3le?=
 =?us-ascii?Q?lZwTm4pAw1lGEKK7bwgPGw+Ra/YXRI+DEafk2N0jj0ndwaMrtuErUTxSPJCA?=
 =?us-ascii?Q?e4zzo4ybx/rvimoKZxHMwCB6xW9DXzVCHGRlFHpIPSfu0kPBZdZejTOGQHhC?=
 =?us-ascii?Q?TWeAEWlfhsK3Geuxs9chJKulYai3ypf4lg4UzAAR1INp44EpOaFD3DOVncYY?=
 =?us-ascii?Q?v2W5FYf0YZh89AfV86Hrr1ClS/ChxJ1SslB65HN5nWc8gDso/9crn3sPD1xD?=
 =?us-ascii?Q?ZbtVuksKCLgkC5KbT5nAh6YeQj6asDjtWM9G7fSkuQG+1ikWgfNWiCd/IvjU?=
 =?us-ascii?Q?OYkyklibEf+jNNl8xbToykEIgJaArXshZbLRgZfQn4PCxFG74juaCTxa4k1S?=
 =?us-ascii?Q?iLHruGDFkpGXQUE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HGqy0Brz3xaEYCeHn1Y6aIK9MZ50Dv7XHtuPgup6RzDtwipvexuMht+JmlJL?=
 =?us-ascii?Q?iEIwTRIQUNTYcLpkfmy7PIyhmIbcpNtqigofUfq36+q0mh78QFVvqmQBLlck?=
 =?us-ascii?Q?6UtRikmEP8eYR50OFrPU25WM6M4+Ii5DmeNR2LqMKo1kOla/Oyglj8nwJ7H5?=
 =?us-ascii?Q?I2edAAyo9ELy+7xTH406MVBY9TLO0meaWhIoJPI6BO9higIJraJxpfOkpa1D?=
 =?us-ascii?Q?OUM1IFXyzhpYCEExY4KYWUWea7S4fT9azkJjm4SPX1OaQIHo8CDES/B2DtH0?=
 =?us-ascii?Q?MYSdrGqTm9CWZIIkC8zshySdN5wbvEpqrxn4lhbinrlHGSv9a/vQ//EzzBUR?=
 =?us-ascii?Q?zCcE3KliZeA54MLVBkdi/TB2Qedj0Jo5Ajlu6yE/IpQeYlgZcOS2OOywIOGC?=
 =?us-ascii?Q?8yhKqfCAAnOqCeqZ0O//rO7HutuCOBj2MG620ES51OcOmf7ulwE6fDqSBAM+?=
 =?us-ascii?Q?/gchzse+EotGMnCvtagnaRnKcEJJPYKPIRbcU5S/qIL83vjHQZKUrl9uPqed?=
 =?us-ascii?Q?/pO91lpNfp43EGS6Ho9tWB3R0nqEje/sASmQgHYFIuFvce3eRo5m+YqPqrYi?=
 =?us-ascii?Q?0gEDE6Mbp6D0B4eY6Pe1USpi+4W324gBN9o678V8xE2d430fqCocLfXGvwx+?=
 =?us-ascii?Q?xye1N7zO41p+FKOqVuUKxZ6nxcJgv+xqZj27q9bz9dMfLh76wF0F5Qr71v6N?=
 =?us-ascii?Q?l3tgHDE4J+MsNk0jmxAaxGWs85n5wQJzG0uQrRYSnTvpoUJgXJIwJZiivdUi?=
 =?us-ascii?Q?0ABDUa0I0yhdiKVy62eiF3N74tps6r7ImStdq7spafXc73VzQOvUixga2hXK?=
 =?us-ascii?Q?v8RyL1VQvk1YvJbDkGDgQyFvSKZnYQjfIq/ZtP+TNJ5ML7ZbUVvrITqT+Shr?=
 =?us-ascii?Q?H+DZULnadAm8UHsHK1tGl41o46SNc8Z4Te0yM4msTAoFXaTQxCyIJ72UoTOF?=
 =?us-ascii?Q?Nlpuj3wLp9ppRNGuobucoPY+W0WQ8IdaREzHMSNl5S1kYiTYI0m8cABvXKyq?=
 =?us-ascii?Q?z85bNurIJSR7RlubqJlKM6V0+WKUlhQax/ZlmSXOWnTEZGAvNGShLTBvUy9Q?=
 =?us-ascii?Q?qMUxD67f55qr/LjQg6WtRZtgtmJJ5rHGy3ZXiRKOnarBN7jKdZnFeMWV9TWQ?=
 =?us-ascii?Q?bMB39Q0vYOjC/UIhvJC03sKr43BskkikfjYl+53jG//aGpucHAiO8cPWXZLd?=
 =?us-ascii?Q?YBslPXom7tbYS5rG4wuXrZ9IW6elrF3sNcezjVLvgSbh3cVMQO0izTtO3a2B?=
 =?us-ascii?Q?MVzR+Y1UmnfCu582pt/HasDg0JB4tPzxWlBNcqrRy8YVKfC7bWobnn4LaxJO?=
 =?us-ascii?Q?Ki0U3zuZ0mUDV/yCHBy2wpmp/d7kn9KIPvR1H3YGu2/7apxjW1q/IIHo6LdD?=
 =?us-ascii?Q?5iufZYcQGDYniplEHoaAdhF7yEr6i45/Q9Yf/oqYsX9BCwV2QXghGoTfLa8h?=
 =?us-ascii?Q?8wzR4CzYoe5I6c+sJ4kLBE9JQXUnNJcyS0jcbzXHl1xeLRm/LzXTYujFrxd8?=
 =?us-ascii?Q?b2C4tGMpmKfXoJV7paPtTTiT+y/r0RAuAHkgdbBJNsRNtaFOiKzCRV8/2Ffb?=
 =?us-ascii?Q?jkh+z8vys8FE3vPE0gUztMqARHVkfH0BVrYif4o1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b20647-d2de-4421-53fa-08de21fb5f15
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:25.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIXlcS7/3iRP9ovgUo1O2TH51VKiXmkUpbtjhNBzsZTx3rrEhYuiELdWb6VdjwyU4/7rKzvVdDwtc/2enZvb+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX1FMlAxYxUjXX
 wZ+vIbnH0n1I+q4LRsC/l34HLzAuD0DyIOGTT1+4L++PsU7oIxtxe+vjbAVxmsQIR36xBdk6Q2Z
 Io77JyBY72khiVAyOVo2AHFpumKGrWi+syCUBgUyE83kDLXbayWfhojHvI3eJ768N2/xh+nQ2jK
 beqJnvZ8XT06VnfN7CBIlZqXUGy5NkZffYeFEr/0IQqWKkvyaTM2+sBqdZeAc8lCt/OeOCqoe9U
 uM6cEPk/9TgUYJv73MenQgxdqCbYN8fGJoS1nz3QJZzYC0CfNxuAbP1aXWo98ThyAsh4PRfRCfh
 sv858MirCXOXKCzUsk5UZiXWyHC82JePXNC8xsbWWQQy6C91Q4IDVRskv6rcx28i6CFlvuMZM8k
 ZQodN5v9RJs/hjsANB+i6z+I3eQBaA==
X-Proofpoint-GUID: vEps1HfMnPhxuZQsnYadzl8nJnVTcW2w
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fa6 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=_aMczNPNQZBftk_eqJ8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vEps1HfMnPhxuZQsnYadzl8nJnVTcW2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121555

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-mock
INFO: Current version: 3.14.1
INFO: Latest version: 3.14.0

After the patch:
$ devtool latest-version python3-pytest-mock
INFO: Current version: 3.14.1
INFO: Latest version: 3.15.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-mock_3.14.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
index f107e20ff5..134459aaf1 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
@@ -11,6 +11,8 @@ SRC_URI += " \
 "
 SRC_URI[sha256sum] = "159e9edac4c451ce77a5cdb9fc5d1100708d2dd4ba3c3df572f14097351af80e"
 
+UPSTREAM_CHECK_REGEX = "pytest_mock-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi python_setuptools_build_meta ptest
 
 PYPI_PACKAGE = "pytest_mock"
-- 
2.34.1


