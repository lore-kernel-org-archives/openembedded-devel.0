Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94898C88E77
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 08:39:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15721.1769416643835452491
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 00:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EASCSsql;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: shoudil@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PNNx17191832
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pNJuqM1R64IyQoHyFYmxoFWXEAqT2DeIqjJ
	aWD/PrLk=; b=EASCSsqlI8HNIFlE7sikKZ+2HKGytypTnrNDpV+bLpGlUmsIpDk
	QKD/XZ11CbPvcl8RVEpaRia9TYO02eYXI3NifnuHL909oldL3xM6nYfGuAw5AN54
	wLlY2Hb5iCIcfP6J8dhi3aa138cFqOhCi+U9/Y9L7LPUSqLLoH5ZY7XQwj3Up5YX
	vMP0NFQYc9UjfMgHlRvfpjfALFDSjUfjm1i1J+vwDvIRfYZM1pthvUSw4skLMIq4
	asVv5e3y33HfpBkQmhiSFDAc4n/hljze8NAJne3qd8LvfYexuwu8lEEBqLdsr3yx
	6sjwQBENVzvRK4bc21z/8sFW0YVnJD6kSGg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xuv53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:25:22 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60Q8PJLb008797
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:25:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5ktk72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:25:19 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60Q8PJOj008791
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:25:19 GMT
Received: from shoudil2-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 60Q8PI7i008787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 08:25:19 +0000
Received: by shoudil2-gv.ap.qualcomm.com (Postfix, from userid 367460)
	id BCCAA55F; Mon, 26 Jan 2026 16:25:17 +0800 (CST)
From: Shoudi Li <shoudil@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shoudi Li <shoudil@qti.qualcomm.com>
Subject: [meta-oe][PATCHv2] android-tools-conf-configfs: remove this recipe without selinux dependency
Date: Mon, 26 Jan 2026 16:23:56 +0800
Message-ID: <20260126082356.3462355-1-shoudil@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c1FPX7u69-1DOz2TCx4uLqjHSLp5Noj6
X-Proofpoint-ORIG-GUID: c1FPX7u69-1DOz2TCx4uLqjHSLp5Noj6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA3MSBTYWx0ZWRfXwEj5J5rhazaC
 ZM8tbHNPjLSgSb0Uyi4AvC1vxodo4X0laL7sMkolYjEPCPsQQXSfxzjQ0xl1hqo0HBs8OmkjIm6
 iJX6E/eBqLBxugC6DuXj3cTLqaCC9VRPGU9jG6FpoUr9vF8L5HLu3/wWL9T4V6lxGT4MKtpYuyA
 f9VSbEjgVk8NAlVOrVnKgBspI18AybKSKCjWdhLPvnFnSMmmsgHJZ5IgbcqWr+C5Bl50efBa4/n
 5FKzxlezEra0aREXER6SXWIsUgEjOCnATi0ULLjVq2GeF2TDjSdeHLgjULAr0UVhhYizOt0psIs
 5O4OlM9c5rLiMsb8sWupQQbEtLpXJaYOXP0GI+TloY0xWVdtb3jSHoPnjw6qUACa3G/+acFbADK
 j8gUXhPdqTkx7xfSvCpU/nx/SPfmKtr1qQ3EbcHtFoyUU0VT7LuUKQp3orveqW7/CxyGnxss1nA
 JRgZPACVi58w9FE4Zdw==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=697724f2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=K4Fpva7YHiXdwjqRakkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260071
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 08:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123865

For the boards with multiple UDC ports, adb funtion will be impacted
when compiling with meta-selinux layer due to below error.

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


