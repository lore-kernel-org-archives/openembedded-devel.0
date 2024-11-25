Return-Path: <pratheeksha.s.n@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE3CD58D73
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 17:24:15 +0000 (UTC)
Received: from CY4PR05CU001.outbound.protection.outlook.com (CY4PR05CU001.outbound.protection.outlook.com [40.93.198.42])
 by mx.groups.io with SMTP id smtpd.web10.24081.1732555451905161844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 09:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=eiSR1dEr;
 spf=pass (domain: ni.com, ip: 40.93.198.42, mailfrom: pratheeksha.s.n@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtOYTKbjQirGQtHQyj8DQs5RNDaX2nu9RmjGgEg19jjPXkSA/mXb487bNFz5lz3TDMDzxROcuGG6gBA69FolYH8dwMx8EZaXN1a++gE4m+V3uoTPXEN5IRVxeIO+0X2mDuhQWl1Q5tsbANItNk0K9SGJ8uaGK2eTtyDy2qRym4U/X9tiNL7wrIb53JkUfAavfS8OSRKrlrVn22L3/zpSWXuj/EMS9Cs0uJ+YLQrTXGejb6DExzkBfNkajofzg9CIGi+aGbmMLpiySVHKfRUjEtlhnvxTytpxdmjMrhkTPzWnvzPWA5qFzH3Dqf8uuoBm4ev/v68Gj0iYFAl31unAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IPM2jA2iWHCtpJzGmG+76ylX0RTUhk/yrGwSBvNpGs=;
 b=iktyEoUJRAGM/aKtWVRZSglJsvJSW72b6w94BaxAOM2BJucIETmdhS2spt5qQk5UbWDehOxSktnWTEHv0+4skHIVIvJ1cQxNLdNNY5TCqCg0oJW4GZ8EvLFxJAKYgljAGDB8Eh5/1lui+Y+CStWgygRzAculYiL/TWsMLicyKkwP6V1MCJCSvHy50qYHtRVC//VUDlbGpatr487XMx+xi/KG0gpbNTBwEZHhGg2LuRK/LRnHyH6YYoHlkX9YPm4rwEKG09uXKht4hbhHKxR6pJLDBYsogmH0VNaSYr3L7Fd/xZVvfkMV9dg59B1WDKDggV68JTPPgCpoBzpJiOLgdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IPM2jA2iWHCtpJzGmG+76ylX0RTUhk/yrGwSBvNpGs=;
 b=eiSR1dErqTadswRCCQFRspO16GC4gI7pSr71ewpU03zAsdLVnn65/1m9CdFVdBdTIsYWUP+FeVq/M2YBqgnyiGzP1QhbOZZYUfFlORS3Y79V1DpsUIau+d5RyCndPJBic9hyF6vXnkaIzaCV2lHzKVU3cV/eG6I65/j7yi5J7w8=
Received: from DS7PR03CA0006.namprd03.prod.outlook.com (2603:10b6:5:3b8::11)
 by SJ0PR04MB7839.namprd04.prod.outlook.com (2603:10b6:a03:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:24:07 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:5:3b8:cafe::bf) by DS7PR03CA0006.outlook.office365.com
 (2603:10b6:5:3b8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 17:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.0 via Frontend Transport; Mon, 25 Nov 2024 17:24:05 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 25 Nov 2024 11:24:04 -0600
Received: from INRD-PSN.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Mon, 25 Nov 2024 11:24:03
 -0600
From: pratheekshasn <pratheeksha.s.n@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: pratheekshasn <pratheeksha.s.n@ni.com>
Subject: [meta-gnome][PATCH] Onboard: Add onboard virtual keyboard
Date: Mon, 25 Nov 2024 22:54:01 +0530
Message-ID: <20241125172401.596324-1-pratheeksha.s.n@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SJ0PR04MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 77495c4b-1d04-40f7-68fc-08dd0d75f6b9
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iBpXuD1MOPBpD7vXeOxRI87vmNTawNu3p7NA8SW5OHWofh6rm1xlmqIZd3wq?=
 =?us-ascii?Q?7ctfhz3vNtTfiS3ClCRBQ1yJsvsMsLhhjUzME1LiXgxXxVGujS+zm4vQ0gfX?=
 =?us-ascii?Q?XlwixendQI+vtSM/sdBatmS5YmSdwE0ov44ft15B22oytT0mBfdDCI632toW?=
 =?us-ascii?Q?OQKWeKf8YEs6LPsPhq7gC1g6fZ/DjGv2MHilD1IFRozag2ub3mfu1yzX4nqo?=
 =?us-ascii?Q?HNYgfq954eAYLD1WA4L59aVEEzp0CYaN15VwHrb0LBgOUuhik0nmX/PbaIMd?=
 =?us-ascii?Q?9OynCf+TSRZBphe1nBv/G52iQDdL40JxJKh4wClY/lVnySCeOlyo9Ja/NCg1?=
 =?us-ascii?Q?l+FhfzDf9trzu9nQo246b83ZOAz9ZTQQWnwp1f9/SeJla5TJS5LPG6r/Qvoy?=
 =?us-ascii?Q?Srl3/eDgoj/hBpZ1FqZE5KmEu0dPOpw+AIetdREC/kxPkQfYS2qBWJHlwhKu?=
 =?us-ascii?Q?FEgdQfbTixgbN/ICEW33t03zkiiEJadBO1zQDEj/XnW5Zr6w/IP6Esk0ZAut?=
 =?us-ascii?Q?9kPGnjD3OuNlGAHyd36wsqcHsSqZfJCojdQra2reCJJ1NZkg7BcVjp1aW4lo?=
 =?us-ascii?Q?uGspx1GERZM5i5g7veE8I9fi+YfwLleh/NAWe79VfN/FtcVo4Ik9sTT1BK7K?=
 =?us-ascii?Q?Rnp7SGsqvo5k3a2UhoUOWmVRalGJVC18rIEpriEwsNapnnCySsdNlJZ8KLNR?=
 =?us-ascii?Q?tQVeTSugS/0ONHEo5CXf9k+lbnUCGrd25f6PfPTviQNXg3Szr67bQqtDUpEU?=
 =?us-ascii?Q?wbhY4iljhBLGdGGLIIDTwTI8gpO0VuTpVQ5+Q41vYhqvw6bwmQcElYdiUMyY?=
 =?us-ascii?Q?8G8gkda3n3O5Y1G2MyinSZCsSu0mwYNOnnSm0PAl3hM5E/zsDrOiTOzKNk5J?=
 =?us-ascii?Q?0EGCWyV/7QbrMp4Qa5gG/v3HVOyi24fKnx32z8JeA4R4zu2dqcc6YR4iQgbw?=
 =?us-ascii?Q?0fLiimPfj+beFnenXeKWQcnJPTkwpxHokvIHXkCYoewb/PzzhJzotO+nNubk?=
 =?us-ascii?Q?n6uDcKhrvHd1l2jVeChH7ZC9ki1sSKPiekmF49XINyuTj5ekcolm/solIeaO?=
 =?us-ascii?Q?QHvb0j2gLRNEg/v4obnmGHaR1av4BtOwtbfyvyZTXJAk8uQmTfQhPc4hzN9t?=
 =?us-ascii?Q?i0Y7VXYJLW/CqdmlMU9Cmgz2O1afZ+UireQAwgHdJFH6J18KtWmu2Ds2rSh6?=
 =?us-ascii?Q?EgWE/gc86+8Ie1868bn8EisTkm60/OgbRBVgYp3sdfZASITIyTSC96aSrhmX?=
 =?us-ascii?Q?MyN+I4kbEVLSGB++gh7NWZKVQm4ivWG37eLDR6r2/k73aXXhNhk2cnCeDTC+?=
 =?us-ascii?Q?xvBkVQL6svUYJk9AIxJVR3coK/Fa1pzF/gD92mB1KCvm/AZEUiWBC00TQx9/?=
 =?us-ascii?Q?pTZztssw7ypmAkRRxK4gdkvntbnV885X0XKolY/FLz1bzvJPH9jouWEv+EZg?=
 =?us-ascii?Q?MtdJs/ndywY=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:24:05.7065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77495c4b-1d04-40f7-68fc-08dd0d75f6b9
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7839
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 17:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114045

Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
---
 ...ine-error-API-if-platform-does-not-h.patch | 70 +++++++++++++++++++
 .../0002-onboard-onhover-seg-fault-fix.patch  | 52 ++++++++++++++
 .../recipes-support/onboard/onboard_1.4.1.bb  | 34 +++++++++
 3 files changed, 156 insertions(+)
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
index 000000000..3f4145264
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-e=
rror-API-if-platform-does-not-h.patch
@@ -0,0 +1,70 @@
+From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 09:01:04 -0700
+Subject: [PATCH] pypredict/lm: Define error API if platform does not have =
it
+
+error() API is not implemented across all libcs on linux
+e.g. musl does not provide it.
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2017-10-09]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
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
index 000000000..6a6346d8a
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -0,0 +1,34 @@
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
+	install -Dm 0644 ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/autostar=
t/onboard-autostart.desktop ${D}${sysconfdir}/xdg/autostart/onboard-autosta=
rt.desktop
+}
--=20
2.43.0


