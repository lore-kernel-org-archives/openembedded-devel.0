Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7C4CF34A8
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 12:43:13 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.105])
 by mx.groups.io with SMTP id smtpd.web11.10398.1727959388976526076
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=w6AKzKWT;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.241.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCBYt9+gluWMFHnbzZ5maYeF5hoYOPytJWFY3RE6RODQDQv+y9A7cl8KGUDkF/g2wL6Iwl1a8VZgz0kRiXKISsbimObwJuBkp7+RxWSssH90qmr3WLxM24oKnUHiflQlkkKtXztWrZgjJJGKgVRfdMy6xxjxgUhb56kAaLqY1rFMBt68CkmwghgXiCzYSDPc87855/6BT1+0Pd7Gf/y6g5yg6kjsMbpsfWc4Sup1Xq4IVBg4q0NM1MODO/GFAB1P+SS8uZZ5Z5Std3XJBPt/XUPGAZMwJSPuLj/jeuNnA/b+CyW1SBSNZ1EIo5eyuM2ZTJQXyh8Z9DDRf3R1JDg20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t45oEHuiW2hgTbKM/7+mp5GjTom3JerVHwRYCTgqYMI=;
 b=jdpgVtzE+9N0P5hGO4fc0cjWcMNrzGYmoY+h7xzxKQTlpNaRudRZy7P2L1dEFcnqIZkVKV8aXnefThZzC89yJa0CYioxliJxtKgVjEZ/ZPD7DqMRjCY6E43OzagVrvzBa38lpdwy1PFPp2jeEL0KVLwFCDEs4rPTVP/VgguK3r8PN3ZMpsFax1ZJy2nTDY+xkY4wJAxz4Q4bDs7r40d6gdxoNlDGmBBdkAPTB3Ke04Tfl7pdP3s8smUQrTYxf9QiZql/UXE8VEcsd1nfKL2dtbow5bfmV8tp0cDaf4I0z5GQEpVPtiY4kdkQ/Bv895iugamtlCNiw/Rm+Dc6YZZt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t45oEHuiW2hgTbKM/7+mp5GjTom3JerVHwRYCTgqYMI=;
 b=w6AKzKWTcE/TEWB8gfZyrXZSf2wZKi3yxwCE7I7XSdYMOzalupFcCBAE0PPEqbRMb2XqfgsjX/H1foLKJ0nyp7CV3Ya6ZGfgPyOilGJn9u58BQoKF2vFYmZI9eQPF3f5mypDP2eyBarN80WBgvY9cWde1MpYZpjHMfP9B5XsOhf+PeuoB745wlhf6I8RM/XdkrgBBGhbzU+UkOpo11Fp2+Q9HBJKL9Ry0+GhT5dfkGvKdJt8p4+pIJ5sAEYLyipMNSVXeDfUBKP2mXtEdwuiKM9e7anf8lLK+tjUUaiFtOsg768+udOPShRHrN8lwPLkjI0K27drFpLO8ukYkQK68Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9517.eurprd06.prod.outlook.com (2603:10a6:102:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 12:43:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 12:43:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 3/3] packagegroup-meta-oe: Cosmetic: Arrange values alphabetically
