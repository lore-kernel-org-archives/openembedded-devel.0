Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88441D2E9C7
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 09:07:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.55339.1731316021629506934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Nov 2024 01:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10456d5a36=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB5bZ6R032387
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 09:07:00 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42sxq8hpaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 09:07:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 01:06:59 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 01:06:58 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [meta-oe][scarthgap][PATCH] libdev-checklib-perl: fix do_fetch error
Date: Mon, 11 Nov 2024 18:04:37 +0800
Message-ID: <20241111100437.3873702-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: e2zhY46Kufn2_HEPJlvRldfPRlirqGUg
X-Proofpoint-ORIG-GUID: e2zhY46Kufn2_HEPJlvRldfPRlirqGUg
X-Authority-Analysis: v=2.4 cv=Z+m+H2RA c=1 sm=1 tr=0 ts=6731c934 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=wyjpycHzAAAA:8 a=G-axfLThCGkl4GXj2LMA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ROKTiUA5NBresHysc1Cf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_06,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411110077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 09:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113788

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: libdev-checklib-perl-native-1.16-r0 do_fetch: Failed to fetch URL https://cpan.metacpan.org/modules/by-module/Devel/Devel-CheckLib-1.16.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
index 74a09e7bf8..bda1771ca7 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.16.bb
@@ -8,7 +8,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;md5=7911cdbb572d25c5f2e2ea17f669efc2"
 
-SRC_URI = "https://cpan.metacpan.org/modules/by-module/Devel/Devel-CheckLib-${PV}.tar.gz \
+SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MATTN/Devel-CheckLib-${PV}.tar.gz \
            file://0001-CheckLib.pm-don-t-execute-the-binary.patch \
 "
 SRC_URI[sha256sum] = "869d38c258e646dcef676609f0dd7ca90f085f56cf6fd7001b019a5d5b831fca"
-- 
2.25.1


