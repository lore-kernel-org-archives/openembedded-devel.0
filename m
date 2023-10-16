Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3304CCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 09:06:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.113351.1697447167263085150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Oct 2023 02:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jmCxyBpi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8653b591a0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39G6QFWj030858
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 02:06:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Nfzgc
	jefdKeqVbJArz6WOpA3p3MEIIbNKPq9eO2xrBQ=; b=jmCxyBpiHOAC7pfaukrW/
	p49ZpSoMDJWt74oWnguuPy1tl7MVFLrEESvXRb3KPTH7CofIYMGZmvzQMu3eqwK6
	3+l2XiMwzej9qQe/El7snEVLIkPz2+tf3T+hkn9bjVyS5iTeyUaax3190eB2Q8Yg
	lUSnaDZO8yUYpedgDCu+yyNDJbYOe6nqcWaM+k3Zcq6EWmV+Mo8SoI8siAA2dRRV
	uERdNa3tv8cZp/Ry5sDtHsCKcMC6m5273qfZz0aliawa6pGsdBcNvu4gNXeSYNK5
	i2LnI/SW4g7n83e9euRMC7/UKiRqHkXscRHU1G+aVNRqNwi+TIuw6Ao2FSRlOgG1
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqtgfhegm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 02:06:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 02:06:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 02:06:05 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: Remove the buildpath
Date: Mon, 16 Oct 2023 17:06:04 +0800
Message-ID: <20231016090604.2306962-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qrg_Wbm5EQfv6olsfmADos3Ja_tT4-yq
X-Proofpoint-ORIG-GUID: qrg_Wbm5EQfv6olsfmADos3Ja_tT4-yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_02,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=835 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310160079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 09:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105542

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxsf.ko in package kernel-module-vboxsf-6.1.51-yocto-standard contains reference to TMPDIR [buildpaths]
  WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxguest.ko in package kernel-module-vboxguest-6.1.51-yocto-standard contains reference to TMPDIR [buildpaths]
  WARNING: vboxguestdrivers-7.0.10-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.1.51-yocto-standard/kernel/misc/vboxvideo.ko in package kernel-module-vboxvideo-6.1.51-yocto-standard contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
index 8e9013824..c478ac62e 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.10.bb
@@ -24,7 +24,7 @@ S:task-patch = "${WORKDIR}/${VBOX_NAME}"
 export VBOX_KBUILD_TARGET_ARCH="${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64="amd64"
 
-EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1"
+EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC="${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}""
 
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"
-- 
2.25.1


