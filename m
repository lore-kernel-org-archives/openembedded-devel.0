Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED17C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 07:29:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16613.1754378964793996291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 00:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03128fa20b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5755V91g125172
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Aug 2025 00:29:24 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489j6gt81t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 00:29:24 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 5 Aug 2025 00:29:23 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 5 Aug 2025 00:29:23 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH] logcheck: correct the SRC_URI
Date: Tue, 5 Aug 2025 15:29:22 +0800
Message-ID: <20250805072922.2433045-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d5n1yQjE c=1 sm=1 tr=0 ts=6891b2d4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=any1U0a9AAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8
 a=sgloKSfiJ8h4_L10iagA:9 a=60uXiyMm-41XKgWTl_BI:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tMiyl9Eva457bSy3EIdegPqjy-giRN1x
X-Proofpoint-ORIG-GUID: tMiyl9Eva457bSy3EIdegPqjy-giRN1x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA1MyBTYWx0ZWRfX+T87p5DCtSOs
 rNHZw+bbLnSzqNEy98qD820hvDoxY7I5262BakkKBZqhp9cqVzE7FJYrMPqPAJNNW50osCrIic7
 u0jt1/LLemNiU6lZcgV3DljQjWvq3vwUEaEUnl7ItF9GVZjSS0pE3e21+DaeWM54h/EkbBFRF0t
 QM9bK1kRanAuI/bWJAMDSYwmUr1wVTSXs21F7fCXDmT/mdy0qoQsEYETpWCLJ+u0ixlPWyb5IOn
 UAuhOs1ej+SRyxnAM4i9bNVwdFc7PUNQDR1Vdjpkl0GIKpWd7nkwTiHro4ZX05s6bqYetvFXE7I
 6QJMySAyHo3mnJhRhAflg2NxbjfuVWOX9DJd++HZyXzENtiZZyjdTLXTt0xjhHDnfxUuGyHgjs4
 g9wObP1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 07:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118877

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL is no longer valid, as it has been moved to an
archive location. This update points to the new location.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
index 037852392f..f00d78fef4 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.4.3.bb
@@ -11,7 +11,7 @@ HOMEPAGE = "http://logcheck.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://snapshot.debian.org/archive/debian/20230718T155737Z/pool/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
 SRC_URI[sha256sum] = "ad83ae80bd780bdae5eefd40ad59a3e97b85ad3a4962aa7c00d98ed3bdffcdd0"
-- 
2.34.1


