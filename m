Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9271088E76
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 05:18:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4579.1773897530926783749
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 22:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Fii2fzcf;
 spf=pass (domain: axis.com, ip: 40.107.162.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzuQhVxaUTC3jIGKtMKVgEJ8wIki7cysWcg/aTpHwYzO3BNiGJJlarrlyl8loKyp/sReAVZ537+wmiLd0QAuk/9fRbwUVUmCGvtd1bhQw4JcJD6bHzdkLl9/D3PXJlOvQYN/Yc8U4ALFEKPjWDN1Jgo9UcxBZ51mLoAm0lcU98qMep10cyj5pkRPxd0Ew/iPpqD0YSDlCu212xGr9oM8UH+B6vEC9Y24nbTf4nNzh/E4r6+SzDffZYZiYmBUuYpOBOQsVZ0deC9MGkL5hw1yM+g6lhrt1Gn46bpmhCrGkmMyCide0o42d6UvkJaa4jMHbBIdxetXjwKZPIFSYr60fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fxi3Xblfu2rnsUyVeR4rqaBTPrZZQdzmWN4Gzi7/bA=;
 b=ahW+I9aE4e2zOGpwVyGkBxjRdLbTInYYnuyD51xElnSHShnhiJbID/2FlOZ6WBIFqYGxHz1CP4isZbPnzM+pYoUICDNnuJH827wZn0dKwIVQvO+OdsRXHGjhVuDBOX3dCw+q6PiV3tg9920SW+GuaVOqjuF3ZAiIU8LA9oJcybzu5zqh37XbiN9qPZJnSKUUOUDkVJ3c5np0pDo3grZUrksktBhw5Sckxd+Qy6zQ6UbbUdR8zY5FqShcuPjSeVsN8QlT5mH49HgSbTrhGC36ocvYCJp9RgDg/wfv98t1ycBFu4Ha9j1DWqnhA9wbu4EOYP9uW2yMr8RwX4XL9rrjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fxi3Xblfu2rnsUyVeR4rqaBTPrZZQdzmWN4Gzi7/bA=;
 b=Fii2fzcf6l5EoSWPmF+PbpUQQftilLdbbk1xJzmfHsLnikF3smSW91lSbjBIerCHgVzDxIri8F/6/Xg7JRBvz5af5NWHRoSN/j9ndW/Fpch4mVxKTiRJsSFRTGNfpJ8JSChQO9OrQXtztdfwvsXeFp/petksYy/1mlKbnSevt5Y=
Received: from AS4P195CA0052.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::12)
 by DB9PR02MB6907.eurprd02.prod.outlook.com (2603:10a6:10:229::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 05:18:45 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::92) by AS4P195CA0052.outlook.office365.com
 (2603:10a6:20b:65a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 05:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 05:18:45 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Mar
 2026 06:18:44 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Mar 2026 06:18:44 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B32AD2753
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 06:18:44 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id B25C01206BF; Thu, 19 Mar 2026 06:18:44 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH] pipewire: Backport two patches to build with glibc 2.43
Date: Thu, 19 Mar 2026 06:18:43 +0100
Message-ID: <20260319051843.2243601-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B4:EE_|DB9PR02MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4113a8-9449-4a89-d412-08de8576fe3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SWvZuUKGymzGebLZfUFzldtNfAGOiBqsPJIp5ccbEihdwv+4I7WRo+rxmKVez9DHU/qbX52gSSQWZEx6Vi+8gfaORmv/FaITFIqFE6ypHvoB7DtR4HZkZtibpN9BOIVbL+6MAjhAPYNj59uWrM9MQrZLlf7AdwaER0TScr4daxCH1UfX/eWKQI9o/vWNXYq55h46PIl46juFhLeZmzsqOSJmKurff4ljIFpmDLyh/rGDico8qI8oGEqAgixZcr43WAvWdoKK45PK6wn2XEOUUi3FaWbQDNVALFuD2FG7K4gyhAJCsFrZ8CtRKZ+O1W6iUeqwJMaJ0zEAFl3FFpL6Uvw4uKEmhIvDsKPEW6duiVz3B+vGMlnEWlwFsY2S3i8jbQ18ZVHtFH19L1PlFqxP+YuV+B9R0SbV7tHZlCeUe8KUBuAzh11zogk60/wUoWgaGmBA6IRCE2ZWyokhIvX7BY+Iu3b26q/e3oc8D97MchTamzkPA0LDktS3+W3DNb4Kz6Rp4yjQozxYFCsWqY9FRwKmvEtxgzj4viCHEkuIkKM8WZTUX4x2oWSREmWVwGVCbaRBblPdXMNu5O5Ar+JEK5Q7SuFK+Oe7j06qUyni05s2HjXoKf2xqEoYg0P5WFkwMu0mz370RG8LNJ+b0VELhkWDp+KWyX1QHKjoN2A3sIHH+7iaBobAyFRMZZU6ZD0nqNcu9G3wSf3dCczKDxhKIb6rnLIYSmDZOANnKYpf3dg=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/mYhypfIx2YH1yHiyxyo/HA9dOppfzdcLhVjipqcXE92HdmAmkMmQrMMQSLlMNWZla6tac4GzORQPjFHL2sVqDPBbmt3HslXzvIdW+ZRtRGTVhBoDH0niuWMdgE44x4w+7JKLYfJv8Xk/wfje9rtC83IEYFUHAuUxfHaKfXNkGNhbsj9IP8JV7UW7omYn6S1U4gpdKLhvESYKQHHfhdjTD1M399N2Ee/BGFUZI0uaEB4ShPAT0/cVN5rqq9Jn0OUFTY/17jyDlMdU8/usy1jnLACRwgMtCDt/HqI2Nq74ELGY81EswS5gUeX+IJQc3H1oTwppW0BT4MIi3MgjpMyQUIGhXcA+LZeI7fr8smNMz99KfzIeP9e+1Y/7mf3ypu+pIq0mfQilJ4uzjJ+bjncdj5Iehm6aWftNK6WocwqDfoKjOMf7Qtkb0KLAvLuQ/jM
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 05:18:45.0965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4113a8-9449-4a89-d412-08de8576fe3e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6907
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125376

