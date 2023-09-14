Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F8BEE021F
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 03:22:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4184.1694661752751474237
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 20:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CBUX9ohb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76213d3f08=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E1nvX9006806
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 03:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=q1Kwj
	rPsb28lP8VuFkSmRuFAdZwQi9dfGas8OStrHCg=; b=CBUX9ohbHtXJkFOdh0SEW
	BfOrL+nCnP5FlsHjKMiTeKq7xC+IIFj7wKL9y4Vyw92n7TrjRWrT4bcKisuxgc8C
	MJIYFiooj8RV9Mpqj/Vex8GvhYTwKBo8NyVGlTCwoYi8lWzVylXD/17lSyHufJyJ
	NiT7H16Jq4MHPvMudh6vMWIpu+O/4G5fjBoulqecK6xP5RNzQB0fxX0sonigFEz2
	h/U1CsAmEFn79zgCjRgNaiQNXDmN0gKh7cgYbm11nwIGbbXWac1btGhgsJ91dAwX
	kvUDcJIUVfvTxH0pZKGUJOhpR93k26gsMswhO47235lFiwLD2v90qUouQ0bmmrnR
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8m9cbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 03:22:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 20:22:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 20:22:29 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ostree: not compatible with riscv32 when ptest enabled
Date: Thu, 14 Sep 2023 11:22:25 +0800
Message-ID: <20230914032225.496168-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3kDRDzlpRAquGTA-MkzlRrDuASch02pN
X-Proofpoint-GUID: 3kDRDzlpRAquGTA-MkzlRrDuASch02pN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_19,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=754 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 03:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104862

From: Kai Kang <kai.kang@windriver.com>

ostree-ptest rdepends on strace which is not compatible with riscv32. So
when ptest is enabled, set ostree not compatible with riscv32.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-extended/ostree/ostree_2023.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.5.bb b/meta-oe/recipes-extended/ostree/ostree_2023.5.bb
index 3028c4c92..bc465dd62 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.5.bb
@@ -28,6 +28,8 @@ S = "${WORKDIR}/libostree-${PV}"
 
 inherit autotools bash-completion gobject-introspection github-releases gtk-doc manpages pkgconfig ptest-gnome systemd
 
+COMPATIBLE_HOST:riscv32 = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'null', 'riscv32', d)}"
+
 UNKNOWN_CONFIGURE_OPT_IGNORE = "--disable-introspection --enable-introspection"
 
 # Workaround compile failure:
-- 
2.34.1