Date: Thu,  3 Oct 2024 12:42:43 +0000
Message-ID: <20241003124243.2411621-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241003124243.2411621-1-niko.mauno@vaisala.com>
References: <20241003124243.2411621-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0000366D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::390) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f76dfe-030a-4a4a-89e4-08dce3a8edd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zO9/0SOOVyKtFhKMzrVwGFD6ZV09gs+X1gw3SLr9BcNWfK7g5Hx8vY6hrrST?=
 =?us-ascii?Q?AYrDt2FSyn/rC3hfxm16PV99EcU+m1ZhfoLFifZJFgrRTtKrBAUkQOekPaf9?=
 =?us-ascii?Q?G9H/1MQ/omS9yeqeEuHXM6BHKKhrIwxya+6cEYZsDpzXzTmGAaLHmKCZrzIt?=
 =?us-ascii?Q?ICqpn/ijNZZfn6FNGRqpQXGvKzCUi5RbtE48gVfojB5+nG9gfD4LvyA9ldGE?=
 =?us-ascii?Q?Y8EwiWxvVEVnVdmIqbEh4+wXjGqt1bc8t5B20W1ad6nFLdfNIhgHx8IRsTES?=
 =?us-ascii?Q?4LmjyZZmw0kJPGvMbAETR3T1jp7hjUrssDB2VUCS3MQewmVSqKF0x7EGIsIL?=
 =?us-ascii?Q?IMHwWfOcXHzddfT6+3lyiET690hCLk3dyM0cZn59XgiSdrG1VIlW+4ypVarM?=
 =?us-ascii?Q?VnDR6LKi0npz/qRqM4an9lblg8wC+XK4gsYXMEJWPlXNI1cJH5bRJg0vVq10?=
 =?us-ascii?Q?uV7daFk3e9tXnof/AbXnDgd5wiA7kownSL/MK6nk5hMadPMyFgSV0OzxgkFb?=
 =?us-ascii?Q?mnnSbgGWT6MKr8wA/ta2fjrfsyr068xzu7KgusewzT/zLGLFrUajO7Nrczem?=
 =?us-ascii?Q?IylQBim8JwCLUZl4MDFRj9cEFIxRUffKtnhWpK5faKy0o2ZmoFQNU26oYTa+?=
 =?us-ascii?Q?cmYKSL+NeUd7J2u+BuDD4WpwxZfr1HvhL+Nf6Bn9TW6wKyvGpw6FI1K+YpZ1?=
 =?us-ascii?Q?Fn2IA+4CObXiDU6mxLVI867HxlAoYa2h7gr3kvKypNjCm06qrAqT5doXAcsa?=
 =?us-ascii?Q?9cqPGnxFqFuXeWgd1r/p4Z+9vXi6tvOQOOiHYi0DN8+KQIkunyfWcBN+qfr5?=
 =?us-ascii?Q?I3QQLs6Vh0PTYH17CQTl4Azl5eQA5lPr0+PRCdI/VQKSelLFNAwUwdg2zvsG?=
 =?us-ascii?Q?PigWSdicDJL9wFvdHyoGo5I6HPYOc1YPX9GXLw6e19+4EyKoPdQPEAhxruKX?=
 =?us-ascii?Q?jGCrJMzQsyAXHB2+z1Jh18zUHQhdvrZ78qimHnQVqWMayTnHx6cyDVxTOi1N?=
 =?us-ascii?Q?5ss4tCTk5vN7Azyx4EYhXAlT+mvHhFxZm/1KbAl8G00vGCSTthemw/30Y4nF?=
 =?us-ascii?Q?uMvA1HkJmHNBbM9z8xAqBHQG1xUATVxQIElisAhYTYHuN+sMUe3ayttFdVGZ?=
 =?us-ascii?Q?EjOVn6AXUlXfyb+spqXR6oB12EsDz8wKUXk8JWOHT3m5MTqtd+WIu/A3S6nM?=
 =?us-ascii?Q?z5/O9LJGunNyhM26e2Kh8D0S4mBEAgz+qyARR9yL7BBsNSP8C/UaQtKQ8loA?=
 =?us-ascii?Q?zHuHgl5MsxH5+QdApr4k5/zMnAvsyuo539V6ngSTkrl+v426SxBo3zMSyYPO?=
 =?us-ascii?Q?nrU+eClDrOjxvUwm5aOabsd+l3iVjT4/WUzg6AxWvFuQgQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QdG5eGWOIdkZ4/b7GDoMgwF1iZ4ZsQ7phcBMxI69/ziA2jAtJn8FFJYljqcC?=
 =?us-ascii?Q?oBIkvecFRjOuPKiSHw9TphibWPevt+oNU5dTY9XoPQrIvdOhuEaMzS2mFG6F?=
 =?us-ascii?Q?+Cb8QedVpMweoiYzD/qx+SY2S/G8j2VIjMz83rUQWRpXt+lyGx4BirFDtccL?=
 =?us-ascii?Q?N8/Dq/K2qepNXcFh9BQYVVMoORWzPIHCi+LNN9A5QCJPViVb5Maxy2q29Ol/?=
 =?us-ascii?Q?u6ERKZyMYu40AMmsrjEsCgzVEmovjzs9rKkZGwQmYshzSl+xWEsKGAQWoBKO?=
 =?us-ascii?Q?MnPdXoJdezD4Z/NlhwsFlOPEoFrEr7n3AX8JGIFERz78K2RxrKwrt54D9LbV?=
 =?us-ascii?Q?g14Vo3kwO/Ta/kTJk274ubXzxbeaOSSZav/iVikWal94HwkboxczCbnsK/Vo?=
 =?us-ascii?Q?sALs/EliYC3PKOvVYZmP2usvEyTc5jXWDtRqVOtFfN0fhNcA1eEhEcPp42YS?=
 =?us-ascii?Q?eUBbVgVwjr4ZVaPcTobBtaa3Xb7nOdvWueO652So7XxYZc/Bs7C4B0vxX0Ql?=
 =?us-ascii?Q?lZ6zdJF4qpwR7H2qJea80erO4prCZNpjuTmRmOsofbGvVeAc6ma7Z1cnBuRf?=
 =?us-ascii?Q?WZf0VuK0fdvFPmNiTiAPSbUSkKitJvW9mJqMbcoRp0lESsQ9a2uyYta9d8p/?=
 =?us-ascii?Q?rRd3x+9Fy/NV2+wTUjtO2zmXuA82ds0JBh2seXINu6ScUcKGvAlJCOgxrZxe?=
 =?us-ascii?Q?q4ink2L8AwU12b17DzFIpKoZDm3KDQv/tqWqQ6Bn2am3/7TKiHOtivQvt741?=
 =?us-ascii?Q?RwBJVvG+r6f/Bjuh5phz2SHpElKmt8uixQbALGjL4p3ZUs/QZulg/VvdBJYN?=
 =?us-ascii?Q?WM5jBqKs6CJmfDzoP5DhOwF3HlAupXdu8CFKezJouu753aPhXpT4OtKjGZHo?=
 =?us-ascii?Q?hEmwI/ctHxRKafdVxtiQHUwsKmI+R26Ak2X8EeBdeVKj3mqPWOy04Y0k7Ha5?=
 =?us-ascii?Q?DcVjF5dGmq78WsU1GztDWW4JLXDTKdd9w7Ic7tGOFOHEAAM5YdWIPmLMVdAL?=
 =?us-ascii?Q?byDytYMh5NUrINtrHU+elZb0LLWTJHiSTmM9dujnRUatBpT0ium3tCk51NkK?=
 =?us-ascii?Q?zC4+CqpEF5bIfov4BvU15GqavZ6fJENzDQcOeOcav7TIcdqX4G2L+wK6pXCm?=
 =?us-ascii?Q?bmIRY3XRql+I8aoJQgyA2Z8v+XwFr+8cpVYFkhHLBA7f9aGNfRpIzOA/iFXW?=
 =?us-ascii?Q?Toc/+gtlrmcPPzoANRTJWyGrERJZ/qvSeH6vZ6WUx3rhW9BwA3kPWKlSQHFQ?=
 =?us-ascii?Q?5g6lX68AA9YRD7jq2cu1TwNnRimXGOwZ1KoUbXfm6QlzLNgLJvayh9WB6O1B?=
 =?us-ascii?Q?8T50CS9THCcXUXc9zvqm7wYZ1URNTRYMUYqkS4e8RC5JwmCbBDYNnb4OUdt/?=
 =?us-ascii?Q?X/468QDSsOU5yUR4a6rN0E2hsPEwfEo2yEyGumT7fdu5bZEMmINeTolsEPeV?=
 =?us-ascii?Q?oj2AU8KSgDJBVfw3Qv1m9rz1RzHZH4aS4lvEeReezHwVi8sIdOZqYkC8a5Q1?=
 =?us-ascii?Q?CZ45HGL8EkHWrQBZL94RGDM3Hk+g9jEUd+z2gvUMwiywJ7hj9bGmemsOGFpq?=
 =?us-ascii?Q?0+xgFdvafkob67WnmxXqKhlsHsV7bMfYuUNmp6U1KHPng9GrKnZT/qVBVeuP?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f76dfe-030a-4a4a-89e4-08dce3a8edd5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:43:06.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFrdVRcwQa0Gr94IwiLSs2BRVanx+tbEiCr2XtTZLLUqJNSYdzbSX2mrUKsxnDmb7/1f6vJwoo/KvfcbCrmOYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9517
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 12:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112649

