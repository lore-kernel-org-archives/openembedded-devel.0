Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECC3C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 01:36:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.36186.1665970580162009852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 18:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=REiQAuHw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72894685da=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29H1LxWp022161
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 01:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ue1Fb0pFf1wr7ozGN3V+7YG5ufeT+8xqnU42cKI3aQI=;
 b=REiQAuHw4QBD0p3Gqg8s/bxgKF1DCmyOAa5mhqHnbGDayIv7O6Fipv/go9QQtgtqB8Ce
 t7m1zt2SeoIyuoBeDUQu3d/J/GghUbHsDOptwVEJGkkVxfvCpTrGzMh8/CYa5uUJUrvm
 RgBRwkS/2/1C5th3RsDt5OoyUtRyDEFYQmDP2i/unS7JNNsPYbJviq79kerFkcGSxXJs
 BfLnkGqOyLZ0/sIWgxkO+osRyjyXyQQg/ARlYktrNa2aPsPGKOl7awUxHkmmCWN0sbSl
 AUNMFfeaR0RnVRqkMHxGhIefnSD6KGSidDZwu5dpyJP91HhuD0kM7dCgDT3vRrc0814F Sg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku997j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 01:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QX21RJpG65tNWXzbwKmfnmw+JxcJzFpqy8R/uxo4/r0CPLrOLQ7E1sgye+7BpiXHTCJhUWS5bRXXSB7C5Ujie0rJbstZkQN4f6hT+OJ+w/iNqXIJWHoIAatnHhDt5NT+HPdQH6XemsqMvF8M+hT46gkwkk5ZtRqpSDm41aoq0Dhcfuu/JG9Z1Nkm/HXeIGqEZYXtR/IaQsIirnmT2lz3ki1uc8lXhaeNGWL10QXptTm6qUsECUwASiTGHtcRGuC2HQ8HkNn7PY3vgFKb9+aXs+6qYYYsYuWGVOg6tm8rgeui3n3cM6Dgeasyq6XwrCnR2CaZeWjhQHuOvW1wAzXvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ue1Fb0pFf1wr7ozGN3V+7YG5ufeT+8xqnU42cKI3aQI=;
 b=I0ChTe1PAwXVtberGff5wtF9IO++cEAErLgeXnqe0uwUmZhRvtBWUKxenHnsL8jEIoPTcvVQ+ooDPH1Uq/Ye2mIFGzm+NllrK3D2v05uVikzQJU2Xx+bK0Mx1wBIcnWON5kol+FPia0AU8y/QamLX/cc/QCEJ+gRV9Gy88NbMMdQzZ1dt0/zrbnGxpT+KQRjX+Uh8CdgQmtKc7cqBaZhcpCE00csFtVG70Bn1nupYC+2U9y7b0q93kib+48ofespq76dlX5wyiXFfERljTZUUpJaXTxweuOrAOpyA1r1Dl3XuBBrfxaYArIIzXBZMAqPgWddjPOlmP+TylEQ24skpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 01:36:13 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3941:23f3:dc69:b89c]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3941:23f3:dc69:b89c%4]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 01:36:13 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][kirkstone][PATCH] psplash: delay the psplash service
