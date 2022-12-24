Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD86CC4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:33:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.106401.1671917638112276667
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sWqfLnoC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLXuPE031454;
	Sat, 24 Dec 2022 21:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=u7ZyT4k3dcAtxSUEJ+V64PZobbg7wydn3wXTy2EqT3A=;
 b=sWqfLnoC30QNZ5MZQUsUozFdw1qc3pwnC9S7QKzB5+1x09MEj5U9+cGta4RwSAiUjCGm
 seTXV6sp0Hv7qgnj08zygcrv6aqh6OO0Km5D2GELPwIPg1AR6a2Vt3bhimGnQku9zgBb
 gKxxDLGsn7jBC+arSmpls8h/sLXi7GbMUn5pxOzoUckFGGNOP7a9WakwVCc29PzEgYkL
 EJMkm8m3WXcJ5C/Aq+Hh39MKHl4HQFZItfIQcZEkak9w3FQNQq1KbaQlvdvzILvb2uOh
 873ThYxJ/eqrPLjLiyidMXES2x1RZPFosEd4dKyV1gzrnqFw2nnwmEkfNzsHmTpV/num 5Q== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30fcy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:33:57 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:33:55 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:33:54 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 01/16] xfce4-dev-tools: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:32 +0800
Message-ID: <20221224213347.39959-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qFQ2UYtpwhP1WSV-yJUeF1K0pYFTUgSr
X-Proofpoint-GUID: qFQ2UYtpwhP1WSV-yJUeF1K0pYFTUgSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100208

From: Kai Kang <kai.kang@windriver.com>

Update LICENSE which is GPL-2.0-or-later, see

https://gitlab.xfce.org/xfce/xfce4-dev-tools/-/blob/master/COPYING#L298

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...v-tools_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
index 586a77efc..6ca18b8b3 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.18.0.bb
@@ -1,21 +1,19 @@
 SUMMARY = "Xfce4 development tools"
 HOMEPAGE = "http://www.xfce.org"
 SECTION = "x11/libs"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "glib-2.0"
 DEPENDS:append:class-target = " ${BPN}-native"
 
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native"
-
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2 \
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-SRC_URI[sha256sum] = "f50b3070e66f3ebdf331744dd1ec5e1af5de333965d491e15ce05545e8eb4f04"
+SRC_URI[sha256sum] = "eedb4fc955f0e3459c46864ff98579295db2b900743e0ff69cad5970ba76be37"
+
+inherit autotools pkgconfig
 
 do_install:append() {
     install -d ${D}${datadir}/aclocal
@@ -25,3 +23,5 @@ do_install:append() {
 FILES:${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4"
 
 RDEPENDS:${PN} = "bash"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


