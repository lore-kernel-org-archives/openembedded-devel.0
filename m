Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82996E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 10:04:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.126280.1734602680287678030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 02:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208387d3b6=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ9c5st011428;
	Thu, 19 Dec 2024 02:04:39 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h6685fkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Dec 2024 02:04:39 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 02:04:38 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 02:04:37 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH v2] xfconf: 4.18.2 -> 4.20.0
Date: Thu, 19 Dec 2024 18:04:29 +0800
Message-ID: <20241219100429.407058-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dkvnU126giuvXqiIOBzJE8QQsw9YAQcs
X-Authority-Analysis: v=2.4 cv=K5XYHzWI c=1 sm=1 tr=0 ts=6763efb7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=6cR9DLqH9oASFjr1WeIA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dkvnU126giuvXqiIOBzJE8QQsw9YAQcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=953 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 10:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114387

From: Kai Kang <kai.kang@windriver.com>

Update xfconf from 4.18.2 to 4.20.0:

* update EXTRA_OECONF to remove legacy perl setting, and add config for
  gdbug-codegen

The change log is at:

https://gitlab.xfce.org/xfce/xfconf/-/blob/master/NEWS

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:

* not inherit systemd and not handle user mode systemd .service file

 .../xfconf/{xfconf_4.18.2.bb => xfconf_4.20.0.bb}         | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.18.2.bb => xfconf_4.20.0.bb} (73%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
similarity index 73%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
index 39694cd0b..04c12b44d 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.2.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
@@ -6,13 +6,15 @@ DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
 
 inherit xfce gtk-doc gobject-introspection bash-completion vala
 
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
 
 FILES:${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
 
-- 
2.34.1


