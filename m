Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C696D10F45
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 02:38:04 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.44])
 by mx.groups.io with SMTP id smtpd.web10.18405.1731668091221929238
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Nov 2024 02:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=PWD8CBK5;
 spf=pass (domain: ni.com, ip: 40.107.92.44, mailfrom: pratheeksha.s.n@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxzhKdM9CHpUDQVZXpkUZ0bIzYsAvFboEEoETTMHm3T7gSIzpCXYxzNmS02m6ZUsW86NlSDXI4nchSH6DtNKDPDQNOHh7tlTGWInT4lAMAoo8lA2CyRDjcP8JmuOrQCydPCw9WfOUvXU/LFBDVo+JHLyWn7zQM1guUVZmchXtRfBaKSCvAJPlHIOpCNeBbi+uVFvMb/l4VFWBK78BukcS7yeDU5I/qNbMbaRjPnwmBLktJyWbRsFhkY0jwnM6tgS2DnY+k5BKUyXuzgZ6gkihMSqCK/AFbBZPj0iPyuwbbKysYIdgvOTTdi9UkcAfmJa0ZrTc7255o0TZl37NeQfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5LMtaCFbj+Dza6dN0uMznR0dG2hGy0KhJx7w1A5WGw=;
 b=wZ0yCkNVz216dGprbTzr4pL8GFIHDV8lqOeh+YsDqn4hiC5MC6OK8AP/7maLV0VaHTW4gXP5v3Mn/z6sLMnLDXt8qnvpuOaOOA7OeMPgTWB1kVB4uVmX/RAdTjxXLkVHYWXO1rYXZLzfgU1DIWAqKgxhsLrPhBDsnBqtnsZjnmAed3wGaS2jbg9tw7NvcDMKigEZLCfq9IKrTJ7zcU4qSoZEgJgjvR9mokfCjFQbJioEeh6x0ELcXaRXGNShX3a0YFfi9PkauikRDUTLyK2c3dBXzFrXlcfFJJTccbSB0OlthiOy/xX8IDoN+ThxBh+QVS0Gt3zgMjluozB0AMlpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5LMtaCFbj+Dza6dN0uMznR0dG2hGy0KhJx7w1A5WGw=;
 b=PWD8CBK5XVEJqWicIdR+qSZxJlTzu6jYtSKFqscD8Jt6OHaA/w4E2TnYP2vR3olIQFGlx70JXMIMPdf3Os/3qmA77yebJwgWOJlZOThAaHVzjk/bgsv6DYhcnN9wfcnrTBLUzfqpu5/hnwWrtvuFS67Kle4skQY9WyBuPcPOGrI=
Received: from SJ0PR03CA0112.namprd03.prod.outlook.com (2603:10b6:a03:333::27)
 by MN2PR04MB6880.namprd04.prod.outlook.com (2603:10b6:208:1e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 10:54:47 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::5a) by SJ0PR03CA0112.outlook.office365.com
 (2603:10b6:a03:333::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Fri, 15 Nov 2024 10:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 10:54:45 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 15 Nov 2024 04:54:44 -0600
Received: from INRD-PSN.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Fri, 15 Nov 2024 04:54:43
 -0600
From: pratheekshasn <pratheeksha.s.n@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: pratheekshasn <pratheeksha.s.n@ni.com>
Subject: [meta-gnome][kirkstone][PATCH] Onboard: Add onboard virtual keyboard
Date: Fri, 15 Nov 2024 16:24:40 +0530
Message-ID: <20241115105440.617650-1-pratheeksha.s.n@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|MN2PR04MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 4652e7be-35b9-4136-8e54-08dd0563ea9b
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kpjMQAOgtMvUxu3J6p5bHh9xo3qX+cLktNyrR0jaBsj3htOxUiHdakxxNTdT?=
 =?us-ascii?Q?KtM/lGpRO2Oszrtoue5TU+V0UIkQh9Q3bTUI9pUsX0bqoDGo6ouVXB/yXuWb?=
 =?us-ascii?Q?mJ+qs5gPf07ljjgoYAxmGgeMfmC8L4+KzFeVWin+eMcbNrb4QYYhacuseVIJ?=
 =?us-ascii?Q?3OLTvrZMF/aPeJWtvYDPgJaixUeTg5yWVTQoLhJGv7Ds8dcPv5ylvf6rtO4H?=
 =?us-ascii?Q?uuBy7KzS6cYRGkg8J+ttzOFq5Ezltu9CtFf178tOfP3IIxtxLCVwtxZD2Q4k?=
 =?us-ascii?Q?K0qiU8uKLWS9wpwwf5Vroj3oe3ivtXj8lGaflpnT219rmEKfRpLH1uir3tsb?=
 =?us-ascii?Q?cU209xXAQDxuGCHPgHcsWPGOf8V8eTiwmprsrOp862VZzEiWaZ/osAeee/Mv?=
 =?us-ascii?Q?5bxNd+VvhSrJKJhjIDuUZc1ih2pnyU8K4cDenvGXUGLmEDBaZFitGiXbWxdt?=
 =?us-ascii?Q?jCHaoSx45LpKbYfE54J6wno4QZ083VL7aR5tM4q2O6exYLJLQXlPfm6utQ3T?=
 =?us-ascii?Q?DpqYa9PrJ18/Oyoaud6dtcWJBdjqq3koc4VbcTkdoED0BUVEw07Lr2zwPO8O?=
 =?us-ascii?Q?wNnItnTuwsPVPTIeeygiS8EcN9b65JrCQNq9kbbw/Xv6hGT+UmCsusNL4VJx?=
 =?us-ascii?Q?my5W9OdCS/T3kVQNmPBijpNL+mKd1viOcONsl/QvYezjbah2tIdZcYfGlu9O?=
 =?us-ascii?Q?xKjh5QpBJAwW0X46jGVQa+L6WH3LNkwto1LN80cHI0rXlpUXHWmwqE6eNcBG?=
 =?us-ascii?Q?3jYOeJKOBRelKmNn6tk3zw0SivNDOMQYHIZDpSvcLkV19gj+iFT0xjrdilEb?=
 =?us-ascii?Q?uAMSzHhm4gqLzZODZMD/TfSms4azx5INB4k0UpSrzfESyaAGfPrC0LiFysNN?=
 =?us-ascii?Q?Wjs034pNAXZ1mpgkoRCwcxS3MMpVfJIPoELqCR5J0O/FPsdjyZLvFZlsHy8r?=
 =?us-ascii?Q?l+LsD9NjELsCQYurgtHm9rGkKjTp6DDJigDERlxmIfxZoQ0vFE+JFdPV5l5+?=
 =?us-ascii?Q?920OHLpUT/B8iBHZL3OapDKtuj4pJ6d0fHX72+B97mbruMqVA5vTpcI/Ps03?=
 =?us-ascii?Q?72RCSnmDBGpp5KIRegR8a9gKueBoY5NQ9wFr+pSWL+09DI081QmB02qeazVq?=
 =?us-ascii?Q?bJkDUq5U/cwQiHErh+FXxvjk1V7aEkCGYQkURp4K17MhP/KV+iQrbI6uBV3X?=
 =?us-ascii?Q?9UFmdU/FHwLb76X0jBVzssrqDSvVIcEXSf9Gy2afaK/zdKqaGhJrrZHIeINx?=
 =?us-ascii?Q?Ajxg2gF3MVokrnHrpIi2KkYtVnu18vEtwrf2/qV/1F92X2u7B1ZX7RyrHkGh?=
 =?us-ascii?Q?r8c/2bumBDlo70fE5Ej1VlT+yv3xFVetxPzHakK/tB/gkPvwyJD/IkA6H7WR?=
 =?us-ascii?Q?+ETC5JOFJ7ycExgHQPoWDl7yKqvg?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 10:54:45.1192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4652e7be-35b9-4136-8e54-08dd0563ea9b
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6880
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 02:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113854

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


