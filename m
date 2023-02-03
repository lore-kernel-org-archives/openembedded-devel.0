Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1FEC636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 08:10:18 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.73])
 by mx.groups.io with SMTP id smtpd.web11.4773.1675403069187545689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 21:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@elektrobit.onmicrosoft.com header.s=selector2-elektrobit-onmicrosoft-com header.b=XzxyS86e;
 spf=pass (domain: elektrobit.com, ip: 40.107.92.73, mailfrom: simone.weiss@elektrobit.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mlGh0xKHkeBWj9YxRAb7wiFVQlHwZrjFNEKzo/GUxc=;
 b=XzxyS86eOArhL5kwt3mXXf+o8tBc89D8K4mtAN943hs7Qxq3DzP+/SuC/j8qTC6vQuC+N8NkdhWV8E9JY5KacCF4aQqn4NO65ZTvdNBIhZzdGehiljC1/360eM22KYc7THlZkbKCtVufj5Dz6WHMvalCO3X8iTnyGp5kgg3SbKA=
Received: from MW4PR02CA0025.namprd02.prod.outlook.com (2603:10b6:303:16d::11)
 by SN4PR0801MB7870.namprd08.prod.outlook.com (2603:10b6:806:1ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 05:44:26 +0000
Received: from MW2NAM12FT112.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::9c) by MW4PR02CA0025.outlook.office365.com
 (2603:10b6:303:16d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29 via Frontend
 Transport; Fri, 3 Feb 2023 05:44:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MW2NAM12FT112.mail.protection.outlook.com (10.13.181.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.8 via Frontend Transport; Fri, 3 Feb 2023 05:44:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Feb 2023 21:44:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShZ0sz56nOmlTNrUtkn2BkodT/ysLGrBu02LGY0ZxWEMPNFTMlxrOeNDQO5iz8YtL+/nmS181AYNtwmb6tmeQJlGfutRFuALffG72C8uPcNA7Vyd+Lj+3HojL3kOVEBBZ4RGZ8qVvGr5ImL+Fw3SV47G39rZD8VQ2g/blQHJrNdqtXCBMzC5LD51MgSKxWEXTjfouEZBeBYwlNDv8ulHHP1SDrJl2zDBDUKzBfO6C8Xe9fqlCxUR5IhfmJMR3uHa4zGN4cBjZvifx9Z/HGeYm0HDscC/Rn2cNY/K0m6TFTPLlS1JsoLQQ00Pxq58QAZxS6dsVg8VErOdUM8FN7CRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mlGh0xKHkeBWj9YxRAb7wiFVQlHwZrjFNEKzo/GUxc=;
 b=S5oJadNKMiUuu4oi4noMq4q+Bdwm5qAaa1TlCQRZkd4hs3BUjKOlaBzUnHesjBe1RWc5kzcc4NRnwsuwVrxoZH49RMB3fOhPIHKtgmrG10/qhKhY7ASg0S6Yc1gzXfWrBQsGCSRyNAb69WFhOPF69N/nIVt6xvzE8WSnWB8JaoeQk26RZHHVeU0otclvFJkS7E8fcB6XjjnjEE4obz+jnlWGUUPdlNPgEqB+MOuqgbd01/5U7XRX5iis06pEjLt1Hu3Rimf2kWwhzhYrqJyB34NRKdf64Y6VvKFL7QQBDzJpGUZAtSS/xyp7ipFVq9kaZfLddQ11UKf6lCgsLgow+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mlGh0xKHkeBWj9YxRAb7wiFVQlHwZrjFNEKzo/GUxc=;
 b=XzxyS86eOArhL5kwt3mXXf+o8tBc89D8K4mtAN943hs7Qxq3DzP+/SuC/j8qTC6vQuC+N8NkdhWV8E9JY5KacCF4aQqn4NO65ZTvdNBIhZzdGehiljC1/360eM22KYc7THlZkbKCtVufj5Dz6WHMvalCO3X8iTnyGp5kgg3SbKA=
Received: from BN9P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::9)
 by CO3PR08MB7976.namprd08.prod.outlook.com (2603:10b6:303:167::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 05:44:22 +0000
Received: from BN8NAM12FT052.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::33) by BN9P220CA0004.outlook.office365.com
 (2603:10b6:408:13e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31 via Frontend
 Transport; Fri, 3 Feb 2023 05:44:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 BN8NAM12FT052.mail.protection.outlook.com (10.13.182.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.7 via Frontend Transport; Fri, 3 Feb 2023 05:44:22 +0000
Received: from denue6es010.ebgroup.elektrobit.com (10.243.160.100) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 06:44:18 +0100
Received: from DEL01461.ebgroup.elektrobit.com (10.243.10.112) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server id 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 06:44:18 +0100
From: "Simone Weiss" <simone.weiss@elektrobit.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>, Kai Tomerius
	<kai.tomerius@elektrobit.com>
Subject: [PATCH 1/2] minicoredumper: Add ptest
Date: Fri, 3 Feb 2023 06:44:14 +0100
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Message-ID: <0bad16f0-d11b-4824-8fa1-259deb2c13d7@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: 
	BN8NAM12FT052:EE_|CO3PR08MB7976:EE_|MW2NAM12FT112:EE_|SN4PR0801MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 2620be6b-1418-4f2e-7432-08db05a9b5ba
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WwU+ws9k9NpXVUxMGDK/LGSPKvh/J9XaNYfe0TDr9O6Hh8lGptzo0T2CLUbrOiE8vyAuGHht/6OHghjTZVqkYOmZJlkLLa6Cczvp48nF9C3pW0R6NAH83oRK60uIIFjtDPRHeqtM1WQjBfbvHpYcdZ04lyTNhMR4aMg66BFBkX5pMO0B1gKWCSF4EPNUjdMJwISGxwjzqjD+6ZxvYm1a5DBFcTI3BXHRfmNeZzqISmCZK7SsqmUVEdSEuwwlN5waAjjW8YWvWNPWvWHUA7SHwKCUjmz1wzXeMAqKKtZRu9mFwF4bT7hwoI7iyUvmRb59B0LIWeChtNVkepECuFYlAYjYWYh1J+1e6wK3d/BGt8Evg944vcGU8FTfrUdlO94VPwrYN+4dJt7m7Do0P2yFLzgFzLL3mKU/5FZfLDijfQ63oyguLIxUTsWwjeLrgKqyytCxOP/SDW5YGOw8x5hi0C5IP7hDl2MNPBcR/35/2TWGaqfatlDW3vzipSOg8mh3KCbzvzOcJevgxhT24E51mAbCHREZKQzYs3CpLkrDiQN+ttIZIoMtwgDfu0T1VlWkC0zwy7qMfXScg94pDmnNxOJGYijnmMbg2SbzgsBl+CKFEwWVGzFmSiEka3S83Q72yDO4iTZ/6RC6wZFiGApGdYBqxPAMu7zUueG3LU7r1rZtdSQ2gJCbFcP8rWnWAdmeI59gxzVhr0SZu1fHa74Pig==
X-Forefront-Antispam-Report-Untrusted: CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199018)(40470700004)(36840700001)(46966006)(2906002)(336012)(82310400005)(426003)(54906003)(44832011)(47076005)(316002)(83380400001)(107886003)(6666004)(6916009)(186003)(478600001)(26005)(70206006)(70586007)(40460700003)(8676002)(31696002)(356005)(5660300002)(4326008)(86362001)(41300700001)(8936002)(82740400003)(36860700001)(81166007)(40480700001)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR08MB7976
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MW2NAM12FT112.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	db30c38b-54e2-4cc5-cb15-08db05a9b38a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nkWWS7tkUrA+fs3mz2FnGzdf3iEPxhZogdAArG8Um8bF3G6bX8pwLbGUDPMED8oIKvkzFQr1SK9ymB3ILweaVcwmUgiMEPKrR7wImKdnzYrJdXFWGqUcGrLjEUon6IJpru3DNzAC8QEYiRCdSEFGgivyAT2mPOpLJQHVIkq4oGWL1Lnm/eOsoyXh8bOICQDaqd/x8UBGQq8MF0oRF7b2iaU/ItDYz7MuVbCwvTmr2t0GYHNNsadSlD/rxXqzr98hma4saDt70F0tmISBWMxNrckpyHsYR4L71BlRygGgXRjij8Ovs/fSJoQkIXwYw0W9VN0zUiCvsIY5a3JVqaxaZiTG8THqzfUTgU91f9yrTvZZf3ri9pSFEflwIqYv3ERn/nuab5DY2Kb1Y+yAP/2BtUXRmnYEHYk4yDZTTJjBRRdC+k8aA9kuFIbv7yX6VNjyid+tvH/GjIztvUK/so2nvNYvU4LmYI+9HNGHxgGVCbsIdiZmShDcPoGI1sY94WIZmZ1yvjObRUZEdzuCwRKef0waxwg81J2UVSvvOMcyXc90Mx0DUdvECIJBGq+0XuQfwDvBbrCcUBy4mdKRybpn84Vkmf3lvd56JT+xjKJ5+7rYBuZuKoAr5W3RUAFWwFwumWQ8yWfuUJG45yREcR3T/VQ4qK8PqcNXkyD+yG25v+vGGRrwjL1b74YDfo8SQ9hD6AGMf9iyz5w29dLbIMHzMW+lOdT0nmeZ0Ij9rnXG7BA=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199018)(36840700001)(40470700004)(46966006)(70586007)(36860700001)(40460700003)(8676002)(478600001)(26005)(54906003)(82310400005)(6666004)(186003)(316002)(5660300002)(86362001)(2906002)(41300700001)(8936002)(44832011)(70206006)(6916009)(31696002)(107886003)(4326008)(40480700001)(336012)(83380400001)(426003)(47076005)(81166007)(31686004)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 05:44:25.9095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2620be6b-1418-4f2e-7432-08db05a9b5ba
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM12FT112.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB7870
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 08:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100922

Add the demo from minicoredumper - that is intended as a test for it -
as a ptest for minicoredumper.

Result example:

root@qemux86-64:~# ptest-runner minicoredumper
START: ptest-runner
2023-02-02T12:27
BEGIN: /usr/lib/minicoredumper/ptest
minicoredumper_demo
expecting Segmentation fault with core dump ...
[   21.791878] minicoredumper_[330]: segfault at 0 ip 00000000004014f2 sp
00007ffe4271f870 error 4 in minicoredumper_demo[401000+1000] likely on CPU =
0
(core 0, socket 0)
[   21.793886] Code: 00 b8 00 00 00 00 e8 7d fb ff ff 83 bd 5c ff ff ff 01 =
75
2f 48 c7 45 e8 00 00 00 00 bf 58 21 40 00 e8 52 fb ff ff 48 8b 45 e8 <0f> b=
6
00 0f be c0 89 c6 bf 77 21 40 00 b8 00 00 00 00 e8 47 ff
/usr/lib/minicoredumper/ptest/run-ptest: line 6:   330 Segmentation fault
minicoredumper_demo
minicoredumper
SUCCESS
DURATION: 3
END: /usr/lib/minicoredumper/ptest
2023-02-02T12:28
STOP: ptest-runner
TOTAL: 1 FAIL: 0
root@qemux86-64:~#

Please note the Segmentation fault is intended to provoke a coredump.

Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
---
 .../packagegroups/packagegroup-meta-oe.bb            |  1 +
 .../recipes-kernel/minicoredumper/files/run-ptest    | 12 ++++++++++++
 .../minicoredumper/minicoredumper_2.0.1.bb           |  6 +++++-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/run-ptest

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 34689fb48..d37383919 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -982,6 +982,7 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages =3D "\
     libee-ptest \
     poco-ptest \
     cmocka-ptest \
+    minicoredumper-ptest \
 "
 RDEPENDS:packagegroup-meta-oe-ptest-packages:append:x86 =3D " mcelog-ptest=
"
 RDEPENDS:packagegroup-meta-oe-ptest-packages:append:x86-64 =3D " mcelog-pt=
est"
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/run-ptest b/meta-o=
e/recipes-kernel/minicoredumper/files/run-ptest
new file mode 100644
index 000000000..fbddc0774
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+echo minicoredumper_demo
+echo expecting Segmentation fault with core dump ...
+
+minicoredumper_demo 6 & sleep 3 && minicoredumper_demo
+
+if ls /var/crash/ | grep minicoredumper; then
+	echo SUCCESS
+else
+	echo FAIL
+fi
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb =
b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index 0b934ee2d..992de014f 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D71827c617ec7b45a=
0dd23658347cc1e9 \
                    "
 DEPENDS =3D "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux =
json-c"
=20
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig ptest systemd update-rc.d
=20
 SRCREV =3D "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
=20
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/diamon/minicoredumper;proto=
col=3Dhttps;branch=3Dmaster \
            file://minicoredumper.service \
            file://minicoredumper.init \
            file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.=
patch \
+           file://run-ptest \
            "
=20
 S =3D "${WORKDIR}/git"
@@ -29,6 +30,9 @@ INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME:${PN} =3D "minicoredumper"
 INITSCRIPT_PARAMS:${PN} =3D "defaults 89"
=20
+EXTRA_OECONF:append =3D " \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', '--with-minicoredumper_demo=
', '--without-libminicoredumper', d)} \
+"
 do_install:append() {
     rmdir ${D}${localstatedir}/run
     install -d ${D}/${sysconfdir}/minicoredumper
--=20
2.25.1


