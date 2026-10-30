Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13260.1793371236522395132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=E7F0JPL6;
 spf=pass (domain: axis.com, ip: 52.101.84.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn7Se1M3g2XRLMfBkfd3PUG3FffVKDdlWmbqofK2ftTdT1AgVMCG6Nw6QEAY4smqCpoUFLPE5b0nuVkvCfatBoY3jLgESvoGpPlKRlwJ58MuZ8IQTkl+R3uJwmGjcRjOTYkVI74pfkl939P9iDO+ifMwhhc9EzNhpRZ3AZLbhM+1VoBlmsh8He1h2wyIaSwcndKnhzkyAA4eC3Yh0t5YNdMCMO+tN5Hv06SUPVi8FvsR8Hx02cnYM3suvzeAomMi4LdfyXjYhKzaZbvTWmeI2V/+waZiWfDUEQEfuwaGt/4z7Y4QwbxZiI1MCJ1B63I6KkPHLUg6IT0Y1kr/42xfRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWh7P5i1MrzjK1p4AWaxp9pik+R+5xy6++L0EdgBro8=;
 b=mrCXmSYTt7iQVkpopE4SEclaEql9LWARb3lFBNSKmhhArd5+uuH0jyBE0XDsBiu0BvUehLPdsErm4SNS2wCqLMlh+ghf8i0pD+2FblExMumJ1sz01qxd7zGjIgderMiC+q6lwLfTaqUMwNpOlPcrp8jiFClCwGXi3Geq+ULgpCxwoZkndRNxhnlX8ShXZhfQ8jsXCCEA+pQIEpqg50RG5t2BFuTkCERCpO47Q9eQ9P0WHGckbinWUmRPGQsDG88ai1N+sIUuNh0y1s1sdqVOMcbXChnQ0+xgix0FJ4zxHTfK2b3bELLMBjD0cQOgP4t6Jff6af/o22IX1QiGdlFD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWh7P5i1MrzjK1p4AWaxp9pik+R+5xy6++L0EdgBro8=;
 b=E7F0JPL6ZHgoneRLe6JX12HN7SYN4rbSvY07brJoCGxd3qsAt0Et/o9Jux7htvKihimWt4ClU9vNFsqhBHU1HW3sB9vB6t4YZGq5ymbsJ0F6HaQTz1NSaXUXbfn8salzJQuTHJCN/bxF4+B/Dbw86RyKywvSYADp2BuzswKhCUE=
Received: from DU7P190CA0013.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::35)
 by DU2PR02MB7776.eurprd02.prod.outlook.com (2603:10a6:10:2e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 14:40:31 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::61) by DU7P190CA0013.outlook.office365.com
 (2603:10a6:10:550::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 14:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 14:40:30 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 30 Oct
 2026 15:40:29 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 30 Oct
 2026 15:40:29 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 30 Oct 2026 15:40:29 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id AD423C76;
	Fri, 30 Oct 2026 15:40:29 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id A934212B974; Fri, 30 Oct 2026 15:40:29 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>, Markus Volk
	<f_l_k@t-online.de>
Subject: [meta-oe][master][blacksail][PATCH] glaze: Install the CMake files in /usr/lib/cmake/glaze (as intended)
Date: Fri, 30 Oct 2026 15:39:54 +0100
Message-ID: <20261030143954.1209259-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|DU2PR02MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: de34c1ce-6c72-4e89-7bac-08df3693bf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|10062099007|56012099006|11063799006|261028144727099003|10067099003|261021123027099003|261021121427099003|261026121527099003|261009223027099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 4dgDRA8Z5BIDHXYkZN4LKCgM1DSKNJ8hCyU1sFBknPDBZqrjEYnTvKpptGBFog0iNg23Zuz9MtGqFVed0mqUijZxbFMSZhUWshgUJdUCTAcEG3utIzJv59OD+YmkFlvD53k0Gy/lZXDyynzjEvjmvjTZBBZ1EUyFtuhOjfZqjmJ6RI3Z0puNUdHlWdSj3rRuWVfoJw7fzTN7vhBspp58abLX8DVTW/GIFxHzs2or/DQtwgX75tg8a/yWH3swZ6fUlGzOX/jPNMumjmdgNRiX7m3/GOWcGWIwuoUMqk/tcu08bp6KZRNzN9qbNs2MBMGDGsVXaZ61RnqAVNfVPZddJ6ElqlT8sxzJY8HDt1rqWOmrdMkbYE1tMX6YPBk28Xy5CxEtm+sHH1ASmeM3WJJlC5MSMmEijvv9sierlzuzuliJdJH0IWBDDr5JvzJ+Tvi8D8iFrEPSIx1apzMjPG0P8cY+mQkvfeNDH069Zfz0yQBaEGejwkR2WUbTvKF1BbamkpPPcgYw1B1UoY7Y/1qEUI92loEfOZd8wU6LYVfZD8HGZQoXXyU9F1FcaA37T0yFV0EkbKxJbu69nNOjf6bGO/GTdGZ29e36rt4pR0rhTWhJQe3Oyun2e+0Q1nqOrWYq4QHjEn3y2zci8iGry9Y+hAn7reSHX9TtQ6JJRZN2AtN0JM6BTmZDc2je1Wd13YHcIUcrPS6DUDQprd2Vxe9R5w==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(10062099007)(56012099006)(11063799006)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5C1HJYNlagg4sGIwRL8WzueHtDfhhE4+pZ6AM5fzdYpnta1XX8LpTIFBRR9SrMB6Alp6PiDFU7KAssAkbuMQUHq/Zx6QOpC2ZpIJo2skdmQ66IgroYkXoKPZJ+8/pl5pCJf9nndGD+psLFmwClHqiTdBTTO2YNL0Cql+fwTyUsbihRAbDJaDekSq7MWf3osD+3L+fkBeh7OyTWNDZziVi3PbdynNWw2l33EckQpEOWMAeFsaGXEEp8GD8OQ5TjofnxKrIqyFN8pi9aQqsLwyD3zOd64ADQRPsqku/c7YiSWCFdAPcukB0uO1YwNrkSEg39i4MTh9XB6/a0wVMJjOEZxh8lt1dpRwr2+tKaPMFLa0Pigtbgwq7qzU8NtNEBa0hyjjHGar3omQ2aYxvfvLwQOA7PXhQc1Ht+dMbkVtFA3DbWhPYKSO0ro+0Par6oAu
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 14:40:30.2430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de34c1ce-6c72-4e89-7bac-08df3693bf07
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB7776
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 14:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131708
Content-Type: text/plain; charset="utf-8"

Commit 23304685070f85c25af858beec06ada10fd9df79 aspired to move the
CMake files from /usr/share/glaze to /usr/lib/cmake/glaze. However, all
it did was remove the FILES:${PN}-dev assignment, which resulted in the
CMake files ending up in the target package.

Actually set the install path for the CMake files using
-Dglaze_INSTALL_CMAKEDIR:PATH. For some odd reason, it needs to be
realtive, or the installed files will not work as intended when
cross-compiling.

Also remove -DCMAKE_INSTALL_PREFIX and -DDESTDIR from EXTRA_OECMAKE as
they are already set correctly by cmake.bbclass.

Finally, restore -Dglaze_DEVELOPER_MODE=3DOFF. It does not seem to affect
the installed files, but generates less CMake rules.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

Markus: Can you verify that your use case actually works now? Because
ours worked fine before and after.

 meta-oe/recipes-support/glaze/glaze_8.3.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/glaze/glaze_8.3.0.bb b/meta-oe/recipes=
-support/glaze/glaze_8.3.0.bb
index b393460c9f..e1bef79ba5 100644
--- a/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_8.3.0.bb
@@ -9,13 +9,15 @@ SRCREV =3D "dce5e0f7ec572725ec369a0bc59a00eeb2270a9a"
=20
 inherit cmake
=20
+# For some odd reason, glaze_INSTALL_CMAKEDIR must be relative, or the ins=
talled
+# files will not work as intended when cross-compiling.
 EXTRA_OECMAKE =3D " \
     -Dglaze_BUILD_EXAMPLES=3DOFF \
     -DBUILD_TESTING=3DOFF \
     -Dglaze_ENABLE_FUZZING=3DOFF \
+    -Dglaze_DEVELOPER_MODE=3DOFF \
     -DCMAKE_BUILD_TYPE=3DRelease \
-    -DCMAKE_INSTALL_PREFIX=3D${prefix} \
-    -DDESTDIR=3D${D} \
+    -Dglaze_INSTALL_CMAKEDIR:PATH=3D${baselib}/cmake/${BPN} \
 "
=20
 # Glaze is a header-only C++ library, so the main package will be empty.