In order to improve the readability of the file, arrange value lines
of variables with multiple values in alphabetic order.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 640 +++++++++---------
 1 file changed, 325 insertions(+), 315 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a8565982f..6dbe194cd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -7,10 +7,10 @@ PROVIDES =3D "${PACKAGES}"
 PACKAGES =3D "\
     packagegroup-meta-oe \
     packagegroup-meta-oe-benchmarks \
+    packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-connectivity \
     packagegroup-meta-oe-core \
     packagegroup-meta-oe-crypto \
-    packagegroup-meta-oe-bsp \
     packagegroup-meta-oe-dbs \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
@@ -18,8 +18,8 @@ PACKAGES =3D "\
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
     packagegroup-meta-oe-printing \
-    packagegroup-meta-oe-shells \
     packagegroup-meta-oe-security \
+    packagegroup-meta-oe-shells \
     packagegroup-meta-oe-support \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
nome", "", d)} \
@@ -95,10 +95,10 @@ RDEPENDS:packagegroup-meta-oe-bsp =3D "\
     fwupd \
     fwupd-efi \
     irda-utils \
+    lmsensors \
     lmsensors-config-cgi \
     lmsensors-config-fancontrol \
     lmsensors-config-sensord \
-    lmsensors \
     lsscsi \
     nvme-cli \
     pcmciautils \
@@ -117,6 +117,7 @@ RDEPENDS:packagegroup-meta-oe-bsp:remove:riscv32 =3D "e=
fivar efibootmgr fwupd fwup
=20
 RDEPENDS:packagegroup-meta-oe-connectivity =3D "\
     cyrus-sasl \
+    czmq \
     gammu \
     gattlib \
     gensio \
@@ -140,8 +141,8 @@ RDEPENDS:packagegroup-meta-oe-connectivity =3D "\
     modemmanager \
     mosh \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "",=
 d)} \
-    openobex \
     obexftp \
+    openobex \
     packagegroup-tools-bluetooth \
     paho-mqtt-c \
     paho-mqtt-cpp \
@@ -155,7 +156,6 @@ RDEPENDS:packagegroup-meta-oe-connectivity =3D "\
     usbmuxd \
     wifi-test-suite \
     zabbix \
-    czmq \
     zeromq \
 "
=20
@@ -164,26 +164,26 @@ RDEPENDS:packagegroup-meta-oe-connectivity:append:lib=
c-glibc =3D " wvstreams wvdia
 # dracut needs dracut
 RDEPENDS:packagegroup-meta-oe-core =3D "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", =
d)} \
+    dbus-cxx \
     dbus-daemon-proxy \
-    libdbus-c++ \
+    distro-feed-configs \
     emlog \
-    kernel-module-emlog \
     glibmm \
+    kernel-module-emlog \
+    libdbus-c++ \
     libnfc \
     libsigc++-2.0 \
     libsigc++-3 \
     mdbus2 \
-    distro-feed-configs \
     mm-common \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "ndctl", "", d)} \
     pim435 \
     proxy-libintl \
     safec \
