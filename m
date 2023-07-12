Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5F9EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 09:43:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3648.1689155018616315598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 02:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65573a9d19=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36C9U2jb021890
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 09:43:37 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rpxs5be4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 09:43:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 02:43:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 02:43:35 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] snort: Add systemd unit file
Date: Wed, 12 Jul 2023 17:43:34 +0800
Message-ID: <20230712094334.2402390-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qSvv8wVL3SLZ097DrbIQc-yfQqq2U70X
X-Proofpoint-ORIG-GUID: qSvv8wVL3SLZ097DrbIQc-yfQqq2U70X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_06,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307120086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 09:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103838

From: Mingli Yu <mingli.yu@windriver.com>

Add systemd unit file snort.service.

Reference: https://salsa.debian.org/lts-team/packages/snort/-/blob/debian/buster/debian/snort.service.example

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../snort/snort/snort.default                 |  1 +
 .../snort/snort/snort.service                 | 12 +++++++++++
 .../snort/snort_2.9.20.bb                     | 20 +++++++++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/snort.default
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/snort.service

diff --git a/meta-networking/recipes-connectivity/snort/snort/snort.default b/meta-networking/recipes-connectivity/snort/snort/snort.default
new file mode 100644
index 000000000..f1f67c55c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/snort.default
@@ -0,0 +1 @@
+INTERFACES="eth0"
diff --git a/meta-networking/recipes-connectivity/snort/snort/snort.service b/meta-networking/recipes-connectivity/snort/snort/snort.service
new file mode 100644
index 000000000..487328c1b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/snort.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Snort NIDS Daemon
+After=syslog.target network.target
+
+[Service]
+Type=simple
+EnvironmentFile=/etc/default/snort
+ExecStartPre=/bin/mkdir -p /var/log/snort
+ExecStart=/usr/bin/snort -q -c /etc/snort/snort.conf -l /var/log/snort -i $INTERFACES
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
index c15c20443..8b9092b41 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.20.bb
@@ -8,6 +8,8 @@ DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc bison-n
 
 SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://snort.init \
+    file://snort.service \
+    file://snort.default \
     file://volatiles.99_snort \
     file://0001-libpcap-search-sysroot-for-headers.patch \
     file://fix-host-contamination-when-enable-static-daq.patch \
@@ -19,11 +21,15 @@ SRC_URI[sha256sum] = "29400e13f53b1831e0b8b10ec1224a1cbaa6dc1533a5322a20dd80bb84
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools gettext update-rc.d pkgconfig
+inherit autotools gettext update-rc.d pkgconfig systemd
 
 INITSCRIPT_NAME = "snort"
 INITSCRIPT_PARAMS = "defaults"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "snort.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 EXTRA_OECONF = " \
     --enable-gre \
     --enable-linux-smp-stats \
@@ -69,8 +75,17 @@ do_install:append() {
            ${D}${sysconfdir}/snort/snort.conf
 
     cp ${S}/preproc_rules/*.rules ${D}${sysconfdir}/snort/preproc_rules/
-    install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
+    fi
 
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}/${systemd_system_unitdir}
+        install -m 644 ${WORKDIR}/snort.service ${D}/${systemd_system_unitdir}
+        # Install default environment file
+        install -d ${D}/${sysconfdir}/default
+        install -m 0644 ${WORKDIR}/snort.default ${D}${sysconfdir}/default/snort
+    fi
     install -d ${D}${sysconfdir}/default/volatiles
     install -m 0644 ${WORKDIR}/volatiles.99_snort ${D}${sysconfdir}/default/volatiles/99_snort
 
@@ -87,6 +102,7 @@ FILES:${PN} += " \
     ${libdir}/snort_dynamicengine/*.so.* \
     ${libdir}/snort_dynamicpreprocessor/*.so.* \
     ${libdir}/snort_dynamicrules/*.so.* \
+    ${systemd_system_unitdir}/snort.service \
 "
 FILES:${PN}-dbg += " \
     ${libdir}/snort_dynamicengine/.debug \
-- 
2.25.1


