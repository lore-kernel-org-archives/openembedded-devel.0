Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1958ECD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:15:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76079.1781000141491135516
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=K0vlM+ka;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=S+fYUW8C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599woFh2311319
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 10:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hOw9PlfOReipfxyj3hufrr8TxfjodhRTuVd
	ZsbQVZ8I=; b=K0vlM+kalmveYXNnlZqQuRHrYn/BnlXrkxL+mtaTPNfecCpoFQC
	jChtRo2h/7wBUoaPDNT/8EkrQMcTMZhGVdlmzQL7b2XnQsihKZc88YGWduPKp4Xh
	mIfR8I9UMmMqTuYEUbNJCPZ8oz7H70CQIDsoUE3kKUoRC1u7QTjjz0iXdwRr0Fq2
	BWSIxFGRnkpejXERt1ifa0+B/hjXk3N4Hww6VQjk2mZtxSqpVU/GW80F9YXP6AOa
	NbsxXPLKmHvuR7WV2BozTBkWQaJJYnRDd3uO8TQWyjs2D+BvptMBzclQDo9qLzMs
	YsOamGE7Ss2dAlPHJHSIJ6gP2oonSyUMEsg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v071x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:15:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a02dca36so5334999241.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000139; x=1781604939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOw9PlfOReipfxyj3hufrr8TxfjodhRTuVdZsbQVZ8I=;
        b=S+fYUW8CWZS5x5INNcSnsaTdrNkPdWfD/pqQYIPyulB9w7P29sEd5OQ3Sc6ieCz8Ni
         L8uvSeCtjXN/xoVf4mW5yCvTJM8ZamvIOes73K6ak3e6PV1+pF4vra70BrdG7qvB+xev
         +wcGsziZPw3Gh25WYAePqf4QXf2PmpoL9u+wBaE6XZpRQ85WdM9PqAFCTAqnHHy5auO8
         B7ugmTwpap86b+gsmx2Ra3Gbjzg5WzAOH8dt4PdcbCyLgEDbqTWd67MOR3oxvQUWzfeo
         Vs2m9gvAcohRu0qLi2lLDg8KlXI2JM7hkNi+xrQaimIVvwDrRRvo33dAztObmkB3H25p
         lZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000139; x=1781604939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOw9PlfOReipfxyj3hufrr8TxfjodhRTuVdZsbQVZ8I=;
        b=pAwYawjj8Dv1gpBnpw/6XGB0hoQwHX4aLCTH93G3lcOkIIO85Y/gt9kxP1JcOjtUS3
         rGPR19E82244rWNjxndG8uSEukKlFv5ttWpkFgpfW2YlyvT8i7hbW9HHdDwGhJ039/jL
         EIRawBJMvwTXcD4MPea2P00sAgJgTjCUZ5hmL362ah1uiKzcgcXXPDqQsNBdhchrhJzj
         uwU/iPpBKRgB6BcRsPlayfm4ikE7CnpAoEtXSMlA76BmaSanykD1bc1vdB4w3r5sHpL7
         duptBlPEYiklQnE5L/UZ1OMgBWY1RQLmnloYQZr6aeBJk5R5BU7PLAZ2MvinXb8vn36N
         l+kg==
X-Gm-Message-State: AOJu0Yzd44QALu++J9p3jCm7gKifBwTzZO94NEyOZgmY2kz0aGYNpoQG
	cLNKcxgfXRuE9rHHF/KikQZp8mP3L9QvJ8x/2Z8S6UOO3BKdTsSwhKAVN25GfzyNNPIct3OJ4Qc
	JOV+5gt29XF8E0AYbyx0KIbJcIfeOuCIEaar1p3W3nCdV3i2DMbQrGkhaNgrjOFffS5CnNTBX69
	q2rccOgbqqS8CuYq/LPk8=
X-Gm-Gg: Acq92OFz70qZlK7ZG4pm5DWPqQYONyqaQnQxThxRkFYrCxkSaLMga2ygcaAStOjl+Hk
	8K0cYgrj5t5Q7rZ7FhKrgzPLjo5pjgsJVJBKIBGY8OV0ihtO/eVCSnhWgLeLYRyawUgkVDF8b0q
	mA+P08aX6TpASdRnqw5BCge6gPxIHdgVXT1JRnx6l2yg2j6t6A2UfB5MYeN+leSQ11ZDJJ7Blg4
	e78JlENtibfMxBHZyBxN3N+5T3pE20umybRKvCDnHXg1uu8LSwgEMJdmjyOWjIohMEbEwVSYUER
	/xOOwyP5xAJ0RXlMMYjQS23sn5kmTqB2z+Imup6ihD8xd5pikgWguEY1bosj93BWdmlNNBjj2cg
	xTFO6SgoMUBgH9NGkUze2HKZ+WzOktR4rMJUJARhNlLwP3NWULGsDMohKmsPTFYTTAasCGrK/LH
	RwAHlY/NN/SV+6Ni8OdjcyFfYG1MykWIsCbl1apWpfHLXdMQ==
X-Received: by 2002:a05:6102:3ec8:b0:604:f029:224c with SMTP id ada2fe7eead31-6feef48708dmr10551314137.8.1781000139084;
        Tue, 09 Jun 2026 03:15:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec8:b0:604:f029:224c with SMTP id ada2fe7eead31-6feef48708dmr10551292137.8.1781000138540;
        Tue, 09 Jun 2026 03:15:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm4456336e87.23.2026.06.09.03.15.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:15:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] android-tools-conf-configs: revert deletion of the recipe
