Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF4CD548C
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:39:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2335.1695109160869796556
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Kx52F6uY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7626e63108=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38J6aL1H009188
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=NCCRa
	6S/QWkmVIYXD4wJNA7z6Q44K28Cw8q/1SVT13c=; b=Kx52F6uYe90lXTiMe1Ayn
	oJjsvFtmUYHG9gWhm2HnZB5Bv+JkES7ZnbxxACclHnPu6J4bZt2yeyhf4VweR81o
	Q9tmeTt4azkee+KIWMskooarFldX4G+nz5axeTC/ZIBnwRdR274uDokdssau3wsW
	dzHTB8T2msczgnTMw5ZSFijcow8EvNhju2hhz4E3P75kdRULcNocca46LsFjN/6u
	qSgBybmCmzEeepb6ZNZZXipfVI7FYUzaaFPkEjLjjacQEW6DuNvzFJ1G+vQU+6Cf
	uhrfj0IZHSWl7U8pnzr1X/xU3WOgvjs15/mXJf4VThjHUm2wRRE1asyPZXjxNcPB
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t53b5t6h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:39:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 19 Sep 2023 00:39:18 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 00:39:17 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] vlock: Use EXTRA_CFLAGS
Date: Tue, 19 Sep 2023 15:39:17 +0800
Message-ID: <20230919073917.2626293-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: owLmNtlr5LhD-91O5HUs3FywzRXy-Qd0
X-Proofpoint-ORIG-GUID: owLmNtlr5LhD-91O5HUs3FywzRXy-Qd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_01,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=546
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309190062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104974

From: Mingli Yu <mingli.yu@windriver.com>

The CFLAGS is hardcoded as DEFAULT_CFLAGS or DEBUG_CFLAGS in configure
script, so use EXTRA_CFLAGS to make sure -fdebug-prefix-map option passed
to compiler and also need to put EXTRA_CFLAGS configure option after debug
option to avoid the CFLAGS overrided by DEBUG_CFLAGS when debug enabled to
fix the below warning:
  WARNING: vlock-2.2.3-r0 do_package_qa: QA Issue: File /usr/lib64/vlock/modules/.debug/new.so in package vlock-dbg contains reference to TMPDIR
  File /usr/lib64/vlock/modules/.debug/ttyblank.so in package vlock-dbg contains reference to TMPDIR
  File /usr/lib64/vlock/modules/.debug/vesablank.so in package vlock-dbg contains reference to TMPDIR
  File /usr/lib64/vlock/modules/.debug/all.so in package vlock-dbg contains reference to TMPDIR
  File /usr/lib64/vlock/modules/.debug/nosysrq.so in package vlock-dbg contains reference to TMPDIR
  File /usr/sbin/.debug/vlock-main in package vlock-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
index a37404193..455bda1d7 100644
--- a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -37,13 +37,13 @@ do_configure () {
         VLOCK_GROUP=root \
         ROOT_GROUP=root \
         CC="${CC}" \
-        CFLAGS="${CFLAGS}" \
         LDFLAGS="${LDFLAGS}" \
         --prefix=${prefix} \
         --libdir=${libdir} \
         --mandir=${mandir} \
         --with-modules="all.so new.so nosysrq.so ttyblank.so vesablank.so" \
         --disable-root-password --enable-debug --disable-fail-count \
+        EXTRA_CFLAGS="${CFLAGS}" \
         ${PACKAGECONFIG_CONFARGS}
 }
 
-- 
2.25.1


