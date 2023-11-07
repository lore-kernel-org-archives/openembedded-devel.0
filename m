Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C82C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.53])
 by mx.groups.io with SMTP id smtpd.web10.5514.1699341179570043504
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=b6HaqmUo;
 spf=pass (domain: axis.com, ip: 40.107.249.53, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndyRK2oEtuL7or1DBIYcyqu+WAB9rIHPBVtMnyo7Qnklu9RKTpkl+jWGY3Tq/EzFn7bHRWSdCFyW4KpUpQQe2BocGwSvJZDByECsAk3a0zVBaUDbaungTpI5kG+D9OjEpdI6+u6/CnUXPO5hZN7k8Yzk4o9DEKp4t39a1vow22CjlvzgsvbiJSccikLGJ1CAIyzQJZ7NQg/SohGOzCLJC3D/ogLXKHvOoyv6V5q59bJ0dJX2g9fj0dAvxPRX8LEyr6HIu9iZKnWRfiPmKnNV8uNQLIS3+t/uqyoRdW/++B3n6lKFhA6n9nChWofAW2Ebbh8OZMvpgXLqkt3daBC59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk0esRsVQWal11lTf458+zrx/RoVu+joJrp8ve5nn8s=;
 b=FLySsXYD0LglJItx6iqOKoSKM4YDBQ6tpn1yTzMFv7IuL30Qxq8uzqffV2F2xpaWkZtUt35t7uceH6ebNxWYRDhhCOUwejK9fxDq/YaNdMIgYnuEIQ/dyI5mRXo288V7I7W2bsBCF9sGLgTP092NPnko1KjSjnfGZtreW/W107Y5oMoZ8ohay+4mntmv4bFogECQRKBLukhDcIq2oTV/q/cWbKE6pt4tpVC+Nd2oOP+RyhQXKAXYeUCUqZ92aDU6WhnMnLx1P3lz/HYt6oN0xc+sHGY9cGjJlCDf7FwEDeOLjQOwNlqfZ+VTqgfXKbfNNteS7zj/foBXjGThcI8AVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk0esRsVQWal11lTf458+zrx/RoVu+joJrp8ve5nn8s=;
 b=b6HaqmUob1rHsSTZCnlepJLkY/nPYTN2gcI1rJrNY/zHwHdvpkDW+aTEJTByg3WimMbi/B1LY8Lo6I/0ZFCIFBExxbzLio6TXoNldeScr3eIaPhEtPKdHFuTZGLVroetjOAiMp6rIoYhy8qLAtl/xr3bAhMnS6lehxM27IqjSmw=
Received: from AS9PR06CA0481.eurprd06.prod.outlook.com (2603:10a6:20b:49b::6)
 by PA6PR02MB10849.eurprd02.prod.outlook.com (2603:10a6:102:3d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 07:12:50 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::5f) by AS9PR06CA0481.outlook.office365.com
 (2603:10a6:20b:49b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:50 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id DC06D1C96
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CnYO1519722
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77Cn7O1519721
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 07/16] mksh: Update to 59c properly
Date: Tue, 7 Nov 2023 08:12:31 +0100
Message-ID: <20231107071240.1519631-7-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|PA6PR02MB10849:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c3377c-c3ae-441c-73cd-08dbdf60f3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	giOMs+zoX4VOgZ7dnJXJtr+D/gkFoRhbcczCmz91YRmQimmzU1ID+opeT/vMcp5pGLgkfoEDWhV6LSexuKDECOcqbCiWcLC1Iff8J+7TxipmDMo5AAyIdMnLBymQIkxYqJXUhhKCYS0qsRDSyCt/9WoqEKEzE1nYaUhVzj12zm+3B5aAIjhUPx7jOP3wJQKdQ7dW9ldjGxE7O0ue9qU5TOQdaVVal6tnvyKgjDYWwESEjfjo8owPvZaU8knp8iDqpappQiIWuKe3bbvjmkvdAnDdAGZm+l1SyYO1Nxp5uYoNUwi3W37tWu6TOQslIcTGqqgkFE0IYeq7nEXBUh35+b6VCBtoSVDGLYQOqhhKZ4YSNUAm8twGtUsw1w+xTsJVjr9Hz3ylvSXViVfb+LDQRG7HsANju8JRtVEHs4YtmgSgYJMPXchHqu4Ln1rTDRVsz/XAdHa03Jr+NEdRVkk9YSX94esDSxtnA53LI5MFcfXX6XzQDvm/F81ABMJoi9LJARaBFY4BlWatMkVXo5ZRuPWoyVdTlFQkXFHoYsKFoS2oMNKGF0pln6wIpFEsmAK+TwRWV2Ktt1P76/i0biPLRd3f5apF5nQWXuw5YqMvZdhz9/SyXiPyeHyISpLnawJ/QZ7nwK6Zcex1rzhYgLMyPrq3q27Y5aV0Gfsuo3XACND7ZlI3RrLiMiqLccQWr99VvWfFaoU3hhFVWpfIPp0qm9Wbi9KrswaD3joHljRp1p7/lytFt30F2KNlvD6J6oeL
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(336012)(426003)(6666004)(2616005)(26005)(47076005)(41300700001)(1076003)(356005)(81166007)(36756003)(82740400003)(15650500001)(5660300002)(2906002)(83380400001)(36860700001)(8676002)(8936002)(6916009)(70586007)(478600001)(42186006)(316002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:50.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c3377c-c3ae-441c-73cd-08dbdf60f3fd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10849
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106431

The "update" in commit 2df786211a only changed the version without
actually changing the downloaded tar ball.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-shells/mksh/{mksh_R59c.bb =3D> mksh_59c.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-shells/mksh/{mksh_R59c.bb =3D> mksh_59c.bb} (82%)

diff --git a/meta-oe/recipes-shells/mksh/mksh_R59c.bb b/meta-oe/recipes-she=
lls/mksh/mksh_59c.bb
similarity index 82%
rename from meta-oe/recipes-shells/mksh/mksh_R59c.bb
rename to meta-oe/recipes-shells/mksh/mksh_59c.bb
index a45107316..e3a8ca8b5 100644
--- a/meta-oe/recipes-shells/mksh/mksh_R59c.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_59c.bb
@@ -7,9 +7,11 @@ LIC_FILES_CHKSUM =3D "file://main.c;beginline=3D6;endline=
=3D26;md5=3D6efc2c249328e4d2bd3
                     file://strlcpy.c;beginline=3D1;endline=3D17;md5=3Dd953=
f28f0c43ee29e238ec9bc15df2a0 \
                    "
=20
-SRC_URI =3D "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59b.tgz"
+SRC_URI =3D "http://www.mirbsd.org/MirOS/dist/mir/${BPN}/${BPN}-R${PV}.tgz=
"
=20
-SRC_URI[sha256sum] =3D "907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4=
d753bfb272e0e6"
+SRC_URI[sha256sum] =3D "77ae1665a337f1c48c61d6b961db3e52119b38e58884d1c896=
84af31f87bc506"
+
+UPSTREAM_CHECK_REGEX =3D "${BPN}-R(?P<pver>.*)\.tgz"
=20
 inherit update-alternatives
=20

