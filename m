Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6F3CA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:29:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.web10.6138.1756880969142694062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=h3kFDb+G;
 spf=pass (domain: axis.com, ip: 52.101.70.65, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvlU/Zv2MBQgJN2IuSmi3bVx6KiDkJfNoaKvjZ5yclStcUItoCvqgGj0hlML0AFfE4NSgCXrDWVOncK/2hu37KHxI6LCVQuzhvgltvvoDLSvnFAsQcjn0L5++HMX0F2u71qZSUD2/5jOfPrtQcy2E5F9VHvN1daFE5sIwgmQWK9ZRQB3WL6gVIkTTPt0wHqAII1QZUEXMK7E9+x/rNGAARTYo8SWZjNawwk18usX698eZS1ccUfFFx+dQ1GsOnK43y68F/7WNQpWXYjXYipiBMIBjajTlf+guR6dgznWCkriSE/dfXJqNf8sgwgtBMOu1Z1WzVGUF9tFjYRzzX9bdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvljVgKpuh12MGwRs9NkIeOGHUiPrC6PTWMoe6vvM4M=;
 b=rM6glcLqyV3WXqdoG0Kt5dQiDIJeiXh9LHJgCtCqJ/Mq9VJUTAwhuX9G7JOlic5+JwOGIUlYJbwNUOz3HUec7K7n91xfFoFaq/G/R4HN3bQgx0Z7QNfVnKazvTVJzNBu0SSA0beq0+17YyFMvUM4rmfM4n6HbMIbPWeu38HCFmAaaYO7jTqUVpw3iOBFREOxopLT7RtAAZi7s7se3pawvh2zT8yARzQv/UFLgxTvQqhMMwxFhXFYd8AM7xU35tGmDk1L85LvC/8SySjh4mjfoGUi22r38qmSnq0l/UXYLVgBzf9MTMdZaV5HUrEUvp+0p1y0yMLn3Acqg8w2OEM12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvljVgKpuh12MGwRs9NkIeOGHUiPrC6PTWMoe6vvM4M=;
 b=h3kFDb+GM5BVPqxqOngeZgaC+QAW3Cw+Bmf2ENuiSZqsML7QIn35SLftu508Kqzb2eRedgn9UWEl3VQLKfCZHR/RBs9TKFRkXMz9cj3Jlct4lcys93RVH1fWRomEna8vZQj2X1cmujjMZnee/2epmmnHAi3jSJMbYP7e7QPN6PQ=
Received: from DUZPR01CA0227.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::15) by AM9PR02MB6561.eurprd02.prod.outlook.com
 (2603:10a6:20b:2ce::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:29:23 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::5) by DUZPR01CA0227.outlook.office365.com
 (2603:10a6:10:4b4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Wed,
 3 Sep 2025 06:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 06:29:22 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 3 Sep
 2025 08:29:22 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 3 Sep 2025 08:29:22 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E9ED11042
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 08:29:21 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 6CF0D2426D07; Wed,  3 Sep 2025 08:29:22 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v2 4/4] influxdb: Update module cache content
Date: Wed, 3 Sep 2025 08:29:22 +0200
Message-ID: <20250903062922.615315-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|AM9PR02MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: b3cd2faf-8189-4c0d-0d17-08ddeab338c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zE7K8vDhJWxy0Wqcb8jGID1NJiKZEKcG5XkPeXZzUIXEcalGDvLnmsIW4xOt?=
 =?us-ascii?Q?m0AvmUF+nCo3lVkaCByiq4ZMBGCkjOCDJyu/svDC4rXslpsIfd0dZo0ZnKFU?=
 =?us-ascii?Q?XW8Q/6qMk0im5clKlOO4wt1mnJsY2hdx2Q3+KbgTPSVBcz7JnndZeWqY/I+H?=
 =?us-ascii?Q?7h6QWwPHaT5ktDgVhKGAmTy1k/Vj/oqL9hou9+qIJBZDA9Z8frj5Z0iuqO5D?=
 =?us-ascii?Q?zI0OQq8a/ipU5B7+INb3odf6w9lXAhRQ9+peSXaKw8y/Lov42Xz4Hg86IWsu?=
 =?us-ascii?Q?4XOo5SeXdDosTgB5ZnTxRfglgQn/zhbS+22K4YY359xotU5jxiF9dbJ14Rrw?=
 =?us-ascii?Q?/TTCayG/wgq+gC8JDgGQL7oxHvgTXTQu6Cf5XpJgq30CjdBUP2KkYJoNbcpV?=
 =?us-ascii?Q?ewc5qyQtOWiemWhiC4Ylr4pl6dMVzT6WZOwOfzz01QgdG0Uh57U6uWSVO+2X?=
 =?us-ascii?Q?4dUacoC6aHmssl91dW4Svf+KXkZBgwGY8wv5vi8uxurSyZcHT+YKd1TOARYD?=
 =?us-ascii?Q?Kp9YNBF48OjcjCpwIXFL1Q8WWTkcrhAKhMgbWUDl8JdseoM6G51NcoZigpK+?=
 =?us-ascii?Q?rgLZyMrozKx2dH725kNk5h62dadGZkHsH/ocLvysHqCoh+NtxhTi7zfWFmS9?=
 =?us-ascii?Q?oIoHPmwqwE6mFSq+Bi7H6UPjHlqyusupT1dKoGASG0ieYFww1jYcwzZBJl3E?=
 =?us-ascii?Q?pZROrbJhrVS9pViDsVV7dMMGGx0DcIe8zCerAqJiKL7VpIYhnWDP76A90nLy?=
 =?us-ascii?Q?cNn9qDfYQuwowU2YPkeIuej02V2/BYN/MxBQh7ZA7q8YTlyciVBNOAEurqjz?=
 =?us-ascii?Q?27r+k9RK5fPb519amKSJx1D4WF6DWtdYvAYEBu8J4FzfdyH+4ypSr04rrFjE?=
 =?us-ascii?Q?EYbu0eJ9wgGRxjtdzMk9KdsRgs5gGsdqLkvdw1Qw16TzX4IJG4HIhNFa3gSQ?=
 =?us-ascii?Q?TEaZhfZlCpwH7EXTA80vy6j7Ogobgx2/aN5b8zX2WpH6rI9yubbrt+za2JcW?=
 =?us-ascii?Q?Plk7T/yxLYGvc8YpHmHJIBY5kNCnxkKPenm6JC7XQqQYP1BHEvkvpPiMCi+y?=
 =?us-ascii?Q?HEzQludLAdYRdMedy5oWaZWHwYZ461BbyvN9ZaYMwVHwMB0HtaKJlMgEKIuV?=
 =?us-ascii?Q?Q4cDTs2g7Bazl4EAZxSlVxNMluE/7aIHo+PW7+ySajeoCATTVlEEsMgdKu1F?=
 =?us-ascii?Q?FV+/pyCinRpli8bV15GOcHddebXU3d1ri//gDXSe+9uKOXN+5OY5d/H4C0hR?=
 =?us-ascii?Q?EIkJuWyf7NiwCaCZ89k7RR6W5kwmzDiu2YjubaJ35p6pD4uwlX5ndjwqOH8Y?=
 =?us-ascii?Q?7nfEIm260VzA+4EZel7ejSErJeT0+0NKZT7v/w9wl/0SMDz0BY9FGcmYx4fo?=
 =?us-ascii?Q?CL7irjaR6fUx0wgX70BFtfv7tSU7JMQfISTs9BBoit4bJxzxpFB4nkmvZays?=
 =?us-ascii?Q?YJDb2wBjasCSx0JsOtdTLNpYCiQryEp2WXuWxHRv1UeHwRD461KYfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:29:22.8427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cd2faf-8189-4c0d-0d17-08ddeab338c5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6561
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119193

