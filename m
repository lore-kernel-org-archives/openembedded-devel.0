Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC78FCA19A
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 21:55:49 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6922.1773179740556473395
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 14:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZyCq+1mC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.19, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbFBi9A2yg/e1cLMKEPKUzyggLrl9cjJICjTY9ywOoGcfXZuEj17VH/zpA2GolG6vyReBEHlUL/DuOFPlVSoLIGLs6LmqyS05rvErZRbQEwMEycG8q4nbANn8qm4Q09Rp10xHs/mstIgN3RfNttY4N8LETX3Hv/iORWmz9l6CK7cLM20rwZL+2VFhbk8KdtglDNe7Oj7hNWvV9rexraRmX8sQY/SKF3MVINcNsrKFhH5/5Pn64QlgXcgBzUL8UZc5zKO4Ua7uyLmhM2WVmYAinosesjEfR6s3txwZwWXGqr4gdXfa+xmIlrcoCdaJDWjgRWtf3QSduZGbvhfhXzQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fNJSba0IDPel1lOivn70TNSmcCZfUrouHtf7YUCYBs=;
 b=oD/naGM1U3hhY1P3FBAsbZB0JYABWDu8OLpVg2gHQY73PuKEQMvVLH1cU6Iz3xba3Udmg60F/+QN8LGFVd7qv52UF3qEQBWwUZjNdiz+Hph1B+YL3suArhA4t760J04glJxOSk9itw7sJbFTZttSMSKSPLyJuMeARQKaHRmyOgviNtE3KagFAOy+MMCMyp/XmpQTEfqvIGSpzaldidAlyCSeMVLvTlzYHvdrWuudFl0ed5RZpsplw7o5VZ4qnTXRwQ2Jt9d43jgXwHZXW9eTk21p+6O1kPM0qkcij0C1/KJbQKQj2L1I640wBMnJs0Yk0HrJxnIYYV+fXdWei0bY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fNJSba0IDPel1lOivn70TNSmcCZfUrouHtf7YUCYBs=;
 b=ZyCq+1mC9jWejJseQHf0rD2prIbuRPoWpVdEqyNzgkuC5xgDosxqF9Uk7OItgAtsABSJ4bMORU0NyATRbDTjirYM69+qQIBOGsCWhDsituSDBuhzDBdyVCyII+HnghMeDVM4gKGF9TfyHP2PqBwilZC+oMPNy4mtr6DinQxKbbY=
Received: from SA0PR11CA0174.namprd11.prod.outlook.com (2603:10b6:806:1bb::29)
 by MW5PR10MB5738.namprd10.prod.outlook.com (2603:10b6:303:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 21:55:37 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::69) by SA0PR11CA0174.outlook.office365.com
 (2603:10b6:806:1bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 21:55:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 21:55:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:55:36 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:55:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 16:55:36 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ALtZVb3849728;
	Tue, 10 Mar 2026 16:55:36 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/2] openbox: update for emptty
Date: Tue, 10 Mar 2026 16:55:21 -0500
Message-ID: <20260310215522.2836352-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310215522.2836352-1-rs@ti.com>
References: <20260310215522.2836352-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MW5PR10MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: f1014c67-3531-4dd2-3324-08de7eefc2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	cI6Wj1K6I0rWQ4uyv1febje4U1V2iwk6ocG4Gkubsfz9o8RQpnZNSJY1o+3TJurpO5YNHNQfK4EXr+zkQ4MAv1NWySFPY0hgsz7PmmY2+ZVqBe84LoQOtBCdrjRWH0/qcaPD9JHQt675mHESD74K2GEzQJlO3aUIBnHcUCIIrYNt7J1lSbbeEEhpQYMlqHbi40vu0Yh3eGaGYT9Qa5y7XecfZBySyV8Gst8OyIIQ/pyRrszAnLJeYks19bjGwNYrzfbYIjOxLmYTzvzGvadJ4hTs9LP5Cr8CFG7Pb6dBGDTeK32VqTETIzH4yA4+ZjVXT4WI542slQsCqoRCl6hs7NfpqIWUxYLG2Lfo0Qo6enovjscr7TAl1ykToeHyblkiB4yGod82/IixyyFu8/Bxj9Suugdrp3YWkCuFuqRq+M5EUlC8jTuR5Vsx5DXY7WiItYP7XdFlA1MNbsgf05xNUVupHu0myazNohLVbyd5dJUZvjTtYYdIH8F1Z3y2wxD70f+FlaI583u/9FLo6FprpBYig9ArZ0Dv3Xhs5YNfNLsz1TWp4gcZX9NR5Yb4gmhsviNEL66sGSTZsZdL/FpvKdQSrf/L04jPImxA1qsypzBkXS9vFwHuoMzSO6bG24Z3ucNOOkE4w+mCeaRi0rzdOR6kEXxwdAskEmI3dZRX5qnun09ZsSNeBSjPZDfbflOX7Cq+4bKKRPo3gnjmiCQxHCOYcdownG81LJBLPNSJ6jlG+hS88Z8NhC7h8eN+HHr7hKqQ4Dup1WUU9PjfLwgwqg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yYpYm+zy0WIkzJDxxYlL3sNHsNTsT+x+bAGuECL3PROjjVc9UtxpN56TTaJ1R16sP2mGXzEkfH/cshPhEMjomICRBDkxKXfChFIStjQdQff30oN6hS1/Q0UVxNlDsbW3/dSJECKL1sl82VLyWEgfGI/UsJTN0fCu5K3TiNvRnDYviEZg64lqNl655yuB83xpyIliCEI/SDyXNcDxcH46JJIKEmWV/UNa7skrnYWnBcjRIwoqIqt5Bmvrk5Kkl6qNSnz+fjTt7oqht/fAyNixwFU9knXpQ7aCRf2HW77rkfIs62sA743VvT1/AVBl+LPapd6TREJuP+sCFMecl9CYo4XFUtNrU5c33O5UF1EcDZKzn6YeeB+xoS+yQA5vW7JCRoSWyC42U2eI8nr/VlIXVbPWkwhHNgEFRkqrFubQPRpTfVI6MaIGK+s6ySyUDj22
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 21:55:36.6213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1014c67-3531-4dd2-3324-08de7eefc2f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5738
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 21:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125042

