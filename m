Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA2AC77B6F
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 09:17:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3452.1680859052885928080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 02:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GxShWBGk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34613e1654=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3379EOWj026012
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Apr 2023 09:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=35sGYoViiHxif0nzj3FxgCTY21rwzTMj+x1sKrcRPIU=;
 b=GxShWBGklccW3BWVtJdEQzfZJwuuGiey4Jwo/vU8CXVMNS89ZuYW3oZFqIxaIzSPh97o
 NXQLuL8Q9CHw5yPybmNtJl5ECN/4EOsn0HlSTsNOyf8SSKj343k/sx4juu5P3ACovh5I
 8pHKTI+V4ZfAXEjqqvFW7vHUvOLHO7n478UjSBFdax2xKCdlRpOVHy9+NLrmljYQUltH
 UC7ZmTB5hXBGOjI9VgnmXkw04GYdh2XnoFupyo3IYYZq+WIgTnZIPP7CcYkT5ldAlRYz
 Z4ALypJKlY1qqvOscJgRCwA3iuP+ezZg9wykaW/LJnLlqzpYMCnlFqgJi9VqpABUMmfV 3w== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pp9u4pukn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 09:17:32 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 7 Apr 2023 02:17:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 7 Apr 2023 02:17:30 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 4/4] xfce4-screenshooter: 1.9.10 -> 1.10.3
Date: Fri, 7 Apr 2023 17:17:22 +0800
Message-ID: <20230407091722.5576-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230407091722.5576-1-kai.kang@windriver.com>
References: <20230407091722.5576-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xYM3M4l2Iw-vghA-ncAwAnxaLw2y9B74
X-Proofpoint-GUID: xYM3M4l2Iw-vghA-ncAwAnxaLw2y9B74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=927 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 09:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101981

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-screenshooter from 1.9.10 to 1.10.3

* update HOMEPAGE that goodies.xfce.org has been decommissioning
* content of license file has been updated

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...creenshooter_1.9.10.bb => xfce4-screenshooter_1.10.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.10.bb => xfce4-screenshooter_1.10.3.bb} (66%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.3.bb
similarity index 66%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.3.bb
index bb44ec782..10427dab3 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.3.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Application to take screenshots"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
+HOMEPAGE = "https://docs.xfce.org/apps/xfce4-screenshooter/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11 libxml-parser-perl-native"
 
 inherit xfce-app perlnative
 
-SRC_URI[sha256sum] = "04b4178527f5b98cfe76ae427e95581067edf262a530639d332f6db9a68292d7"
+SRC_URI[sha256sum] = "a454159847becfeca274a5b58c0e5817d4a260a29345a37bbc3b4ff46f8f3818"
 
 do_compile:prepend() {
     mkdir -p lib
-- 
2.17.1


