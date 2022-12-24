Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83529C3DA7A
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.106407.1671917643214374160
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nUN+i81O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLQ1JR004475
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=qWKTheZ+m8tNUujp4g7jaFaHJhWvYyOAT333UpLtsZI=;
 b=nUN+i81OeOHVeZJJKCbhuDVHDq4koj4MFk3R8xPyOJiQtEzCCbKFK6mSj2SXmO2agSz9
 3pt6+ixv37dNI/aPJFr0ox+z9q5KTYn3mFpJGInV3N6UMGBcFDhS6bZcqQgf9OyeVSOo
 aLgOUOHnuqWO8pmfrVmkCjOHz6wYyktymqPnLC1H+9V+Cgfcl0jA8gdMo7WQ8QLsCzh8
 ASCIACzvfORKohA4PqdxT40S988dwccW6PZZcPYzgqoU0uGsDvFmgzHfHYN79aPkltSi
 s3QE2g1PJII/7xeQXX1KvkPdNJ648o7n0FakdSv1T/4HrQYYAg5AB45H6PK6L4A0qynh TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trg6d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:02 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BOLY25Q018072
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:02 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trg6cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:34:02 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:02 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:01 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 07/16] thunar: 4.16.9 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:38 +0800
Message-ID: <20221224213347.39959-8-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: ljniCpnD9KR-RO9dsOPASO0HbUZUb9b4
X-Proofpoint-ORIG-GUID: Tb7YIOHmtLA8FwoJZ_Z4J2BQN0MyOc-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100215

From: Kai Kang <kai.kang@windriver.com>

Update thunar from 4.16.9 to 4.18.0.
* update license which should be GPL-2.0-or-later
* update package config pcre

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../thunar/{thunar_4.16.9.bb => thunar_4.18.0.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.18.0.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb
index d3702c83c..3c05dacc6 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnotify xfce4-panel udev"
 
 inherit xfce gobject-introspection features_check mime-xdg perlnative
@@ -10,10 +10,10 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[sha256sum] = "520bf318eef8bc792db38ae4af343b648f87d4b8d66f5b5d6f092e15264ee5af"
+SRC_URI[sha256sum] = "d1f4b080c97b9e390eff199aaaac7562fb20f031686f8d5ee5207e953bfc2feb"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
+PACKAGECONFIG[pcre] = "--enable-pcre2,--disable-pcre2,libpcre2"
 PACKAGECONFIG[x11] = ",,libsm startup-notification"
 
 FILES:${PN} += " \
-- 
2.17.1


