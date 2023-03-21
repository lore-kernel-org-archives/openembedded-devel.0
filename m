Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA114C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 15:42:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16703.1679413349344395966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 08:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Sfts8HyM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2444f1a2c9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32LB03uT024185
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 15:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=CHTlvA+7IhUsiq83yM2xIRV8EbYB43/Y4fomKeeHpcM=;
 b=Sfts8HyM161lIXz7UZEVzeyeNma7OkLiB4zxuHuots7SfCgYSVUcpFByzO/NYC9KZ8Px
 1h1cTRvNio9ofnFsB+53LxXG7gGRoTCOP/AWgagk9/iuR+vxnTM2UvTtcU2Zo8KsKwjH
 6Sfg4NWaPCx0ateQ8ZHVk0Y3IAG6lOp5tNemkaCQxfDq4z3pOFWf/ZgGbmVJB1lJgGgO
 iL6/BJLTOfHGD1qf84GmFbvwQO1IxqdRLN+PHwT9RS1Ct+oYCRHgk7z8A9JAiMFtRSLC
 kb9Xt95X63jBgVjcc6xBXLZSZ4I4jVCpxLYxt4dhi6Cs4zjbh1AYki8KLC8QvHLddOrK YA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd2h3b8su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 15:42:28 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Tue, 21 Mar 2023 08:42:27 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Mar 2023 08:42:27 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] cmocka: update from 1.1.5+ to 1.1.7
Date: Tue, 21 Mar 2023 08:42:27 -0700
Message-ID: <20230321154227.2785985-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cEvSav0MsX7aNA7vMll8E0Prs-uuKQxy
X-Proofpoint-ORIG-GUID: cEvSav0MsX7aNA7vMll8E0Prs-uuKQxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303210123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 15:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101617

Switch the SRC_URI branch from master to stable-1.1

The 1.1.5 version was actually a bit ahead of that tag but
the ChangeLog comment for the two releases are:

Thu Feb 23 2023 Andreas Schneider <asn@cryptomilk.org>
    * cmocka version 1.1.7
    * Update ignore list for source tarball generation

Fri Feb 16 2023 Andreas Schneider <asn@cryptomilk.org>
    * cmocka version 1.1.6
    * Added new assert macros to compare 2 double given an epsilon
    * Added meson build system
    * Added header with version to TAP13 output
    * Fixed issues with MSVC
    * Fixed TAP output for skipped tests
    * Fixed issue with fail_msg
    * CMake generated configs for find_package(cmocka)
    * Documentation improvements

CMake still seems to be the default build tool based on Install.md
so use that rather than the shiny Meson system.

One test, test_cmockery, was added so now there are 23 passing ptests.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-test/cmocka/{cmocka_1.1.5.bb => cmocka_1.1.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/cmocka/{cmocka_1.1.5.bb => cmocka_1.1.7.bb} (95%)

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
similarity index 95%
rename from meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
rename to meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
index 554d582a5..308d5ca1f 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
@@ -6,9 +6,9 @@ HOMEPAGE = "https://cmocka.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "a4fc3dd7705c277e3a57432895e9852ea105dac9"
+SRCREV = "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
 PV .= "+git${SRCPV}"
-SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=master \
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1 \
            file://run-ptest \
           "
 
-- 
2.39.0


