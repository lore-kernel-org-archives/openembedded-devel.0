Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8297.1794237771741644451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 07:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=nWrEdf/P;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.20, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQ1CRSef2jVunwOt+PDo0xWNgy1e6CHPoLNkAD8BZIQcBCzz7hY1KDDaoorSVIcw4DMt8XJNv/q6SwziBYZqcK8m/QjWOAdjeO7H8A18qUl74gsgJEvG7AxRAmcuybCUu9Xq1f6nzG5gajq584IRUp3Yygxw8frrwZPpKSyqQVSIzlIPMbBANidyLlbY6/8zzzPJXdI4lYTJlpRSL1cEQd9FsSHXOSeXIh8pJolPES3MpYJt1apugRpgamEFNGwDKZI01OClrtN0avlro3c/kj/pJhmkKjZd/awb772EpTa1GykoCM5f4/JUcoSlPjsjdRVY8RoTwC9xGhR8K7A4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncN2U48A/0GY+gMdkm/8n0CM5wGoZia6XtMLzRdwGSE=;
 b=WO5NloxmTtjP3SO/R8Qtn3WFW0pzWp/II5M8aGdHPnBS2OWMOwEww7+b/ZtS71OCvk0lJt3siylEEYzoPJNqTb4jpBNlLgxoKrM2teizZ1MFhd+kAIe5sii2Dx1DoHIw8/pwkPYac+yO8I/E9VCRaxGh4L96OQ23uDz/Rx9Vsu0xGFex5S3bueFSLZpoxo97Uu3SBxOtamr/tUEJc3HWpw31lBPbREnDPHHlrPGXCxIFzY+9eUKeDzXKbFAbZq3I/0nqwBMpyxn+AajW0Lr7kEVgSLBVOY0XUHErTrVt7HydaChXmDulHmRyhjrP7vom1KsmG3y5mtVhNuFePokKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncN2U48A/0GY+gMdkm/8n0CM5wGoZia6XtMLzRdwGSE=;
 b=nWrEdf/PiceWRusS0kkA3+9KaHRxFo0l0L1+OE5VaS5Oc8K3XJZjQNuHGFWwIsgUcbk1o8NwuaSZRhz/aCfGhA/R+9WwOaSJ5eQMmZLbVmEiWmUe7Lb3YE7hVOpRdL+1+mAt3gKa19d//jyprC7Y+6C0tdssQrFKJssZPDmvhUg=
Received: from DB8PR06CA0039.eurprd06.prod.outlook.com (2603:10a6:10:120::13)
 by MA9PR06MB818361.eurprd06.prod.outlook.com (2603:10a6:250:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 15:22:44 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::28) by DB8PR06CA0039.outlook.office365.com
 (2603:10a6:10:120::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 15:22:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 15:22:44 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 9 Nov 2026 16:22:43 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH 2/2] discoverable-disk-image: stage systemd-repart below WORKDIR