Date: Mon, 17 Oct 2022 09:36:00 +0800
Message-Id: <20221017013600.2887829-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0150.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::17) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: a1126eb2-5b05-419e-f198-08daafdff9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	koRabbcqocEczVbFzRyUSQqAwE0yQ7FSh5bxjZeF0VQEI53N0zOnuO7bEDHefYr6kS4FTlPc5+Ta3yF8OvbdjZMXb0V2fb+q/tQcEIepIZU+G+A4ulg4HgFMNuepwQ4HMogRFJiWo84P98BKXPjhhQvtdmKOGX+Df/ZRlPAeAb9teux9UYunkf/qCzzTQZi+GtgGrcIs0yvMFL2KKaFBjd+fWYSfsTEXTO898ljwwAUoWsV3wZkZKn2/jbMlEwp89UUluCsN7263KOMBdCGpG4W5Ib2atM5KC0TSweCNWqIRGLxY9SsFoIMiUhmJIduNMkOWNp4zodvqlbT5xHi2jXX7FpZkciv+0e+njkpBRROnCu+CWA7pZHuTrIXhs9eMzOkvrfov/emUdbuHIixVfkDZsXpnNi/o0W+pbi1BO8o/9Ze4JBQ9e6f1kN6NnJiZFUA56p86FDkOmo0vq2OPP9n9t4AHa1nK/x3kRAIOBgLrTjHb9xE4QQsWAaDMxn7fuM5zVUxx+JfeSWhc6RixJXExiwu3FQOYaEspxs10RWrNaitEepil26enf9Ao4/igKTuTqcaNSo/Vx5tg9W925DmKlFuERVbwmCJQBJBJCYLeB9nCM1HSSkAYeBn7hY0xYONRX6kzd56ezaNb/qyJWWyfI3HkdI6mbJP2w95cpS8kvdRC6sa7KtFLVR6cB7eJgPxkrJZoUwT/CTe8RGUALMbXdQdWDC2PfvnMDWkRdUR8UlK9HnFuJhmijVQDxtawZ5lUdVFp5fF4SztaPkUW0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(451199015)(6916009)(4744005)(66556008)(44832011)(8676002)(66476007)(316002)(478600001)(6506007)(41300700001)(52116002)(26005)(6512007)(186003)(2906002)(6486002)(5660300002)(1076003)(2616005)(8936002)(36756003)(6666004)(38100700002)(38350700002)(66946007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vWcP+QA3zWcK1A6LRVD5snLz7IdQMJFjge35NmVWOy+IXJ65VzBY1j1dLNgw?=
 =?us-ascii?Q?nj5hlnjPVMcaqqq/dYgKUB29AgDuhmk7TZqwuWwXNr9sVWJ6FVLLt9tuUuCo?=
 =?us-ascii?Q?kPlQW3U79GNVf7AWHZYdiEySyJYgMFix13dWhE6+TjTwgzwy8ZZvmEkmvVnQ?=
 =?us-ascii?Q?sNubz81LWXJ1ZghRh1NWfr+QX5gxNiGu1I08SbCUId6C8Vxe/Z6mKJuSch84?=
 =?us-ascii?Q?2YmZMBDVEm50dfHHNY6aneoHPhsOe80/3prHk9C/qqxXfavLvAIk1/gSPZr1?=
 =?us-ascii?Q?uhz2PXKKYyuGCO5JQtbF8zVjKjB2v9Ohc72uPcZSigHE4kts1hzVlrvGvboh?=
 =?us-ascii?Q?C84FCgDoD8iEnzVVQddqRooYvumwX+MDTD3ux+yFz3kJjt049GTj3vxAitvW?=
 =?us-ascii?Q?Z/q8Oj5CthBd0o6WrERw4YaMZYrtbrMejkPaTJyqviCpMUJ/d1MQxIrkUEZH?=
 =?us-ascii?Q?o1TeG/xw7Ndztt3M5z7+azr2stFyxIudq5gHZb9xNII1frlTfgl4uAro1BKU?=
 =?us-ascii?Q?U7tMPY5SjmMumtsMJR7EW8JEj/YsU1ru3O72DvcbnCeHLtem1Dn799iv2KHn?=
 =?us-ascii?Q?Z1NUhiXQabcVzvGIc7sJEfsO7w/w1zJ8zhJLIu04AeKhavhoJZ3K6D6Xifzl?=
 =?us-ascii?Q?IrXmTy2VNF45MPMNOtbWMIl3JIiCU2oFC4Ols7aXh9im+Kv+Dbd55cTZrNfc?=
 =?us-ascii?Q?XiF0w3VvmJuBVAmQBKC2h5iEQ73GhbqiN1jXoXxn4mvSsY2/rI2nRl/clJUh?=
 =?us-ascii?Q?8p5GwHTTtQf3BjJfv1Mr+ZCwiYr218ZGrAMuAwC4qXInrmIz8wEhw0O6f+5W?=
 =?us-ascii?Q?OjBiI1ZKjc9vl6/N3Z1BVmitMEUe6/psJDYFOZ2MyR40zvx+QUSZHNZg6KW1?=
 =?us-ascii?Q?ou18sSNtI28s3TOjOozDfzlOoudBUbl7I5CQw/LqyCqe2tCdASq6Tdg4+1yN?=
 =?us-ascii?Q?LUu9IGjiUacar+91wl2O5uSvIKuYTQjAbogH2y8rnMvln492e8h2eQkh3qEm?=
 =?us-ascii?Q?ib4RbIxfKjRlwlOUOHEkX6RY9WPBFp3F2D5+GYLdUKGzX6gN6MkpC37nBIF1?=
 =?us-ascii?Q?691SHE5v4AVVkV/QP3Q3WpGXSWaiPHmCw24bm+pgF4/f3tMU1xgOA1tgC52P?=
 =?us-ascii?Q?HxE4oO9+SLkrqWpqZyRTvVRUBWpL9oIWgrwGziiAzMsfO344h8MQnGg21CJV?=
 =?us-ascii?Q?/aIvAoS7Rm3RedjcRxb4sPCEXG/bcHtrO2WF6qEHJAs/SlYGESsa90pHYqAo?=
 =?us-ascii?Q?rSP3eKZjy0OINm7JA1sb+dHCFMH5kJLz6oso+DK3vqU6AZJSrA3Xtpogs9US?=
 =?us-ascii?Q?wS/PcFrpyE1yU0v7GOagXKfZeqltVsplaUUEDDqmh0fj28nZ7I5CLb20nE4X?=
 =?us-ascii?Q?VvzRvq5EIPBGpD+8wQVhCt5MENLOusXo6OPCmfhMoF68sXmQkrgK0/v0LGfV?=
 =?us-ascii?Q?gDoF181yEiTIxQW+Ubsa0NvXDj6ZYf+jeLVoCF4vhuEIINalw/wecKXuDR/R?=
 =?us-ascii?Q?oKqHk7zr4ioNiNvInE1dtIk5gc2QmhlX8+eNelBiIA5Wy3IQRRpaYNV2Fwea?=
 =?us-ascii?Q?T7RYukVaoNA1m/9Qtsb3V3vWsOmGqtG3sKax2thdmLh0RO9bRvLFY6rjSfhn?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1126eb2-5b05-419e-f198-08daafdff9fc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 01:36:13.5496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecOxqFRHHVmzvlYgXeb1JyYvfeU8bAuCgUEPzZ6SQ1cXswpwtI+Y+K8wySzlzYZAqH01dJ/oh/H1ciqmNctxZnUQjsdGKcJyRSJRIWH8868=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-Proofpoint-GUID: qegQ3OdzlfyBvKWLRB0wMSnZD0bW7f7m
X-Proofpoint-ORIG-GUID: qegQ3OdzlfyBvKWLRB0wMSnZD0bW7f7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-16_17,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=818 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 01:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99185

psplash starts too early to start on some types of
machines. Fix this problem by delaying this service.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 meta/recipes-core/psplash/files/psplash-start.service | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index 36c2bb38e0..9eaf2658a5 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -2,6 +2,8 @@
 Description=Start psplash boot splash screen
 DefaultDependencies=no
 RequiresMountsFor=/run
+After=systemd-timesyncd.service
+
 
 [Service]
 Type=notify
-- 
2.25.1


