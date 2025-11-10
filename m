Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE56CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:35:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45401.1762770897687376763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=Bcmapbzl;
 spf=pass (domain: phytec.de, ip: 52.101.65.95, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmXW01fWgM7Mub2bklV5eL3kF7+t+VEI4F6FffHD8BzE0EFskPPEywFySTkMlEJERHY57DES58+RErB+g+do7Ih0lV4Z7L5Tc5qwPZpONQMaCGRA7GYGO8Gc2wgaABkSVmvNIwN7eeOpgJh05xe7M0KcAsmYywjp7AShXgMdP+6UjxvfWIdP8+9gcXPNFfKeNgftLc0T9NZViLRGK7MySHOzIBchbeP9uQsBqJ9JnWvK4iEqAmSao6sDt4fwNuUbWjsTvvllACA+5cTN7hiqPxYJCUVVgkeUpvnDDpPW4EvMY4t7l7XfN0+XksQEeElgk4aKL86BsRGmbOSuE6Oqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjyaAQiqOFkG4W7k2N/OmoyRvq9nNA8Ut1AT4JqA9Hw=;
 b=EtFMUgsUSKwkz4JJaOt2kyPgnoiXYnjFFKkmGHKuN6pIxRdNcnh3tt2dxPrukOp6KzmHTF8mJ8VgR56nv7Jkf1Zz/5DbIvcoOVHGikbV5cWGuIZTF0hJaTB68SypW0N0zzgA/91wLcXgRUSeOjFZht82oyIZadRA3EOiybva2Dao4BZinW3NlAgNxlR4cSIJZcTfjcGqxnN3NimM+zPK1rP88DTI4myZ6iDIAJ/6kA5fEatF4ZVt2AxFUaLX5OoMBftXhqj1o9j5/4U4mrTUi3ol/UxjlmLsoAZyLhKaoh7WHXNGHIuB1DK8R1P637RZTO3Ocr1jogM8PiaqbSEzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjyaAQiqOFkG4W7k2N/OmoyRvq9nNA8Ut1AT4JqA9Hw=;
 b=BcmapbzlpHRozHssJHFs5KBQOlUOHRqPLdJ0yz+8ODJ2AmdHs6HNnFSyJiD37NNK4pM/2yDDB7+OPlrASgQkEYNDJmbO1BL1mb5o0uxW8dmMJrvU6hUfa+XStLDMYtSqLHRIZTZHGLXU0YgeAMQqbqSKJRMZ9ATqlFNU2UIz/wXCvpsQSMNotyHTm/ddsAViCcqGsvrGDx9U6cWjJ2/77LQVmXhJfQRpOHg7LE8OYqidSgI/2KTOvrci1A9LhxGRWqq2pjdblElU6Xj/9eHrxD6WVTw/VsNwzxcHgMlYCMzQItJaBK6eMQ0+RCTqT+0nLk8MOILeJiPK14O78JVDeQ==
Received: from AS9P194CA0018.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::30)
 by PR3P195MB0973.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:a0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 10:34:52 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::47) by AS9P194CA0018.outlook.office365.com
 (2603:10a6:20b:46d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 10:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 10:34:52 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 10 Nov
 2025 11:34:52 +0100
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][scarthgap][PATCH 1/2] cockpit: fix build error
Date: Mon, 10 Nov 2025 11:34:41 +0100
Message-ID: <20251110103442.3179795-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PR3P195MB0973:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ec42ac-30d1-4b71-12eb-08de2044c851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g4NreU696qj1kCL5ufVYGv+E0OvVc9Q0xxpK2VwF4kPwb492v8rXnDhXlRQb?=
 =?us-ascii?Q?t2ak9vEIq+11jGZofJsaNkBnKXnjge+1Tcl6sWjXYIVX+MJqq0MiDK2nbadi?=
 =?us-ascii?Q?kXUhTg5cVpMKaB7GuGgEVfEURlhOLoRO992A3jw6fEauswD0706NV6h/xTcN?=
 =?us-ascii?Q?ZvibuqVktvta+gtR1rRi1GjdRr3T+JUcq0PbAaqNfmX1ERTITx1ORtTTTq4s?=
 =?us-ascii?Q?9yYQy1nLt6sD3J4PpmrnIxYg7K9ejCZkD78SaDfkm20poW7hELAxCpCgGCpV?=
 =?us-ascii?Q?cUtm87eWF1RLMxvOg0K3RyhSJchLyqG7NYzZfSPqNfJbA331hqX3Nr93wiSj?=
 =?us-ascii?Q?o6RxlFM9APb1nglxHH0HRTQQo56C0SE2O9teghF5jysyAgedrdPY6M1BqFLe?=
 =?us-ascii?Q?V835yLBX0E18jIlgAnqOFIYRmjamwZkQjwTLdplk1hauIlWQxTAM9V1qqqz7?=
 =?us-ascii?Q?5ZzuD/hczLI0jHsspFCoTGjkheQ/xwtvTJdXrDFCsRYG1VzbmIDNcBsaRW73?=
 =?us-ascii?Q?WBlMWVH7RDxM6zfCdOCbg5QvewTQDfbnGYETT2RysECzwCwFUCzuAr99GQyv?=
 =?us-ascii?Q?tdbgLSj5k0naliK+rKkaqb9yiFPZDB2gcw3S2TjWjqhaNor81deRnvCKo7K7?=
 =?us-ascii?Q?jf2mneZSTvkauoMvB8qAqJBzptIbb40ZFb664GyXQl26JWvK6yRt8ahz+94z?=
 =?us-ascii?Q?ytZ9IXNxqD+Rk7QacO+XDWTgYa6tOwPOiP/MJMeBCWGGd2oS40hpdfUetUr7?=
 =?us-ascii?Q?qPYm+gTP2+dS75Akuvb+GPLtkceKyJSN9h8ESZALcqI1nbg5DGb7B/ywrOnk?=
 =?us-ascii?Q?/KbMgdGQ4vm/pkrTtsVS2ospdB9G1VEO2QeLHYF1CEdtklaPHQSI+2wrHj1r?=
 =?us-ascii?Q?2bTwFuD3vAzd+ajevXC1naoCDqm5XMNT9A85cXGJ32mbzcsPu46oNAJcPnWA?=
 =?us-ascii?Q?HIGMh4UsNMRAUQY1U0Y8nK1xwmCsBSNo8HUJBSkwXAGdqQtrlFjGDz19rA2U?=
 =?us-ascii?Q?UhLY+HUFc9t4xNmYChQNGOytrxi8k18DY1+h3Jyjj3W4GpqICB0ispy3Vu0k?=
 =?us-ascii?Q?CQOS8A4AO4zoCNk9uhHqwMyAtS1tcdZafKJD6Iq4WgDPhbBAQXIbNtH3v9X/?=
 =?us-ascii?Q?XoeH1DWLRTaj7I0j3B9n3eQJWBb879IX8Soe7MuPRuzYynnN+TqyPaf5zToe?=
 =?us-ascii?Q?mX7qrxuawnC5fwFIagbucR3S8PSly6jYKJ6C6MKPCKIULXn5jSooGaX3dUMB?=
 =?us-ascii?Q?9TEPbMk8rD6DVRLDaNsa5fz4gjZI9gE1zSNu+dXCzf/A1LXKEdwTF3u28WXp?=
 =?us-ascii?Q?n21P4bizkeDsOpa1tiTR6xqO3NkQ4VgSbxTKKmCsQ77aalVq38EyxdNg4tUf?=
 =?us-ascii?Q?JyHXOMDR/C2+L/A9DJU15uIJRSm8mYruKydGbqiDrjjbAvYGRSwVqwbAO4lF?=
 =?us-ascii?Q?XzhY3nbn7WjeaoTwGymycQgrZAar88+UoADXIXQjcGsFsBhiO77xfCVmcaSZ?=
 =?us-ascii?Q?7zFPYQ/1sx5fMMCkwzxOs83s16KCwltTGFER+jugBoQcJvdHaS3z69xkLppg?=
 =?us-ascii?Q?Qyh/DoxWi23P2T+cBgk=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 10:34:52.3420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ec42ac-30d1-4b71-12eb-08de2044c851
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0973
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 10:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121456