-    sdbus-c++-tools \
     sdbus-c++ \
+    sdbus-c++-tools \
     toybox \
     usleep \
-    dbus-cxx \
 "
 RDEPENDS:packagegroup-meta-oe-core:append:libc-glibc =3D " ${@bb.utils.con=
tains("DISTRO_FEATURES", "x11 opengl", "glfw", "", d)}"
 RDEPENDS:packagegroup-meta-oe-core:remove:riscv64 =3D "safec"
@@ -215,84 +215,84 @@ RDEPENDS:packagegroup-meta-oe-dbs:remove:libc-musl:po=
werpc =3D "rocksdb"
=20
 RDEPENDS:packagegroup-meta-oe-devtools =3D "\
     abseil-cpp \
+    android-tools \
+    android-tools-conf \
     apitrace \
     breakpad \
-    android-tools-conf \
-    android-tools \
-    concurrencykit \
+    capnproto-compiler \
     cgdb \
-    ctags \
-    debootstrap \
     cjson \
     cloc \
-    icon-slicer \
+    concurrencykit \
     cscope \
+    ctags \
     dbd-mariadb \
+    debootstrap \
     dmalloc \
     ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnf-plugin-tui=
", "", d)} \
     doxygen \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany-plugins geany", =
"", d)} \
-    jemalloc \
-    lemon \
     flatbuffers \
-    heaptrack \
-    libparse-yapp-perl \
-    libubox \
-    ltrace \
-    luajit \
-    mcpp \
-    memstat \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany-plugins geany", =
"", d)} \
     giflib \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "glade", "", d)} \
     grpc \
     guider \
-    php \
+    heaptrack \
+    icon-slicer \
+    ipc-run \
     iptraf-ng \
+    jemalloc \
     jq \
-    json-spirit \
-    serialcheck \
-    tclap \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "tk", "", d)} \
-    uw-imap \
     jsoncpp \
     jsonrpc \
-    yajl \
+    json-schema-validator \
+    json-spirit \
     kconfig-frontends \
+    lemon \
+    libdbi-perl \
+    libdev-checklib-perl \
     libgee \
+    libio-pty-perl \
+    libjson-perl \
+    libparse-yapp-perl \
+    libperlio-gzip-perl \
     libsombok3 \
+    libubox \
+    libxerces-c \
     lshw \
+    ltrace \
+    luajit \
     luaposix \
-    capnproto-compiler \
+    mcpp \
+    memstat \
+    mercurial \
+    microsoft-gsl \
     mpich \
     msgpack-c \
     msgpack-cpp \
-    mercurial \
     nodejs \
     openocd \
     pax-utils \
-    ipc-run \
-    libdbi-perl \
-    libdev-checklib-perl \
-    libio-pty-perl \
-    libjson-perl \
-    libperlio-gzip-perl \
+    php \
     ply \
-    protobuf-c \
+    poke \
     protobuf \
+    protobuf-c \
     pugixml \
     python3-distutils-extra \
     python3-pycups \
     rapidjson \
+    serialcheck \
     squashfs-tools-ng \
+    tclap \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "tk", "", d)} \
     uftrace \
+    uw-imap \
     valijson \
-    libxerces-c \
     xerces-c-samples \
     xmlrpc-c \
+    yajl \
     yasm \
-    json-schema-validator \
-    poke \
-    microsoft-gsl \
 "
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86 =3D " cpuid msr-tools pa=
hole pmtools"
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 =3D " cpuid msr-tools=
 pahole pcimem pmtools"
@@ -320,105 +320,105 @@ RDEPENDS:packagegroup-meta-oe-extended =3D "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-c=
lient", "", d)} \
     brotli \
     byacc \
+    can-utils \
+    canutils \
     cmatrix \
     cmpi-bindings \
     collectd \
     ddrescue \
     dialog \
-    duktape \
-    enscript \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gnuplot", "", d)} \
     dlt-daemon \
     docopt.cpp \
-    iotop \
+    duktape \
     dumb-init \
-    konkretcmpi \
+    enscript \
     figlet \
-    libcec \
-    libdivecomputer \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libgxim", "", d)} \
-    liblognorm \
-    libmodbus \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gnuplot", "", d)} \
     haveged \
     hexedit \
     hiredis \
     hplip \
     hwloc \
-    libleak \
-    libuio \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
-    libyang \
-    lprng \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "icewm", "", d)} \
-    md5deep \
     indent \
-    jansson \
-    nana \
-    nicstat \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
-    p7zip \
+    iotop \
     isomd5sum \
+    jansson \
     jpnevulator \
-    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-d=
atetime polkit-group-rule-network polkit", "", d)} \
-    rarpd \
-    redis \
-    libfastjson \
-    librelp \
-    sblim-cmpi-devel \
-    sblim-sfc-common \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "sblim-sfcb ", "", d)} =
\
-    sblim-sfcc \
+    konkretcmpi \
     libblockdev \
-    sgpio \
-    smartmontools \
-    can-utils \
-    canutils \
-    libsocketcan \
+    libcec \
     libconfig \
