Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D1FE9A04C
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 11:30:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12032.1771500594343843722
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 03:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YP62i8Gy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LLwyBa9/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JARnVL2004697
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CcGxMV7T3MC81imcOcamxT/yntRr4I/79e+
	6nNlTODc=; b=YP62i8GyAs7LosakV/9IY9jPopK+oukqCS2xjRjIoQNY/wOII+r
	+QFQfVL5zMBgsb+Y87A3fE6rMHmMtRaWqKk4pE23x2y6ccDXgXUKMjqAljI3ixf+
	10H/Y9yGCMnzluWFIKI+Ut6nOLormJkLD0kmuX9B9+KeTcxT+K7ZFVUsDmii1pZu
	UUOM6HfW/yuFw5ggyf/KuWOnkHZ6eqJkhl78/0LBTxiCkViNnk3xP+dBAJhZ6Eld
	dixOnlB94+o81d/VanK9dY42XBqA5DaH2ACWGyiF7fUTPm4DTUfJ2+hhOElY3y/t
	JfrpE9Sim+qX8f9T9lmqI4i94ttKNH6HozQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhqw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:29:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82436a49592so444214b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 03:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500592; x=1772105392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CcGxMV7T3MC81imcOcamxT/yntRr4I/79e+6nNlTODc=;
        b=LLwyBa9/0xgmp97XOOyDiyljldvyenUmZQzOZkS2T29lK51gMxUAkiRUD92nXMw93Y
         iXxhN3Zgj9+h9stTbvCFFR3ozeL+4zD2fZ72ZHp3FqNaUWL+zsiRYQufMR+2NoyHLSZe
         piv4fI3iMy5mBdb/yh7gjt/5D77P4/B5e3FbtvUBiRpSdmCV38R6i9RfaUDk329ADFnR
         cYpNgWi8qD51ax/q5R+nzOVqX3ZRUBvIKhIwKC2+6SmoigjMT7cWgFDA8h3fRxD3JwwQ
         1WkdNCxVje1OXyXNAJzyP7wrxUFJ8/uMNp5WBws3dX78BNbEsIInOB8OwJkZf6CjSL7U
         dGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500592; x=1772105392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcGxMV7T3MC81imcOcamxT/yntRr4I/79e+6nNlTODc=;
        b=firfU3fbDCn4DeuIRdP59c9kwAR8O8149KVyhMkDBPDnfQLTOYPkCqEhO9rARs9tSi
         HCk8Q2exUY0xIznkyLi4e74f6UsArzvlYUXEGnPSzyD8ZFYQe6A/G9sKzn/1QO92kv6l
         eUSQTlcaik2X6u+xqR/wlmgwv6PF6KRnv1iJN78Xt0kM0dyzvnC9VxdRqDgHPEyCZCqK
         FytGSMqcHkqmXPkPDSmDXNEtDgQThU6mekDQCqhi5eNLD+1k8YAqEGbCkKu9vR2lk9q8
         FHTib10n5MNefh34aohyC4BELcXmMY4Xlx9p1z84rKVec9hfXZblt3vnwXBLBg9AI3ct
         bR0w==
X-Gm-Message-State: AOJu0YyLg8vwSGfEqn14/gRCwrZt5od2C+IojM9cNReNsvX0BhxlGSv4
	YCrDzLXRNCyAJaRtY490xBXqCCjdb6qnrDf45/h9wnlFKrqTNTeKqExnkwRYa/GaZAaOWLE3D2t
	4b1MNVlLnasERmXv30aEm++INLg6gydlGo5Ss+oiEZM2693XErbEy4CK+61mnCrLS6+295gIcDQ
	sDY34gj/qXEU4YQm9YGCI=
X-Gm-Gg: AZuq6aIFfHMuc9oPK8e3AWThu5GvYCScMDI1o+TS1ZD1Zt3WgvNHFHum7r0Tc/7rUWB
	rWZ8Eqjy6D+9bt3awcOmjhj3hjyvQ+d1ew8jBEzklRfZyS+NNlE8MecqCydP9UA2X4fzFZoUc0z
	2AyYI/ZZ6CYD4Vf/6I40I+6KoVKMU4SWTfhjZi93Z3kpW5DnMUffRaalDPiijZDAqH7FYK0ZNr/
	E/Pw8m+pdwNZEHqbsDc6tUuXXPOGMlG8iw53ATkuXUyDZp9o73hhIlYNOYxQIL5ABO0bTRX79sZ
	niHJBFidtgtuKsWqZS0vWUmmgOaMi8e+uLZ9NHR1rkVujTU56MB1IrneE80sQa9x7kL/0ttzdGW
	dVElRgFRHjiu+/HIMUhsjaYO7IlK2TywdIatKS1G99hxnHzYeFbZg
