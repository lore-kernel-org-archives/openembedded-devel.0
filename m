Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8355DC46467
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.106125.1671917646575279373
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=M09ziU+d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLUrtK006737
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=juLQNriQTJpkqePmiNPIRYvpLpSsn+e8oWW2xsUXGUs=;
 b=M09ziU+dmYttzIDc5ovdRwZjuSKXKLnXoSuBL7w+GElmS2NG6dhn0+3VBpmGeABk8mjO
 yTQNSMa8kPSLq4dQ4tA58o7DwSMwisMUHOmUSWROKLyb1L+cYuHWrJPfhQnpy5afjUDU
 fYBySIF3j06xq93h0HpZy7ATWY4tSyLtxh3W/FFxCtP8uenjGwSQTPvZZ3QxU5RggQiE
 wWwEnGZV26K1mLetPeqJtL9rissTAVnpN//gJxcM4T3SngWnJEt09o9mrWAJHsSBzyVf
 31zJ973pfJpfVMuxE+8OA/g85mzLBGP/CimhXUENwHG3NhOXudFge8x1SSBwsU2BahcZ aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:06 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BOLY5J3012962
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:05 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:34:05 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:05 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:04 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 10/16] xfconf: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:41 +0800
Message-ID: <20221224213347.39959-11-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: Nm7EHTq747eQajQShdaksFrzqbjkTgBz
X-Proofpoint-ORIG-GUID: QdqZD2a3HFXYKTj5Rtd2BwnjCD7lhocf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100218

From: Kai Kang <kai.kang@windriver.com>

Update xfconf from 4.16.0 to 4.18.0

* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfconf/{xfconf_4.16.0.bb => xfconf_4.18.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.16.0.bb => xfconf_4.18.0.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
index be742192b..f5c598b8d 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.18.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce configuration daemon and utilities"
 SECTION = "x11/wm"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
 
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection bash-completion vala
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[sha256sum] = "652a119007c67d9ba6c0bc7a740c923d33f32d03dc76dfc7ba682584e72a5425"
+SRC_URI[sha256sum] = "2e8c50160bf800a807aea094fc9dad81f9f361f42db56607508ed5b4855d2906"
 
 FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.17.1