-    linuxconsole \
-    uml-utilities \
+    libdivecomputer \
+    libfastjson \
+    libfile-fnmatch-perl \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libgxim", "", d)} \
     libidn \
-    libqb \
-    wipe \
-    libzip \
-    zram \
-    libplist \
-    libusbmuxd \
+    libleak \
     liblockfile \
     liblogging \
+    liblognorm \
+    libmodbus \
+    libplist \
     libpwquality \
+    libqb \
+    librelp \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", d)=
} \
     libserialport \
+    libsigrok \
+    libsigrokdecode \
+    libsocketcan \
     libstatgrab \
+    libuio \
+    libusbmuxd \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
+    libyang \
+    libzip \
+    linuxconsole \
     lockfile-progs \
     logwatch \
+    lprng \
+    md5deep \
     mraa \
+    nana \
+    nicstat \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
     ostree \
+    p7zip \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-=
plugin-ldapdb pam-ssh-agent-auth", "", d)} \
     pegtl \
-    libfile-fnmatch-perl \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-d=
atetime polkit-group-rule-network polkit", "", d)} \
+    rarpd \
+    redis \
+    redis-plus-plus \
     rrdtool \
     sanlock \
+    sblim-cmpi-devel \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "sblim-sfcb ", "", d)} =
\
+    sblim-sfcc \
+    sblim-sfc-common \
     scsirastools \
     sedutil \
-    libsigrok \
-    libsigrokdecode \
-    s-nail \
+    sgpio \
     sigrok-cli \
+    smartmontools \
+    s-nail \
     snappy \
     tipcutils \
     tiptop \
     tmate \
     tmux \
     triggerhappy \
+    uml-utilities \
     upm \
     vlock \
     volume-key \
+    wipe \
     wxwidgets \
     zlog \
+    zram \
     zstd \
     zsync-curl \
-    redis-plus-plus \
 "
 RDEPENDS:packagegroup-meta-oe-extended:append:libc-musl =3D " libexecinfo"
 RDEPENDS:packagegroup-meta-oe-extended:append:x86-64 =3D " pmdk libx86-1"
@@ -436,164 +436,174 @@ RDEPENDS:packagegroup-meta-oe-extended:remove:riscv=
32 =3D "upm libleak mraa sysdig
 RDEPENDS:packagegroup-meta-oe-gnome =3D "\
     atkmm \
     gcab \
-    gnome-common \
     gmime \
-    libjcat \
+    gnome-common \
+    gnome-theme-adwaita \
     gtk+ \
-    gtkmm3 \
     gtkmm \
+    gtkmm3 \
+    libjcat \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", =
"libpeas", "", d)} \
     pyxdg \
-    gnome-theme-adwaita \
 "
=20
 RDEPENDS:packagegroup-meta-oe-graphics =3D "\
+    bdftopcf \
     cairomm \
-    directfb-examples \
-    directfb \
-    fbgrab \
+    deqp-runner \
     dietsplash \
+    directfb \
+    directfb-examples \
     ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnfdragora", "=
", d)} \
-    fontforge \
+    fbgrab \
     fbida \
     feh \
+    font-adobe-100dpi \
+    font-adobe-utopia-100dpi \
+    font-bh-100dpi \
+    font-bh-lucidatypewriter-100dpi \
+    font-bitstream-100dpi \
+    font-cursor-misc \
+    fontforge \
+    font-misc-misc \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut", "", d)} =
\
     ftgl \
     fvwm \
-    gtkperf \
     gphoto2 \
-    imlib2 \
-    libgphoto2 \
     graphviz \
+    gtkperf \
     gtkwave \
+    iceauth \
+    imlib2 \
     jasper \
+    leptonica \
     libforms \
+    libgphoto2 \
+    libmng \
+    libsdl \
+    libsdl2-image \
+    libsdl2-mixer \
+    libsdl2-net \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libsdl2-ttf", "", d=
)} \
+    libsdl-gfx \
+    libsdl-image \
+    libsdl-mixer \
+    libsdl-net \
+    libsdl-ttf \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libvdpau vdpauinfo", "=
", d)} \
+    libvncserver \
+    libxaw6 \
+    libxpresent \
+    libyui \
+    libyui-ncurses \
+    lvgl \
     lxdm \
     numlockx \
     nyancat \
     obconf \
     openbox \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "",=
 d)} \
+    openjpeg \
     packagegroup-fonts-truetype \
+    pangomm \
+    parallel-deqp-runner \
     qrencode \
+    sessreg \
+    setxkbmap \
+    source-code-pro-fonts \
+    source-han-sans-cn-fonts \
+    source-han-sans-jp-fonts \
+    source-han-sans-kr-fonts \
+    source-han-sans-tw-fonts \
+    spirv-shader-generator \
+    spirv-tools \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
-    leptonica \
-    libvncserver \
-    libmng \
-    libsdl-gfx \
-    libsdl-image \
-    libsdl-mixer \
-    libsdl-net \
-    libsdl-ttf \
-    libsdl2-image \
-    libsdl2-mixer \
-    libsdl2-net \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libsdl2-ttf", "", d=
)} \
-    libsdl \
-    lvgl \
-    ttf-arphic-uming \
-    ttf-droid-sans ttf-droid-sans-mono ttf-droid-sans-fallback ttf-droid-s=
ans-japanese ttf-droid-serif \
+    stalonetray \
+    surf \
+    terminus-font-consolefonts \
+    terminus-font-pcf \
+    tesseract \
+    tesseract-lang \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "tigervnc", "", d)}=
 \