X-Received: by 2002:a05:6a00:bc05:b0:81f:3d13:e07b with SMTP id d2e1a72fcca58-824c95b11aamr17405531b3a.43.1771500592142;
        Thu, 19 Feb 2026 03:29:52 -0800 (PST)
X-Received: by 2002:a05:6a00:bc05:b0:81f:3d13:e07b with SMTP id d2e1a72fcca58-824c95b11aamr17405511b3a.43.1771500591530;
        Thu, 19 Feb 2026 03:29:51 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a3e15bsm19697056b3a.19.2026.02.19.03.29.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:29:51 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] thermald: import from meta-intel
Date: Thu, 19 Feb 2026 16:59:42 +0530
Message-ID: <20260219112944.1555772-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XEkHVtfcDVc0FV04QxyIVEqnoSrx37uS
X-Proofpoint-GUID: XEkHVtfcDVc0FV04QxyIVEqnoSrx37uS
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=6996f431 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=ayb08WdcAAAA:20 a=EUspDBNiAAAA:8 a=ywxSisczK6T9onmI91wA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX48q6kk72tRsT
 nqIOSo2yFzycCx71dQJwP0AkYDrH55D1MfTcxCuXFuxlaZt0IWUBZTI0GH9iYDYs1GinlvhhaUg
 uHxbdQyvfbn0rtnNjVA5kI3gsuGo+V/GIYPzG+luZ04W8IlKEZXYTZc8cHtFxwuJiZCEiHa47s8
 JedaOEMlrvH3gzOOq/fa1VAehnekIjYjmrHzzqVq32bgtoc3OQ2iTLUJ/XwYZkcjqtgV4lVYC8n
 vCosRNWqo+CUZHOb7GnuTu5MSXCaV3WfWc59tmFr7GXd8gllwT9Lyv+A1TXCOOD2JFg+Bmzvb5y
 lOty30YU4NaxLtLhlpyB+FBhbI/XIkzEHg21HPZL5FB3nVoFfEC/Q6I652grTcVpomuzS8NjWQ7
 bjGYUBs3jJyhIe5/zu0HoG4X3DoUXxYNeapKwVynXDSK/bDDFdB0I4OI+cB2hUq3aoPURXXlF/C
 R00gjPF9NG9/KurhPVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124507

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

thermald now supports ARM platforms [1], so move it out of meta-intel
to allow broader reuse.

This version remains compatible only with x86 but a future recipe
upgrade should fix COMPATIBLE_MACHINE.

[1] thermal_daemon 1931a12e7e ("Add ARM backend and enable ARM platform detection")

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../recipes-bsp/thermald/thermald_2.5.10.bb   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb

diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
new file mode 100644
index 0000000000..6310602813
--- /dev/null
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Linux thermal daemon"
+
+DESCRIPTION = "Thermal Daemon is a Linux daemon used to prevent the \
+overheating of platforms. This daemon monitors temperature and applies \
+compensation using available cooling methods."
+
+HOMEPAGE = "https://github.com/01org/thermal_daemon"
+
+DEPENDS = "dbus dbus-glib dbus-glib-native libxml2 glib-2.0 glib-2.0-native upower libevdev"
+DEPENDS += "autoconf-archive-native"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea8831610e926e2e469075b52bf08848"
+
+SRC_URI = "git://github.com/intel/thermal_daemon/;branch=master;protocol=https \
+           "
+
+SRCREV = "88369b42ec523787081b9bf8811b364e2a3d5f2d"
+
+inherit pkgconfig autotools systemd gtk-doc
+
+# gtkdocsize runs before autotools do_configure and it copies gtk-doc.m4 and fails
+# to copy becuase there is no m4 dir yet.
+do_configure:prepend () {
+	mkdir -p ${S}/m4
+}
+
+EXTRA_OECONF = " \
+                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
+                 "
+
+FILES:${PN} += "${datadir}/dbus-1"
+
+SYSTEMD_SERVICE:${PN} = "thermald.service"
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+CONFFILES:${PN} = " \
+                   ${sysconfdir}/thermald/thermal-conf.xml \
+                   ${sysconfdir}/thermald/thermal-cpu-cdev-order.xml \
+                  "
+
+UPSTREAM_CHECK_URI = "https://github.com/01org/thermal_daemon/releases"
-- 
2.53.0