From: Christian Lindeberg <christian.lindeberg@axis.com>

The Go module cache content URIs has been regenerated by listing
dependencies with "${GO_INSTALL}" instead of "${GO_IMPORT}/..." as the
package patterns.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
Changes in v2:
- Reverted unintended change of github.com/klauspost/cpuid to go.mod
  file only caused by change of GOARCH when listing dependencies.

 meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc b/meta-oe/re=
cipes-dbs/influxdb/influxdb-go-mods.inc
index e191426431..e151404cbf 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
+++ b/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
@@ -144,7 +144,7 @@ SRC_URI +=3D "\
     gomod://github.com/mwitkow/go-conntrack;version=3Dv0.0.0-2016112909585=
7-cc309e4a2223;mod=3D1;sha256sum=3D3f15a518f37228f2d08c6b43762d43869a5ab8ae=
7ba3b5124bf961035e71cc18 \
     gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.2;mod=3D1=
;sha256sum=3D5b59c67ddd6e8f240a0008f739d14875c1af800b8e1b23d95c10c8bea49655=
d7 \
     gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.3-0.20180=
606204148-bd9c31933947;sha256sum=3D9f713f45fe865453738633a69f35c8279ecb88f1=
30ca2a140a7b44385656f776 \
-    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;sha256sum=
=3Dfb012856582335cdac02ee17c08692d75d539158a82eda3a26fb8a51d4ef27e6 \
+    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;mod=3D1;sh=
a256sum=3D775c317e0e805101aacf9509f43a700e945f81a5348fd963b4db1a47d7c1b3bd =
\
     gomod://github.com/peterh/liner;version=3Dv1.0.1-0.20180619022028-8c12=
