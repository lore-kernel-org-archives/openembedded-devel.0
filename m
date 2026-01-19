Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A252D29C24
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:58:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.98])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34222.1768827498002976616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=af+yuVqm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9BHaoztGl8d4gOxZTL5rcKqqouq2jHLZeUoiTtKBqKpmOOjlpCzHcp356gWPnoHaMD4YGCWQWxCjKDaSLEAo9cqXMlAsAt38Y6+Uf5KTc3yq+VikPbVSB8IxQL1TrV8lUgcDlhmZ6t+RDPNzfVI8weQx0XJ8mi3RJVM6Z+tU3NzKEGifjjTiMK4E0hp38dY0B2SChVjj+v4CgCk2PAolikH2cu7gevWcJS7xcLuP5HBDUjIhCpJc4k0AmNH1HlxbO8E3ky/TDoFl/m7kEAvOKx3Bi85gqTPwjz34WWfkZI4CQ9tvtG+LBm245zVDO6Q7ibcm1y9X7W1F8MoU3Y2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2uL/oWSBlWvfm/R0mIPgTSZKVrdglRGp6BMj8a4LOY=;
 b=gVNDtC9zVQiJsm13pSvyLkxZ0umFXtCCI20Y6ibwnoV+aTm/JnyEdogq4oHU5ProXB6+jQiKVL/V5WfdWWaXEa8lLVfnNnHTBaCh2kSJqhtMwunsBi1/LS7xbgmOHYGHygajTRjRSpjl/FU7vTpEv8Iqe5OXxf4F9z8DPHViqeAPcd0jUSn4Jq9s4qRKVh8wHfo12T1YsF/6lH9vbxStPEc6/3NwsoX4D4V1IIqm+LzhOTgrAQPqgKKrUB0VKZ+TsbDXcpdoevr0pi4/ejj1J22zPkSCE+NcOBDuzmQ3eQIIXChxtcGNGzFI7olkPUI04UGUajSO6gbKnX6JzZaH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2uL/oWSBlWvfm/R0mIPgTSZKVrdglRGp6BMj8a4LOY=;
 b=af+yuVqmLC4NVXG8TTpVxVNxbtVI1iiWSp+jBDMcWyv55sVDv216NdiQlOuYaqeoZ0xU3jmXwGfm/+0YJxn30jJysRSU2R/rTSVubbtdLoTgdmlkjvqNNkRsoieZW3YPzdfpcnPaupU49CYuDCXtmgqTCy/uePzr5ztP1pThbtFWQh2D+mz9JbUZHQpCoJ9ZMWcyOcRlGUI/2gYXiHxQcDGAdKp4jHaphm29hQggbfPoSO69c5KdQlTxtIKz2PsQ9xbeljWVhxV0Chx72crwmXmPvlAOlg3CwRzRqoSEXhRcgNp6u3djbj707mnIJwqY5erG2p90YETkB3emGVmv1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DU2PR06MB8335.eurprd06.prod.outlook.com (2603:10a6:10:2e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 12:58:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 12:58:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: tero.kinnunen@vaisala.com
Subject: [meta-python][PATCH] python3-watchdog: Remove obsolete dependencies
Date: Mon, 19 Jan 2026 12:57:48 +0000
Message-ID: <20260119125748.1199952-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002E54.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::2c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DU2PR06MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfa8017-7b62-4e3c-976f-08de575a63af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nIfiPdk50QuSRVwC9P4uQzsqm/s12AzC0PLvAH+oG8FPwLp/j2gnbHqEREVb?=
 =?us-ascii?Q?+pR1wjhOkJnUXxM7/ij0fZq5SAJjfO1rJHMM9ytNeUZbx+ePmQRe0Gq6njct?=
 =?us-ascii?Q?V/NmFwpFnL4nFlNnUPN0FSpKedgW5KcJjs26qHFE7kYir6dK6p6DNvfKIGhF?=
 =?us-ascii?Q?V6YSN6NRKDotdIIhrZG1a17hHRQT44kEMrVgp7m3baMV2vJOslzLAT4Yravn?=
 =?us-ascii?Q?Dd6stQBOQg+E+abF+s425l3+k8LILaNeJUfjPb3wswCkfoUyu9UM33xOkvsk?=
 =?us-ascii?Q?p+sSWvGBz+ozoxYeMBIAfKF2lLP2r7UY9dBrF261bQ3El+OfNnwHWz7AfMCr?=
 =?us-ascii?Q?GkLb68HSt4aCYyqJUp1ZWiz+a8AK16BrWeN2YEMasNb1pLb+HHFJ7NkYNQiU?=
 =?us-ascii?Q?QvXta6vbCQKPZTo98z/CEUIK8digSccQ+7CbkTJ17QvOn/rToZZw3Cr6oYrW?=
 =?us-ascii?Q?y3SpWzvl0O93tlcP/Ch6rN+W0xLYZHghVZqsGv7eqkP0wW1YoWmB6prf4/Le?=
 =?us-ascii?Q?VOcmZOWxAjn7BCdnUKTTi2iPknyBnkE6X5nZxYvk6yahYG1Jc+E0t2IwrQVj?=
 =?us-ascii?Q?+smu0pNPn8xXzWYTvgnO8LwXuuY8J+UcnIgl/z80Yx2e2Gih1XjAWKB4976g?=
 =?us-ascii?Q?jpHNYT0NM5+YPl5P4F3fLiy1SJkjBzScIX10IcaMEheJBBGxtbNJQ6bPXHiJ?=
 =?us-ascii?Q?cN9HSz0SYnkvnzywVHwCNilievKrolWVv9A1u6l/O3oLmN06wK9J4Ff4GY6T?=
 =?us-ascii?Q?cK1LV147yCONqEHV5HJxcyosfr9etyXyy1HQNt7xyxAoErHNTqywPXI/+Cj6?=
 =?us-ascii?Q?mLjGZnS3jSFZ18X98XSJ0wAkPLzdeyWxs9sO3lYwR/12e6FglXdDgEzNVpul?=
 =?us-ascii?Q?a8fXt/zFbmkH9NO/5XU39joF5CzMZOyGE1F0ClG0W0FbV7xIffSC9dpIVN3R?=
 =?us-ascii?Q?QrAqIJzEZnA/WJ5ZXHwShfjab10pV3tawVHGqtzP7k2ZvFHsnbJKXlh/pBIv?=
 =?us-ascii?Q?bBQH5Qdf4jBBJhAnRuSuD7Qoa+icCHZmt/Col8FkBqI5deqYWXh3lojIfHGn?=
 =?us-ascii?Q?m5ZoHdIpIzapBsUeiozzyoic3rLPFQteV40YKX0WDu8k4Gn6qAS03hJJF9zg?=
 =?us-ascii?Q?P2PNWbIYjw0VlGqtXd1eClXYO9WTtq4yspaEV5oFPoDfotuXaexBsO9ZHalF?=
 =?us-ascii?Q?HhSOF8zkea7o7jdd1YoiUVTp65pDTkM4VaDplWTCvL/gHIBN1Ha6+dgsKoIl?=
 =?us-ascii?Q?PPnvv1LeKjSOJQMeKYTDxidB+zRL7LQ470G9lwUNqUfMSEsksqSpO9X/Q2Ch?=
 =?us-ascii?Q?lKn0mXZXPTeW564p6vttsI/XY8KsilgMT1zgjrps8IpjYBqIBo1fQ12ffAPZ?=
 =?us-ascii?Q?DH1XpHW3KsxloUlW+q/bYAokKf+a/cG9vJG5jewBrKlKYtpKamwsh0NOgBlZ?=
 =?us-ascii?Q?vdYan08feeWpR+2eSN0Px43gvfcWg2mb062DpeqXrL9VKME85ODFvZCBbs/p?=
 =?us-ascii?Q?Cz4jXJWn4EAmQXKId1fUhLgbBSO3W/OX6oyBZgz71sE3tdxbCe+xhy7IKXpz?=
 =?us-ascii?Q?Su2g+tBS3CA7FXfZQsCUZeIBqXu0x8yaq3tnHCbhQ9WglLUhsnbXizLWR2WG?=
 =?us-ascii?Q?PtKuWcjya9Ow3VJus7bfdig=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nVpm2gasMvwOiCrns4nI7IYlXSgFKMPJihOAoElpHzpLNBuZDf66bGKjV7eB?=
 =?us-ascii?Q?XC2p3p2yrppfcHZgjMMRw0IlcxN7wR5nXkpPmwSPqb+tvdaKAwPcq2yD1X4+?=
 =?us-ascii?Q?21L7DuGqwotO5pGozK+rDJGBczVIuic4mTbOxo3B5GnfNcyl5bSxI17MrI8c?=
 =?us-ascii?Q?/4t4gubiV+lz2lzynu8je56JIpqN51D38KFd2A0kT/YdSM394k6iRG60BuWq?=
 =?us-ascii?Q?0OMeymgJUPGSVCSkGDogU3fk2jyeUgMaYmSVUql6yWdnOmYN8MwXllwdSu/s?=
 =?us-ascii?Q?KJ32MWv601FKZj/QKbqNeFm/4xC0V3pHkHWFsy7M0zglAkrQDmR0IBsC+gy6?=
 =?us-ascii?Q?i/t1OFE76ZgJG+mfKXOyy8AOsM2DdGEvas/q+b+PL64RUHzTIu4UGi9G2q1l?=
 =?us-ascii?Q?1e8SxlccFJxrlMQmcNtLKJFqTVfjuXnOw6R1k29kVPl96xLJC+MTBcTMQdl4?=
 =?us-ascii?Q?JzaPErzbWo2UZeRfLQmkEPvFeNqKDIh9ZpQZCIv2jQ04c3RyZRiP4rC+rf23?=
 =?us-ascii?Q?XJgh2kObiuRo1j3t5NIvdoisNcmTTe+C4sH9ymDEW6b1AbTxZKyzSqGzpMBz?=
 =?us-ascii?Q?ClG8OGMMaVFpeivdwf0QPDrUXdMzab4XR+9q4dJzFTdo+toP1+hP1IWn/512?=
 =?us-ascii?Q?y1LFSoGVK7KzimzM4KP/44LQjkH5lhBWpBQxaNk09Ay4g1oUY5gRRe3Gzcma?=
 =?us-ascii?Q?jcSMzrrLooR95CCjLygQceRp1U0tg6ZM8Qxz4WeelAGi9yAEqbpSIBb1ZzNa?=
 =?us-ascii?Q?kwhYCqwg8bjhcffBsdyj61zLLp5n6dtRgoL2XrR6QeiOUc/PkE+KJF8Hc4zQ?=
 =?us-ascii?Q?BL2C0LhOUGAnabMrM3kfATpxlWPt1DDuVkFMkv8a+oAOnzxhV5JSa1rYSg/n?=
 =?us-ascii?Q?+JQm9B5suSby4mubtinGqphYXA1KMPNZByZwec4WgR09W+MgXTb4VDlliGGW?=
 =?us-ascii?Q?IvX/u10E2P3CnfkFrrbpIYpDUcVdaowx9xdmhhpp24R5qbCs5anIRND/2kS0?=
 =?us-ascii?Q?M+K7qzw3S0M+7tbVDA6rNMiZSjoQVvrQB1IjBEgD53AWG1hQYVL5Lp+iJR0h?=
 =?us-ascii?Q?pck+OQVugPXnd/vn7Ue7m1hlNECBpbWAPU/ZiN30M1gTe2G5nYqd763nIyUu?=
 =?us-ascii?Q?gWEvXZeddMkM9K9VVh3XRGdwNd6Dm0uHY0mQ4sPxyYDnRurLrAxCXve1pHOq?=
 =?us-ascii?Q?pqh7/q4pNRokF6j+nnsNyL810TSK5d/wh4I1en09V5lmUEpjg5L9iXsAiuQ7?=
 =?us-ascii?Q?gnQiZAkRP+XYnL7TTVRzPfIotpX/lf5PALOiLyj42BB4gzwQewQcCzGN+0kZ?=
 =?us-ascii?Q?3jsCmPTnhe9TpjCBPat3qqwRWjna9yjvvqWT/qEuS9Guc8drPItoMLFX/19E?=
 =?us-ascii?Q?Fbf7Uucr5UziIHbN+umpOQDi47NrbCf9Km0JBVhCup/rh90Wo2z5Y87PAxnu?=
 =?us-ascii?Q?qTgrtFIn6KF+7CB3LpefFN/LXmXR1npmh0eJRL/q1Z+dc3K2TKzPo3GFReU7?=
 =?us-ascii?Q?yYWj2nDabRimx1DyusNZUPyFwzS48Wmf1d2/iYKESYZpn2NwRTgn2ElWFH9k?=
 =?us-ascii?Q?L8HxJhXJc+LIvUGoyCk+Tcv759+YbEcMvuDWfFWsu0N86hdXuirtZTvT7TW7?=
 =?us-ascii?Q?Ez7EWp41ehuVJD1nKU/sLdhBhr8WrUK89ZJx4ypQflhPhCfhli+SLwDkc4Bb?=
 =?us-ascii?Q?e+/LmgbXYwDWXLIO0hV/SEk/hKbPPuZadnc6lCekGTiucVPzw4IBZsg1R3ZN?=
 =?us-ascii?Q?mXZyRxTeXIIk6esotgH3b4kqvqy4htQ=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfa8017-7b62-4e3c-976f-08de575a63af
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:58:06.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lvm1JRcCQUn/q3Gk2KAq+lMwkg1BC7C1r4FQ21IZVH/caDrfK/zEFBD5ewU4Cxg/VPT3rP7qO+qKM583xformA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR06MB8335
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 12:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123639

From: Tero Kinnunen <tero.kinnunen@vaisala.com>

Python watchdog has removed all dependencies except optional `pyyaml`
dependency for `watchmedo` utility, like follows [1]:

* pathtools dependency was removed in 1.0.0
* python-argh dependency removed in 2.1.6
* requests was never a dependency
* pyyaml only needed for extras (`watchmedo`) and may not be strictly neces=
sary

[1] https://github.com/gorakhargosh/watchdog/blob/master/changelog.rst

Signed-off-by: Tero Kinnunen <tero.kinnunen@vaisala.com>
---
 .../recipes-devtools/python/python3-watchdog_6.0.0.bb    | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb =
b/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
index 4f56e81049..40abfbfa38 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
@@ -1,5 +1,4 @@
 SUMMARY =3D "Filesystem events monitoring"
-DEPENDS =3D "python3-argh"
=20
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
@@ -8,11 +7,7 @@ SRC_URI[sha256sum] =3D "9ddf7c82fda3ae8e24decda1338ede66e1=
c99883db93711d8fb941eaa2
=20
 inherit pypi setuptools3
=20
-RDEPENDS:${PN} =3D " \
-    python3-argh \
-    python3-pathtools3 \
-    python3-pyyaml \
-    python3-requests \
-"
+PACKAGECONFIG ??=3D "watchmedo"
+PACKAGECONFIG[watchmedo] =3D ",,,python3-pyyaml"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.47.3


