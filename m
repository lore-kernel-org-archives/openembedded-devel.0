Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CE4C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:58:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.130])
 by mx.groups.io with SMTP id smtpd.web10.46542.1746439111060796852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=DoJ6x4cX;
 spf=pass (domain: phytec.de, ip: 40.107.22.130, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvRb0NUa2D11Ikgsy+7iJgwiOxmh72+JAWZYXwo4haFdl/e+O//wenkQoqY4pGXO6qXtlVv06Hlr8NvzyKyqH+ZVCCfFirSC2IQzm+l082BoJXAtyyglhRVS2wb6iQCRe76CjYuRKHg3PRLpPYi4ajY75iFIv9VOHXTGB/jNW3sYTmSXyXTucwBh5vlogt/ZK5CMSz/Dvdn8HZqeYUamN6blPrdHR1kTifs7S2ql3P5PN73RlOChfGALaWloHvMeRxCGcGipMozkpg4MnTwL9B4jEa+pA5ETTMgGiISHErhjUSxGcQPxJKSSThTOd8yN1Z6Uo4yKIm2tHzLRy8SB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B9jwYOnzPizlGJjjTVBgYiFzo/E1Yq+Ck9bv/K5XLk=;
 b=i8hHi0Wsx5JENJfaGAmCQ96RNUkSN7SN/JTt2Mbi43nQKyhPHRheBp+5GbIAXh9MQt3j6XfNJymAYiQzn04NuvR6MkaOVRkDYp/HzhkrRadTBsl47QQe34gvv9LhZ2xZxIt1AbS6ddvOzvqSpM/o7YNB2DnhJiaMpUjHq557I94a+WFwe9SUPqlYtaxlYA5XSbrLykgqu4DlnPVW3afRHtI94evd+wxk0Hslm5aSho0BzLClLfwgbZL5cYIeMCkFsq4D5oj0X6eEKLmd0ekJkWosnPTNvloVHDJvEoaXtZgj0QBB0B0tCtaHUlNej40420XwXIdvAJApFgQmYkB68Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B9jwYOnzPizlGJjjTVBgYiFzo/E1Yq+Ck9bv/K5XLk=;
 b=DoJ6x4cXC3hBwgHRutJ58WknwBrZTuVw8f48xn6gf26ifREDH1kyB2kiqXN1d46gYJzY7JAIK2Hphpr8e3xXCLQ154zrV545dmwHNiJe4jRZBKVEahE5APR5p17zwClgF15PN3ip5gePHZaFWe0XLQ5LBPXFOJAg547q/h8QX6kdPKhW1se0Kio0hf5l7Su0rg5Jp+xm7M7dcQ4mz0kRwacRz42YOCp3pQOFLI/adci3lpOaAZFPkB2qacAqejSyaTEzJ/TKUTf3PmaY9xLeVPoWuk03cV4qxc+5mYEUKcUaZwcFqHOAyiyCVFtKI0/Cz5VYRQm+BN7BvzbAe2Yr1g==
Received: from DU7P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::25)
 by AM0P195MB0689.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:16a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 09:58:28 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::94) by DU7P191CA0017.outlook.office365.com
 (2603:10a6:10:54e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Mon,
 5 May 2025 09:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 09:58:27 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 5 May
 2025 11:58:27 +0200
Received: from llp-anderweit.fritz.box (172.25.39.133) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 5 May
 2025 11:58:27 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>, <jonas.gorski@bisdn.de>
Subject: [meta-oe][kirkstone][PATCH] lmsensors: Fix build without sensord
Date: Mon, 5 May 2025 11:58:15 +0200
Message-ID: <20250505095815.15137-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.39.133]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039230:EE_|AM0P195MB0689:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a99a4d-c457-4551-31a1-08dd8bbb6241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?23C0AAborhYYVzPV/l3Tru/pcfTFaSOCh/Al1hY2G3foIRic827d1Ep4TNvD?=
 =?us-ascii?Q?q8XzvdTcuLk/7DojOWATFmZiUtPtzLMFxWGvRLIMEU+K+CgymHXqZScA6vI/?=
 =?us-ascii?Q?PcGtNxFeGRm4fW0jboj2MjtnjDC7GkcB9pC/ili0KSKsJAwL7oZq5t7lEVn9?=
 =?us-ascii?Q?P9+PVSvCIhXl54gt4b2NgS/CyvVGVR6I2ADwuY/6394NNopDhH5biPaIr+ML?=
 =?us-ascii?Q?Yj+hl/GUteCOWCN2j1vX/mfrP+k2yWh1LDBIEbAH1yh1G3JytUEuYDdzY4oj?=
 =?us-ascii?Q?p0Ltle3KjdpaYpcFWlReoUt202I8TKHVwx9mKHOqAlngQQewwLZKiSHWBNZG?=
 =?us-ascii?Q?RDs7b9tJ2UygKEwhArZzify604tKDf+Epf6oWgHcrC0dmiOrIN6HG6WbXgvA?=
 =?us-ascii?Q?GyZ+sApzI+9+4B7F006BKBobaT/SX9BTGqeXwS01Msqmk7QTTY2k5kKf0sHq?=
 =?us-ascii?Q?PsSKHxRqNMbCX8ivWU1NFMIn0pDpTXrSvPPMgZhd+jTx9CSwVCLSHAqaSYli?=
 =?us-ascii?Q?W1eXH6Vg2tdmV0EplcvjfpH5MXuF/M/KHxkckY/xkWF9jrAWf8SSejV6i8TH?=
 =?us-ascii?Q?WhZzPuoKcILwFjPN4M3V9DLf5RaKtHUr8I9ycStOfNpMdMXhMAIgW+w/3pVW?=
 =?us-ascii?Q?uj02Fsvj6+mVXz+qOfn1k3JHxM68OYSSkYtdBPO2+pdHP4RH0miy6L0EH3wc?=
 =?us-ascii?Q?H4pXa9nwhOYVwFgGe/RQ4wa+j4iQXD1isnkR+q02DqerbP+Nvfkb7jxNvM34?=
 =?us-ascii?Q?MOeDYd6QUak7ih8HeeC5+TXsPI7QKRi3jo3k1g4dxFwT9mse6iN7CwAvi/T4?=
 =?us-ascii?Q?RN+MsFAOM4tV+tTTH3JmXIUoELPxIPF6AcZbFqzR/sUZl4lb8PZyf+s9BMlZ?=
 =?us-ascii?Q?7BhikCeGTBg8rzn5DDk2sRjPfNYK6sNflUR7NCWsvk7Am5uj0xYOR6zQofdf?=
 =?us-ascii?Q?W1QqUqm2M/qxFQe85rMXb6swaybd6Eid3m499508+dgynxy9zOIljgBU6Vbl?=
 =?us-ascii?Q?FimPKzEX6liE0ZWsg1OjUZJISkVSDHb3mut7Qruzfk9mBTsjxH9eGQEY/evP?=
 =?us-ascii?Q?ing1DP4PAVnbNAmwTI+FK+GIpo3F1VyxMYv5Qts/VjTMfcWGTrb1x8qhBznR?=
 =?us-ascii?Q?474rX4ORreci3ueHsEsuKy6RiJ+L0fQujy++lu1GCgG1jKqwfaiWR8oBKZDu?=
 =?us-ascii?Q?AQM+DFKN0JcJUTMZFu8mM+Jy8zaxBWj4l1oNymKjXLz7iKcEn2W2uK+WzSS/?=
 =?us-ascii?Q?/4K8X/oKqznX6U4KltaFxwNtQUhEQvf4dFeUJ3BG/mgzEs2iOp9FGo1kc2CO?=
 =?us-ascii?Q?VThVAqygvn4ORfnSxoA1dNZTyfBRW3ue90QEMV3mb3ABRyPfXayRv7QjypAV?=
 =?us-ascii?Q?p1T/y8AwlDWiMZVa3FZC9E3bImOh4wUNSqUIIblk9VHb0A58dSXlfyHJEP+U?=
 =?us-ascii?Q?KM306p6Yyxkt91vNv35/daSz+daHxC5kZJZJkD4K0ALD47yOn86a29OKkZcn?=
 =?us-ascii?Q?FhgRuyl/pCNgkDhQLFxrJO/6ppWyigr0Ix7Y?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:58:27.9372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a99a4d-c457-4551-31a1-08dd8bbb6241
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0689
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 09:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117302

When building with sensord disabled (PACKAGECONFIG =3D ""), do_install
would fail because it tried to build sensord which was skiped in
do_compile.
Error log:
make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.rd'. =
Stop.

Avoid building sensord in do_install by explicitly setting PROG_EXTRA.

(master rev: fc88c96c4e40d9dbc6097c4679ac79ed55356730)

Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
incorrect GCC header dependencies)

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/re=
cipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index e3186132c76c..6e4cf29f479f 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -48,7 +48,8 @@ S =3D "${WORKDIR}/git"
 EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir} \
         LIBDIR=3D${libdir} \
-        CC=3D"${CC}" AR=3D"${AR}"'
+        CC=3D"${CC}" AR=3D"${AR}" \
+        PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"'
=20
 do_configure:prepend() {
     sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
@@ -59,7 +60,7 @@ do_compile() {
     sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
     sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
                 ${S}/lib/Module.mk
-    oe_runmake user PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"
+    oe_runmake user
 }
=20
 do_install() {
--=20
2.43.0


