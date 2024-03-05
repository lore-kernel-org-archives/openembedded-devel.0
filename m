Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D68C54E49
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 02:10:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11844.1709604597788287706
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 18:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eoMvlk9K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37941debd1=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4250dlfZ024685
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Mar 2024 02:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=0jrVp
	jxAFMtXitXaSOaG0c1UMgNC/VJeJ7mmi3Xge/g=; b=eoMvlk9K4Eh3Z4G8Wmtfq
	VONjXgixLeu5e9XAG+ff2qkc2j80ucQdNGT7zsT701l0kdMlvBne+CTn76boWxoY
	6V8iovHAbt/tqWrrKtWAfqJMwYMuWsE0mKk6r3cKq1uB4eI47fXTyqBTQuU2Gk1/
	W+6ApVwarmuZ/kiJrXFVulqhkv6jYhGYjOi4sDwJpEF+q4WwHfmZEW1twdAdDVBa
	STIhzGRWTmk81qc9TlrDrRRK7wGdK9kg7U/hffZkHvo3XDW2xRd9SdygG9kseHPN
	vbJkFVTi3PqoHGbdFE5jwMzDx9t/PksYaxSQ7k1x0PtEgU2ivPvXlHX0TPz6Nfhz
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawtcq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 02:09:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 18:09:54 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 18:09:54 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] syslog-ng: upgrade 4.0.1 -> 4.6.0
Date: Tue, 5 Mar 2024 10:09:53 +0800
Message-ID: <20240305020953.2357116-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cZQAnPBLDzq19fb6Jyd-5j7cmR-POl-p
X-Proofpoint-GUID: cZQAnPBLDzq19fb6Jyd-5j7cmR-POl-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_20,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403050014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 02:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109109

From: Changqing Li <changqing.li@windriver.com>

License-Update:
Add a docker license header

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../syslog-ng/{syslog-ng_4.0.1.bb => syslog-ng_4.6.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.0.1.bb => syslog-ng_4.6.0.bb} (97%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
similarity index 97%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
index 77a5e67a4..4cc5d8451 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
@@ -10,10 +10,10 @@ ideal for firewalled environments. \
 HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=71d15c2fb22f43e1a380f3f799ebde30"
+LIC_FILES_CHKSUM = "file://COPYING;md5=924958cefc9f7de3e0b818832b8a1cec"
 
 # util-linux added to get libuuid
-DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native"
+DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native curl"
 
 SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
            file://syslog-ng.conf.systemd \
@@ -26,7 +26,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
 "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "c16eafe447191c079f471846182876b7919d3d789af8c1f9fe55ab14521ceb2c"
+SRC_URI[sha256sum] = "b69e3360dfb96a754a4e1cbead4daef37128b1152a23572356db4ab64a475d4f"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-- 
2.25.1


