Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B179CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 05:56:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7248.1758174978400951692
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 22:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LpbAlvwQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13560e645f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I4eRh62871560
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/KQZHBjaVNwFBOCi0Kj8
	Twta2E660gMIA4E8+Vfarm0=; b=LpbAlvwQXyMNDgl5fMgpw24AawfAVdgOs3Zr
	/rl4H7x+JNmD5lYVOqADY0vtObzdH1+vxqqXD7Bo2UW14QhEUR1I8xm8wr4Cyk0f
	3La4mzzKDMau6fienYWJ/2ZC5eNYFfDHwnOvXg+39rMz4Uz9W6S+pblmLngOHLaK
	v17GEUnZTSxxyTOwHt/qye3hCXP4phX2DkbRlw0k23EqhvGvlr8QHUFwmfrls52x
	582QYULPaEBMT5FKL8mYbCu5J5q4uYSiOMhKpX3PAsyzmEvC9Gvu24Vr3A7o0G2z
	27IMCZaDLLHbR3xdoD+aKdJhQ2nlcKU8oB4ypom3uz31eVgF5Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwrspfs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:56:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 22:56:16 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 17 Sep 2025 22:56:15 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] webkitgtk3: Fix a typo OFFF -> OFF
Date: Thu, 18 Sep 2025 13:56:14 +0800
Message-ID: <20250918055614.2556357-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EFEvn7lZSsioRmJlFrmd0DgHuz3xsT6y
X-Authority-Analysis: v=2.4 cv=Sdr3duRu c=1 sm=1 tr=0 ts=68cb9f01 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=T_9fnUzjbIAgbDBu-YUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA1MSBTYWx0ZWRfX5XEvv0fT5KB4
 eELhs9BUKN8t9KaPrWUMRCgBehChRHiQc7ZEsn7c3aakc2TDHZZbfHOqDsJr3bzno9Gy37fN3Qd
 nlhQwb3jt0jk4VkBLXmX6EczMui+PrAx5H2Fi6YmZ96aZdIzPAYQvO+bZmKgiLs304L3rBTPKfV
 f/CPiZj1nO57I8jNgpkYk/HzJs3623FGl+uV9hV7fjIGFXO0ERX1m/F20qBP12ndA5iqv8UZh9W
 FV08arSbllfOHhjvQEpAAoojbV4c3qzDUjNy7karlgn9+yiGfqlirTTHSx3Rvcyeg0/VmQh26ta
 oyEzLCam/LLYCF2bkiB3c/WlQEn+kiaCRI3oHj6iLDN8lQHxaF9laorREtzK/E=
X-Proofpoint-GUID: EFEvn7lZSsioRmJlFrmd0DgHuz3xsT6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119523

From: Jiaying Song <jiaying.song.cn@windriver.com>

The CMake option for disabling always_inline hints in debug build was
misspelled as OFFF. This patch corrects it to OFF.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
index b4f7518620..b848008910 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
@@ -99,7 +99,7 @@ EXTRA_OECMAKE = " \
 	-DUSE_GTK4=OFF \
 	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-        ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} \
+        ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
 	-DENABLE_MINIBROWSER=ON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
 		"
-- 
2.34.1


