Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57556C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:50:54 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.93])
 by mx.groups.io with SMTP id smtpd.web11.14372.1745499051828801301
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=mgYYQnTx;
 spf=pass (domain: phytec.de, ip: 40.107.20.93, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1IIBAiJBayj/iSTO/D9Uj70WZ360cnFhsLFbgLNFoE91Uh56nYnBVUogqH8OcMi+cy5zfQBiNU/CyBK87tkg7Fbyy7XwT1TnvHmFmApU9hMlsfFvbqfa5mP/ZBqKwJO2WzCVxt0ger31mUwwSuzmI9c9sMMHdiLfagWMqHELLmdbfHJaTXjxV1vG5KD9CqOqKV9oXhLvsuvvCoMlY8h17kJPIvNE8Pgr1t+bk82v6YMZrUBpfq0qsoupAzENrVguYu3IYgASAdBlFupTuc3XXY/yWgDCBzhDvQxSX6dVd+LzN9A10kmPYovp0VITFsazUggYsMCTtfZmy7O9FOaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2bzINXkF94ktxppflJ7e2SoID+vzAh9zUvqcwViPjE=;
 b=ZbdaKwoLhmZsC2tJ0ZTm7r2CTNwg/Lcj3GJEZrmMWWP7yGu0+hbDDkP9U2yoXD9Q3GTDaHxePKQmvs0J9bCNr2UE9Tcp8LYCLlxaBmYdy3q/bTBHPULY0JLGkMDMZ1Sv8ra6f/wXbcEH7lzoh3QmSstgKYeP+R3/N4RSeYQmvwKkvRNBfC2BK44oTISRbco4f44OGczXBnvLuhqGwDI2wDsGy5vCknG0mPt0KyePB8u1qX+h2zygH/vXDWhQn4m4FmjBanW0J9NJ0x/Jr9WVlsb7y9/lXqiHTDZzYyb8beOwX9NQUowlqFZPLzO4OYdv+fhB+zIlq10fpM+TxOGgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2bzINXkF94ktxppflJ7e2SoID+vzAh9zUvqcwViPjE=;
 b=mgYYQnTx3jkN5EU58CZpozDbM5zsZ6qECVzBfnBr6nAtQzAsJq+bWQi9kuM6idlUKbwCvSZhJCVruxQS+Vp7SXgxRBUhBWHcAZ2ic3fpuq5rpXNjF3vLvLLGUItxfyLIPHX6ZNDOEfeEIOF0arzOqnekv93HIlTmlYLD4n4q2r7S4IxJtS4CUNBDh6m+PzxFX1cFgCgRP5xnya94uSkOYNlQOyGgEBxXK5W3VhxYW6bO1ZB9096gaKjeSxFZwjz0732SF81bYf3csYA0xblRGy3mM/i19YKAfD3S5YyfB1SaWIy5XbO5+GW04mGQNe1dt/FOs3foQK+Z4KlMjzcm/w==
Received: from AM8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::13)
 by PR3P195MB0746.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:34::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 12:50:47 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::10) by AM8P191CA0008.outlook.office365.com
 (2603:10a6:20b:21a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Thu,
 24 Apr 2025 12:50:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 24 Apr 2025 12:50:46 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 24 Apr
 2025 14:50:45 +0200
Received: from llp-anderweit.phytec.de (172.25.32.133) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 24 Apr
 2025 14:50:45 +0200
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <Haixiao.Yan.CN@windriver.com>, <y.moog@phytec.de>,
	<upstream@lists.phytec.de>
Subject: [meta-oe][PATCH] lmsensors: Fix build without sensord
Date: Thu, 24 Apr 2025 14:50:34 +0200
Message-ID: <20250424125034.73053-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.32.133]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|PR3P195MB0746:EE_
X-MS-Office365-Filtering-Correlation-Id: 66212a82-0412-4409-d7a1-08dd832ea1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0KEReKdCMxGsK10efNofvg4j7bv8Yzdm5vywjEXJ2TgE+fH1R9ErUm9vN3zw?=
 =?us-ascii?Q?hr9HRrfte2irNcC6jfQAcbHmOSI5kNRI1aIOb3eQlZmZRH4E3WSiAzrjnLLa?=
 =?us-ascii?Q?p5J/CdV/6cxtyN8phF8RFrz1juMqIzp4x23SdkZxYeIedOOpw7osyuqLOK+n?=
 =?us-ascii?Q?RPZkChtfJ5jQ9qGrA6idOW/LfTES1+fYdmvwf7EU4ZjeZugELP2SLbyHVTbN?=
 =?us-ascii?Q?AtLREaQmnS4OzU19vU/d5AFYkCYlPw3gYqx53Z3QU5+GaGUgzktodnSESj69?=
 =?us-ascii?Q?58DPdrHFfQsu6jKu5dgOvqzqVC+kHQngNumx1vRlyBcrCQhAMyi9gTDrvxmW?=
 =?us-ascii?Q?zFbkTaGElJAUagSWuCHfazjURsFFqyeW1C05ci1hkFBC1EXyiXEb6KdAxFst?=
 =?us-ascii?Q?b4Yb0/gqizt7WXXYLPlGOzT0eI3o+OhqJyrvvomUoPv4kCp3DaE2ujFCtBlz?=
 =?us-ascii?Q?g/SdApbX528lRQWOF6WT2nCRF7cgUBbV8OeO2zfr/Fu2IZEi6lJ5/mbZkUJj?=
 =?us-ascii?Q?Ia9N1ASrZz42NK+33WmhxG/chbrm+VtfWOCAvgZPwK9m+Q4bSP8JZy3QB6OP?=
 =?us-ascii?Q?SfUcKg9EHNQyzvwqe+QoqAvvWRAubKtDPLE+Q4YTC6FPUsV7KnyhPOkVCvk7?=
 =?us-ascii?Q?F+cpOjG8r2EfuKm87lUfxctUxNs9mGmzRTng4FepJw75eUawNKG0srmr6rx/?=
 =?us-ascii?Q?lEdLR6BQh6DMq3RtSrTo36r0r7LeAQI1rr4Qq4hgLqST3JAmLI7/fE7kAnhj?=
 =?us-ascii?Q?b76LitJ68f30wEO97jpLWshSLRYSSBedsw5KY0Xy9XVUFwUxdPYCtcJ7lXNl?=
 =?us-ascii?Q?iZ7R75BKr/eXjl86Mjf1Sz+7vbC7TCplrarnLkEjChNe5sDkJYjQCelmwpBq?=
 =?us-ascii?Q?tKb4V+sKErnjOZr5EZKU8DMehmu5S/MZSPGRR+cfbMHfc4lDineFl0Z905il?=
 =?us-ascii?Q?3bj0kVTLQ/2rgoYyvs948L25ViXBH4eotUemOl1pvXerTw+Q+rX7lOlp+GYq?=
 =?us-ascii?Q?TmBVqLRdNw7Y8rB2iZmCLFdljz4AU003AMhrm+8hBBUDnAyulOHSAGAk5JxM?=
 =?us-ascii?Q?cy7+iYrTj7eF0DjdO1B67sgDDVDH3sYWAv6tlyvAN6Iemulv8TuhNoEBQVhC?=
 =?us-ascii?Q?II2c3aAdcZEKdLj3JmFwNybTjFgRuoYrRTvao9OIEkc+DQnnSryFoYorkiyv?=
 =?us-ascii?Q?FaWjr2o0u/YIyusjEreRiA1IuTkAD8G4iN4i+lpIi+W1nAN2oXaxTnodf8MM?=
 =?us-ascii?Q?Sz/EjsuvSgkhmWSO3zvD9sif8O2gbsCOEZcv6DN+UrAHJNcY4MnDx+QU+kyl?=
 =?us-ascii?Q?T8PCFFV03ZC15e/7xl3Twc0/tdEh4R6u6WOfQEAKX11Gn5CJN2SArouis4vf?=
 =?us-ascii?Q?cquYOMOoL7glXxbGlB98dcot0ts28jTDA1T2vAJceI+0BuDwMOOksSRkjwHV?=
 =?us-ascii?Q?xJjv1Mglu3JXeUr3P6pPhqkjMACPkE753eIujgoOVHF55+6y1v5++14uWCAI?=
 =?us-ascii?Q?9l7fbEG8XT8f/H/pAFaU7GnyZJtp4gM7lXR+?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 12:50:46.1972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66212a82-0412-4409-d7a1-08dd832ea1c7
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0746
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 12:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117092

When building with sensord disabled (PACKAGECONFIG =3D ""), do_install
would fail because it tried to build sensord which was skiped in
do_compile.
Error log:
make: *** No rule to make target 'rrd.h', needed by 'prog/sensord/rrd.rd'. =
Stop.

Avoid building sensord in do_install by explicitly setting PROG_EXTRA.

Fixes: 86b20b84ec27 (lmsensors: Clean stale files for sensord to avoid
incorrect GCC header dependencies)

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/re=
cipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 9b072d70b20e..4df03420ae8f 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -49,7 +49,8 @@ S =3D "${WORKDIR}/git"
 EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
         MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} MANDIR=3D${mandir} \
         LIBDIR=3D${libdir} \
-        CC=3D"${CC}" AR=3D"${AR}"'
+        CC=3D"${CC}" AR=3D"${AR}" \
+        PROG_EXTRA=3D"sensors ${PACKAGECONFIG_CONFARGS}"'
=20
 do_configure:prepend() {
     sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
@@ -60,7 +61,7 @@ do_compile() {
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


