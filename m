Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCC7E93708
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 11:03:07 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.12637.1696503785587717114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 04:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=iWX3j6EH;
 spf=pass (domain: navimatix.de, ip: 40.107.105.69, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD2pOkXs4Cx50OUCKm8CEgkHr/jE+v5IiH5TlD9unhNRal3tH7Lh0R/3UR77NW8Wt7gRmZc43QlpWqHmR45FwjViYdgDZOHahp3C58Nm21oRsa9olFDpxBd0dnLCZkzB1F3jBYQaYzG37GreGUgkVfpUJHsCsyZ+YxmGAF5Y6DZJit6BlUy1JVCnKOAbjB+KfOrG/opr4HVtqubSDGSBRRERByAqceTda5Yzr6PxzVwf48bm3PueY7jG1dxCJ031ePGbSeq7+fmzFFpshn3q94a7RkEERv3N6WEbHDKY2ZHlm6ZDI7YyugQedy8Rjr8fnJiDs/q/yeMHKLDEzZRByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoHVlZmZzzJ8qhxP3RzUVIdmP0meNAvA78ekGje4VOo=;
 b=GtYjkkWAqrI37GgfREdrpJ2rxNNc1XGn/XUvLJmFmS2ff9tcGGvunGM334zUMRTLd0FSFxWFgyzFCKD8NxZW++6S2Axu23kT9aO0sGyhUWrNx2LFPj2Mo8igVfG446dldvn0WRHkOmC6AEazxhBWt8LLh1WxxAFqhuHYsrksgl7m1gIx3gi3OLNED0wUufWP+NUHxqaYfUbvy7oHHeLb6jluQh9QlH3pYGhXXBNwCtbWXGS+6Z5KnlR4WgDc7QKsOaKgyR/kf/1oF/QDj2L92o1zPwsE3eBVIdIiV79EkG7Kenn9v6bj6ce4tnUk08WfqhZH6Ldppz8QjcZCqCD32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoHVlZmZzzJ8qhxP3RzUVIdmP0meNAvA78ekGje4VOo=;
 b=iWX3j6EH6KitiO249gNwbcnl/jNIpg0lHAQvtju0yoEAa5HI1WCQS3Uqmo5R1x9aS7TXswNEvLGmTeDhIkOwxjWk9kNwI+Y8CfW6EdKqPIom7ICteehDjG4MHQFy/EbE/7+2FpHl4Jd5xSzCBvX3eUb5WgnsT/+9k4shLd/O6Y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DU0PR01MB9429.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29; Thu, 5 Oct
 2023 11:03:01 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::fedc:a1fb:55e9:fb31]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::fedc:a1fb:55e9:fb31%3]) with mapi id 15.20.6838.016; Thu, 5 Oct 2023
 11:03:01 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH] collectd: Use https in SRC_URI, add HOMEPAGE
