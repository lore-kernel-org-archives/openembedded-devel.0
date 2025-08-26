Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6509DCA0FF4
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 04:20:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.56957.1756182036038601930
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 21:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R9xZVqat;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0333471bfd=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q3iAUk759609;
	Tue, 26 Aug 2025 04:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=n5gImtZQ7S5t2i9g2ooHKXkS5L7cjR6lUxHXXcFhQbI=; b=R9xZVqati7hv
	3tRmU697CE1hO0w+8zuquC2Q+twzo90e//3pG2KJ6o4ZBTo9IdLxDywkXGS9FawC
	NXjLWlu7dafgm38KJqPE+dHcxcHaNu4RZAk+oz7XGUHTpHdl80r43fHIC506038f
	oa6yLh1/IBbB7W10epEMG5hVavUSsVLTc2NGoHqmqBrhy3uY4AQJn+gg3oW719Iv
	BxzJFhtpq/p8okzb7PTkPQBiVBTzvS6QqOfS7nlEmgfBTKlgps9zXSFq7QzrVHRT
	119y5ndAtob7DIwOcjGKP2nPwcPWzCOyfxK1xeun1Z11zcVl+1PzEpFJa3GF4k0P
	hcoWVmeC4A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q4m3tmuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Aug 2025 04:20:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 21:20:32 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 21:20:31 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [PATCH v2] softhsm: switch source to GitHub repository
Date: Tue, 26 Aug 2025 12:20:29 +0800
Message-ID: <20250826042029.1612164-2-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826042029.1612164-1-jiaying.song.cn@windriver.com>
References: <20250826042029.1612164-1-jiaying.song.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAzNCBTYWx0ZWRfX6KPFCEv1vJyk
 81UuuHm2fuhzlUsSIP94w2At4Gz1KVaD3FOWMPW6i0PNGj5Hfz9b6p+1aOqssXZjjBuz8gWXogN
 yXFTO0dQaQClfzSVO/F03ap7nw2s02IvvjeLMqH22JQ7G3CE8vn2uyjPXfVMkvvNGIUSmvNB3E3
 gXpc2p66zfflT0R3I2MUrghZ+F24s3PtvU2OgXMf2gFYL8wdecXGN1Z8nZ8vVXIQBurEYyQz544
 wq4B3rZwBL+op4qQo883GxdNCxAVS3vFDg02+aUXQ4dUcFzelSdPukzUrlG/HFkxcnthMZctOSy
 K6x7WYLqrGtYwfkxd/xOO9Kf+a/j3WRw+YTfGmJNA99mgIRdPM6oh6O7PmeAAM=
X-Proofpoint-ORIG-GUID: 5QqiNAAbnfrfKwWNhOe_z1KbgrjYH3w-
X-Proofpoint-GUID: 5QqiNAAbnfrfKwWNhOe_z1KbgrjYH3w-
X-Authority-Analysis: v=2.4 cv=CcwI5Krl c=1 sm=1 tr=0 ts=68ad3611 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=TUjdwidjAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=ZlsDwdhJwEkaTQdksU8A:9 a=XBCfRPmKWXHXM36ql9fg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 04:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119108

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


