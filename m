Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E401C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:28:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6416.1698103732022873811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jVbxR6uw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8660f253af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39NNMXmo015421
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 16:28:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=YtI+7v484FnbKTC5Y1
	07Eubig/CruWnhNeG+Y6FH9/U=; b=jVbxR6uwJ0Rvc6qFNqNm8V3qmFaw32LFCI
	eDcEEre4sI6IHcYrC4BCVpMCNajRZ6JReqNA9hKIzP02+f1T1/uopXEquiTRuKqD
	ra6HtI7waC83smuwT3UJsaXnVHGVaaF+AKtvOMScHdM5y/+pjvXUKfoyDtNcfKon
	v3SRi3KFUV+PMA3+H1vke1AF6KEBWiMUm1GcZuzX4nmsqzqDvnw05iiTNgoTpEZs
	ESaLBvnjVwMtkAztMXJ2HKekcaJw/R1axDowAFpnCdlHOurkx+HAZmDXTWqFp6MN
	2IsIKd0ySgpxS8ZBcsrRGgk4eM23PxmbMWD1VL2NMykN/5VI3Nxw==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tve5fa8kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 16:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSIiSYDJ1k8dZif6unn9PO1GyNkYp2ItvaPpjfqMdz6nDQ71J2zlikoOR86+ipl8YP4WEZrrxw7ZFKYLDxLjnWSQ8IrfVv+GlRFYvC1u6apbZ3WstGB0LPq8VZ2nEucYn7SlipmJgPb65eqMOgTtRfzAWyleIogw5EVSveQBWXu0iTU03BwWKVo+JWC4ioBJ9w+uaOWeVRVqkINSRzOg9VohFTxr9cVPy+OpVa0ZGnXrAr4VCtgyhDMpxGnAHM0QCwq/fOwoIAqVlYTrlkDACm6cDYzSzpQFAJNQuL3wvgelhohxvtUkzRGPQgWmg9XNlvyVwNCaVDLZAzb0gVDX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtI+7v484FnbKTC5Y107Eubig/CruWnhNeG+Y6FH9/U=;
 b=MU8MndzTSNcs5qIS8U5LqVKgw4pR9UEvI1n5kbTnETZnuQT7MMOrzrFMejGly+PIdEt3sM8LQcvGe1Y7Cgc43KQ4lcMNpnTlKiIrQrhahNut5y1BhvbN/7TxDfz8O5jTxrzS5sYyTXJ2XXBvvYN+HGidpy7SRUdCsNcJq7N55PPkAKflZrVfb5zVP0ZlhTO7zwabX2p69AmdeDPK2KB7l//CC5rUQeYPRkzznAvdj7Uml2QH7M35+E7q/rv21NHU1r+/Gog80c9kzyP4j16+W+AgWHPoGoxZk4I1kzItJhe6bNhI+LATJ7pXSL5qVQGGNgTwcBHjQbG1p++3rNh0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 23:28:49 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c0d4:7b72:20c6:3a07]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::c0d4:7b72:20c6:3a07%3]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 23:28:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] conntrack-tools: upgrade 1.4.7 -> 1.4.8
