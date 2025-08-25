Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25793CA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 07:48:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33796.1756108089766681445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 00:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SvTDoUlE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0332d1973f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57P5xdMY2969446
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=C6CTMQX029Sl3tY1uELw
	/i6h+lpmIvnD0WHswTrIor0=; b=SvTDoUlEhXN89y3/558qJ6bqDVAbjjkCWcvL
	wjHM5pDlBV4GQFEqGJLLxWWtJ4ZR8PbwB4KuiUFpBr+V3wyvsLuBQO35bG1Vm+5J
	kPYdydsflL9tRQS6ao2jOaBd76eX5rUi956ZvffDdbUs1moXD00LYf95rpWuvXc6
	XTKkm004W7IoAifrvlkxm2ZxuyZ9V31EcBLgWDWEmjPfjJfL+7gCdCF/FMGMC2LO
	kWw9ZTPp87X/MIhJqDullTj9vAjyW/AzhFtHDH4TwqXJX46Xnq7owyeLFt6LUF4+
	Aoy7UNiRkfRVupoAQfoF9PyP5VQfKTP7N/Tvg7m2Kga03980fA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v19n4r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:48:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 00:48:07 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 00:48:07 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] softhsm: switch source to GitHub repository
Date: Mon, 25 Aug 2025 15:48:01 +0800
Message-ID: <20250825074801.2953407-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JnAEGx1l2gL2-EZZ8y5jL78fJcAY7byd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDA2OCBTYWx0ZWRfX8oownimmMbP6
 ZNqirmZ1WwfmaVDAc4uol9r08WD+Spb7Vp6DNpULjsyrSfiEV1ioHyH4QEhyObxO323OU61Q8Q+
 4R4xeo80BUM24kalDei30A6ax7kSr5nz5LIyT8Kdf7onmV7SRQTqzQZKrFk1YNQO94+6mqlm27/
 jJphrrUk9lJLH7VTKUw1ww/Kh6pVcPAtZvov5/7fRSxvNCri7cfoyPaCLSSi0gpP3VDdXXXVsO8
 xrsHL/c62xA2CBUFyNKg/rAxMK2I7YLGMfBd9aijZKlAsG4Fd/CSDBU7nulhPjDxQvk1fKYfm/1
 IAlr3Q332LHkmRoR98tE8eVeZe12gsrSwzNOur7xwmc6o8xqXeQfhMzMT73mZQ=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ac1538 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=TUjdwidjAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=wPLx-hkjEP7Tmftl22oA:9 a=XBCfRPmKWXHXM36ql9fg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JnAEGx1l2gL2-EZZ8y5jL78fJcAY7byd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119094

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original source URL is unavailable, so it has been replaced with the
official GitHub repository.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 66f0488792..11a05b8283 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,11 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
+SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=develop \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
            file://0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch \
 "
-SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
+SRCREV = "7f99bedae002f0dd04ceeb8d86d59fc4a68a69a0"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig siteinfo
 
-- 
2.34.1


