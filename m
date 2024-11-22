Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E3ED75E31
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 12:08:25 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.194.8])
 by mx.groups.io with SMTP id smtpd.web11.17674.1732251405497059278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=aaxLEVA7;
 spf=pass (domain: ni.com, ip: 40.93.194.8, mailfrom: pratheeksha.s.n@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdmUxGylocqmKb8+gXzr7E7eGpoJ24b4DFDU+JJe2h6tfugJNevrBxpQvEHo/+xHCefpf0yQbkqHSW/9+SlesL10laYMinssN+qrDPsyVrOW9ZPN1h0LQt/lKHQ16E6EbXSCXmWwf190Oy9/i+p7EiYaSSXdGVMCW1OKRueGnG4TUH6PGAha1BY/p9LvQ70AMeN9VBeXWx2SFwoiWmh8h4e8PwGIK5aaxlelEsh9HJQe0HqXFVs31Gyxdo8Y5ShAQQ9lh/SEzC4Qza3pKKPGBkAQUHPUg004NMLqJkFMbn7Lz17dYaqxhFFK7ocxDJtF1DkjjY/I911QNL96bHT+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5LMtaCFbj+Dza6dN0uMznR0dG2hGy0KhJx7w1A5WGw=;
 b=BoyLDGpsICcNVQVnsgs/A/gUUr6Qs06NvPeLPIGM8LbwuqxgkPUUHaa7YHEHwLMq7Y8vBnXbeJk7XDwYnILlKLrQCclJN9/RsZW7b/fw1dCalF39AVfqQoU+8BbFIW5k67VTv4X5yiZimE+0dDYCeELCQLE8QUJIaDVSV11HPYgWbfyEMCIswcIFyTwRpA52iHtshbw7/PuRuZZGpVvIpecUGxzUOCAw3iipjUQib5k6rp6+045hhMfplSF9ha1ACnrrtabgxd8lRqo7hPRCRoP4lPMJH2RuZsrlaXjXGhNSViBvd+hS0OBA+Dh4nXYFCU2N2zwH2iyouLzyqNZbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5LMtaCFbj+Dza6dN0uMznR0dG2hGy0KhJx7w1A5WGw=;
 b=aaxLEVA7oULq+sycZ0muSsQMI6SeRxVSgd4K+c+n6hwHWHZhMe0JaFPPdhYeWOjEIK9DNDmzgyNQZOeHpbKvBSEeKqJzIRICyFxy+pwtq3ZlgNNgLYl1IhDrPF8RnZ/QOYtDcjc763HikgsoeXYSnkgC8zOqvU8JRmhwHN+n7z8=
Received: from PH7PR17CA0048.namprd17.prod.outlook.com (2603:10b6:510:323::11)
 by SA3PR04MB8770.namprd04.prod.outlook.com (2603:10b6:806:2f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Fri, 22 Nov
 2024 04:56:39 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::3c) by PH7PR17CA0048.outlook.office365.com
 (2603:10b6:510:323::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Fri, 22 Nov 2024 04:56:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 04:56:38 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 21 Nov 2024 22:56:37 -0600
Received: from INRD-PSN.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 21 Nov 2024 22:56:35
 -0600
From: pratheekshasn <pratheeksha.s.n@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: pratheekshasn <pratheeksha.s.n@ni.com>
Subject: [meta-gnome][kirkstone][PATCH] Onboard: Add onboard virtual keyboard
Date: Fri, 22 Nov 2024 10:26:32 +0530
Message-ID: <20241122045632.2470221-1-pratheeksha.s.n@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SA3PR04MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f1a35b-0298-4d5c-2a32-08dd0ab20c2d
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QaUIkf1ifAi8dGX3PcZxLY/Ozma4KrHa3F+1vWeKZSsUX5yGYYEYP9r4bTDq?=
 =?us-ascii?Q?QJbJNBWndTxrr4JpaQzhYf0+TxSx3RHep59tRQ+aaHJ6fo1zaqZ3VCqPmSXU?=
 =?us-ascii?Q?GWxumF/gghTw2p/BgK8pmdAM6C1Yl5BApPpobU+tliLmcp5s/WDkJ5yQD/w5?=
 =?us-ascii?Q?3dQGftEQBEE5AWVi6nNmVYNxmBGS9C5KQAlTyF4gW656Cpr2z8Bf66gv9HfF?=
 =?us-ascii?Q?nFaUzayMf4kBzCa+p5Ng3yseMdfhn5sdogkh14uhDmutnyrjPMsrcxpnCZ/3?=
 =?us-ascii?Q?eWw62CNWXkG6mIuyc3Bhryl69u2OvHEnw4Td+I4P7aUZoFslgo1wYQTVDFx3?=
 =?us-ascii?Q?K5jhxxMkIrrOwyUOP2Dim8aCHlPoJZtWVYTsfnPaBszsKWoBrbdBtUs20MfB?=
 =?us-ascii?Q?zz+hkjHI2nnBFmXA9PeefjQrb0v970U6QhMvPTTBoqmOT0H2Q+W2o+HlNKOx?=
 =?us-ascii?Q?EOqrj0z8EWrumK90MLT1GyvAEFmyNN1e/lIeq4HOpNaTdLPeI4FtM0uQ7pRw?=
 =?us-ascii?Q?P9MTEO8nOth52MmA9+/VhvJDaLZ+2VdVQP/8BDPfd4CchqNde6StacQ+U22C?=
 =?us-ascii?Q?gkKooy9HSm2Sb6vuTPCefDQ5ds1OG7gi+0kAcKmcmjoo87fzmyBt+TiqJwG5?=
 =?us-ascii?Q?KyfMVsBCt7hRhVGCVnz4Vc13b0aiwJN0m0ljAyeBVkM8UvEPJwWrT9szN+B+?=
 =?us-ascii?Q?F9H0At+iDhKLBw8UG4VghlTQMxCnwuoIq3CFubmQfsUB9BFnW3aCPeUj992z?=
 =?us-ascii?Q?MgyneMVde9hsTj7hPJST6nPHwpHieHUA35n6FeMDpF8TTQv5m9dp2qGXJNxo?=
 =?us-ascii?Q?If13EZhHTjvwde9cfKxrq6byD8twv5RNO/7WkOwpfEWOtwKFH18pPI6ls4r0?=
 =?us-ascii?Q?9nZL1mi2XEGwUMMRl4kV/RWigDFp8KpxM9E67LmTX5DYkd1djgVVDRvqazGq?=
 =?us-ascii?Q?nmCb8jdTIu2jz4HzLllL+DW8GGoOUpAOpFB7fxc1Hf3eq2TSDuEXnH+UaLg0?=
 =?us-ascii?Q?/ouH9Z7CpYOOsT4CngUpqLtKyxeiY6xaq0w4leM+SmVVTsdpxGLcMTqVLKbw?=
 =?us-ascii?Q?C/i0ubdKC4QXVu5utKmM53r50QUPFRDfaBeP/gK0azNPPATaQ7OSyKlTAqO1?=
 =?us-ascii?Q?JCFVTwx8hpyUfLs1r4lh3fLl4BZrgXF2F7gWYuiRwKJF6d8X54DI9g7Z8Jwm?=
 =?us-ascii?Q?TCfyDQOPpiP+G7qO51AFT+eVG05Wsa9rYfI+S3EDbrUyqVHmImYfQGDv2eFm?=
 =?us-ascii?Q?hkBvRi4ckdjSee+q5jF5eLN8OWgckmQ10oozGdkq0iRGpFMaa9Z+U75fej8W?=
 =?us-ascii?Q?d30NB0QVdZHXOUNRT9f/PflGgjLDIjsMlrjQMT1HRhaY2tYFOf/m4qy0hhmn?=
 =?us-ascii?Q?dgUJoonGfIFkDbheNRuoIOqVtQ9e?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 04:56:38.0752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f1a35b-0298-4d5c-2a32-08dd0ab20c2d
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR04MB8770
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 12:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113998

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


