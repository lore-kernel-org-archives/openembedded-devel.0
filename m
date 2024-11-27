Return-Path: <pratheeksha.s.n@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FBFD609D2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 10:51:29 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.74])
 by mx.groups.io with SMTP id smtpd.web10.68963.1732704683386229559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 02:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=lDKkatZh;
 spf=pass (domain: ni.com, ip: 40.107.243.74, mailfrom: pratheeksha.s.n@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkzdDv3WwH2mDRWiIXrf4yBO/S5oBfsK4G1j3Ui7SKQX2HkqyneJbGV3wnKBgVIeqCuSfQFCugrYBrBfPUs4pLhAuGwzfDugc/RjQ031k8lTvUgIuJCClgtrVXmD8kVv1JMjkxSBpmgwO76zeLDudaq61K+/LnFj2GQuHTPwyB/F6n3nPNXkjzAZGCpLamrWy/o4bbgarjvN5uu0fSKpFQXRq0Fa2IHXi2p6jpyfOP4eLyfSslWJYb3AAwwHKg4Vzqaj67ejOr/Xxre4XmxIHGatsU+9vwtfGPVBk/FtD+sUTvdMsNBM6ELYmffoBlmTmA8dYd2pdjz8eO0rZV/bvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJYuVvqatECxSmSiAUl/sPkqDtnWWyGqFuGV0xwLVKU=;
 b=U8lIi12+lfY/C7NzsKXuSUzDJvnzSm3GFw7bXwnaBT+jLwWWEg68kb69nVtmCLr/56DV1V1zBSOHuEuwr1NFBHG2ec6kJx/QyD3uc1MxShNz8sLHxi+yk6+9KZEhQh98chdNRdGdHSL4NdCjG3xLKqOol5tnWiYOniczp5xj2lyaKcIFVq/Xv2IchbcQEZPe3EtGCnWEeXdzABGn/qWSIr09aO+/fQdNQvDFVkZAkxekqwGTA2b0PMbGCN0A2B2wEL2CYn+bW7Kwmdj8vhCq1BR26TnXTu9WA94kXtxxMZKCn4PnP6bpIjGkxnbkdgNmUcAcGjEtFZWoiAp4wpI28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJYuVvqatECxSmSiAUl/sPkqDtnWWyGqFuGV0xwLVKU=;
 b=lDKkatZhjk9NWv+PZlSzTwNJ0QRsEGisFh9K2Z61z09NIRswv1fqkh2YqE79BOQXfoskDRNEGDEY5NUEA6OC/jHAeUPcklHWPIhRLKx7OW5rsTYnncCykSbAVRh9pXPQyzF4H0kcZbIB8Y4I79Oa6dZIWw/L7fm4X+NwWju0WE4=
Received: from BN8PR15CA0048.namprd15.prod.outlook.com (2603:10b6:408:80::25)
 by SA6PR04MB9297.namprd04.prod.outlook.com (2603:10b6:806:41a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Wed, 27 Nov
 2024 10:51:19 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::75) by BN8PR15CA0048.outlook.office365.com
 (2603:10b6:408:80::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Wed,
 27 Nov 2024 10:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 10:51:17 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 27 Nov 2024 04:51:16 -0600
Received: from INRD-PSN.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Wed, 27 Nov 2024 04:51:15
 -0600
From: pratheekshasn <pratheeksha.s.n@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: pratheekshasn <pratheeksha.s.n@ni.com>
Subject: [meta-xfce][PATCH v2] Onboard: Add onboard virtual keyboard
Date: Wed, 27 Nov 2024 16:21:13 +0530
Message-ID: <20241127105113.2411322-1-pratheeksha.s.n@ni.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|SA6PR04MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f3a359-f25a-4ccd-9553-08dd0ed16bec
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4CAoTqlgb7oaWjQFBEhKyTDNFK6dqysMiVkBaH/Fwr31JHfu5iQLP951u087?=
 =?us-ascii?Q?ld2/eoUil1urzMNDcKTnjv5zhQZnKBF69IpZiV9tjgcDxEtOn8rfZFJnDhie?=
 =?us-ascii?Q?pG07M+YSQKOAlEDeuNymnB17KOyu18YEpDzahiHsN8H7JQOn3WH6HMh0xDFH?=
 =?us-ascii?Q?GE9Y8E7HR+bhO6FfprxNEqlhfluF1kmfHiWa84hZMI1REn5cofEMU8L9PdWx?=
 =?us-ascii?Q?4TPPVvvBKeQi6AGbarXwSbAGZJERUhof9X/QmGKF8epCufSUsLRQVbJiIQi3?=
 =?us-ascii?Q?UFi0+jNESLv66Jsd8U72T/DxgfYC6Om9WbLTSaynncoGnh6D6AfVCHQRViyg?=
 =?us-ascii?Q?Ysy93gQCtscv/KO4IBpylzZbuLakgtrAxlmEBa00P+SaG4/O6BZm9YVMUQCW?=
 =?us-ascii?Q?ryN/PDVcq+pRFIJ2ev9Y2GuNPn2uNWB/iN3mNNyH3TQ2cki5/ySLlHEMtjHI?=
 =?us-ascii?Q?wfEu/QM0Zk3PML8dqjwx1CJJiGZt46rliFM1OoYxOy62T15svrxBglJr1w1y?=
 =?us-ascii?Q?AzqDuJeMe186mkTLNxR/hvrcQXy3a5jxLDnUFmHU6OZ7VDSNC/c2HTCmPd+p?=
 =?us-ascii?Q?yQKjvfPk1I0Y9lES36iBQ2zRaJXeC4qfeO3pJ2eySpji+RPCP7584ZGNTorV?=
 =?us-ascii?Q?WIvPWs533O8yV32fA+xtclLw5Xh6eLZ2lioYYc6qqKOtaXsvIfYhAUjIzGms?=
 =?us-ascii?Q?n2jaHzYlvMRNSOT/eeL0ID3TTPF8ZT8nQwBYu3JiPuzzeDdSvASPfi+ypXtm?=
 =?us-ascii?Q?sOqWjEchhkdpMtmMAlcmgjR4uq7VG1IJlzaDMsX8IHgsTqkaP+tZq2J7VDa+?=
 =?us-ascii?Q?Qn+Lp/tCbDvx341SE1b5Kp4mvMvDFR/PoIe9AhkpI08ma4YMhqv6giPGCwu8?=
 =?us-ascii?Q?PSOVYJ1sMJFeQ0v5Fzv+b+qP8xcrKb2zuYT0ZD7S7b6WI8/thLiWb5IykUD1?=
 =?us-ascii?Q?UxDLWHNbACMPg+CofuwjBMJa3Q1IG64Awn+z+kY3pohkiu+AQcsFYGE9odlU?=
 =?us-ascii?Q?iYG5HdX+8nshSdlt0Zd9Ho2MDgZK5d8s/4W/dPceZHwCQK9zoWeYGs1tbXFw?=
 =?us-ascii?Q?UlhGllYC/njVRKWRm70Ue+GhgVQkcM58P51VVMGpLN8TJQC9qNnlpCE9rVA9?=
 =?us-ascii?Q?7Y4KE1mQh9T5GRvqbar8PoX7aCVN7gP552Ye9ccgJaFq9Y+EliNcFA25AVGb?=
 =?us-ascii?Q?x+gm8KhSqpTElFB2ZFYTWNO+6fsDwhK9rJdjrH1uTqwM/XpHvshTQ6A0ttbL?=
 =?us-ascii?Q?O/8kigZtMY57ZWfVLuaEUpE6ftOGrjTpKuYKyfZy9Rgow1Ml1iMPltpOwv7l?=
 =?us-ascii?Q?JNMRvfJcfst8gR7wbnY6HzqqKPifFVazikHwsAinB8gb58mb0cDT/ckYbXHa?=
 =?us-ascii?Q?9ogMn621udJKZ0S+THvllimS1ylOz3PEXbT/SIKmb/OTdMjsYdhBJmXPWY1C?=
 =?us-ascii?Q?4kB2VTXFNGI=3D?=
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 10:51:17.7005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f3a359-f25a-4ccd-9553-08dd0ed16bec
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9297
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 10:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114085

A lightweight onscreen keyboard for touchscreen devices.

Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
---
 ...ine-error-API-if-platform-does-not-h.patch | 70 +++++++++++++++++++
 .../0002-onboard-onhover-seg-fault-fix.patch  | 52 ++++++++++++++
 .../recipes-apps/onboard/onboard_1.4.1.bb     | 34 +++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/onboard/onboard/0001-pypredict-l=
m-Define-error-API-if-platform-does-not-h.patch
 create mode 100644 meta-xfce/recipes-apps/onboard/onboard/0002-onboard-onh=
over-seg-fault-fix.patch
 create mode 100644 meta-xfce/recipes-apps/onboard/onboard_1.4.1.bb

diff --git a/meta-xfce/recipes-apps/onboard/onboard/0001-pypredict-lm-Defin=
e-error-API-if-platform-does-not-h.patch b/meta-xfce/recipes-apps/onboard/o=
nboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
new file mode 100644
index 000000000..3f4145264
--- /dev/null
+++ b/meta-xfce/recipes-apps/onboard/onboard/0001-pypredict-lm-Define-error=
-API-if-platform-does-not-h.patch
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
diff --git a/meta-xfce/recipes-apps/onboard/onboard/0002-onboard-onhover-se=
g-fault-fix.patch b/meta-xfce/recipes-apps/onboard/onboard/0002-onboard-onh=
over-seg-fault-fix.patch
new file mode 100644
index 000000000..1ec195cb8
--- /dev/null
+++ b/meta-xfce/recipes-apps/onboard/onboard/0002-onboard-onhover-seg-fault=
-fix.patch
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
diff --git a/meta-xfce/recipes-apps/onboard/onboard_1.4.1.bb b/meta-xfce/re=
cipes-apps/onboard/onboard_1.4.1.bb
new file mode 100644
index 000000000..6a6346d8a
--- /dev/null
+++ b/meta-xfce/recipes-apps/onboard/onboard_1.4.1.bb
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


