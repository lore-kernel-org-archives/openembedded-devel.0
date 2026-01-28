Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14038D3568E
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 08:06:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4380.1769566932381768223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 18:22:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EZVEkjJz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: shoudil@qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RKqiOg2953104
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=98wicP5+fwXQfwNTqzwLpRRfnUK/UhktTVz
	OcxdFIxw=; b=EZVEkjJzrWtApAARuRLaS2TJGj9f1MfI5jdmBIGRZfeMOoK76M1
	G31cts9pJReQzmVB3Wd1BX7EUvwVxDtSfZgf3mwweTiP+VuQp272o8HrO1wIv4Ro
	XTMi7/Bk9QMDnXF5LKjjbF7Juj1fBR0zdg4giRWR5SOt711o/uBnlDx88qPnTUuh
	tgTdcOB4c+YQrWf5kNFE1YlvwZI21F5nRtB2an4nUaUnuIiMC9Bhwox1jBvLVhSI
	9CtYY+HaQ/AquG82OBFudfgpqwQKLmy3iffsvibeQJ1WQnV6BYkuj2NxhYYDd7ci
	Eq1O7XN3HAUaJsZCowXbvRCKVZYZESuTeOQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjru8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:22:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60S2M8vH021510
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:22:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bvq5m9jcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:22:08 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60S2M7d0021505
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 02:22:08 GMT
Received: from shoudil2-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60S2M7oS021503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 02:22:07 +0000
Received: by shoudil2-gv.ap.qualcomm.com (Postfix, from userid 367460)
	id 843C9565; Wed, 28 Jan 2026 10:22:06 +0800 (CST)
From: "Shoudi Li" <shoudil@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shoudi Li <shoudil@qti.qualcomm.com>
Subject: [meta-oe][PATCH v4] android-tools-conf-configfs: remove this recipe without selinux dependency
Date: Wed, 28 Jan 2026 10:21:59 +0800
Message-ID: <20260128022159.3958091-1-shoudil@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAxNiBTYWx0ZWRfX082vwIrcqi/h
 /14nfMqdLm3FrbSAF3z1eMV7OIUuchXIr7buld9IZFJ3PfF5d5ju073eof+tO+GOo9En7yN/Spr
 lt+AhiZqzAPlIqv5EkzMZ4qJgZSD200MtvWxIeT30KvfUSpotk3EaBwomIHYev6Xo5yLCBUxu6R
 dHXHFazSTpbJDB0bBS0gwtNxEanTJYGgpW8HU/DxH5YXJ/kW/ol1/FrPCFGRbyxVuVQpMIq2qZz
 MnwcNFZPtY4SSNzZ9kYpBF4tMViUBDGWKtFCTVgld9FFtNzCym3oae9ee1NMGvs2Il/0zilyQ8w
 x65JQqdPkbYErFSZMHb7d6bpaI5CorxtXoBiRLTxRf5lJlgJmHeRQQQv1GHRwPG4DfxSUwrYM6d
 xmcPbd8ItHAkd1ujbdtp2WqEupe37sdmTNomXGBKspJuB2+PWQJsyyvBHSCq3zN3EHtfC6zRm2K
 5E6DWZ6Mbiwc+8KAQzA==
X-Proofpoint-ORIG-GUID: up2papYR-NZHk1ric0C3ui-h9ZdAisZ5
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=697972d3 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=1ni_ke5EW6YKA92IucEA:9
X-Proofpoint-GUID: up2papYR-NZHk1ric0C3ui-h9ZdAisZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280016
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 08:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123969

For the boards with multiple UDC ports, when compiling with meta-selinux
layer adb funtion will be impacted due to below error. Remove the recipe
under dynamic-layers/selinux/ as it's not required anymore, and ensure
adb work normally on the boards with multiple UDC ports.

ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
ls: write error: Device or resource busy

Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
---
 .../10-adbd-configfs.conf                     |  4 --
 .../android-gadget-cleanup                    | 24 ------------
 .../android-gadget-setup                      | 35 ------------------
 .../android-gadget-start                      |  7 ----
 .../android-tools-conf-configfs_1.0.bb        | 37 -------------------
 5 files changed, 107 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-cleanup
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-setup
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
deleted file mode 100644
index ddf155a907..0000000000
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-[Service]
-ExecStartPre=/usr/bin/android-gadget-setup
-ExecStartPost=/usr/bin/android-gadget-start
-ExecStopPost=/usr/bin/android-gadget-cleanup
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-cleanup
deleted file mode 100644
index 517227d4a6..0000000000
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-cleanup
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-
-[ -d /sys/kernel/config/usb_gadget ] || exit 0
-
-cd /sys/kernel/config/usb_gadget
-
-cd adb
-
-echo "" > UDC || true
-
-killall adbd || true
-
-umount /dev/usb-ffs/adb
-
-rm configs/c.1/ffs.usb0
-
-rmdir configs/c.1/strings/0x409
-rmdir configs/c.1
-
-rmdir functions/ffs.usb0
-rmdir strings/0x409
-
-cd ..
-rmdir adb
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-setup
deleted file mode 100644
index e44d1bacbe..0000000000
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-setup
+++ /dev/null
@@ -1,35 +0,0 @@
-#!/bin/sh
-
-set -e
-
-manufacturer=RPB
-model="Android device"
-serial=0123456789ABCDEF
-
-if [ -r /etc/android-gadget-setup.machine ] ; then
-	. /etc/android-gadget-setup.machine
-fi
-
-[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
-
-cd /sys/kernel/config/usb_gadget
-
-[ -d adb ] && /usr/bin/android-gadget-cleanup || true
-
-mkdir adb
-cd adb
-
-mkdir configs/c.1
-mkdir functions/ffs.usb0
-mkdir strings/0x409
-mkdir configs/c.1/strings/0x409
-echo 0x18d1 > idVendor
-echo 0xd002 > idProduct
-echo "$serial" > strings/0x409/serialnumber
-echo "$manufacturer" > strings/0x409/manufacturer
-echo "$model" > strings/0x409/product
-echo "Conf 1" > configs/c.1/strings/0x409/configuration
-ln -s functions/ffs.usb0 configs/c.1
-
-mkdir -p /dev/usb-ffs/adb
-mount -t functionfs usb0 /dev/usb-ffs/adb
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
deleted file mode 100644
index ca6c3df275..0000000000
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-set -e
-
-sleep 3
-
-ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
deleted file mode 100644
index 4d30327372..0000000000
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Various utilities from Android - corresponding configuration files for using ConfigFS"
-SECTION = "console/utils"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-S = "${UNPACKDIR}"
-
-SRC_URI = " \
-    file://android-gadget-setup \
-    file://android-gadget-start \
-    file://android-gadget-cleanup \
-    file://10-adbd-configfs.conf \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
-
-    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
-	install -d ${D}${sysconfdir}
-	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
-    fi
-
-    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-}
-
-FILES:${PN} += " \
-    ${systemd_unitdir}/system/ \
-"
-
-PROVIDES += "android-tools-conf"
-RPROVIDES:${PN} = "android-tools-conf"
-- 
2.43.0


