Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC77C04A92
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.57])
 by mx.groups.io with SMTP id smtpd.web11.5143.1699341174026793876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Tgyhikbr;
 spf=pass (domain: axis.com, ip: 40.107.6.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUcb4Z8xErQmSGRJWpdrd3hki7s7zB0Z/WSt5amwJXfOgFmvbotRU9T76tNddtz3xvwX2UWSo2GxncQ8MogT0ZdBCbF5RLc2DEcodzhbbLqAWgC1V7b4eD2KzQLk5CJ7OPpxNXS+YS21Q1Z77MQZgkKMsZFinJNtVR9vzX0RuTwZ6BwKdBCAagUnEnQ/8ztFrsm7I3bwlCC5cFyiZdN/+e3G+ReCfIyrK948Iw9U4nsg7Kuo7Xsye6zGZx+v7lYZ92Rv9cGZ2Gdaw4wVTouShHPaPxh/i2NVzl3Jb14ft1QCwoMv+xvcY4a57fqIpmb59BvDYkm+MXxoZz5OL8C4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxRL0FwBV9HlmPqv2yf5PB8eKNbrgjnCWdGVnzF6cUM=;
 b=HuFNB7lQwWfP+RAqEIQjVmBcN6Xp19oGSQJfhOVjWzoBEpRYDQmBxevme1TILYofYre6vCv9ep4W2rWkxbJKYz2+1Jeg6hBehBhclmqwcW6mxzkrmfCOfSKBdl49GFj64nhccNvO1Tu3wkXl6CRL1lF0m0lX+f9rI5NRx+h9xTP9TUedVHiK3xUWeEYShuuO68hOw40jtwUgMgrulLc7mQjlJuD+Z1u5HOc5GuyEvNWI0ZlLGAvjZp0Ecf5hdkk5//yAhmT8GU/I6QdlC9DCtBTgY+aiAdRYHTLpqIGyfYcKTtnYhQgjuna4quZMqTHQpvF71ZK++aLlUTZ3EP2aHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxRL0FwBV9HlmPqv2yf5PB8eKNbrgjnCWdGVnzF6cUM=;
 b=Tgyhikbry8juCxA8oBu2xFEs8jgNiO1oi3EXbnxRYDQ7onJiWHTSAYr2ykvL+8aPxDT+9i9yCmdSt6TGRhpIlC6kilwjAoYB4MVZYuIimyDmdjfjPGoffZ/2IUgo7f94ZYs086UWr7u/BM/h9XYXNhLxBQ3vIkl+1tRSXd3CGz0=
Received: from AS9PR06CA0483.eurprd06.prod.outlook.com (2603:10a6:20b:49b::8)
 by AS8PR02MB9113.eurprd02.prod.outlook.com (2603:10a6:20b:5b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Tue, 7 Nov
 2023 07:12:51 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::f8) by AS9PR06CA0483.outlook.office365.com
 (2603:10a6:20b:49b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 07:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:51 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:50 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 4D1DD1C96
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CoLv1519734
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CoJ41519733
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH 10/16] gst-shark: Update to 0.8.1 properly
Date: Tue, 7 Nov 2023 08:12:34 +0100
Message-ID: <20231107071240.1519631-10-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8PR02MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c81622-54b6-4179-09b7-08dbdf60f496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E79KMC766wB3SYF2DwZY/00j+4eiZ+cMItUjkrMAxTxnnB6C/BX2awya4PjXVZDWKNtqmDZgtyD4JsSluSL7aOAwUgVgW4M98S5AR/t4QiSB3W1gnODxc+awoUSMSLu08YbDm+O8a9Oe3FilBo6pDq79R6KMzNs/C+rPT2ZPXSLaK1MRKlbe4NjM1TKuj6rWe1XUhRcVDFGV5sUvzRBoLbm6AcIP/+3iCdzltGnQCKtfhTBFH8ezNqCsFcfYVBe0yzr06vL5xBWgHC/uOK0SGNfknUunJxVhlH3KE8GAdj8+zjW8VEVysu1kM+atu4uZ6z74AQfaR4AJY+4g+IGTnnV4XcoiNXix9v1q+JbvtqpMxeaHa/cY91pAhyvfemD8/q26wRCOOjHnEJ0EUzOQDWeetWZO440WHe2NoNHNArhZgMqbZxuw1SNMpMmtpYOmPYEK86gXpkvQjNwLKZYHBTuqieAaIWKWdqd0A8EakH6ReYDmUEZtEpKKq2O+P82JBtPv7bg2M2dT+daIm6MBZTPURM5AwbPIIVLLIj12YCxpV3waPRkbzNQV7GNSLo6AWerNcWsGY3aLwSOSQVpnqQDzTfEs83zLT5kJlo+PUG4/AiEh1VtspNMs4vMfMWesU72ohuw06S633CrhPtFGh5JHhgrOirceCNHfwectwLP4WYVaRD5JFzBzVLX+bXxABDCYIFiOOiOppnLgt2DsH+EQJuxldRpSKSoOpwyQccKITmm4cfWQ4fnmQbrzO26a8R7VHR7hQfV0xculYVBAwQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(16799955002)(8936002)(8676002)(2616005)(41300700001)(15650500001)(5660300002)(26005)(478600001)(6666004)(47076005)(2906002)(82740400003)(1076003)(81166007)(40480700001)(36756003)(83380400001)(42186006)(40460700003)(336012)(426003)(356005)(36860700001)(70206006)(316002)(6916009)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:51.6072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c81622-54b6-4179-09b7-08dbdf60f496
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9113
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106425

The "update" in commit 60726d77d5 added a SRCREV rather than updating
SRCREV_base. Change the recipe to actually use SRCREV so that it is
compatible with future AUH updates.

Also specify the version in the recipe file name, and correct somw
whitespace.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../{gst-shark_git.bb =3D> gst-shark_0.8.1.bb}  | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)
 rename meta-multimedia/recipes-multimedia/gstreamer-1.0/{gst-shark_git.bb =
=3D> gst-shark_0.8.1.bb} (69%)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git=
.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
similarity index 69%
rename from meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.=
bb
rename to meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.=
bb
index c75d0965d..8a839e0d1 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
@@ -2,36 +2,33 @@ SUMMARY =3D "Gst-Shark Tracers"
 DESCRIPTION =3D "Benchmarks and profiling tools for GStreamer"
 HOMEPAGE =3D "https://developer.ridgerun.com/wiki/index.php?title=3DGstSha=
