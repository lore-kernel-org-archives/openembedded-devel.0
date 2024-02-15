Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70477C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 20:06:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.52])
 by mx.groups.io with SMTP id smtpd.web11.608.1708027610095111609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 12:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=AoIpfHxl;
 spf=pass (domain: axis.com, ip: 40.107.8.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA8TlLTsczh5RXVm3wvdl164NRyk9fKwOL4AokOOXQNZG5Mo8aOR99bfUZm/WKR09EiWabZmEtBXwrXjHPqPPsxifH6NX473NXTMMwT0i1UKM9HOAVMrjPC7b2NEGBXgi6+eUq5Gv07Z/j0yQzGV3dl/r/5srs3MhJXRnmN8ZwssGc5cOecNGJt2Q0TM+84rmnoWyFkdy+GeA9LVCS+I3Ip+ncSPU+oKGSKqLZIuqtIVE16/TWeVCVPP2s8P/sbHBctdQ+wbv0R1i+AYKQjlRhOJ7FrasXjxM9GmkmgPwhsDa0LUrDTcIHtDVLu5b5tah8YIUslWFN4VQmcpF0E1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2PVIPCE3/Dt8mXNvfB46nCATYb8MyIZLhhnPBeABJE=;
 b=Sca86Fjis25C7S3O72ZSCTdGDLIGfxz2MVB8GnvSxLavKhaUJvMJ/Qy2otdgxZvefa1BDggU7yFZRQWY1pkAcvdND3PARifGyEhIuPGvYyzSKJYPioxJSyMTXzz6WVt9NTaQvlnCES7K4DXpAzwbg9UWGyGp0D6vUKM3sqMfdhH5yP0+ufDj4o6G8R6nkFcqLgiKYKRWP+UCsKQw178lk8pmb+WbnsHqzZDil0Tfx2OGm4SPHweYxS0sdbAqPw9SR9Gk5ihN43lZRTdRoQFlnR357mEujqiBczuKlquA0Xkcy32KNrdmbYVJHXbVdCdAL2vpJMluGMaSuB+n9R0ecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2PVIPCE3/Dt8mXNvfB46nCATYb8MyIZLhhnPBeABJE=;
 b=AoIpfHxlFpObtPTWtToT/LlwvRcCQOk9KBEtXS+C4QbLhtnXI2+qwfolGoTpwYA3F42tTUm9ANIY2KHSy33kvtGaSLqG/6KUipW0dUglBMKPJZGmYLBBBn8mqFwdkFROseJ8q94rjYyR6Fs5L+Y9mQrscEYDsIGW20mWTNI/tt8=
Received: from DU2PR04CA0334.eurprd04.prod.outlook.com (2603:10a6:10:2b4::24)
 by VI1PR02MB6302.eurprd02.prod.outlook.com (2603:10a6:800:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 20:06:45 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:2b4:cafe::9f) by DU2PR04CA0334.outlook.office365.com
 (2603:10a6:10:2b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Thu, 15 Feb 2024 20:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 15 Feb 2024 20:06:44 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Feb
 2024 21:06:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Feb
 2024 21:06:43 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Feb 2024 21:06:43 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C9F0314611
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 21:06:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41FK6hql1104660
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 21:06:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41FK6hGB1104656
	for openembedded-devel@lists.openembedded.org; Thu, 15 Feb 2024 21:06:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-filesystem][PATCH] xfstests: Only specify the main SRCREV once
Date: Thu, 15 Feb 2024 21:06:35 +0100
Message-ID: <20240215200635.1104644-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039233:EE_|VI1PR02MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceff8a0-a221-4cb0-5927-08dc2e61a21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZzCBHeBT0BwI6pyOAqLeURlzGu/Q6y0GzRyxYFhACBOOZdYtqLyQ0TV8tYXoghGIuGtoTaRFIj+N3dX3fBhny9lDDpcxlzXop9qzUW7R98uaGTdFR7qwRiS/vCRM3iXwcJ1u0wPHUGqDOzGKOC1E0LZXAY8GgXYARVHFxims41NpcoGgjbwMTnem+gRghtOIpplGMqA8vJzeMfQ19TLrDoiVEixpNOptr64R87An1BH5w1pldgitWLMMrb2Y5U4AmaQOX9Ikb9+iuhhnALNHU38UtdirjnRDJS4Vz/bhOv+wDoH7ys/rE2lpcFAHu0lBDwksGmDwcsfIe2ohBzfr1k2/XRvega4tZXjnSqnDi7ka/04N4kyxh9GXjcswkhViHh7qzhbDN0NczXUjau8gy2/icnq6par3daHY8FX6L+ChaZv9A7sa29kapyyd4JDu8IeKGeX6SVeYnO+97Z49TyN8RvddPa02YNFRWvZx1rDv0LI3CVQEyb6PsOcL/wpM9JW5GuGF5CVATAroVNfchWBQQl8YrZF+5dtVHUdl8X3A7Odck6yCbfBsQO+nw9ehPi6HM6r3mMuWGSwSkVsfpbhmXxYTq7jiYP+j5BK/MhED6eO/LtPM6n1wF9hd1edjed/PMbMVlM1038D0gAcXhywuGHphktVQwzYlUP+5KO8=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(36860700004)(82310400011)(451199024)(1800799012)(64100799003)(46966006)(40470700004)(2906002)(5660300002)(316002)(6666004)(6916009)(41300700001)(42186006)(356005)(81166007)(478600001)(8676002)(70586007)(70206006)(8936002)(1076003)(83380400001)(82740400003)(336012)(2616005)(26005)(426003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 20:06:44.5393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceff8a0-a221-4cb0-5927-08dc2e61a21b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6302
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 20:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108761

The "update" in commit 2af7d3f63e added a SRCREV rather than updating
SRCREV_xfstests. Change the recipe to actually use SRCREV so that it is
compatible with future AUH updates.

Also replace "/usr" with "${prefix}".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../xfstests/xfstests_2024.01.14.bb           | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb=
 b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
index 5ff191456..2800a4c30 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
@@ -2,19 +2,17 @@ SUMMARY =3D "File system QA test suite"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3D74274e8a218423e49eefde=
a80bc55038"
=20
-SRCREV =3D "11914614784735c504f43b5b6baabaa713375984"
-SRCREV_FORMAT =3D "xfstests_unionmount"
+SRCREV =3D "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"
+SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
+SRCREV_FORMAT =3D "default_unionmount"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dmaster;name=3Dxfstests \
+SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dmaster \
            git://github.com/amir73il/unionmount-testsuite.git;branch=3Dmas=
ter;protocol=3Dhttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.=
patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-mou=
n.patch \
            file://0003-tests-Makefile-make-sure-group.list-DIRT-exists-bef=
o.patch \
            "
=20
-SRCREV_xfstests =3D "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"
-SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
-
 S =3D "${WORKDIR}/git"
=20
 # brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that's =
not the only issue)
@@ -57,14 +55,12 @@ do_install() {
     export DIST_ROOT=3D"/" DIST_MANIFEST=3D"" DESTDIR=3D"${D}"
     oe_runmake install
=20
-    unionmount_target_dir=3D${D}/usr/xfstests/unionmount-testsuite
-    install -d ${D}/usr/xfstests/unionmount-testsuite/tests
-    install -D ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_targ=
et_dir/tests
+    unionmount_target_dir=3D${D}${prefix}/xfstests/unionmount-testsuite
+    install -d $unionmount_target_dir/tests
+    install ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_target_=
dir/tests
     install ${WORKDIR}/unionmount-testsuite/*.py -t $unionmount_target_dir
     install ${WORKDIR}/unionmount-testsuite/run -t $unionmount_target_dir
     install ${WORKDIR}/unionmount-testsuite/README -t $unionmount_target_d=
ir
 }
=20
-FILES:${PN} +=3D "\
-    /usr/xfstests \
-"
+FILES:${PN} +=3D "${prefix}/xfstests"