+    tslib \
     ttf-abyssinica \
-    source-han-sans-cn-fonts \
-    source-han-sans-jp-fonts \
-    source-han-sans-kr-fonts \
-    source-han-sans-tw-fonts \
-    source-code-pro-fonts \
+    ttf-arphic-uming \
+    ttf-dejavu-common \
+    ttf-dejavu-mathtexgyre \
     ttf-dejavu-sans \
     ttf-dejavu-sans-condensed \
     ttf-dejavu-sans-mono \
     ttf-dejavu-serif \
     ttf-dejavu-serif-condensed \
-    ttf-dejavu-mathtexgyre \
-    ttf-dejavu-common \
+    ttf-droid-sans \
+    ttf-droid-sans-fallback \
+    ttf-droid-sans-japanese \
+    ttf-droid-sans-mono \
+    ttf-droid-serif \
     ttf-gentium \
     ttf-hunky-sans \
     ttf-hunky-serif \
-    ttf-ipag ttf-ipagp ttf-ipamp ttf-ipam \
-    ttf-lohit \
     ttf-inconsolata \
-    ttf-liberation-sans-narrow \
+    ttf-ipag \
+    ttf-ipagp \
+    ttf-ipam \
+    ttf-ipamp \
     ttf-liberation-mono \
     ttf-liberation-sans \
+    ttf-liberation-sans-narrow \
     ttf-liberation-serif \
     ttf-lklug \
+    ttf-lohit \
     ttf-noto-emoji-color \
     ttf-noto-emoji-regular \
+    ttf-pt-sans \
+    ttf-roboto \
     ttf-sazanami-gothic \
     ttf-sazanami-mincho \
-    ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho =
\
+    ttf-takao-gothic \
+    ttf-takao-mincho \
+    ttf-takao-pgothic \
+    ttf-takao-pmincho \
     ttf-tlwg \
-    ttf-roboto \
-    ttf-wqy-zenhei \
-    ttf-pt-sans \
-    ttf-vlgothic \
     ttf-ubuntu-mono \
     ttf-ubuntu-sans \
-    libyui-ncurses \
-    libyui \
-    x11vnc \
-    terminus-font-consolefonts \
-    terminus-font-pcf \
-    xdotool \
-    xkbevd \
-    bdftopcf \
-    iceauth \
-    sessreg \
-    xgamma \
-    setxkbmap \
-    xkbutils \
+    ttf-vlgothic \
+    ttf-wqy-zenhei \
     twm \
+    unclutter-xfixes \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts",=
 "", d)} \
+    x11vnc \
+    xcb-util-cursor \
     xclock \
+    xcursorgen \
+    xdotool \
+    xf86-input-tslib \
+    xf86-input-void \
+    xf86-video-armsoc \
+    xf86-video-ati \
     xfontsel \
+    xgamma \
+    xkbevd \
     xkbprint \
+    xkbutils \
     xlsatoms \
     xlsclients \
     xlsfonts \
     xmag \
     xmessage \
+    xorg-fonts-100dpi \
+    xorg-sgml-doctools \
     xrdb \
     xrefresh \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "",=
 d)} \
+    xserver-common \
     xsetroot \
     xstdcmap \
     xterm \
     xwd \
     xwud \
-    xorg-sgml-doctools \
-    xf86-input-tslib \
-    xf86-input-void \
-    xf86-video-armsoc \
-    xf86-video-ati \
-    font-adobe-100dpi \
-    font-adobe-utopia-100dpi \
-    font-bh-100dpi \
-    font-bh-lucidatypewriter-100dpi \
-    font-bitstream-100dpi \
-    font-cursor-misc \
-    font-misc-misc \
-    xorg-fonts-100dpi \
-    libxaw6 \
-    libxpresent \
-    xcb-util-cursor \
-    xserver-common \
-    openjpeg \
-    pangomm \
-    spirv-shader-generator \
-    spirv-tools \
-    stalonetray \
-    surf \
-    tesseract-lang \
-    tesseract \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "tigervnc", "", d)}=
 \
-    tslib \
-    unclutter-xfixes \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libvdpau vdpauinfo", "=
", d)} \
-    xcursorgen \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "",=
 d)} \
     yad \
     ydotool \
-    parallel-deqp-runner \
-    deqp-runner \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "",=
 d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts",=
 "", d)} \
 "
 RDEPENDS:packagegroup-meta-oe-graphics:append:x86 =3D " renderdoc xf86-vid=
eo-nouveau xf86-video-mga"
 RDEPENDS:packagegroup-meta-oe-graphics:append:x86-64 =3D " renderdoc xf86-=
video-nouveau xf86-video-mga"
@@ -604,10 +614,10 @@ RDEPENDS:packagegroup-meta-oe-graphics:remove:libc-mu=
sl =3D "renderdoc"
=20
 RDEPENDS:packagegroup-meta-oe-kernel =3D "\
     agent-proxy \
-    crash \
+    broadcom-bt-firmware \
     cpupower \
+    crash \
     ipmitool \
-    broadcom-bt-firmware \
     kernel-selftest \
     minicoredumper \
     oprofile \
@@ -632,42 +642,42 @@ RDEPENDS:packagegroup-meta-oe-kernel:remove:riscv64 =
=3D "crash oprofile"
 RDEPENDS:packagegroup-meta-oe-kernel:remove:riscv32 =3D "crash makedumpfil=
