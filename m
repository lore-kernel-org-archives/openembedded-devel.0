Return-Path: <ctheegal@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A5DC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:46:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34030.1785908768698707236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ParagzkA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: ctheegal@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6753Vlq81017190
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Aug 2026 05:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BpvmQ9bWpP1L/025WBad5WCmc81Jvs615+in1tweYoU=; b=ParagzkAKAMskpw9
	Q39cG6+zWmtoU6BM53i/PjsZeGWf2CP0lohXkL2KjcXgzlJ9vOjzTOHiKsKVm0eX
	bxao9HAAT9UBKyBy0i35wJLL7FXTSjagHIwzIsswagqfFe3lfs/u/pbSK/aKt7ir
	KbdCvS4VmmuCSjJ1+6vHaw4uIqsdDoNGcoP/eyzaeshxgZDUUO4co5pTOmuXuBAq
	BiEQdgn5qAKhZlk/Z/ahCKRNmSB37dw7i5gcXQ07Jvv6gfn7zwi5sftjnnjtzgW3
	LjaaKcNsEiEzpJXkv13BhPXK5467QUo0vqGIakGA+PU21EVDInrPHyz7fHo2UtCi
	GLdw3Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqrerx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:46:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6755k68D010225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Aug 2026 05:46:06 GMT
Received: from hu-ctheegal-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 4 Aug 2026 22:46:03 -0700
From: Chitti Babu Theegala <ctheegal@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <ctheegal@qualcomm.com>, Chitti Babu Theegala <ctheegal@qti.qualcomm.com>
Subject: [meta-oe][PATCH v2] boot-time-analysis-tools: add boot time profiling tools
Date: Wed, 5 Aug 2026 11:15:33 +0530
Message-ID: <20260805054533.1722572-1-ctheegal@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715130932.1438994-1-ctheegal@qualcomm.com>
References: <20260715130932.1438994-1-ctheegal@qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 1E1IAzc1j77tK0TZmXUIU90_Pfw3x1uE
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a72ce1f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=Ujg9kQxSS-RusALq8T8A:9
X-Proofpoint-GUID: 1E1IAzc1j77tK0TZmXUIU90_Pfw3x1uE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0MiBTYWx0ZWRfXwtX7cOqivpeT
 v33s8D/WIYPQBWioWqrcb095V3y6Cc41+6iBZf8U2OZHNH+ari+C9UYREDYYMWXt5v/xE/rCinC
 9AMSV5pT3foYv9EQC8Rfg9rI/4XmgTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0MiBTYWx0ZWRfXxIjTtYGfC5xu
 N0Wi5YQiu6ItYQo+mSQ+yW0qBE8PD5NryasQ0AeNgBSmhlWjSy/B2aEWMJr2JFZEKlslTqVH03y
 wxifj4SWLL0Bainh8Vz5Pbgpx3YK4YLoE+hTgbenb2xVZ5Bw4L0dX8LDiAv2kgxr/bADaIzT+i6
 x1NyUpJdXmlwKoMuYpbxNjVUanD4RyQHVGwPdHzndSpJgu18Zfu4hMUe/UQH1uLU/eQa7WKeB63
 i4C01dWDGesgeGwsJ70NPYxvRnWihq7V2weNtPWLG9oqb4bYgtXsDc3t9gXpDmFMUl/gscF5buM
 CkIg/+5DH/jZ7PG+u8v1BUS+aZPl0OD+5GOv9Lv/EGwM0BL8WER4y2tgPYRisC5Db141UkGmJNq
 mliEDrfaG7eyLYDK1mLEfD6NEJZIm0yAvUaEbGeu8d0AXI0INMU/5wwBjtmJmce9i02fwDrm5T6
 as1yFhspYXnmfyosyxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128798

Add two new recipes from the CentOS Automotive SIG
boot-time-analysis-tools project to enable boot time profiling
and measurement.

boot-time-analysis-tools:
  Python-based toolset for collecting, analyzing and visualizing system
  boot timing data from the systemd journal. Provides the 'boot_timings'
  CLI utility which queries D-Bus and the systemd journal to produce
  structured boot time reports. Depends on python3-dbus and python3-systemd
  for runtime journal and D-Bus access.

cntvct-log:
  Userspace C utility built with Meson that logs ARM CNTVCT_EL0 virtual
  counter timestamps to correlate hardware-level timing with systemd boot
  events. Installs cntvct@.service as a systemd template unit (disabled
  by default) for on-demand per-instance activation. The service preset
  file (98-cntvct-log.preset) is installed for system-preset-based enablement.

Both recipes fetch from the same upstream git repository:
  https://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools

Signed-off-by: Chitti Babu Theegala <ctheegal@qti.qualcomm.com>

---
Changes in v2:
- Move recipe under meta-oe/dynamic-layers/meta-python to fix
  layers dependency check (meta-oe must not depend on meta-python
  unconditionally). Reported by Khem Raj.
---
 .../boot-time-analysis-tools_0.7.1.bb         | 13 +++++++++
 .../cntvct-log_0.7.1.bb                       | 27 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
new file mode 100644
index 0000000000..67dba14897
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Boot time analysis tools from CentOS Automotive SIG"
+REQUIRED_DISTRO_FEATURES = "systemd"   # only build if systemd is in use
+DESCRIPTION = "Tools for analyzing and visualizing system boot time"
+HOMEPAGE = "https://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2e0cc0dec0b709fe547806b55737b0"
+
+SRC_URI = "git://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;protocol=https;branch=main;tag=${PV}"
+SRCREV = "2409ce37e7389d8079bdb8740cb6a44b505fb8d4"
+
+inherit setuptools3
+
+RDEPENDS:${PN} = "python3-dbus python3-systemd "
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb
new file mode 100644
index 0000000000..8cf2a4c225
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "cntvct-log - ARM virtual counter boot time logger"
+DESCRIPTION = "Userspace tool to log ARM CNTVCT_EL0 counter values for boot time analysis"
+HOMEPAGE = "https://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=1c2e0cc0dec0b709fe547806b55737b0"
+
+SRC_URI = "git://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;protocol=https;branch=main;tag=${PV}"
+SRCREV = "2409ce37e7389d8079bdb8740cb6a44b505fb8d4"
+
+S = "${UNPACKDIR}/cntvct-log-${PV}/cntvct-log"
+
+inherit meson systemd
+
+# Manually install service file if meson.build doesn't handle it
+do_install:append() {
+    if [ -f ${S}/usr/lib/systemd/system/cntvct@.service ]; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${S}/usr/lib/systemd/system/cntvct@.service \
+            ${D}${systemd_system_unitdir}/cntvct@.service
+    fi
+}
+
+SYSTEMD_SERVICE:${PN} = "cntvct@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+# Explicitly include the service file in the package
+FILES:${PN} += "${systemd_system_unitdir}/cntvct@.service"

