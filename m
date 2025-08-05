Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72072C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 08:50:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17163.1754383838743100551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 01:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03128fa20b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 57567aZa4134199
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Aug 2025 01:50:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489dy12dtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 01:50:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 5 Aug 2025 01:50:37 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 5 Aug 2025 01:50:36 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH] libconfig: switch source to GitHub repository
Date: Tue, 5 Aug 2025 16:50:36 +0800
Message-ID: <20250805085036.3073559-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wPzvqLKFuSwGydrl0VTBG3TWlM7Qvig1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA2MyBTYWx0ZWRfX3/WUwYYeaMWn
 ELEXVEv0LvS94o7t6S2j+x/DKAURb7Xj+xylznBkI3Zy6eniiawAF/1+ES59+rOjsLjjr8rDokD
 YDFhoOf9nTig+GRhfqmlfho9QQWqrtqMtHqlnA5m2LV6H5rERazUMYKGAqrVigNwftcs8uB/uDU
 db1yGdj9cm1l/E6mrgQpflPxQ6pTDQe3m8UXnee0oclbzxmdM//OgzmzIB7VmvbUfj9FRJy68vq
 b6scWfMNXItdfqT6GPYVZrwit1ss/phohgaVrespw6lfTmKQMh7T0lEp9Xue2+cZML714qhHxVA
 ZwmJEY+qJCH0I6NhzKaecQCrg3qlm3BRYmEV89qdkiOZRGNn3OAdtz4h2m8aHf9Uo9tO86zhz4d
 +3KDZ/pF
X-Proofpoint-GUID: wPzvqLKFuSwGydrl0VTBG3TWlM7Qvig1
X-Authority-Analysis: v=2.4 cv=LtOSymdc c=1 sm=1 tr=0 ts=6891c5de cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=jn5mJRsBAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=EqJmOwNUkXt9ClG8XrMA:9 a=0flEoihKdI8QF1_aUImP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 08:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118879

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL no longer provides version 1.7.3 or any other
historical releases.To ensure reproducible builds, the source has been
switched to the official GitHub repository.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index a4df707dd7..ace2698fa4 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -7,9 +7,11 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz \
+SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master \
     file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
 "
+SRCREV = "525922a6b49ca19235cdf307376e7c9c539d1b93"
+S = "${WORKDIR}/git"
 
 # needed when we modify grammar.y with above patch
 DEPENDS += "bison-native"
@@ -19,7 +21,5 @@ UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[sha256sum] = "545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7"
-
 PACKAGE_BEFORE_PN = "${PN}++"
 FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"
-- 
2.34.1