rk"
 SECTION =3D "multimedia"
-LICENSE =3D "GPL-2.0-or-later"
=20
+LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De1caa368743492879002ad032445fa9=
7"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-b=
ad "
=20
 SRCBRANCH ?=3D "master"
=20
-PV =3D "0.8.1"
-
 SRCREV =3D "09ba05865dacd2824b5b40ab75a4b9545fcc1366"
-SRCREV_base =3D "5413ef5475e5b70476c2480a75ca3746d91d4caf"
 SRCREV_common =3D "b64f03f6090245624608beb5d2fff335e23a01c0"
-SRCREV_FORMAT =3D "base_common"
+SRCREV_FORMAT =3D "default_common"
 SRC_URI =3D " \
-    git://github.com/RidgeRun/gst-shark.git;protocol=3Dhttps;branch=3D${SR=
CBRANCH};name=3Dbase \
-    git://gitlab.freedesktop.org/gstreamer/common.git;protocol=3Dhttps;des=
tsuffix=3Dgit/common;name=3Dcommon;;branch=3Dmaster \
+    git://github.com/RidgeRun/gst-shark.git;protocol=3Dhttps;branch=3D${SR=
CBRANCH} \
+    git://gitlab.freedesktop.org/gstreamer/common.git;protocol=3Dhttps;bra=
nch=3Dmaster;destsuffix=3Dgit/common;name=3Dcommon \
     file://0001-tracers-Fix-buffer-overflow.patch \
-    "
+"
=20
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF +=3D " \
-       --disable-graphviz \
-       --enable-gtk-doc=3Dno \
+    --disable-graphviz \
+    --enable-gtk-doc=3Dno \
 "
=20
 FILES:${PN} +=3D "\
-       ${libdir}/gstreamer-1.0/libgstsharktracers.so  \
-       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
+    ${libdir}/gstreamer-1.0/libgstsharktracers.so  \
+    ${libdir}/gstreamer-1.0/libgstsharktracers.la \
 "
=20
 inherit autotools gettext pkgconfig

