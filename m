Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBF9D25943
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 05:54:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3823.1769493218804342051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 21:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Tdl40C+4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: shoudil@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UeTF142320
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oKOgYTXBp9+tspbNZOD5e1t4uWv22wRfH/v
	J5kq/MQA=; b=Tdl40C+46ASCKpPVi7DGOOA5W1TVYvDJsjL2gett0L0x2+mEe/d
	LmqHEVPJnWSrey0LW7eHA5CMmB7MCuwMPR1plQTECCk0qHMyIVZpfzuL2/6iH7U2
	JR0wj62mcq29j8uVckowWCcbvdMHW2CV2NaY7cyvlKNtzLDYxQlUXm6N/odZCWBH
	ZbRSPeBcxlEZF9EhVY7pZIJsi+R4tuiDt7sujpscULuaKn6B2O8abJBkNtD3OCWO
	jjfMvOeAX4VMoOezCboWfX17bQM4z53cqgRqinJ6U0Vw8YzWcEYW9EIDNG1vDSu+
	ALIApm8H6KaK/lbF/EkC7xcrgE7NuIUOusQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxcb0hyte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:53:37 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60R5rYt0019245
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:53:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5m2950-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:53:34 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60R5rYwt019195
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:53:34 GMT
Received: from shoudil2-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 60R5rWoK018820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 05:53:34 +0000
Received: by shoudil2-gv.ap.qualcomm.com (Postfix, from userid 367460)
	id BA56255F; Tue, 27 Jan 2026 13:53:31 +0800 (CST)
From: "Shoudi Li" <shoudil@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shoudi Li <shoudil@qti.qualcomm.com>
Subject: [meta-oe][PATCH v3] android-tools-conf-configfs: remove this recipe without selinux dependency
Date: Tue, 27 Jan 2026 13:53:29 +0800
Message-ID: <20260127055329.3727567-1-shoudil@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hgM0VlFvsW8lt_bhlep0pltILm-XefbK
X-Proofpoint-GUID: hgM0VlFvsW8lt_bhlep0pltILm-XefbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0NiBTYWx0ZWRfX4riGGM7CL+BQ
 ORtGUTL0CqBcgpD9gkS7t9wAQkOhdQ6C3KhFl6zKbB7G9LjDl44CcNnkEpWeGhvVI9gWY+lN2fE
 pXaiTlNFaVpIU9c/h7ROT6nlBMgnKnJCdL/T+8bosApMg0RNnAAMaWGqpJ35VZNSQOe30isGrzq
 zZzerJ+I2fIWWXEkvocuBfAmq750L9AJu/GyObTl+vVICf7fiBa7+I2MZZE5rmLdCD0l4UzdAdx
 oXOSGGIa5AA+0GjSmMq4D2BMDasGJlHZdeyuwqRe48DBa1FCoqFkjMABYV2n6SxgS0209yK7XNV
 ZOqbQISKRDLqBMoA8qsgtePhyR+eAZydBYhX0zdFOIvGP1iRc1HN6gWAfK6qL1cyTZfriyi6clq
 LOacRtBTR46pFjfK9PUJBCzua1Qev6dF0nHtc296TndF6lcphaJn+abtgiW0t40EI7QBSALU3fq
 iSPlc9zFrllN3sFyJMg==
X-Authority-Analysis: v=2.4 cv=IdyKmGqa c=1 sm=1 tr=0 ts=697852e1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=1ni_ke5EW6YKA92IucEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270046
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123899

For the boards with multiple UDC ports, when compiling with meta-selinux
layer adb funtion will be impacted due to below error. Remove the recipe
under dynamic-layers/selinux/ to avoid it.

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


