Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5E2CA0FF3
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 04:28:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.57021.1756182470170231035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 21:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cy6FZ1ma;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0333471bfd=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q3uDFa952162;
	Tue, 26 Aug 2025 04:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=n5gImtZQ7S5t2i9g2ooHKXkS5L7cjR6lUxHXXcFhQbI=; b=cy6FZ1maiLrF
	TNAbSL1du1IAz7WtcJ2ZjOcB47G3b60A8y5B8PraiyrvDfklC/GwaVqdHN1BROCk
	zKKDpVbDglaXzvsSyk7dSVNWZdx2m/vQN3CHzhAiXEM1MSYA38ZCA6j7UEBrv7G5
	+nHpVIGm+abum38t6F65GVFfsNzT5U8jUBRVDN96uqbTz2W8dXhtKY41hWOw7P8g
	5jZyYdHxE7cJDCnLMU+k9TWv0LLFFp2q1PlLpnW2KJUeNeEODM6kg8IiqemZRj/1
	HOuBXynXAOW1LMlP2igDAhNUvE99IrhDzmMvBocm7rzottajEfqBFb2O97zkzhKX
	HF6huolwvQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1aq2v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Aug 2025 04:27:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 21:27:48 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 21:27:47 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] softhsm: switch source to GitHub repository
Date: Tue, 26 Aug 2025 12:27:45 +0800
Message-ID: <20250826042745.1629517-2-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826042745.1629517-1-jiaying.song.cn@windriver.com>
References: <20250826042745.1629517-1-jiaying.song.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yqk9tKVvm3bMoGOUc13xfK3xcS7nonSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAzNCBTYWx0ZWRfX+TNSFBRMx/vs
 yHEqQZgqA6ogbm6fPW3d+XLvHk0BF71ICBETVNX80fUSgBIS9Gp9yj9eMwFUGjJqYleW8IdXVZw
 Aap3EuaQfr1yucdssPsU8ZmmuYdwSSAZnypIvUl8MQH80XkONbN47vI3OiW2Fgkt2y0es1Kgux2
 TuRiQoFaX78lHm66E+bznZUU7qvQ+gdN6kasE0iZgdHL02NykP10J+iILo+9jajZ7Dol3CGiD8o
 kN4Bnm1RI+wdp2dpaeyTyStgTrXg7gVmnBkvh5sleiha3ZVves3LczWiZVZ5lWlbWid/zk75Vnx
 lNqhfGewFRc/eo18p0sTQ8ynkWnPT6esduMyPB3hFT8FX0XkT9r54ebqjKNDLQ=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ad37c4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=TUjdwidjAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=ZlsDwdhJwEkaTQdksU8A:9 a=XBCfRPmKWXHXM36ql9fg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yqk9tKVvm3bMoGOUc13xfK3xcS7nonSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 04:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119111

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original source URL is unavailable, so it has been replaced with the
official GitHub repository.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 66f0488792..78766e0fe9 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
+SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=develop;tag=${PV} \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
            file://0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch \
 "
-SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
+SRCREV = "7f99bedae002f0dd04ceeb8d86d59fc4a68a69a0"
 
 inherit autotools pkgconfig siteinfo
 
-- 
2.34.1


