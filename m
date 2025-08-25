Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282EECA0EED
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 07:45:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34014.1756107914393802792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 00:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N/P7S7q7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0332d1973f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57P5dS6Y2778014
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vNNiYEDM1Ng0ORBtSRO1
	Ag+WCYo1HjxccSVHBnG2CVg=; b=N/P7S7q7rSo8Q/nLtmJwH676TJQYB2+nIrXA
	yaw93PZDXEmQudCiIzSRNuaTRbBQQddHcRWesHbNjjA/xhrveYK+3W/7/pn2zPLK
	gbUk4c87jZHsz7q7L5ehxjpH8wSSvl52Z0E+IUnQd4qhYXcBHf68C3KoGKzV5/rC
	rJzN8t1/kSOaJ+m3baGAnbLyEkn6Ri/ch2C5hsiESStwpd9SKn5nDzNg25jhyB9K
	SuiV1NmmMlXCJko5fw4DhlJSUdraM8/O8MC7TdkOCx9oLv34tgORLscIrWqKARdY
	2ZNurT8kDqCc2tQoFMibR7BLTTWGfSnTJ2+Ufq+M8Geo9XUo9w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q4m3sjgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:45:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 00:45:11 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 00:45:10 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-perl][PATCH] logcheck: correct the SRC_URI
Date: Mon, 25 Aug 2025 15:45:10 +0800
Message-ID: <20250825074510.2942550-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDA2OCBTYWx0ZWRfX6eMuxTUIKBbb
 siRtK3HlBZipOg4rWqscbk87zJfjAAUKOHcAsP7qgnj7Z88Mh7DI7eEr76u1Zl3a/ytelb6C/nO
 UNJTWR4b18nKWu27aDN2XTaitxJQwC/aWUcgqElGAaygsmike1tslLIcoc0ShP2hlGlyI8scy/p
 EcXzzseW4oVLQxqr3zcdnCFa2PcrYje0MKaya64tq6nGfseqRsH4E9DrTnztOlo8S2EhOO96dDh
 sIlJrg5KYJa30LJBMxNEBpwBhQlRsN92HH9ub5xX8RIdVxBOvmzOXYnh9ua3PSSYcTvJg/YvnwD
 MIHGx3e/K9UEdQhT08MvzgPghjxJBWUD3OW/6SSFI+6nXoRYfneikAmDsKBbEA=
X-Proofpoint-ORIG-GUID: h-lqGycJwLA3QHAs8OYiW2zXvK3vRpOc
X-Proofpoint-GUID: h-lqGycJwLA3QHAs8OYiW2zXvK3vRpOc
X-Authority-Analysis: v=2.4 cv=CcwI5Krl c=1 sm=1 tr=0 ts=68ac1489 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=any1U0a9AAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8
 a=sgloKSfiJ8h4_L10iagA:9 a=60uXiyMm-41XKgWTl_BI:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 07:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119091

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


