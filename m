Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D02CC0018C
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.73])
 by mx.groups.io with SMTP id smtpd.web10.5511.1699341174824407443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rlFIj7aE;
 spf=pass (domain: axis.com, ip: 40.107.15.73, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGvbXmQPpjU5UDeoZ2vCxTiZLi+wslBlrAjok/kQEmxMBKJC6FA9VooXZBbVylGhvqJHXOXBRhroO/zyVPA78HHb5Xj2rkcqjGSEVAbL103rYYpJjgSPFkUxjqcIoP8a5mn4/3ApVxuaLEyFPUetUE0xbLNs2A0QkpWG687F+9ltlE/1VH8/XiQEADMFiCwfNj0IaBsWO73oWStEcN++OIGa8z8jWnVClRSFXe4HS+R6b1cevXCtmTxIlCQ3bmZuBDX8mXLrp3xd3sJy3ZulZ0f+Iea2FOok1zNwrAvqFvU8+heqV6aZjpF1phuAJUBdtwLa1kcU9T/oBcuSd4bTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D99ZpM+XmfSUlJEm7CkAhnpseHkEGXcmWEXpVz6NL0Q=;
 b=FXh0zZlrL+h9gSdoYVAL2fiYsvh4tnqNWsZCpqDVjX71yLPDUZuCpMRoG9EEcO8Q5vnWmag7QR6yt6tWq7rHnW4ik6n5hePKMfVtj1K1+0ipZtRW+cWV6AOQoPZv2/ShCbtKmenAVO94pVfDkk6J6m9kn6+bjWTpYp5hyJPijYURI5v60F2x87Mz4VpvY/S2Jk/pI7exfJSZH2uVVvUjisRTlMIwpPKWH9eFEg9oy9A0ANqFhdbWZ5b0/FSNNy8HxEl+sttW4K1+3eBfzLclV9xU+TGNxtsmoxNHIEGExz/9ewOpXbvyp8x3eT3pPawtZ6+qqX12nt8FyBLaFDssNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D99ZpM+XmfSUlJEm7CkAhnpseHkEGXcmWEXpVz6NL0Q=;
 b=rlFIj7aEtg4QQkwd82HF5KQ1FmlMixVc/hBuJAzZjdHik16/mGBmRwXIBchtvcUSLtTw7wZK40Pb7814cQjFayoXf6SrEpRSGiKZ2VId74Ffe5px2awxf4o9HuShqAkIF0O+hbHoREN+P98I3y9BWlewuJ9ncx07yHzKdvRXvX4=
Received: from AS9PR06CA0483.eurprd06.prod.outlook.com (2603:10a6:20b:49b::8)
 by AM7PR02MB5942.eurprd02.prod.outlook.com (2603:10a6:20b:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
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
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 8C8701C96
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CoBi1519744
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CobA1519743
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-filesystems][PATCH 12/16] xfstests: Update to  2023.10.29 properly
Date: Tue, 7 Nov 2023 08:12:36 +0100
Message-ID: <20231107071240.1519631-12-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AM7PR02MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: c52411bb-e1f2-4540-cce5-08dbdf60f4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UlmpNfFfWxYX3Gb8VHhmV1xiQObSng3ytIlZBil0IFiZVJKXlFT8w0pFeyq3ZHfOY8g6ZibIWFsVAE1IUwVVyMsqervwAYLRstfnQ7aMRz8ELtzRYOtloXoaqMdRNzPOYcQFjk5ICVZC2J5i/Yese5uqnsyue1VJ5r7kb02sor2IiRkhuUo5hzsBeO0up9uZCzUosBdCLnIbV1/uCO7Fku+UsAyIHm446FJZQCKWTLj4kNe+wm7FvWnRNV6LAG9XnOyUaWXSMsERiUul0Ef/yjosJMaNpU0kU6Q8B1H9PioN8CuA7ZD2JvcxcuauD8P5RzvWOH64oMT0ck3+yKeW/uwS32WkZnZIbJgS4yBW8fqrD/NFHdQkiqGFDBZKlWCIIXpcWynwUoioisz96k4lzOoyUqiWf5sdgQaiMiNREa17FmjK/oqTN95cfHJWh5lSx5C26kvD7UCXgkTt7hL+S93RLNUaNda2W1WsIuM2gCdgMmZNZJ6pauAhfK3yS7S73Il5WNoFmVNvrvZsDFsfeztSORn2lFzvinf5KcKWU3NCYkKvHRjHCS7XfTkOAezsA5LszsIyr41hFVqMqcaysvQthRM6KRRneeRLyIPw1ZODIavA3QJek3XrPqlF0Ceiwgkwj5vIxFVq0xBLG8IOj4cLBnJ2xcil4jQWl+o7w0Is0KoF8RJ8FOPArbWYjr082WmzFYlRgohHhAQpKQ1sM75Yh9N5rQgKH1gL8ugBP3YTwAZN7CxSNcz3dMjjv4LT
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(40460700003)(40480700001)(2616005)(6666004)(478600001)(2906002)(15650500001)(36860700001)(36756003)(316002)(356005)(81166007)(82740400003)(47076005)(5660300002)(41300700001)(83380400001)(336012)(70586007)(26005)(426003)(1076003)(42186006)(70206006)(8676002)(6916009)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:51.8416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c52411bb-e1f2-4540-cce5-08dbdf60f4b9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5942
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106427

The "update" in commit 2af7d3f63e added a SRCREV rather than updating
SRCREV_xfstests. Change the recipe to actually use SRCREV so that it is
compatible with future AUH updates.

Also replace "/usr" with "${prefix}".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I wonder if this recipe really should have been updated to 2023.10.29,
since that tag is on the "for-next" branch, which I assume means it is
not released yet. But I cannot find a way to make devtool upgrade only
look for revisions that are available from a specific branch.

 ...itly-use-int-for-return-type-for-aio.patch | 30 -------------------
 .../xfstests/xfstests_2023.10.29.bb           | 17 +++++------
 2 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-l=
tp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.=
h-Explicitly-use-int-for-return-type-for-aio.patch b/meta-filesystems/recip=
es-utils/xfstests/xfstests/0001-ltp-fsx.h-Explicitly-use-int-for-return-typ=
e-for-aio.patch
deleted file mode 100644
index 5e9e9d9a7..000000000
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-ltp-fsx.h-Expli=
citly-use-int-for-return-type-for-aio.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0927d0def968ea7e19905c7e39182f65961c11cf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 5 Nov 2023 01:17:52 -0700
-Subject: [PATCH] ltp/fsx.h: Explicitly use int for return type for aio_rw(=
)
-
-Fixes build with clang-17+
-error: type specifier missing, defaults to 'int'; ISO C99 and later do not=
 support implicit int [-Wimplicit-int]
-
-Upstream-Status: Submitted [https://marc.info/?l=3Dfstests&m=3D16991722200=
8646&w=3D2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltp/fsx.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ltp/fsx.c b/ltp/fsx.c
-index ee4b8fe4..c0aec23f 100644
---- a/ltp/fsx.c
-+++ b/ltp/fsx.c
-@@ -2581,7 +2581,7 @@ out_error:
- 	return -1;
- }
- #else
--aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
-+int aio_rw(int rw, int fd, char *buf, unsigned len, unsigned offset)
- {
- 	fprintf(stderr, "io_rw: need AIO support!\n");
- 	exit(111);
---=20
-2.42.1
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb=
 b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
index 4e8e31840..be7c2d473 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
@@ -3,18 +3,15 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3D74274e8a218423e49eefde=
a80bc55038"
=20
 SRCREV =3D "11914614784735c504f43b5b6baabaa713375984"
-SRCREV_FORMAT =3D "xfstests_unionmount"
+SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
+SRCREV_FORMAT =3D "default_unionmount"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dfor-next;name=3Dxfstests \
+SRC_URI =3D "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=
=3Dfor-next \
            git://github.com/amir73il/unionmount-testsuite.git;branch=3Dmas=
ter;protocol=3Dhttps;name=3Dunionmount;destsuffix=3Dunionmount-testsuite \
-           file://0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-ai=
o.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-mou=
n.patch \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.=
patch \
            "
=20
-SRCREV_xfstests =3D "f7765774a1b5cb98c2f21a892e82b3421f40e791"
-SRCREV_unionmount =3D "e3825b16b46f4c4574a1a69909944c059835f914"
-
 S =3D "${WORKDIR}/git"
=20
 inherit autotools-brokensep useradd
@@ -53,14 +50,14 @@ do_configure:prepend() {
 }
=20
 do_install:append() {
-    unionmount_target_dir=3D${D}/usr/xfstests/unionmount-testsuite
-    install -d ${D}/usr/xfstests/unionmount-testsuite/tests
-    install -D ${WORKDIR}/unionmount-testsuite/tests/* -t $unionmount_targ=
et_dir/tests
+    unionmount_target_dir=3D${D}${prefix}/xfstests/unionmount-testsuite
+    install -d $unionmount_target_dir/tests
+    install ${WORKDIR}/unionmount-testsuite/tests/* $unionmount_target_dir=
/tests
     install ${WORKDIR}/unionmount-testsuite/*.py -t $unionmount_target_dir
     install ${WORKDIR}/unionmount-testsuite/run -t $unionmount_target_dir
     install ${WORKDIR}/unionmount-testsuite/README -t $unionmount_target_d=
ir
 }
=20
 FILES:${PN} +=3D "\
-    /usr/xfstests \
+    ${prefix}/xfstests \
 "

