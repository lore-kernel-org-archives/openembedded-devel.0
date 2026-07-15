Return-Path: <ctheegal@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42579C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:09:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5559.1784120989098326783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 06:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=J4eimmLC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: ctheegal@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdUXH3697872
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 13:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q9D4uXM8vhw856OrG4m5ud
	PejqwiknN6mh3AHxtbFIw=; b=J4eimmLC2pUclCgHrofuRWfQqa6dakj5tQgrpL
	+dptwojWcPmfdtDNr5RKyyHsYdLfVskzEdRS6apV5N/3BiOoRcTAUTST0nyORgRm
	/tmVgkJufBwLBT2tmTPGRS3jp5mZFZAlefplTsqG+rrb1EQnY3v+FfkkwTvkwcX1
	NRaw14CtgyKHUCWRnqFlhZKDOlnB6xd45qqWxqWIFIaSAeJK0ZHlVCpzU0RsH1C2
	TZbuN2QyPOstMa+eDZ8KXA4iwBUG8Urg2417u0+FfrrTFPfBRj76S2ifhRKYqX/q
	DZ1rUxUVggQRvWFaaqRL4VY+5EAtu1T1NLeI9C7vLBrniZDA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vjdua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 13:09:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 66FD9iAT016425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 13:09:44 GMT
Received: from hyd-e160-a04-2-08.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 15 Jul 2026 06:09:43 -0700
From: Chitti Babu Theegala <ctheegal@qti.qualcomm.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chitti Babu Theegala <ctheegal@qti.qualcomm.com>
Subject: [meta-oe][PATCH] boot-time-analysis-tools: add boot time profiling tools
Date: Wed, 15 Jul 2026 18:39:32 +0530
Message-ID: <20260715130932.1438994-1-ctheegal@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a578699 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=ohqr1eaZV0cQlpiUwIIA:9
X-Proofpoint-ORIG-GUID: OiWbHj4h5P6-zp54JN99BoRIGeQGvAm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMSBTYWx0ZWRfX/Und1KJ5Lfbx
 0AdYqVEkSTxtbQj4tJJm9aeU4dQYLVQrMhgShfXNqLZnNapXbOHtHsxIOhiRHJtCkaZICydLe5X
 tr1gYVG2UeUgvNKO+O3NXnfjJtOFFmMfvpLTFXbqImFaplOIskEza5TSojtqOsvEpjB3/vYcqHE
 kvXWePu+ZkAK7bneDhZE0cEvzKegcagAwxsjU9QebSHwZZwhFk5AQz2QRree37ZnATQzETHBsmP
 O0qu93QRIY0EQqP50oJRtj/zMITjE5Vgw/uSoJPgmixt+RDTTlouDka4G42eKIwA18V6CgfpziJ
 oUHKUWDKeSppUY8wv/s4Q9aSB5wTIsAuvf64lXhZWixOpY5FYwte8tOH8dsQ686Y9nmBtsyBTq+
 HlSRdwHQM2oJoviBMCBM77XR7MYTZDLrtarvXWuc4JXsVTN+cmMXvChW43YVD083eqjrZjPnYIN
 BDXysEpoX+dPRuG1IxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMSBTYWx0ZWRfX9RqgJQPDmVzj
 /ERKhT3gi3oy2J81wQ6D4V8YAqlFHRYXB2669nQPL0RcDWOuND4XoMn04g5lePr7YhWy/TAympL
 Yq4VlqyYUA8fla79nVaGZZLxfztsDIQ=
X-Proofpoint-GUID: OiWbHj4h5P6-zp54JN99BoRIGeQGvAm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1011 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 13:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128218

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
 .../boot-time-analysis-tools_0.7.1.bb         | 13 +++++++++
 .../cntvct-log_0.7.1.bb                       | 27 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
 create mode 100644 meta-oe/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb

diff --git a/meta-oe/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb b/meta-oe/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
new file mode 100644
index 0000000000..00a5c8b960
--- /dev/null
+++ b/meta-oe/recipes-devtools/boot-time-analysis-tools/boot-time-analysis-tools_0.7.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Boot time analysis tools from CentOS Automotive SIG"
+REQUIRED_DISTRO_FEATURES = "systemd"
+DESCRIPTION = "Tools for analyzing and visualizing system boot time"
+HOMEPAGE = "https://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2e0cc0dec0b709fe547806b55737b0"
+
+SRC_URI = "git://gitlab.com/CentOS/automotive/src/boot-time-analysis-tools.git;protocol=https;branch=main;tag=${PV}"
+SRCREV = "2409ce37e7389d8079bdb8740cb6a44b505fb8d4"
+
+inherit setuptools3 features_check
+
+RDEPENDS:${PN} = "python3-dbus python3-systemd "
diff --git a/meta-oe/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb b/meta-oe/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb
new file mode 100644
index 0000000000..8cf2a4c225
--- /dev/null
+++ b/meta-oe/recipes-devtools/boot-time-analysis-tools/cntvct-log_0.7.1.bb
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

