Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76E9CD128A
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 20:25:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.149410.1712694334350329999
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 13:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SfLqnOBs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=482968419c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4394dGxY000614
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Apr 2024 13:25:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=sp707wm3XOiqExlZMXQnTT5unmu1N0eZxLzOW0OCp98=; b=
	SfLqnOBsl5R8qOmr9nhHTSJNd9XGEpewCKpcUjLqOdnkIUV+2NIMz8hCCPFyPHLX
	4xbINSU4w89/KV3OEDnWPHoLy7/200B8HmCVjw23n96NpbUSvE+Sy2h2gdNjAagl
	ydWSiRMhqdZkTnXtDSp1QkOQRqvw9XeSiCoN0t3rAgXFC/XXNAUIrge4ylEYafiP
	M9JMcNRiNsHlROgxZYe3lUDACeGbgWrs1SQ1GC7JMIbyFaAlah+WIYvS2YA2Zw47
	U0PrbvQ0yA6KLVm4HazrCoZAKgdcRcXFZF3PWsE/bX84IcxMiwGW9hAKKqhajPza
	QHo4mgk0Qw9u2PC1GYm2Yw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgjtp7-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 13:25:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 9 Apr 2024 13:25:32 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 9 Apr 2024 13:25:32 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 5/5] libmad: switch links/SRC_URI to https sites
Date: Tue, 9 Apr 2024 13:25:31 -0700
Message-ID: <20240409202531.1050101-6-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
References: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UL1lVqxUYXoaAIYaTPxV4hvGD9X00bjo
X-Proofpoint-ORIG-GUID: UL1lVqxUYXoaAIYaTPxV4hvGD9X00bjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404090137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 20:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109885

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Switch to the sourceforge SRC_URI since the mars.org site only supports ftp.
Also switch the HOMEPAGE and BUGTRACKER links over to https.
and drop the obsolete SRC_URI[md5sum].

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index d0171f3b9..e70c8e3ed 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -1,6 +1,6 @@
 SUMMARY = "MPEG Audio Decoder library"
-HOMEPAGE = "http://sourceforge.net/projects/mad/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
+HOMEPAGE = "https://sourceforge.net/projects/mad/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=12349&atid=112349"
 LICENSE = "GPL-2.0-or-later"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "libs"
 DEPENDS = "libid3tag"
 
-SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
+SRC_URI = "https://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz \
     file://no-force-mem.patch \
     file://add-pkgconfig.patch \
     file://fix_for_mips_with_gcc-4.5.0.patch \
@@ -19,7 +19,6 @@ SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
 "
 SRC_URI:append:toolchain-clang = " file://0004-Remove-clang-unsupported-compiler-flags.patch "
 
-SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
 SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
 
 S = "${WORKDIR}/libmad-${PV}"
-- 
2.43.0


