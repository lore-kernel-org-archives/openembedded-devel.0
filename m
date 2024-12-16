Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECC9E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 10:36:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53416.1734345384537884180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 02:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2080fd93a2=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG8nUBD019739
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:24 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq1e8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:24 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 16 Dec 2024 02:36:23 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 16 Dec 2024 02:36:22 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/5] xfconf: 4.18.2 -> 4.20.0
Date: Mon, 16 Dec 2024 18:36:14 +0800
Message-ID: <20241216103618.4078816-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iB7gPoScaWuDcxpsYK_0Rhmo4Lasuiec
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=676002a8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=awJ2OSbzDOY4TupDAFYA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iB7gPoScaWuDcxpsYK_0Rhmo4Lasuiec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_04,2024-12-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412160089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114326

From: Kai Kang <kai.kang@windriver.com>

Update xfconf from 4.18.2 to 4.20.0:

* update EXTRA_OECONF to remove legacy perl setting, and add config for
  gdbug-codegen
* handle the systemd service file

The change log is at:

https://gitlab.xfce.org/xfce/xfconf/-/blob/master/NEWS

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfconf_4.18.2.bb => xfconf_4.20.0.bb}    | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.18.2.bb => xfconf_4.20.0.bb} (49%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
similarity index 49%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
index 39694cd0b..750a40627 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
@@ -4,15 +4,26 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
 
-inherit xfce gtk-doc gobject-introspection bash-completion vala
+inherit xfce gtk-doc gobject-introspection bash-completion vala systemd
 
-EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
+EXTRA_OECONF += "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
 
-SRC_URI[sha256sum] = "dce24fb0555e9718d139c10e714759e03ab4e40a7ffcf3c990f046f7a17213cc"
+SRC_URI[sha256sum] = "8bc43c60f1716b13cf35fc899e2a36ea9c6cdc3478a8f051220eef0f53567efd"
 
 FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
+                ${datadir}/dbus-1/services/org.xfce.Xfconf.service \
+                ${systemd_user_unitdir}/xfconfd.service \
+                "
+
+SYSTEMD_SERVICE:${PN} = "xfconfd.service"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)}; then
+        rm -f ${D}${systemd_user_unitdir}/xfconfd.service
+        rmdir --ignore-fail-on-non-empty -p ${D}${systemd_user_unitdir}
+    fi
+}
 
 FILES:${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
 
-- 
2.34.1