Fix a build error caused by a missing build directory. This is already
fixed in cockpit 344 and newer so backport the fix.

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 .../recipes-webadmin/cockpit/cockpit_304.bb   |  1 +
 ...sing-src-common-directory-in-build-t.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/cockpit/files/0001-buil=
d-Create-missing-src-common-directory-in-build-t.patch

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/meta-=
webserver/recipes-webadmin/cockpit/cockpit_304.bb
index df7f47a1182a..f8b8b52608bd 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd2559=
51079008b364516c"
 SRC_URI +=3D " \
     https://github.com/cockpit-project/cockpit/releases/download/${PV}/coc=
kpit-${PV}.tar.xz \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
+    file://0001-build-Create-missing-src-common-directory-in-build-t.patch=
 \
     file://cockpit.pam \
     "
 SRC_URI[sha256sum] =3D "a87d090c930e2058bb3e970ca7f2bafe678687966b5c0b8b42=
a802977e391ce9"
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0001-build-Creat=
e-missing-src-common-directory-in-build-t.patch b/meta-webserver/recipes-we=
badmin/cockpit/files/0001-build-Create-missing-src-common-directory-in-buil=
d-t.patch
new file mode 100644
index 000000000000..2b2c1ca6b0f1
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0001-build-Create-missi=
ng-src-common-directory-in-build-t.patch
@@ -0,0 +1,32 @@
+From e0e5959d91f53bdc7825f8bf07b2d8c74e0f56cf Mon Sep 17 00:00:00 2001
+From: Martin Pitt <mpitt@redhat.com>
+Date: Fri, 25 Jul 2025 07:00:52 +0200
+Subject: [PATCH] build: Create missing src/common/ directory in build tree
+
+This caused a build failure with parallel builds when using a separate
+build tree. Thanks to Nicolas LANTZ for the fix!
+
+Fixes #21918
+
+Upstream-Status: Backport [https://github.com/cockpit-project/cockpit/comm=
it/2038da3237abf8ae181ada05db1cde834876b03d]
+
+Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
+---
+ src/common/Makefile-common.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/Makefile-common.am b/src/common/Makefile-common.am
+index e7d1ca04f3f7..0da5b74e9f25 100644
+--- a/src/common/Makefile-common.am
++++ b/src/common/Makefile-common.am
+@@ -102,6 +102,7 @@ libcockpit_common_a_SOURCES =3D \
+ # libcockpit-common.a static-links an HTML template to use on failures
+ nodist_libcockpit_common_a_SOURCES =3D src/common/fail.html.c
+ src/common/fail.html.c: src/common/fail.html
++	@mkdir -p '$(dir $@)'
+ 	$(AM_V_GEN) $(top_srcdir)/tools/escape-to-c cockpit_webresponse_fail_htm=
l_text < $< > $@.tmp && mv $@.tmp $@
+ CLEANFILES +=3D src/common/fail.html.c
+ EXTRA_DIST +=3D src/common/fail.html
+--=20
+2.25.1
+
--=20
2.25.1