Date: Thu,  5 Oct 2023 13:02:26 +0200
Message-ID: <9c70b1b137efc84b24a4b7c52e1182fa1976400e.1696503746.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::28) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DU0PR01MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d349c6-e60c-4953-c8a3-08dbc592a3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wyls2iP1+9qXmkI5sfcGq1NpgCL5Qh8rHkp9StFCgTtjk8VU2bG9RfzbO/snHQDBfhomRfkM8gfOzRr3SUWYRayZOtEpQo01TzUgziBhBdqYhOcg+22HROVwDivq6zLfEUNByRJuA88JexNxBpUXtTbC6MUX1LRQi2PDCRBCTqUaXC1WMGTBbqm3GHRhowaQnVKB0TCszsbHWHwERpspCUqL3LvgGAtADcKacSWr/BzDTdweRE6qzE7wcIWkuryt/Yh3uVL/d3AIzCyvAxVc31/QtIoRXJA0Uv4h1fFFlGgzqtSVUB4ZEqJEQAKMd2qmY8J5ZSZFgayDOTJ8wjLtNquWts0bWHnSiBMB1R80pUxxubaJaUL9dCx+RyJ+xk0ur0ZHodqVSZ9bQpyGzfrJK1fPTOUoAEBmNq0GcXV3gS7TtGNjy8r12NSnsWMG9Og8y3TGL//Ook52jMw0dfpDj5aBPMfT4uLOzB88wjYkpXLiMtt8fgL7pIyr3Xu3IjUEQnUN5+5X6kPou7oCqNksuLrKQgmY/dKLwQLpsg/z7DIs6MlhFzNAFm9nPE19UTIqNaVOayb7rLJ4QMn43OtmUdsmAUz/z5UDvTnkMNy/Tr0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39840400004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(52116002)(6666004)(6512007)(6506007)(6486002)(478600001)(38100700002)(86362001)(38350700002)(6916009)(316002)(2906002)(83380400001)(26005)(2616005)(107886003)(66574015)(36756003)(41300700001)(66946007)(4326008)(8936002)(8676002)(66476007)(66556008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2DXtpZHzWSoS/6Hxk3S+nGAKiM1qGc8IaDuC2MyPA0bFq1+7sBtUt7fFTr6s?=
 =?us-ascii?Q?Hcnm5hKqf00jtpLX6DIQDwjUC0MEKvl72179Xoe9IjvNICrb/aY3B3tCAmEW?=
 =?us-ascii?Q?epkk8Hfxm5jxdKOp2YFxEC5zoaFM+vlLpI5XQsG69bD1icdj4e9Ch/eKozhz?=
 =?us-ascii?Q?ybXJrMpIeQqjis38DLKBtGoB8zcC1woFCAvSQXhplk7XgGt1wHjf2wXPGRQt?=
 =?us-ascii?Q?/nCydDfXqDbUL2/7G6sseKJfU/nXCmk1HmVuHVeCg1+ZC4jsr2xSsnC0tWAI?=
 =?us-ascii?Q?dWpG/n4ioxT7pPLlaLxCMKAc81nKuo3/Khs1exE2iAkJcV05VGppZ4sC87cI?=
 =?us-ascii?Q?6JsN3pLKsLJO5weuT+5jB1+GdLZdqVZu+9l1VZvxUpLoCLKouQqRKjraRu/A?=
 =?us-ascii?Q?hVpq8ZLzzUvIJ9FofhiSVUHgTbZweEZ6SjuO3M9gZsoOwZ67PtN6xa/ANCzE?=
 =?us-ascii?Q?fGsIaBh3STTZ9/Q6uSAKLGYswS67JObajChJGRH/h0Qwsnd7/YIWU1StoWGM?=
 =?us-ascii?Q?TxKSMIaroLQKM27Q2hNJWSc+/DxTdhPUJ2YWwPTSkYo6az+R/a9NkMmm4p3S?=
 =?us-ascii?Q?fi/tkuLtmsvxXIM57kHGdr56MbWigyoySEJeS+Mk1DT0KiLCZlI/N9cT0qLm?=
 =?us-ascii?Q?oe3DwMLZKAFMq9veL7AnxI4+2ReM6imdVkwhiEvnEMrDSrLrA5DM6WO8z1I5?=
 =?us-ascii?Q?A13i4RapwYWn49L+6sMZUlfrEtgrzhBDFEFMOt2m9dHNsgUR/ik4G5AwZpV9?=
 =?us-ascii?Q?9Kx5zXb/cWr2xAOj7KLjgTHyYvIBL09mpNyOOmSctAPAt0+rnAJcjdaHNJxs?=
 =?us-ascii?Q?Xcc7YPC4dPBIBWXv06TId4fnznd9PEcPWc/IU6Ocf9aMYmAY/grx9YoMwt50?=
 =?us-ascii?Q?fmdchI83Am5Z+aK/HTnRcqsw0HOKZJggQab9Js2GuOov1LiVU6kDhxZLIQ5w?=
 =?us-ascii?Q?q9NCxJ/sJdeh0o/k75+xPrS2jpvtC/4qRQhPXSIAtFmoxo+xhvUgLs0UFJkb?=
 =?us-ascii?Q?VVAZnMIABjqS9E7PPFFzF5f6zQhri2/nKhyWF77rOAVLxxxSCwdI45j4Imc/?=
 =?us-ascii?Q?zYGLKRN79YHUyXHjU8oGqx5RPSvmgfW5SRUguN0BFuMka5V/E5KQpDVVZ1Kb?=
 =?us-ascii?Q?jO+aZDWPmtD2dmQwqornJnUKPqLQBoy3PQFApFH1r7XOkdte0Kv76qiWGrRz?=
 =?us-ascii?Q?NNTe2tscF5QyUjPz0NLojlX+9JzH32B99ttZZH0miK1coh/9OIN3pu5oUFqm?=
 =?us-ascii?Q?tqRH9+E9DvUJVegry1WEMEE2W675eFsqCxlr1/aWN9sjw/z1LBQ535pbte3/?=
 =?us-ascii?Q?RZEe/QL7PKd1Ic/2JldPUu56VQDY0RrYyGb8YfSZQUjdL2uOXgtjBczOKK0E?=
 =?us-ascii?Q?7D3zl/89pbm4YeYuInWznqo2qGYuFN1QMveAq7qf2W9uTceRBA8ZyGtzvmlq?=
 =?us-ascii?Q?qSdfShOA0NFODF/dafHjTcC35A6awKwrmKVp1X0pdK8sn0ql7gwyjPjDeXA4?=
 =?us-ascii?Q?VtCH4WzP7lAuvPr1xKjahGGbhHQ9yL6q9PA2KObX7PoofboRt9tHqunny6u+?=
 =?us-ascii?Q?Wlh7WhUtEBEkBujSH0DQWWAQXf1e4Gftqq4DCER/EYjt+XvCojbQVYGySZii?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d349c6-e60c-4953-c8a3-08dbc592a3dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 11:03:01.0684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY5pIuf62McvbcGXukrDN4erH6xgMFEY8POiX2PlmH++JL6t00LGDVN8OOe5/cNpIrf3LFnTxXnmDULzn7H4maaOCe47MLfGKyjtsiL3L1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9429
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105354

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe=
/recipes-extended/collectd/collectd_5.12.0.bb
index 479c12d6a..bd4a5b3e8 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -1,11 +1,12 @@
 SUMMARY =3D "Collects and summarises system performance statistics"
 DESCRIPTION =3D "collectd is a daemon which collects system performance st=
atistics periodically and provides mechanisms to store the values in a vari=
ety of ways, for example in RRD files."
+HOMEPAGE =3D "https://collectd.org/"
 LICENSE =3D "GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1bd21f19f7f0c61a7be8ecacb0e2885=
4"
=20
 DEPENDS =3D "rrdtool curl libpcap libxml2 yajl libgcrypt libtool lvm2"
=20
-SRC_URI =3D "http://collectd.org/files/collectd-${PV}.tar.bz2 \
+SRC_URI =3D "https://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://collectd.init \
            file://collectd.service \
            file://no-gcrypt-badpath.patch \
--=20
2.34.1