Date: Mon,  9 Nov 2026 15:22:42 +0000
Message-ID: <20261109152242.1135919-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109152242.1135919-1-johannes.schneider@leica-geosystems.com>
References: <20261109152242.1135919-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: johannes.schneider@leica-geosystems.com
X-OriginalArrivalTime: 09 Nov 2026 15:22:43.0062 (UTC) FILETIME=[2A57D960:01DD705E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|MA9PR06MB818361:EE_
X-MS-Office365-Filtering-Correlation-Id: b95a23f1-d4a1-455e-88a4-08df3e754d7a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|5023799004|11063799006|56012099006|261026121527099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261026140227099003|261102130727099003|261028144727099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OzdnOZ7bTqIwe6doBnaNWCr3rGpWo4Wl2R0w8YHOnPE3hOF+FPWFdPDT5C7ltq8L8jJCtk/wbgnKgfyM3VN3aEzWc3hVW33lNkPeAHIIKXVrJ46LK3TwoNG+GTpKPDkdg23G2fPPAx8Q6MR44cl+yTB4jn9gxzlub9cmcgIp00BrchiAvnqAxndOnF5FsflHMVWdtQCNT70P41ED2qdZhi+EmnnwazlEhL6c1DkVnGbLqeP1Mgw78ulce3VPdEBxAPgscErsucKNEVxwIKQMjRwGoXFeRtXg6v+GHPKtB4bw7RgmKtL+L/Q2wEZyzmJIh1NkEStoKvNIg4uWY1yMdy+JSq/5gQrGuARazgv9jEt9d0JvIIURJqhj1nVX4J47LrGUSX47MXPOWv/EDERDYnVNZcGypF2OeL7aDWUETgWNtTO00Z8zJpykm9QplbWXoxv6urBBG9K1tpm7PPGdU2RiiynDSVgZSrctHKL+Z09Rj21Pckfojk/OBwgJYQGT2Mk43BHdKJ7RWLsVZ/jtWqwWOrmMz8fV7Fegihc8DLN63qnea9SOK9HyuZdVeynDnEs+MaaxZmAN17lVfrMsiL4TkDCNs54SQBf25Fr/r2eiGoGqmlAGE2dMozUtl8Fad8VlO/vnEOgCIbDh1linvsv1BQrfOUvhYG+KJIm137cq1qeFfh240pD7axyH4IWjx0kKXT87ATCRY7O5/wln6A==
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(5023799004)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261026140227099003)(261102130727099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gtsJDbI5z93yJsgR1oOMIxyE/PTBxaAWUpT60sLu99hgvqOtjjgd0vQw5uGuhHoycv0qfMj41YlmGEORCFLTTz6AFdbc3Oyzw/UGo/1H8Pi2m+YtZKxYy+0gc49H/7rOWwzLl2oTOkt3jCR1whaGgjdlDQqEHmV9JG6dTnDPdHvCXdmx5trL38q2bMhtW31QOqltnBj8ODZ2BUxQaEPnma/BtwOjd4JiowUU8POMFs90NUbaQXk+9k+WUOHM4atsp7PFymIRytakMFxHzBeNC4PJla9a4ZOvwa++hFwXlHg1jl5Tj4EFLlmw6IVc6I0INbVgTRRlnvZDx0A+u9SO+4bCQSc279v8avpw9qRoKINAMd5YGe3lX2KeiHfT9W1aQ1RfuGkR0zMwVNkq4+jHrvW9kzW1F79gTCSkrSRhQ0dUwWXuW6lMCH9aSPiVAQ4Q
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:22:44.1244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b95a23f1-d4a1-455e-88a4-08df3e754d7a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR06MB818361
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 15:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132063
Content-Type: text/plain; charset="utf-8"

systemd-repart copies the rootfs into a temporary directory from
var_tmp_dir() to populate the filesystems. With $TMPDIR, $TEMP and $TMP
unset in the task, that is the host's /var/tmp, which the class adds to
PSEUDO_INCLUDE_PATHS for the faked ownership to apply there. pseudo
then tracks a host-wide directory shared by all builds and users, and
an interrupted run can leave its staging tree outside the build
directory.

Stage into ${WORKDIR}/repart-tmp instead, recreated on every run, and
cover only that with pseudo. The location is passed through $TMP rather
than $TMPDIR, because pseudo derives its own runtime paths from $TMPDIR.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---

Build-tested on scarthgap with this class and 1/2: two signed lzma
sysext DDIs build, the files in the erofs partition are owned by root,
and nothing is left in /var/tmp. A downstream copy of the class, which
had no pseudo coverage for the staging directory at all, failed
do_image_ddi in a CI container (EPERM on the ownership copy); this
staging fixed it there.

 meta-oe/classes/discoverable-disk-image.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/discoverable-disk-image.bbclass b/meta-oe/clas=
ses/discoverable-disk-image.bbclass
index 02ad900d0f..604f316d5f 100644
--- a/meta-oe/classes/discoverable-disk-image.bbclass
+++ b/meta-oe/classes/discoverable-disk-image.bbclass
@@ -77,17 +77,19 @@ REPART_DDI_TYPE ?=3D "sysext"
=20
 REPART_DDI_EXTENSION ?=3D "ddi"
=20
-# systemd-repart creates temporary directoryies under /var/tmp/.#repartXXX=
XXXX/,
-# to estimate partition size etc. Since files are copied there from the im=
age/rootfs
-# folder - which are owned by pseudo-root - this temporary location has to=
 be
-# added to the directories handled by pseudo; otherwise calls to e.g.
-# fchown(0,0) inside systemd git/src/shared/copy.c end up failing.
-PSEUDO_INCLUDE_PATHS .=3D ",/var/tmp/"
+# systemd-repart stages copies of the rootfs here; pseudo has to cover it
+REPART_WORKDIR =3D "${WORKDIR}/repart-tmp"
+PSEUDO_INCLUDE_PATHS .=3D ",${REPART_WORKDIR}"
=20
 oe_image_systemd_repart_make_ddi() {
=20
     local additional_args=3D""
=20
+    # $TMP, not $TMPDIR: pseudo derives its own runtime paths from $TMPDIR
+    rm -rf "${REPART_WORKDIR}"
+    mkdir -p "${REPART_WORKDIR}"
+    export TMP=3D"${REPART_WORKDIR}"
+
     if [ -n "${REPART_PRIVATE_KEY}" ]
     then
         if [ -n "${REPART_PRIVATE_KEY_SOURCE}" ]
--=20
2.53.0

