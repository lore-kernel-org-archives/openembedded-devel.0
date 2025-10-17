Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7430BCCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 14:58:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.128])
 by mx.groups.io with SMTP id smtpd.web11.17859.1760713112915837873
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 07:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=TWNELXuL;
 spf=pass (domain: phytec.de, ip: 40.107.130.128, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eW63KtxCwwsgMcP/2sBjiKavIwaehefVrsALcsoOnorLFr+8ewx9xP2jE10XxonAnrqgw6dREuv42TLaVu2g62q+RNV9X3fnzkvXR1WHvzRYGoTzlm23QsxMBQKupBCG7vhCrJXBTcCBbxdH7Kmbf1KkjIrxgiC6DxTQUzipGRaea+jmBCDsSzITOWSEtDh3lqlHTZynSfaJ9G0hhhq6/2ad3/cnR+PiACCP0X8tG4agKtE1hwsUrzP3evSh2q+73skUwh2+O+pu/1IvFdXrxP/ywPCjeJP3D0RjmPq4itLnqKVzyVUBKIdUA79Rksz1Ox1LBaPskLJNarXkCCBCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODXCf5nJQBcbgpfeC8kPHqY9HhMRoWosNxj12pPcDug=;
 b=Tn1HgeaL3TNRPZX8+fYzC5SUOmdRDUQ6mfEkleMN1ko1lYmEGaA8IJUi5h2fGNZbJTU1q+KCIF/nDFL0FUiEY86iQTB/QyXYAb0p++N24hs7c3A45hPYr0ecIBKTkC686RBAUiBQ+QrgvnhCI6COoCVilpqYR0SfAP8rWz6OPV8920fW3cMkytsWFzIeoXbpNeHdhin0oNf2SuhXnZZyTQuqBP/hpgnu6H8h1T6zI7HyUprQUPWBFUe9P0/HS1X78K4mpxqMMmTSO62eepj8Qf65g5/E8d99ZGue7aS9+d/2mzzNuAIxl0vr99GfFCGADRu/CaE4aDwusUmw3hmtgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODXCf5nJQBcbgpfeC8kPHqY9HhMRoWosNxj12pPcDug=;
 b=TWNELXuLtHSxZ2vAqro2AqagLahlOkz0UiERyYmFRiJFFgXm8NqeBjvi5BY3ZbwfkDFcy/y9TMAMsJK2xvHUCr0EopaUwf15U1qQQoGgVcF/Czmw66A2XwDyXnH+43BOBy1sXVuB4QtKnLfqfI/F9LPxI8CEaCLkeVswCb4wbG9hpVaRTn85kj0kRLO530HNWruLHPW4ieEH6HaHlwFUWW6qXalkS+sSTjiABNSIJLFy6Z5+qiFeWzlJnaXfl8AuUUxU0zqHU7Lm5tirrpitWsOKbN4mcPcoKERDD6alCRUhTMujL5pWxPkfpO+qNHfUKSEn3qWuD1n+xh8I7he1GA==
Received: from DU2PR04CA0297.eurprd04.prod.outlook.com (2603:10a6:10:28c::32)
 by DU0P195MB1403.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:343::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 14:58:28 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::60) by DU2PR04CA0297.outlook.office365.com
 (2603:10a6:10:28c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 14:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 14:58:28 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 16:58:27 +0200
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][walnascar][PATCH] kronosnet: Fetch version tag with BB_GIT_SHALLOW_EXTRA_REFS
Date: Fri, 17 Oct 2025 16:58:18 +0200
Message-ID: <20251017145818.2019373-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|DU0P195MB1403:EE_
X-MS-Office365-Filtering-Correlation-Id: 670970a8-ec07-47d7-2bd6-08de0d8da181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uLRpC8In/IIxElQ28iN3z239Rm/1qQVmz42s99TfntAsc3yis2SBabtmQZYQ?=
 =?us-ascii?Q?MX/cJc5BYChzdroQwijoL7VExYHLJK3C13uKwTZtJS+ntt9696KDxD/cIyE4?=
 =?us-ascii?Q?epx6oEmyfUIwrdACoxL5luXtuevAvYVMROZn34KqApI+G4grzT3UdYVyt9Cj?=
 =?us-ascii?Q?m73CghEBzKWtymQ4Uq6L8tU+7NOeh37eAHUh2QUvoaIA9A4hHHQ9rIu1xhF1?=
 =?us-ascii?Q?frj4Ce14jffayGroGLkV8LuYsQ5YFoWCn5laztlN7vlOvUQYdfaT6zHfzZ09?=
 =?us-ascii?Q?H+MUpqwIjw2BqdRcTb5kiVIsZZE++0KAPo84w45BsE13WXXAe61v5be0+/rB?=
 =?us-ascii?Q?cW6he76lGLLquNbUtMWtVl6AFOYwRzcUIn668Puy9yMV8N2G4Onf3y6OzleX?=
 =?us-ascii?Q?P+aXeXJgUCY3z/iPKh2/CILLiI8B+JQznX1CQa4nsYRwjW+V+wU4WOuiT6cI?=
 =?us-ascii?Q?hQkyW7zE1FKFpDsIqBzRp3Ah3pbndiVwZu/EAqpz9wlY3OPCxFKC3/Sho6eO?=
 =?us-ascii?Q?l+MDK6CplnhtWHdpOMAcwRlpwjSIGToT0a4vOH+Tb1CB8gPMSrDjJGKW0iv0?=
 =?us-ascii?Q?WnbQ1WDVkkC2Q9TzWxCsr7oWc3UBnNDmKQec3+XzH1mJFhj87KmL1A9t+skB?=
 =?us-ascii?Q?lRAlrOiHPH8d3LWES5IA5Zfj4FJEENdkVdpftO5veQuGuqc6acM1ssgflde8?=
 =?us-ascii?Q?sIOyJq0wNV4qpEFR4ufYnBLIY/9k/9He+oHHrJUZb6WaRZ4kppLJeJvbz9V3?=
 =?us-ascii?Q?fOs2g3FoXtFQYgVdF1QL3eFVZcstixyuJKnIOcIdW1kocR90tI8leUehL7hs?=
 =?us-ascii?Q?sE8J79ThzayW9+rZNsNx/qkQQ/2zJBX8V/C6QHUu5rkAr6s0B2adUwQ6v5gS?=
 =?us-ascii?Q?0yWzkR7gvjJvgXpH85DAm9R2sgX20Ws95+cufOYeF79kGGXRoQla18Zbe8UG?=
 =?us-ascii?Q?73PzNgWCEvZeaPq7/AbAV4DAY69opR/ybOaESEERKg6HaqcQiwoHQPsKmjia?=
 =?us-ascii?Q?0PPfhDO3M/j37xl+wifL0cnwDNduevKe6Gn0xULDlZ1G53BItJv8Hq8ztB+C?=
 =?us-ascii?Q?UKRwB70FgnivhnytAN/iwmkFc8Pkxfga/aLuVyIb++f1FKjEGIkTs18lgcRy?=
 =?us-ascii?Q?cipvAe+WoCF95uqDNFD+hYEiHAOjKyI5+7J1/Uf8EVpH27x+4aIp8ZFA62Yq?=
 =?us-ascii?Q?okMUGHn6L5onChqmqM8fq2Es7dtuh9vvXvqkoHhhkkGv19Xd4jK95cPJI86U?=
 =?us-ascii?Q?4akObS8GrA1uNi5ZesIc0X7U3kvEC2r0zfKQrwh5/ErYkXxjyLYEAVA/vWO9?=
 =?us-ascii?Q?R2Ru7MwqNpv/lYZ3rrUdkOlVjBFmRGTN8qk0lQ+hgtlsXu2ywr/L81E+y5Dp?=
 =?us-ascii?Q?gMvSLWOo+BhGoHrOq8EqVSe2cgFsSEI57zHtabxthB1sYjhhXBq8Hbl27fDX?=
 =?us-ascii?Q?H6vfsubxL1vvQESIWRLCLauWUZXGp6NXcL2i39MUyBsaavWNYblJCF6Z//4n?=
 =?us-ascii?Q?QW4n7xNWJbTfSTj+HUMU1IyFdtK0BSwVHqiK3WqH6xCWNciSLM1FznuSFSzU?=
 =?us-ascii?Q?bIQiMMXlNhDQBP7UZhs=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:58:28.3618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 670970a8-ec07-47d7-2bd6-08de0d8da181
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1403
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 14:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120767

Fetch the needed Git tag by using BB_GIT_SHALLOW_EXTRA_REFS. This fixes
the following autotools configuration error:

| build-aux/git-version-gen: WARNING: .gitarchivever doesn't contain valid =
version tag
| build-aux/git-version-gen: ERROR: Can't find valid version. Please use va=
lid git repository, released tarball or version tagged archive
| configure.ac:22: error: AC_INIT should be called with package and version=
 arguments

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb b=
/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
index cbd5e7a0fd..06807bef47 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
@@ -16,6 +16,8 @@ SRC_URI =3D "git://github.com/kronosnet/kronosnet;protoco=
l=3Dhttps;branch=3Dstable1 \
            file://0001-links.c-Fix-build-with-gcc-12.patch \
            "
=20
+BB_GIT_SHALLOW_EXTRA_REFS =3D "refs/tags/v${PV}"
+
 UPSTREAM_CHECK_URI =3D "https://github.com/kronosnet/kronosnet/releases"
=20
 inherit autotools pkgconfig
--=20
2.25.1


