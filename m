Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00857C4167D
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 03:29:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23379.1698895781985492897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 20:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hVPiDWJd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9670e035af=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A22a5iu027885
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Nov 2023 20:29:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=kKFHd
	vqWsy4nPnSg2Thc9Yj12qkAQ9FgjEFcnOvc8EY=; b=hVPiDWJdABFdBMYcXjX41
	7ZFfGkgllQ4Y7wgt71CPHnKDh9pFxKK3eRrA2EUKlVq4y8iZSbBLqWegcQw8Ol0m
	w/LUaIsReTv/j06WCNDVbLQzLBLSG9rD+QMsujeZ8lkL7DD2Bs1D3VaXQMpEARh7
	Ko0EhczGLbeA6ZF17tOTZlRsB0w3TiOjx9kQc4FqQzUC5Sd5H4PgRG0B7HGkZw01
	OK8JRIVWSbGfPf0qCGMCUCOQaPlHhN8b57q98F+1CXDBIRvQo3XzVpAD5Bc8Q1Ei
	DmTg/do7bQOeAoFmViLg6hZNd1fUSlgfpzMwghKlV1G1kEDPCCzxPlekYrdbQYsX
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u434ag146-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 20:29:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 20:29:42 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 20:29:42 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] vboxguestdrivers: Remove the buildpath
Date: Thu, 2 Nov 2023 11:29:39 +0800
Message-ID: <20231102032939.3447809-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4jaBfc0R6s6nynRsbvnmSRDQOxq9O-Hy
X-Proofpoint-ORIG-GUID: 4jaBfc0R6s6nynRsbvnmSRDQOxq9O-Hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=744 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 03:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105830

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxsf.ko in package kernel-module-vboxsf-6.1.51-yocto-standard contains reference to TMPDIR [buildpaths]
  WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxguest.ko in package kernel-module-vboxguest-6.1.51-yocto-standard contains reference to TMPDIR [buildpaths]
  WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxvideo.ko in package kernel-module-vboxvideo-6.1.51-yocto-standard contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../vboxguestdrivers/vboxguestdrivers_7.0.10.bb                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
index 8e9013824..847458645 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
@@ -24,7 +24,8 @@ S:task-patch = "${WORKDIR}/${VBOX_NAME}"
 export VBOX_KBUILD_TARGET_ARCH="${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64="amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
+TOOLCHAIN = "gcc"
 
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"
-- 
2.25.1


