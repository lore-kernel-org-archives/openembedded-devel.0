Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC7DC001B2
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.84])
 by mx.groups.io with SMTP id smtpd.web11.5147.1699341186037668305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=BDJh/+1O;
 spf=pass (domain: axis.com, ip: 40.107.6.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK8lbBXDIk/tLIj0AxyhRSlYq3dSVl3vtYXdOADtgvzVYwQ8ZNMoV0p5Mmcjpz95lyN68IM4LEIA7oWkUfhjxwwYo+pOC6L22nXERzepUQDYdn/vsNDtN6OUJdb9FT7PbprsCbXn7FnDfUSpFCJxmrGvehF57AkK8+6bQuinxilPbNppahF5IOqd0mneb71jnraIDyDQoiUN4VezXHf00k+p1acs78l5Fx5nCeIVVAowxHVGC/U9eCBJl1T3JBRw8PZM+XrSq+PhndFhDlfIQuWKEowml/hXznqPOOFbG4kz96CUvRzoh4sqEfnY3c6JkkG/JkVc+KEBy6iMs9AHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To+K/GiFmX8EZW0NR0fJia/qmApUGNX2ou8BEwNm6hs=;
 b=jKreLyROMun7E9rzqKoWwfqP1+yy8uyru3wJUddXmeQdZbv+6ADKo0ywU5dcom5A0kjmIlEo6SW1uc8BDwViFYWCVrhT6EX8ysk5a1hR0PlqPjXokzMC7/Pp/BSa5lu0KJ4vRsrHDmLUMwsDK/zrB78Sxb8zS2ywEFVREHSL+m/hxXaTp3XRRkZWasNiyOsciUP2cv8QqM8t0szqlPndXlaROHN2FZwof+a/8l2lou/U1X3vGENe4HL0RPAfhmEftREdgtGq9npm7EpokA/VIoMiKH11pDdlyjI9U3tH5GtMVH5KgkggTES6wsvPkJ6Cc5g/Qi9e1YYoq/+Tv/ky6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To+K/GiFmX8EZW0NR0fJia/qmApUGNX2ou8BEwNm6hs=;
 b=BDJh/+1OcSxb1ODXblUOKoBXFejg4wcfWghHMzUbx8/sa+uwU6l6IHqXYVOzT1uKNr0ctT2/Z7N0sfTHqgysqw5fuOURbd6bCSt1pR8sL13xFIJBrmGZy/e0qcW4Kc0XsRPw7ms6jRddqviMxxwEDQy+u5RCW3h60//cS03ckwI=
Received: from AS9PR06CA0706.eurprd06.prod.outlook.com (2603:10a6:20b:49f::16)
 by GV2PR02MB8798.eurprd02.prod.outlook.com (2603:10a6:150:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 07:13:02 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::c) by AS9PR06CA0706.outlook.office365.com
 (2603:10a6:20b:49f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:13:02 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 63905FBD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77Cniw1519707
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CnJv1519706
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 04/16] mstpd: Update to 0.1.0+
Date: Tue, 7 Nov 2023 08:12:28 +0100
Message-ID: <20231107071240.1519631-4-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|GV2PR02MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: 0747c7a2-e7b1-4190-390e-08dbdf60faca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tOviY9RR62Z8E1tw8uXa4fw+I9MZ1jo/x/Fbe/afsl9LnkMFLHQzQdQSq15OENzHr5ICRVFZzPBvny9ciMhfXhGjSCyD7X0H8lzYPjvZuFs8/elcLTpTfM5lTbc54A0IGkJjfcomep+M2qdY7HoMSp8FpeWa6qSw6YnmI/VF6CPkVUsbQR2yTTiW2GidUwDjT76Op2hzRmnGKEIH0j/JccD7epvE3BQpubSdqDWo+LW2jhtx5ckFi6eUcs2bmSrgZSjbAaCOAOZmJvjd5rHuK1Jp18IJjJ/dbSWV0I7agKyzYgeYdKp8kA64t1zFeCUobTmM96Z6BVJcmZSIyMOp2rvfqwuTWO8TQcPtmTLeP1e9TNfGgEjDmRLiFUxPE1UmgX2yBLcxXqJrfGArEXQt281DVzXkYy42rxzfF7lyKZlGTfo8z8c84Xb+0v+U+B+plT3hJ4nsqjVQI4l5dZlHiQeCCzAd+ultaFy81hKvkQUlu5P7dhdbSVumwJXvln6p1fao6WRPcITh9Hf42Co3W52o4+j9qJz7Vpe+Rg9cl3PnhH5DU37IeFPMojf+aKGlc0ZsrfsK1NGdEJDEGiMXosmahRXlMZme8ASV6dc39Z+lJc6z7U3PvtssniNYVOnIu/m0TP/1A0riXOugN9qaetDfmCXzadAzDB5rJJ9hcxYxrAho0NaZtqqe+SUjxEaFEw1iv8OQOUa5dF/wY/D5LkE5sxsf5lozVB3PirpudDRmvQyquF9JHTUj2zGiLCzDFk5pZx/uBzCy77H7+ZGqDw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(64100799003)(82310400011)(1800799009)(451199024)(186009)(40470700004)(36840700001)(46966006)(2616005)(40460700003)(336012)(426003)(1076003)(26005)(82740400003)(8676002)(478600001)(36756003)(8936002)(5660300002)(41300700001)(2906002)(15650500001)(70206006)(42186006)(6916009)(70586007)(316002)(6666004)(36860700001)(356005)(40480700001)(47076005)(83380400001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:13:02.0155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0747c7a2-e7b1-4190-390e-08dbdf60faca
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8798
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106434

The "update" to 0.05 in commit d0dbeb580f was actually a revert, since
version "0.05" in reality corresponds to "0.0.5".

Also do some clean up:
* Unify SRC_URI.
* Correct the indentation of shell code.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-extended/networking/mstpd_git.bb  | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-extended/networking/mstpd_git.bb b/meta-oe/rec=
ipes-extended/networking/mstpd_git.bb
index ed5669e55..b2043ef06 100644
--- a/meta-oe/recipes-extended/networking/mstpd_git.bb
+++ b/meta-oe/recipes-extended/networking/mstpd_git.bb
@@ -1,15 +1,17 @@
-PV =3D "0.05"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4325afd396febcb659c36b49533135d=
4"
=20
-SRC_URI =3D "git://github.com/mstpd/mstpd;branch=3Dmaster;protocol=3Dhttps=
"
+PV =3D "0.1.0+git"
+
+SRC_URI =3D " \
+    git://github.com/mstpd/mstpd;branch=3Dmaster;protocol=3Dhttps \
+    file://bridge-stp \
+    file://mstpd.service \
+"
 SRCREV =3D "181c453fc1a00573e19f14960dcc54ad84beea7c"
 S =3D "${WORKDIR}/git"
=20
-SRC_URI:append =3D " \
-  file://bridge-stp \
-  file://mstpd.service \
-"
+UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+){2,})"
=20
 inherit autotools pkgconfig systemd
=20
@@ -20,12 +22,12 @@ SYSTEMD_PACKAGES =3D "${PN}-mstpd"
 SYSTEMD_SERVICE:${PN}-mstpd =3D "mstpd.service"
=20
 do_install:append() {
-  rm -rf ${D}${libexecdir} ${D}${libdir}/NetworkManager
-  rmdir ${D}${libdir} || true
+    rm -rf ${D}${libexecdir} ${D}${libdir}/NetworkManager
+    rmdir ${D}${libdir} || true
=20
-  install -d -m 0755 ${D}/${sbindir}
-  install -m 0755 ${WORKDIR}/bridge-stp ${D}/${sbindir}
+    install -d -m 0755 ${D}${sbindir}
+    install -m 0755 ${WORKDIR}/bridge-stp ${D}${sbindir}
=20
-  install -d -m 0755 ${D}${systemd_system_unitdir}
-  install -m 0644 ${WORKDIR}/mstpd.service ${D}${systemd_system_unitdir}/
+    install -d -m 0755 ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/mstpd.service ${D}${systemd_system_unitdir}
 }