Date: Tue,  9 Jun 2026 13:15:36 +0300
Message-ID: <20260609101536.2670416-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a27e7cb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Mhs4xKItWYv-3OB2GC4A:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: LYjwNJ0auJ5LXQsinlfn7aMZscfRZzxC
X-Proofpoint-GUID: LYjwNJ0auJ5LXQsinlfn7aMZscfRZzxC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NSBTYWx0ZWRfX0OrPYRrBIlk2
 7aeD84QkkLdP/FvEByT5ezVX5iPvoQsrzJOnQkLD01kWm7enZkfTQKc8qf8u6FNwyJR+DxuWOzB
 oYJjtPrEq/iKevfJfagDPky2tKxpGn77IeEHjqvrrVGdAtQMAUEOuUoFLSWzWzyqXDiR2Df9I3D
 uUUBgGUmrj30pOMVDzoam8oXh7Y5x4PDmHIjgKuGI1NaM5onyeZLs3tGbZksTRycgAvflVnDvgC
 x8bviAxpd1uvaH/5w3Sap8+XGLZjssi40EZ8KV9dx2CWc9szUHl2zXulrX5EEJ5uWMMgk1PCBHG
 cNMRNplG3S6BrMsQvj2JebsJNaplti01Zq3wGCCVhsYUevopMuX5KvdyaAnsNsG6GHHBNpiQcAV
 F1Rc4yDC4PL8DYoEng+AxvdxKPug2bIfo985pCDU9giqjjhaCDD4WPmMVEh8QzT1BEqOmf+PfnZ
 29mU4Hjvv4RKHQ4WCcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127454

The commit 33c1e33d2303 ("android-tools: remove android-tools 5.x from
meta-oe/recipes-devtools") blindly dropped all recipes from the
android-tools dir. Later commits moved the android-tools recipe and
other related recipes from the SELinux dynamic layer, bumping the
version to 29.x, but somehow the author of the patches didn't notice
that the resulting set of packages doesn't work out of box on any
upstream kernels, as the default android-tools-conf setup scripts use
Android-proprietary way of setting up the USB gadget
(/sys/class/android_usb).

Bring back the android-tools-conf-configs recipe, which uses upstream
mechanism (ConfigFS) to setup the USB gadget for ADB.

Fixes: 33c1e33d2303 ("android-tools: remove android-tools 5.x from meta-oe/recipes-devtools")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../10-adbd-configfs.conf                     |  4 ++
 .../android-gadget-cleanup                    | 24 ++++++++++++
 .../android-gadget-setup                      | 38 +++++++++++++++++++
 .../android-gadget-start                      |  9 +++++
 .../android-tools-conf-configfs_1.0.bb        | 38 +++++++++++++++++++
 5 files changed, 113 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
new file mode 100644
index 000000000000..ddf155a907bc
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
@@ -0,0 +1,4 @@
+[Service]
+ExecStartPre=/usr/bin/android-gadget-setup
+ExecStartPost=/usr/bin/android-gadget-start
+ExecStopPost=/usr/bin/android-gadget-cleanup
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
new file mode 100644
index 000000000000..f27d77df5120
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+[ -d /sys/kernel/config/usb_gadget ] || exit 0
+
+cd /sys/kernel/config/usb_gadget
+
+cd adb
+
+echo -n "" > UDC || true
+
+killall adbd || true
+
+umount /dev/usb-ffs/adb
+
+rm configs/c.1/ffs.usb0
+
+rmdir configs/c.1/strings/0x409
+rmdir configs/c.1
+
+rmdir functions/ffs.usb0
+rmdir strings/0x409
+
+cd ..
+rmdir adb
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
new file mode 100644
index 000000000000..47e4edb9beef
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+set -e
+
+conf="Conf 1"
+manufacturer=RPB
+model="Android device"
+product=0xd002
+serial=0123456789ABCDEF
+vendor=0x18d1
+
+if [ -r /etc/android-gadget-setup.machine ] ; then
+	. /etc/android-gadget-setup.machine
+fi
+
+[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
+
+cd /sys/kernel/config/usb_gadget
+
+[ -d adb ] && /usr/bin/android-gadget-cleanup || true
+
+mkdir adb
+cd adb
+
+mkdir configs/c.1
+mkdir functions/ffs.usb0
+mkdir strings/0x409
+mkdir configs/c.1/strings/0x409
+echo -n "$vendor"  > idVendor
+echo -n "$product" > idProduct
+echo "$serial" > strings/0x409/serialnumber
+echo "$manufacturer" > strings/0x409/manufacturer
+echo "$model" > strings/0x409/product
+echo "$conf" > configs/c.1/strings/0x409/configuration
+ln -s functions/ffs.usb0 configs/c.1
+
+mkdir -p /dev/usb-ffs/adb
+mount -t functionfs usb0 /dev/usb-ffs/adb
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
new file mode 100644
index 000000000000..76b5e29624ba
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+set -e
+
+sleep 10
+
+ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_gadget/adb/UDC
+
+echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget usage"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
new file mode 100644
index 000000000000..342e7fd1a56b
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Different utilities from Android - corressponding configuration files for using ConfigFS"
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+S = "${UNPACKDIR}"
+
+SRC_URI = " \
+    file://android-gadget-setup \
+    file://android-gadget-start \
+    file://android-gadget-cleanup \
+    file://10-adbd-configfs.conf \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
+
+    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
+    fi
+
+    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
+    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
+}
+
+FILES:${PN} += " \
+    ${systemd_unitdir}/system/ \
+"
+
+PROVIDES += "android-tools-conf"
+RPROVIDES:${PN} = "android-tools-conf"
+BBCLASSEXTEND = "native"
-- 
2.47.3