Date: Tue, 24 Oct 2023 07:28:37 +0800
Message-Id: <20231023232838.1141607-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 341ede7d-07df-428e-b1b5-08dbd41fcf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vvW1d5M0WYXuvWh2Bp+nztoDLB2VTq1uAGdsFr345onLC78wmx0t3fM2vQCw+h3QctiBwiqQPBXWt0ZiDilOmtiJzqQxRn5eXojBaNxqGms00XG1rXtzoJzUMR1ZMKs9WHoQ+unQYCCvTE5YAhOBDqUQRGUjaBOUEaNKqmYsVo3h9eXkW8Ra3w1IstJh2Q6XIjHhtDiVSxS18H/bIIAlDrd3mtW6dbjX5el3CHx0SSZA9awLuzHOoWJbKbjIZsLO9l8eREh7dn8EwY9n5/cmUN7bKJjbvNoW/ix0cUtFjLIH0UmaTVMoTKlcl0RhASp7OY1GR4BknzEc3ISzMn5up9RriHHHUTxfOQ61N2HE6MZ4NfacknRqN/3W+55mWAKkf0B+2teaI+YCAj8luivm5r+LKUDmFJd3mkAAPrlGVZ/E8qvZm6ghyL9/BV4M6rtDV9iwJ3yc9sFT52eUtod/vnPKjcMfhkZYfezmtXBaUzNRZvIuk0aGRrVe6Ntvzcdu4rgxsewO+qFBPKFbMdU4ajzcxI9YFYBfkSU+lEy5uOM+nHklU9Q2ZUw8qtpGpMrznJZm/x7nDE5xk0EiCjUSr7l94Vf15u4CLr74ULtxTpE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39850400004)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(44832011)(38100700002)(41300700001)(66476007)(66556008)(6916009)(316002)(2616005)(66946007)(1076003)(6666004)(478600001)(6506007)(52116002)(6512007)(6486002)(83380400001)(38350700005)(86362001)(5660300002)(36756003)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yULI1b6h6qbQT51NC8niqbHX/bgfBWoFG9SsP8PaZYb6EE3PdgW7eeWqtFdg?=
 =?us-ascii?Q?vjBDiOZ+BwtUXljn4KKfxFWKBV8dmmH0fTuNn+sqGV89v3ivlrAkFtEhMZD0?=
 =?us-ascii?Q?zEaAjSXXM4NvNgGHCC9TDjrXODeHN5DbmvqWZCRLCG7uh714mkSPyVjbwDRL?=
 =?us-ascii?Q?50sjIKEKZjSQuMVwpNhG0oVr2JyEoKDLPX0U83HxlC3vcUiKZZ6+YVvEg+3N?=
 =?us-ascii?Q?IOm9s05pHc30Q0BR71ktmvIQCT2QkZoD/tEx0awKeN9wezwZDhXmH+Zt4or0?=
 =?us-ascii?Q?bhHYXacIDPGCI9PJyxgF7xz1WmDt0lWO5eJ5+UwsI0WyNDu+B3kXRF6IWJlv?=
 =?us-ascii?Q?8uojsj2I8ON48chRsyziO65UnnayD3v+7n3dTXUkdVLHTt5cAHM0xjpFnGCF?=
 =?us-ascii?Q?9F7aelD2tVcbfUuxXd1sjjbZIdOwIwNBqTAhCJ6tiMxYelIJ2SQMoTAaXOVh?=
 =?us-ascii?Q?BKNLLovfjcZ5ENA30uvWDTUGZI4AUYnh191eQFps5zjOvrZyU3XPgaXmPv7q?=
 =?us-ascii?Q?UOVACwX/26W93ANA3j5gxkRXIZb2YJB1vfv0bFhW6Xcwp+r8z7RvnBeuxcjj?=
 =?us-ascii?Q?/h0iB1j1a+0tTvY58s5MVOPlHoKeDTtetoAM/WdKemt1Ys0znVPor8EDrAY/?=
 =?us-ascii?Q?+JQnwYTFBRA037uWLHgOidsikk+2mV/JLerwhXXlOn93TAq6b4uZk/dA+h0s?=
 =?us-ascii?Q?YWJl643g/6W2+c2w9wQR8kZ0w5OrF3mP6P569SO1aFqGm5DN9RK5tuwjzVgz?=
 =?us-ascii?Q?te8wEVhgReTblv575ytw1GT/9RsGDfCMR0G6ifjpcUX/HyORiCz6FMLNufrO?=
 =?us-ascii?Q?h9dNbucgBrVnm2Ew0MPWUtavr0jaNhSgBzQiOwZIvIyVzzb2Y+2FAR7C6d69?=
 =?us-ascii?Q?zJayzvnnYaI1aUHRYK7oHYo1wbyF5KIHqBzmFkSVz5JeAhAc8IWqY62ZqXAf?=
 =?us-ascii?Q?bieGSaWDloQNfxZv1ar4o+MiEEkbx1S8eD7BgsB0bIvTma4494TtbIDASf+V?=
 =?us-ascii?Q?6leCX3d+oyn3BL8jZN/+dpjI2Kfn1BkaUPTEI4su2IG3fFERBwD13HvVc4tS?=
 =?us-ascii?Q?CeLSb8L8Bg7zw/dTbibqdQGBiTTNuwwIx9ZDklK/mU1IHeTcYQl7TkJ9dxCo?=
 =?us-ascii?Q?MrDh/acd8Fw5x9jKwYJ3WNfU4MTLA6/4nZXkDg1FQHuCwJZli/MYCsS9xzsl?=
 =?us-ascii?Q?krg9qulzbhZTQqgVYPHJwO41+rICUi/CtuS4YaB+kZTJsRxQcs9+VbONwjw8?=
 =?us-ascii?Q?tKBcq31Ls0P1eBPL+u9fvfrOM3ghQMYKZ01kmt79k/4zJPQVUZlWxOU2qLyA?=
 =?us-ascii?Q?MroEbxXgS3AG4ZrVdpLBB2IuF8Q0yfL8mOLNx6RyGhPBQPCKWW6iVc3s0iv3?=
 =?us-ascii?Q?kJaIXtp36ahosouZIKzP3N+aPib6AFvBn5Vt8R8pUKz3qcHfPIwboPD5NDCE?=
 =?us-ascii?Q?zPVwwMnh/Rkcvh9CB1in0sOvPlmpr28lEiJx3EWlevVKfNTgFQqEDUrBF2EO?=
 =?us-ascii?Q?Xkb2R6F9AxNowllvmReK0w5BVvstyamjegVz3LfuV3TV1zW6+7KZz4F6spsR?=
 =?us-ascii?Q?9GI3bNSRHjV+ZwM96Ee3zjMJJi44i6whe90DZ9jX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341ede7d-07df-428e-b1b5-08dbd41fcf0b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 23:28:48.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlSkpcyeap3XlbmLxmFEBjauIMpKMMDrL8exuCzTp8AalzAQJoB0t8RMrdgD7Qpl27W2wb7kGezvkxZ9X9vNUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
X-Proofpoint-ORIG-GUID: ZQaAx0zJnAauAxNasZUV2qhvk0F1sgVF
X-Proofpoint-GUID: ZQaAx0zJnAauAxNasZUV2qhvk0F1sgVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_21,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=758 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310170000 definitions=main-2310230206
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105688

This release fixes several regressions in 1.4.7 with the -U/--update and
-D/--delete commands.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{conntrack-tools_1.4.7.bb => conntrack-tools_1.4.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.7.bb => conntrack-tools_1.4.8.bb} (95%)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
similarity index 95%
rename from meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
rename to meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
index 0c6fd90d3..07e01845d 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
@@ -8,12 +8,12 @@ DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
 
 EXTRA_OECONF += "LIBS=-ltirpc CPPFLAGS=-I${STAGING_INCDIR}/tirpc"
 
-SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2 \
+SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.xz \
     file://conntrack-failover \
     file://init \
     file://conntrackd.service \
 "
-SRC_URI[sha256sum] = "099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d"
+SRC_URI[sha256sum] = "067677f4c5f6564819e78ed3a9d4a8980935ea9273f3abb22a420ea30ab5ded6"
 
 inherit autotools update-rc.d pkgconfig systemd
 
-- 
2.25.1


