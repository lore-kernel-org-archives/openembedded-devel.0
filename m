Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69335C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 06:56:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16631.1703055411279813827
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 22:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s9TTEO1b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0718925310=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BK6ks7n003689
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 22:56:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=A0roh
	g4dQ7zF2c/HTGih7AGtkUaqyBmW3Bv95xK+g8c=; b=s9TTEO1b3VmDC43YCwFDQ
	Gli3eaqoLNphp2Z4d7btM6rH+5aBICiaKOHIxlDORfC70leJgMa1pehfia6THGTd
	MvUFfnP//f8lYi1bNW+MkLpa0L7d+PSrpteLeODcH75VarI3uhBlTb/+h5v8Vtsa
	JT5sqSoRqTclrYaPYg+Gs2pKyEl8X+i3sKG0qXuTggvs0len5P34Vr+A4+IVmVlG
	vDeTEp/RiL+icO70pvclwCW/j3oF60+jW1PtGMtp96CpP5aexYXWunljtH2AR2/A
	qMOIsUO06pmGXoWZDT0I71CnjrvqlYm6850F2FXsvSPDdosmTl2ifDKOBxEukkrg
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1824kwp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 22:56:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 22:56:56 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 22:56:55 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] tk: Remove buildpath issue
Date: Wed, 20 Dec 2023 14:56:48 +0800
Message-ID: <20231220065648.3032297-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: q_qgvalSwdQwQ7Hv4a1_MD3yppvPXG91
X-Proofpoint-GUID: q_qgvalSwdQwQ7Hv4a1_MD3yppvPXG91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=519 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107645

From: Mingli Yu <mingli.yu@windriver.com>

Though the S defined as ${WORKDIR}/${BPN}${PV}/unix, but some source
files come from such as ${WORKDIR}/${BPN}${PV}/unix/../generic, so add
"-fdebug-prefix-map=${S}/../" to fix the below buildpath issue:
  WARNING: tk-8.6.10-r0 do_package_qa: QA Issue: File /usr/lib64/.debug/libtk8.6.so in package tk-dbg contains reference to TMPDIR
  File /usr/bin/.debug/wish8.6 in package tk-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
index f3cab4e61..237c4e738 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
@@ -28,6 +28,8 @@ SRC_URI[sha256sum] = "63df418a859d0a463347f95ded5cd88a3dd3aaa1ceecaeee362194bc30
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${S}/../=${TARGET_DBGSRC_DIR}/.."
+
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 
 # Short version format: "8.6"
-- 
2.25.1