From: Randolph Sapp <rs@ti.com>

The x-session-manager alternative link has been removed. Instead a
distro should choose what the default session is by using the
DEFAULT_SESSION variable of xserver-nodm-init.

If the default session cannot be found the user will be presented with a
menu to pick the session themselves. This relies on the xsessions
desktop entries.

Add a an xsessions entry for the openbox-session.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../openbox/files/openbox.desktop                 |  6 ++++++
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 15 +++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/openbox/files/openbox.desktop

diff --git a/meta-oe/recipes-graphics/openbox/files/openbox.desktop b/meta-=
oe/recipes-graphics/openbox/files/openbox.desktop
new file mode 100644
index 0000000000..62d1d85b43
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/files/openbox.desktop
@@ -0,0 +1,6 @@
+[Desktop Entry]
+Name=3DOpenbox Session
+Comment=3DVery simple session manager for Openbox
+Type=3DApplication
+Exec=3Dopenbox-session
+DesktopNames=3DOpenbox
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/re=
cipes-graphics/openbox/openbox_3.6.1.bb
index 5b62b9b2a7..5dfe0eec5c 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -9,6 +9,7 @@ SRC_URI =3D " \
     file://0001-Makefile.am-avoid-race-when-creating-autostart-direc.patch=
 \
     file://0001-openbox-xdg-autostart-convert-to-python3.patch \
     file://0001-Fix-list-traversal-issue-in-client_calc_layer.patch \
+    file://openbox.desktop \
 "
=20
 SRC_URI[sha256sum] =3D "8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b1=
0878483bde7ef7"
@@ -20,11 +21,9 @@ inherit autotools gettext update-alternatives pkgconfig =
features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-ALTERNATIVE:${PN}-core =3D "x-window-manager x-session-manager"
+ALTERNATIVE:${PN}-core =3D "x-window-manager"
 ALTERNATIVE_TARGET[x-window-manager] =3D "${bindir}/openbox"
 ALTERNATIVE_PRIORITY[x-window-manager] =3D "10"
-ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/openbox-session"
-ALTERNATIVE_PRIORITY[x-session-manager] =3D "100"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[imlib2] =3D "--enable-imlib2,--disable-imlib2,imlib2"
@@ -43,7 +42,15 @@ python populate_packages:prepend() {
     do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %=
s', extra_depends=3D'', allow_dirs=3DTrue)
 }
=20
-FILES:${PN}-core =3D "${bindir}/openbox ${bindir}/openbox-session ${libdir=
}/*${SOLIBS}"
+do_install:append() {
+    install -d "${D}${datadir}/xsessions"
+    install -m 0644 "${UNPACKDIR}/openbox.desktop" "${D}${datadir}/xsessio=
ns"
+}
+
+FILES:${PN}-core =3D "${bindir}/openbox \
+                    ${bindir}/openbox-session \
+                    ${datadir}/xsessions/openbox.desktop \
+                    ${libdir}/*${SOLIBS}"
=20
 FILES:${PN}-lxde +=3D "${datadir}/lxde/ \
                      ${datadir}/lxpanel \
--=20
2.53.0