e oprofile"
=20
 RDEPENDS:packagegroup-meta-oe-multimedia =3D "\
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faad2", =
"", d)} \
+    a2jmidid \
+    audiofile \
     dirsplit \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faad2", =
"", d)} \
     genisoimage \
     icedax \
-    wodim \
     id3lib \
-    audiofile \
-    a2jmidid \
     jack-server \
     jack-utils \
     libass \
-    libcdio-paranoia \
     libcdio \
+    libcdio-paranoia \
+    libdvdread \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libmad",=
 "", d)} \
+    libmikmod \
     libmms \
-    libdvdread \
+    libmodplug \
     libopus \
+    libopusenc \
+    libvpx \
     live555-examples \
     live555-mediaserver \
-    libmikmod \
-    libmodplug \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "mpv", ""=
, d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pavucontrol", "", d)} =
\
     sound-theme-freedesktop \
-    yavta \
     v4l-utils \
     wavpack \
-    libvpx \
+    wodim \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xsp", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "mpv", ""=
, d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pavucontrol", "", d)} =
\
-    libopusenc \
+    yavta \
 "
=20
 RDEPENDS:packagegroup-meta-oe-navigation =3D "\
+    geoclue \
     geos \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd-machine-conf gp=
sd", "", d)} \
-    geoclue \
     libspatialite \
     proj \
 "
@@ -679,12 +689,12 @@ RDEPENDS:packagegroup-meta-oe-printing =3D "\
 "
=20
 RDEPENDS:packagegroup-meta-oe-security =3D "\
+    auditd \
     keyutils \
     nmap \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "passwdqc", "", d)} \
     softhsm \
     tomoyo-tools \
-    auditd \
 "
=20
 RDEPENDS:packagegroup-meta-oe-shells =3D "\
@@ -695,209 +705,209 @@ RDEPENDS:packagegroup-meta-oe-shells =3D "\
 "
=20
 RDEPENDS:packagegroup-meta-oe-support =3D "\
-    anthy \
-    atop \
     ace-cloud-editor \
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "driverctl", "", d)=
} \
-    frame \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
-    grail \
+    anthy \
     asio \
+    atop \
     augeas \
     avro-c \
     bdwgc \
     c-ares \
+    ccid \
+    ckermit \
+    clinfo \
     cmark \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit gobject-introspection-=
data", "colord", "", d)} \
     consolation \
+    c-periphery \
     cpprest \
     ctapi-common \
+    daemonize \
+    daemontools \
+    devmem2 \
     dfu-util \
     dhex \
     digitemp \
     dool \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "driverctl", "", d)=
} \
+    eject \
+    emacs \
+    enca \
+    epeg \
     espeak \
     evemu-tools \
     exiv2 \
-    libnice \
-    c-periphery \
+    fbset \
+    fbset-modes \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "fltk", "", d)} \
+    frame \
+    freerdp \
     function2 \
+    funyahoo-plusplus \
     gd \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
+    gengetopt \
     gflags \
     glog \
+    googlebenchmark \
     gperftools \
     gpm \
+    gradm \
+    grail \
+    gsl \
     gsoap \
+    hddtemp \
     hdf5 \
+    hidapi \
     hstr \
     htop \
-    hunspell-dictionaries \
     hunspell \
+    hunspell-dictionaries \
     hwdata \
+    icyque \
     iksemel \
-    gengetopt \
-    googlebenchmark \
     imagemagick \
+    imapfilter \
     iniparser \
     inotify-tools \
     joe \
     lcms \
     lcov \
-    imapfilter \
+    libatasmart \
     libbytesize \
+    libcanberra \
+    libcereal \
     libcyusbserial \
+    libdevmapper \
     libestr \
     libfann \
     libftdi \
-    libjs-jquery-globalize \
-    libjs-jquery-cookie \
-    ccid \
-    zchunk \
-    libgpiod \
-    libmanette \
-    ckermit \
-    libcereal \
-    daemontools \
-    libiio \
-    devmem2 \
     libgit2 \
+    libgpiod \
+    libgusb \
     libharu \
-    eject \
-    enca \
-    epeg \
+    libiio \
+    libinih \
+    libjs-jquery-cookie \
+    libjs-jquery-globalize \
+    libjs-jquery-icheck \
+    libjs-sizzle \
+    libmanette \
+    libmicrohttpd \
+    libmimetic \
     libmxml \
-    fbset-modes \
-    fbset \
+    libnice \
+    liboauth \
     liboop \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "fltk", "", d)} \
-    freerdp \
-    libgusb \
-    emacs \
+    libotr \
     libp11 \
     libraw1394 \
-    gradm \
-    gsl \
     librsync \
-    hddtemp \
-    hidapi \
+    libsass \
+    libsmi \
     libsoc \
-    libmimetic \
-    libinih \
+    libssh \
+    libssh2 \
     libtar \
     libteam \
