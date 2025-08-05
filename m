Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F99C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 11:04:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19169.1754391858735066607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 04:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03128fa20b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5755qDn54109335
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Aug 2025 04:04:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489dy12gtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 04:04:18 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 5 Aug 2025 04:04:17 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 5 Aug 2025 04:04:16 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH] softhsm: switch source to GitHub repository
Date: Tue, 5 Aug 2025 19:04:16 +0800
Message-ID: <20250805110416.3115735-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Dx7K_twNODzn0xAKT-szK5NHM-uCBSL6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA4MCBTYWx0ZWRfX96hoCx+Rg3BT
 vjfriEyYCXop/gxvAbSfoA//W+ALe6NZk1BbzuNPPo4W2wKEpjv9z1s8Ly8I6/KsabM6+RTwRd4
 vNdMiriA7fiv2535+3hBOZ6g+0/sQhCyfIshs3ct3c61kwqouDnyvdxxjAuw/5i5e6LkcUm70/Z
 9ZXTzkW9/Ar5waP9aN95lx9YzJ+FPdcdY3PhXA3eu9TPxTDJfaoNW4pupVKVu4walT4neCrMY1A
 eiYWMCZbbqlEzN+6oxIpyHPspPPpuXD0F5pdMf3DjLAQBz3YQYr7fFuQWgUAohg7vWW3y3TgNhG
 hp9irzZ5qT5VHn1jQLEPuuR4/CrH9O3bwgKTTZPoiDuze7qZwII+PC2kSDmgxfXhl094P3jl9Vi
 jVbHNvGp
X-Proofpoint-GUID: Dx7K_twNODzn0xAKT-szK5NHM-uCBSL6
X-Authority-Analysis: v=2.4 cv=LtOSymdc c=1 sm=1 tr=0 ts=6891e532 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=TUjdwidjAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=wPLx-hkjEP7Tmftl22oA:9 a=XBCfRPmKWXHXM36ql9fg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 11:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118881

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