71fcf47f;sha256sum=3D0d96c450f9c55a8102f4ae7fd8a583ebfaeba23e3939d6b6284306=
a82a21430f \
     gomod://github.com/philhofer/fwd;version=3Dv1.0.0;sha256sum=3Db4e79b1f=
5fdfe8c44bf6dae3dd593c62862930114411a30968f304084de1d0b3 \
     gomod://github.com/pierrec/lz4;version=3Dv2.0.5+incompatible;mod=3D1;s=
ha256sum=3D2a50cf1993308244414372349e500770dde0671ee259159cf305f4b1f84ebae9=
 \
@@ -161,7 +161,7 @@ SRC_URI +=3D "\
     gomod://github.com/prometheus/common;version=3Dv0.6.0;sha256sum=3D6fb7=
4cce1a5bd84cf36954493d6157b1bd2231b20ba2587c224df9737b579314 \
     gomod://github.com/prometheus/procfs;version=3Dv0.0.0-20181005140218-1=
85b4288413d;mod=3D1;sha256sum=3D52ded709607588200eff4bcfbd61fce32bb0c3f0efd=
d32d846e3ea150b196352 \
     gomod://github.com/prometheus/procfs;version=3Dv0.0.2;sha256sum=3Dd5e9=
430b0a3209ccd75569f7c6f9c9fcfc48f554557f44562352adab9c617464 \
-    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.20180308014038-=
101a6d2f8b52;sha256sum=3D7863938cb01dfe9d4495df3c6608bedceec2d1195da05612f3=
c1b0e27d37729d \
+    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.20180308014038-=
101a6d2f8b52;mod=3D1;sha256sum=3D57ec187307e4b0d0457a8a28a6a32f683e4cfa374d=
2449fa72838a18b1230e2e \
     gomod://github.com/rogpeppe/go-internal;version=3Dv1.3.0;mod=3D1;sha25=
6sum=3D33b55e839b0754283c3eeec1f33e16cc66432dffb8b8a96d24f536d01e51495b \
     gomod://github.com/segmentio/kafka-go;version=3Dv0.1.0;mod=3D1;sha256s=
um=3D02ca00937516b509446c5eb0bd0a4e613b76388af2a65e58f9669434ca0668b6 \
     gomod://github.com/segmentio/kafka-go;version=3Dv0.2.0;sha256sum=3Db2a=
88eb5b65fbb75dac0ba5e721cd2cb8e39275d1702a0f97e3c4807d78e8b48 \
@@ -170,7 +170,7 @@ SRC_URI +=3D "\
     gomod://github.com/smartystreets/assertions;version=3Dv0.0.0-201809271=
80507-b2de0cb4f26d;mod=3D1;sha256sum=3D75ccd8771f23a04379e7631044c4fb70b49b=
27a09650299752ee712f08a6add7 \
     gomod://github.com/smartystreets/goconvey;version=3Dv1.6.4;mod=3D1;sha=
256sum=3D37e964c8dc1be33116055227dc75838037c5b5cbbe1b7923d6c6270d0eeafd05 \
     gomod://github.com/spaolacci/murmur3;version=3Dv0.0.0-20180118202830-f=
09979ecbc72;mod=3D1;sha256sum=3D55565ffdc59d315a952774815afa98668ab9011e8cc=
11e35be5243e63a23260d \
-    gomod://github.com/spf13/cast;version=3Dv1.3.0;sha256sum=3D001ed519a3e=
c007e76e639f72bd9560be70497d499acbf1a32ccf32dc4647d91 \
+    gomod://github.com/spf13/cast;version=3Dv1.3.0;mod=3D1;sha256sum=3Db98=
f2c1774e0b7c0c5747531a6a0c6c8c25a37cf397ff05f1971bbdd97d52fae \
     gomod://github.com/spf13/cobra;version=3Dv0.0.3;mod=3D1;sha256sum=3D41=
ec7f1a12f7934ac349ac6b87d99bc43a8ec4405ef968f3bf0bd0a32625d76a \
     gomod://github.com/spf13/pflag;version=3Dv1.0.3;mod=3D1;sha256sum=3Dc0=
119b5dfbbf3c0cb02b168ce0fcc19e7edefa73c9844c4609ebcb57f4394d14 \
     gomod://github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D=
1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
--=20
2.39.5


