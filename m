Return-Path: <ctheegal@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2BEC5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 13:24:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9008.1786281870541125722
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2026 06:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JYm7vjyo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: ctheegal@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1blA2675006
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Aug 2026 13:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMoqHL/9D10G6WohdAl1UqOU7t2NCbfmKZbQKKZ+kNY=; b=JYm7vjyomW/rRUkV
	rDmrhpWFlGjZGqhXy/paw+bdlfpAnqCnU7R75MFx62t0L3cFp42tMPITh/3ERcdT
	AQfF7L93iwFDqTjYrNNWj3zpx0fbNm+Tl6sK6Ucyk8JqJaahm7J+SmtlhvsVtAvx
	BinCFpdUHwidW+M3Wj9HyoFJG4jJkWyxH0ehMDCZy6dU8339STRQ8PoaPqq1amkv
	BSFlC8K1XTsrXDpzgypD5f0rBdtC2Htodps/VipDaTH7B2bkhSkuiwDrIceNmioZ
	EQqzPCNR4Et7Ih100dOUvOw2uQL+JgCrQ4S2iX677AccxBL2fP2OJRSoeNnt4W8P
	KjNonw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvawdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 13:24:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 679DORAS013911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Aug 2026 13:24:28 GMT
Received: from hu-ctheegal-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 9 Aug 2026 06:24:26 -0700
From: Chitti Babu Theegala <ctheegal@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chitti Babu Theegala <ctheegal@qti.qualcomm.com>
Subject: [meta-oe][PATCH v3] boot-time-analysis-tools: add boot time profiling tools
Date: Sun, 9 Aug 2026 18:54:14 +0530
Message-ID: <20260809132414.1934095-1-ctheegal@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805054533.1722572-1-ctheegal@qti.qualcomm.com>
References: <20260805054533.1722572-1-ctheegal@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a787f8d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=Ujg9kQxSS-RusALq8T8A:9
X-Proofpoint-ORIG-GUID: SQZmFD9Gsc7ZukL3Gn26p7fHE4srS3mD
X-Proofpoint-GUID: SQZmFD9Gsc7ZukL3Gn26p7fHE4srS3mD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExOCBTYWx0ZWRfX2rv6/lWeeINc
 LMdOTtUMnz9BNHCUHN8P4YeAijwv1Zu/gEfN+7bKAMdJ12M9tmZdd8AUM3SNJ7XaGoTSzY9tMd1
 X65NVaacqYrPe/vK8ro+NV74CrayQhp8aPWEODZj8BoHIvGiYjCDc5LxgSNVbL1JguBAHvNAHop
 rJF+lwtNOerpqYa32I3fMvgf4vY16gsomtIgzKX944fofuzAAAXYCHVaAPlY4ch3P/VDSO6Kkih
 uqfVQngQvpijVUeOIlWKWUbrnebURyI3ZmCR63fasOqF0dvF6roQ3OKzbXApoeCHdIvIxsGBLiC
 M1a+X7i6kAJLKq4tOMROSLLSQXtv5HH/jNdSefAoXyElwIrjABgUUSZ6FpvjM7JhKzGvlC+LosG
 tFe5dwJ4A3GNOA2C71h+ZOjv2tWHyK0yYCUns3bm/esYjkQsroUNIKDEJnVrMX9NJLxy2nyI2Wx
 1Z/7Gol4/VsteAOeL0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExOCBTYWx0ZWRfX6Q3hIoimubCr
 pSS+SZkAEATTYdOBkJjtsHoZKUw92CJm7c1nZ2cPmCfc4WYX6hVA9SPfNqgMefyCnDvBSVcAg6i
 P8FigtOb83ZeTbmR8fWE3Ce1P4aQEjQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 13:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128871

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
 .../boot-time-analysis-tools_0.7.1.bb         | 12 ++++++++
 .../cntvct-log_0.7.1.bb                       | 28 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
new file mode 100644
index 0000000000..87fbd68f78
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Boot time analysis tools from CentOS Automotive SIG"
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
index 0000000000..434ddc5893
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb
@@ -0,0 +1,28 @@
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
+inherit meson systemd features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
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