+    libtinyxml \
+    libtinyxml2 \
+    liburing \
     libusb-compat \
-    libatasmart \
-    libcanberra \
-    libssh \
-    libssh2 \
-    libusbgx-config \
+    libusbg \
     libusbgx \
+    libusbgx-config \
+    libutempter \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "links-x11", "links", d=
)} \
     lockdev \
+    log4c \
+    log4cpp \
     logwarn \
-    libjs-sizzle \
+    lvm2 \
     mailcap \
-    liboauth \
+    mbuffer \
     mg \
+    mime-support \
+    minini \
     monit \
     mscgen \
-    libsmi \
-    remmina \
+    multipath-tools \
+    nano \
     neon \
     nmon \
-    libjs-jquery-icheck \
-    libtinyxml \
-    libusbg \
-    libutempter \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "links-x11", "links", d=
)} \
-    log4c \
-    log4cpp \
     nspr \
-    libdevmapper \
-    lvm2 \
     nss \
-    mbuffer \
-    onig \
-    mime-support \
-    minini \
-    multipath-tools \
     numactl \
-    clinfo \
-    opencv \
-    opensc \
+    onig \
     openct \
+    opencv \
     openldap \
-    wbxml2 \
+    opensc \
     p910nd \
-    libtinyxml2 \
+    pcp \
+    pcsc-lite \
+    pcsc-tools \
     picocom \
-    funyahoo-plusplus \
-    icyque \
-    libotr \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pidgin-otr", "", d)} \
     pidgin \
-    purple-skypeweb \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "pidgin-otr", "", d)} \
     pidgin-sipe \
     pngcheck \
     poco \
-    poppler-data \
     poppler \
+    poppler-data \
     portaudio-v19 \
+    pps-tools \
     procmail \
-    pxaregs \
+    purple-skypeweb \
     pv \
-    rsnapshot \
-    pps-tools \
+    pxaregs \
     raptor2 \
     rdfind \
     re2 \
+    read-edid \
+    remmina \
+    rsnapshot \
+    sassc \
+    satyr \
     sdmon \
     sdparm \
     serial-forward \
-    read-edid \
-    spitools \
-    libsass \
-    sassc \
+    sg3-utils \
+    sharutils \
     smarty \
+    spitools \
+    srecord \
+    ssiapi \
+    stm32flash \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "synergy", "", d)} \
     syslog-ng \
     system-config-keyboard \
     tbb \
-    satyr \
-    pcp \
-    pcsc-lite \
-    pcsc-tools \
-    sharutils \
-    sg3-utils \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "uim", "", d)} \
-    uchardet \
-    srecord \
-    ssiapi \
+    thin-provisioning-tools \
+    tokyocabinet \
     tree \
-    utouch-evemu \
-    utouch-frame \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "utouch-mtview", "", d)=
} \
+    uchardet \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks2", "", d)} \
-    stm32flash \
-    tokyocabinet \
-    xmlstarlet \
-    thin-provisioning-tools \
     uhubctl \
-    zile \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "uim", "", d)} \
+    unicode-ucd \
     unixodbc \
-    daemonize \
     upower \
-    unicode-ucd \
-    xdelta3 \
     uriparser \
-    nano \
+    usb-modeswitch \
+    usb-modeswitch-data \
+    utouch-evemu \
+    utouch-frame \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "utouch-mtview", "", d)=
} \
+    wbxml2 \
+    xdelta3 \
     xdg-user-dirs \
     xmlsec1 \
-    usb-modeswitch-data \
-    usb-modeswitch \
-    liburing \
-    zbar \
-    libmicrohttpd \
+    xmlstarlet \
     yaml-cpp \
+    zbar \
+    zchunk \
+    zile \
 "
 RDEPENDS:packagegroup-meta-oe-support:append:armv7a =3D "${@bb.utils.conta=
ins("TUNE_FEATURES","neon"," ne10","",d)}"
 RDEPENDS:packagegroup-meta-oe-support:append:armv7ve =3D "${@bb.utils.cont=
ains("TUNE_FEATURES","neon"," ne10","",d)}"
@@ -937,18 +947,18 @@ RDEPENDS:packagegroup-meta-oe-test:remove:riscv64 =3D=
 "fwts"
 RDEPENDS:packagegroup-meta-oe-test:remove:riscv32 =3D "fwts"
=20
 RDEPENDS:packagegroup-meta-oe-ptest-packages =3D "\
-    zeromq-ptest \
+    cmocka-ptest \
+    hiredis-ptest \
     leveldb-ptest \
-    psqlodbc-ptest \
+    libteam-ptest \
+    minicoredumper-ptest \
+    oprofile-ptest \
+    poco-ptest \
     protobuf-ptest \
+    psqlodbc-ptest \
     rsyslog-ptest \
-    oprofile-ptest \
-    libteam-ptest \
     uthash-ptest \
-    poco-ptest \
-    cmocka-ptest \
-    minicoredumper-ptest \
-    hiredis-ptest \
+    zeromq-ptest \
 "
 RDEPENDS:packagegroup-meta-oe-ptest-packages:append:x86 =3D " mcelog-ptest=
"
 RDEPENDS:packagegroup-meta-oe-ptest-packages:append:x86-64 =3D " mcelog-pt=
est"
--=20
2.39.2