This avoids the following error:

  In file included from spa/plugins/alsa/acp/compat.c:26:
  spa/plugins/alsa/acp/compat.h: In function 'pa_path_get_filename':
  spa/plugins/alsa/acp/compat.h:437:13: error: assignment discards
  'const' qualifier from pointer target type [-Werror=3Ddiscarded-qualifier=
s]
    437 |     if ((fn =3D strrchr(p, PA_PATH_SEP_CHAR)))
        |             ^

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...-acp-compat.h-Fix-missed-Wdiscarded-.patch | 28 +++++++++++++++++++
 ...-acp-compat.h-p-is-already-const-do-.patch | 25 +++++++++++++++++
 .../pipewire/pipewire_1.6.2.bb                |  2 ++
 3 files changed, 55 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/00=
01-spa-plugins-alsa-acp-compat.h-Fix-missed-Wdiscarded-.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/00=
02-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-=
plugins-alsa-acp-compat.h-Fix-missed-Wdiscarded-.patch b/meta-multimedia/re=
cipes-multimedia/pipewire/pipewire/0001-spa-plugins-alsa-acp-compat.h-Fix-m=
issed-Wdiscarded-.patch
new file mode 100644
index 0000000000..6ded1c15f8
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-plugins=
-alsa-acp-compat.h-Fix-missed-Wdiscarded-.patch
@@ -0,0 +1,28 @@
+From c847b8162959c29b783585e0dcadbfb096e7cb73 Mon Sep 17 00:00:00 2001
+From: Ripley Tom <discofan420@protonmail.com>
+Date: Sat, 21 Feb 2026 19:33:11 +0100
+Subject: [PATCH] spa/plugins/alsa/acp/compat.h: Fix missed
+ -Wdiscarded-qualifiers warning
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipewir=
e/-/commit/c847b8162959c29b783585e0dcadbfb096e7cb73]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ spa/plugins/alsa/acp/compat.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/spa/plugins/alsa/acp/compat.h b/spa/plugins/alsa/acp/compat.h
+index f7592e1a6..0f7b959df 100644
+--- a/spa/plugins/alsa/acp/compat.h
++++ b/spa/plugins/alsa/acp/compat.h
+@@ -429,9 +429,9 @@ static PA_PRINTF_FUNC(1,0) inline char *pa_vsprintf_ma=
lloc(const char *fmt, va_l
+=20
+ #define pa_fopen_cloexec(f,m)	fopen(f,m"e")
+=20
+-static inline char *pa_path_get_filename(const char *p)
++static inline const char *pa_path_get_filename(const char *p)
+ {
+-    char *fn;
++    const char *fn;
+     if (!p)
+         return NULL;
+     if ((fn =3D strrchr(p, PA_PATH_SEP_CHAR)))
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0002-spa-=
plugins-alsa-acp-compat.h-p-is-already-const-do-.patch b/meta-multimedia/re=
cipes-multimedia/pipewire/pipewire/0002-spa-plugins-alsa-acp-compat.h-p-is-=
already-const-do-.patch
new file mode 100644
index 0000000000..d6fc5866ec
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0002-spa-plugins=
-alsa-acp-compat.h-p-is-already-const-do-.patch
@@ -0,0 +1,25 @@
+From 1a37f445a20e67976c83360ab5830887fffe37e2 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Tue, 17 Mar 2026 03:17:15 +1100
+Subject: [PATCH] spa/plugins/alsa/acp/compat.h: p is already const do not
+ recast
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipewir=
e/-/commit/1a37f445a20e67976c83360ab5830887fffe37e2]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ spa/plugins/alsa/acp/compat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/alsa/acp/compat.h b/spa/plugins/alsa/acp/compat.h
+index 0f7b959df..87151d197 100644
+--- a/spa/plugins/alsa/acp/compat.h
++++ b/spa/plugins/alsa/acp/compat.h
+@@ -436,7 +436,7 @@ static inline const char *pa_path_get_filename(const c=
har *p)
+         return NULL;
+     if ((fn =3D strrchr(p, PA_PATH_SEP_CHAR)))
+         return fn+1;
+-    return (char*) p;
++    return p;
+ }
+=20
+ static inline bool pa_is_path_absolute(const char *fn)
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb =
b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
index 14e467fa33..6914a4a0ad 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.2.bb
@@ -15,6 +15,8 @@ DEPENDS =3D "dbus ncurses"
 SRCREV =3D "95da54a482b68475958bbc3fa572a9c20df0df74"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D$=
{BRANCH};protocol=3Dhttps;tag=3D${PV}"
+SRC_URI +=3D "file://0001-spa-plugins-alsa-acp-compat.h-Fix-missed-Wdiscar=
ded-.patch"
+SRC_URI +=3D "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const=
-do-.patch"
=20
 inherit meson pkgconfig systemd gettext useradd
=20

