Return-Path: <pratheeksha.s.n@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A01E65D3F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 10:08:25 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.29])
 by mx.groups.io with SMTP id smtpd.web11.21198.1732270103497955997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 02:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=Mxx62OdS;
 spf=pass (domain: ni.com, ip: 40.93.195.29, mailfrom: pratheeksha.s.n@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ont6lpZnr4pEqF4KMfD3A+jH7wQ5kkU2N8NU1fayI7q36W1W8Ujr1hwvrYGufiBQOZM8c5RplbTX7//aWDiKnA5HbqOifJvZfNhXCc5otvkdZOMot0LF+HWonkAFkz38MEPOK4fJ1LIfWHf/TSUz41oRFkHUNHVYYRB7gzv6Zb5Kv7YcpJja6GHt9LiPazt4V3MLIbuWKRw9qqvCmVd83SXMPyGZyya2dWpQZGVy4YMbYUDhJFn+52YJjYnO2qF03JCMYhRzI4ak2dzT9t+9e6jxrOqa1t62OeiWg/wRURgL+rHeECNcu/xPCupjKmj+ZCL7o8bFnulfqRxg8Ra8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5LMtaCFbj+Dza6dN0uMznR0dG2hGy0KhJx7w1A5WGw=;
 b=fnYeq9gFkZXhZNZ90O+SRvwozlGD4MU5mXIQS3F8wGo7sM/IGHs8O5Nrv8nbhCdRHk2eY32chXqvRejivcbsGUMA/gic2gic1cyFoSOvdLJdAIF97t1+yFSoDgVSAEfzi8yreub2ucPXMp15ORGxEcHpvtrfRJ7luwt7fELJF9nxFTN8gz6/C+r80U0aUGJtIY0pqnEVkmA2cUM/0JImPKTyA7kKUYw2YSPDJfe0kICh6kWDPXk62bILuuPuHj5V1iTRXnVF8xaD1ovRz6NP/+sfFRAxydScp88zuTTF3ZcFi4Eo38fS+/uLl8V5MOIUMb69WCdf6cs71twW83+pLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5LMtaCFbj+Dza6dN0uMznR0dG2hGy0KhJx7w1A5WGw=;
 b=Mxx62OdS73j0vpvO9TwjtGRb/LhPJBxJfGmicWX9Is1u/b9PWGH7r6UxKcwKPBEcUv93Ol5ejHGnuOishLi0+/tn+YRgefIZNLya48eeL43BI4OEYBWtZqX3UPkxM3FdBDAwU433+zSsRPTD+p8FzSjEdxG+GXaSuEQqwQWgHHk=
Received: from CH0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:610:e6::11)
 by DM6PR04MB7034.namprd04.prod.outlook.com (2603:10b6:5:24e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 10:08:15 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::84) by CH0PR03CA0276.outlook.office365.com
 (2603:10b6:610:e6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend
 Transport; Fri, 22 Nov 2024 10:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 10:08:13 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 22 Nov 2024 04:08:13 -0600
Received: from INRD-PSN.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 22 Nov 2024 04:08:12
 -0600
From: pratheekshasn <pratheeksha.s.n@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: pratheekshasn <pratheeksha.s.n@ni.com>
Subject: [meta-gnome][PATCH] Onboard: Add onboard virtual keyboard
Date: Fri, 22 Nov 2024 15:38:10 +0530
Message-ID: <20241122100810.3460864-1-pratheeksha.s.n@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DM6PR04MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 9860245c-6a53-45bf-1f97-08dd0add93ed
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/6Jj4vuVYPFhgooOPnEf96AW2RT3nE8/p79jrRd3JqE9sY3jp0NhHbSeUpJ8?=
 =?us-ascii?Q?M/b2YyRs6bUeOiy/rye7Cb0MfSrcuhJtTxELv9gGb3uYbLiNz2jIDD7nNMDz?=
 =?us-ascii?Q?cuZMWVp3rpRQkXto6VxTLknsXVvF2M3T624d+QH27QAHaMTxBMwSXRGHnD+t?=
 =?us-ascii?Q?3r7JkA1yYzueX69VbWHH487JQHAYDnRhXsLHLtuFQLdDg2gnqkBVlLSQzv2w?=
 =?us-ascii?Q?aT2S3V7jPgutnGNwYC/e+xma/lqSi4Jb0zzIZbA/FDjG7TyA3G97WOPALurY?=
 =?us-ascii?Q?FmC9NWlogsmJdoim0XFZyBy1qv2TFxRJfHDAwrvn+zkEDhElMd+bU7mQDhxb?=
 =?us-ascii?Q?HjW9Oi94bt6mOkvLi1vXzdPgMhgocWxMqJ7M8VNvHaIuB2od8tQ6iKIrUnD6?=
 =?us-ascii?Q?4tTejgtwJLxYUkAvtZI4CivkiVZioAAK/lyXTucTsovAXABj0zsZX+l8UoAx?=
 =?us-ascii?Q?SwO0AEjSXitF9zKrW+ZKSYeBBnc9pHVTOlzgFCVDcS3yaHU/WtxsHhmPChEy?=
 =?us-ascii?Q?IJMAMAORdvyX200Ftnfrxt41WUzIWkNhUioybT1ut3e8svSzvslrzu3yDsoj?=
 =?us-ascii?Q?3IDtUxnS7kzZ4k2cPpNgWQg24e8BHHZLHkiMHihF7AweAdRYb4I0EyiFs7gk?=
 =?us-ascii?Q?B2eDM6KWcbei/HgVp71Kxg/jvAasTKL8nen4d+wqua+ACDGWv4LKd2lUwDyA?=
 =?us-ascii?Q?3d4ZeXSPqrbAOqcUnNDvYFeaRndXbQGXMmKkTWlwhbVDDScSrBA00Pr758f5?=
 =?us-ascii?Q?TVfVkXYNLPY5S/S2kLDk3nwOx5yfzD8RVl6fvVjx/Daoxr+LzUs6YALtI1TB?=
 =?us-ascii?Q?0P7Cq21a42TmeO+/nEZgveHaVNZm5sFynHz/pgqic2QowImXIwF1fgfKID3v?=
 =?us-ascii?Q?l8zzt6mrarVbDDhWaEo/f6pdLR+KqQsGPDoY2AF8Fdc14OTQvfZ7TEfSyNJ9?=
 =?us-ascii?Q?PNLXF8SVStqnPNiWhGDmkocFoQIn7o7lXHXaPg5drYU7hGJ/MkN9Z2dcwtMf?=
 =?us-ascii?Q?h5KPqqlhqlM6wQiGZZs2+rJL01dS6PuDFQq+mRYh7FZC8ozj7Ia84WduDKwJ?=
 =?us-ascii?Q?sVPlHPai3wkJJ3cesU8HZowkzzy2yl2lGCT7lRMwcmmLc3ZtNEymhgHH9nji?=
 =?us-ascii?Q?zTaS+/77rF7MoGPVToYDht0pvQcfiNO/6OeuhyPo5WWlECvWfC5m86gK0ieP?=
 =?us-ascii?Q?yBhrPXEiDr7XX5qvaMyXrdwEGDoAuf5Nk3H6DloqkCV5jGeDuWqEOd8Mh3Yn?=
 =?us-ascii?Q?7bIlCA3CKryl2rRTy0ASvpEcmN+aU+RoZVCDv0X2d+jYNU2M07kNU4sUueX8?=
 =?us-ascii?Q?lzVX531uFumRsN3NRe4QAZk44nwhMNZ8/j8xIVE5PqSCsCZX+asYbCTKDhhX?=
 =?us-ascii?Q?G92MX9KiTJNRPC428a1Sje3HwMWI?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:08:13.9663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9860245c-6a53-45bf-1f97-08dd0add93ed
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 10:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113995

Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
---
 ...ine-error-API-if-platform-does-not-h.patch | 67 +++++++++++++++++++
 .../0002-onboard-onhover-seg-fault-fix.patch  | 52 ++++++++++++++
 .../recipes-support/onboard/onboard_1.4.1.bb  | 36 ++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pypredi=
ct-lm-Define-error-API-if-platform-does-not-h.patch
 create mode 100644 meta-gnome/recipes-support/onboard/onboard/0002-onboard=
-onhover-seg-fault-fix.patch
 create mode 100644 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb

diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-D=
efine-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-support/o=
nboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.pa=
tch
new file mode 100644
index 000000000..fda37895c
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-e=
rror-API-if-platform-does-not-h.patch
@@ -0,0 +1,67 @@
+From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 09:01:04 -0700
+Subject: [PATCH] pypredict/lm: Define error API if platform does not have =
it
+
+error() API is not implemented across all libcs on linux
+e.g. musl does not provide it.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Onboard/pypredict/lm/lm.cpp         |  1 -
+ Onboard/pypredict/lm/lm.h           | 13 +++++++++++++
+ Onboard/pypredict/lm/lm_dynamic.cpp |  2 --
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/Onboard/pypredict/lm/lm.cpp b/Onboard/pypredict/lm/lm.cpp
+index 2e64296..37ae241 100644
+--- a/Onboard/pypredict/lm/lm.cpp
++++ b/Onboard/pypredict/lm/lm.cpp
+@@ -19,7 +19,6 @@
+=20
+ #include <stdlib.h>
+ #include <stdio.h>
+-#include <error.h>
+ #include <algorithm>
+ #include <cmath>
+ #include <string>
+diff --git a/Onboard/pypredict/lm/lm.h b/Onboard/pypredict/lm/lm.h
+index ed4164a..b8b63ee 100644
+--- a/Onboard/pypredict/lm/lm.h
++++ b/Onboard/pypredict/lm/lm.h
+@@ -32,6 +32,19 @@
+ #include <algorithm>
+ #include <string>
+=20
++#if defined(HAVE_ERROR_H)
++#include <error.h>
++#else
++#include <err.h>
++#define _onboard_error(S, E, F, ...) do { \
++       if (E) \
++               err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
++       else \
++               err(S, F, ##__VA_ARGS__); \
++} while(0)
++
++#define error _onboard_error
++#endif
+=20
+ // break into debugger
+ // step twice to come back out of the raise() call into known code
+diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/lm/lm=
_dynamic.cpp
+index 7c62824..e7c7f40 100644
+--- a/Onboard/pypredict/lm/lm_dynamic.cpp
++++ b/Onboard/pypredict/lm/lm_dynamic.cpp
+@@ -17,8 +17,6 @@
+  * along with this program. If not, see <http://www.gnu.org/licenses/>.
+  */
+=20
+-#include <error.h>
+-
+ #include "lm_dynamic.h"
+=20
+ using namespace std;
+--=20
+2.13.2
+
diff --git a/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhove=
r-seg-fault-fix.patch b/meta-gnome/recipes-support/onboard/onboard/0002-onb=
oard-onhover-seg-fault-fix.patch
new file mode 100644
index 000000000..1ec195cb8
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhover-seg-f=
ault-fix.patch
@@ -0,0 +1,52 @@
+From: 1be95325d320122efd5dedf7437839cfcca01f7a
+From: https://github.com/void-linux/void-packages/commit/1be95325d320122ef=
d5dedf7437839cfcca01f7a
+Date: Mon, 23 Sep 2024
+Subject: [PATCH] onboard: fix segfault when hovering over the keyboard
+
+Currently, if the mouse pointer is hovered over the Onboard keyboard, the =
application crashes with a segmentation fault.
+This is because the new_device_event function is not acquiring the GIL bef=
ore creating a new object. This patch fixes
+the issue by acquiring the GIL before creating a new object. It also acqui=
res the GIL before queueing the event.
+This patch is taken from the fix provided in the following link:
+https://github.com/void-linux/void-packages/commit/1be95325d320122efd5dedf=
7437839cfcca01f7a
+
+Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2017-10-09]
+
+--- a/Onboard/osk/osk_devices.c
++++ b/Onboard/osk/osk_devices.c
+@@ -97,13 +97,15 @@ osk_device_event_dealloc (OskDeviceEvent
+ static OskDeviceEvent*
+ new_device_event (void)
+ {
+-    OskDeviceEvent *ev =3D PyObject_New(OskDeviceEvent, &osk_device_event=
_type);
++    OskDeviceEvent *ev;
++    PyGILState_STATE gstate =3D PyGILState_Ensure();
++    ev =3D PyObject_New(OskDeviceEvent, &osk_device_event_type);
+     if (ev)
+     {
+         osk_device_event_type.tp_init((PyObject*) ev, NULL, NULL);
+-        return ev;
+     }
+-    return NULL;
++    PyGILState_Release(gstate);
++    return ev;
+ }
+=20
+ static PyObject *
+@@ -334,6 +336,7 @@ osk_devices_dealloc (OskDevices *dev)
+ static void
+ queue_event (OskDevices* dev, OskDeviceEvent* event, Bool discard_pending=
)
+ {
++    PyGILState_STATE state =3D PyGILState_Ensure ();
+     GQueue* queue =3D dev->event_queue;
+     if (queue)
+     {
+@@ -364,6 +367,7 @@ queue_event (OskDevices* dev, OskDeviceE
+         Py_INCREF(event);
+         g_queue_push_head(queue, event);
+     }
++    PyGILState_Release (state);
+ }
+=20
+ static gboolean idle_process_event_queue (OskDevices* dev)
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gno=
me/recipes-support/onboard/onboard_1.4.1.bb
new file mode 100644
index 000000000..359a2134e
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -0,0 +1,36 @@
+SUMMARY =3D "An onscreen keyboard"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING.GPL3;md5=3D8521fa4dd51909b407c5150498=
d34f4e"
+
+DEPENDS +=3D "gtk+3 hunspell libcanberra libxkbfile dconf python3-distutil=
s-extra-native intltool-native"
+
+SRC_URI =3D "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV=
}.tar.gz \
+           file://0001-pypredict-lm-Define-error-API-if-platform-does-not-=
h.patch \
+	       file://0002-onboard-onhover-seg-fault-fix.patch \
+           "
+SRC_URI[md5sum] =3D "1a2fbe82e934f5b37841d17ff51e80e8"
+SRC_URI[sha256sum] =3D "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb1=
91e43a231a3865"
+
+inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime=
-xdg
+
+REQUIRED_DISTRO_FEATURES =3D "x11"
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${datadir}/icons \
+    ${datadir}/gnome-shell \
+    ${datadir}/help \
+"
+
+RDEPENDS:${PN} +=3D " \
+    ncurses \
+    python3-dbus \
+    python3-pycairo \
+    python3-pygobject \
+"
+
+do_install:append() {
+	install -d ${D}${sysconfdir}/xdg/autostart
+
+	mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/autostart/onboard-auto=
start.desktop ${D}${sysconfdir}/xdg/autostart
+}
--=20
2.43.0


