Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5495DC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 19:39:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55360.1723491538355379073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 12:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8954c110e7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C5Ww6T026329
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 12:38:57 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g020va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 12:38:57 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 12:38:56 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 12:38:56 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] liblinebreak: remove obsolete library
Date: Mon, 12 Aug 2024 15:38:56 -0400
Message-ID: <20240812193856.1435518-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -5KK0Wc7F3CfzQnKyLcY6wGHmAAEIYhz
X-Proofpoint-GUID: -5KK0Wc7F3CfzQnKyLcY6wGHmAAEIYhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120146
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 19:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111776

From: Randy MacLeod <Randy.MacLeod@windriver.com>

liblinebreak has no users in meta-oe or in the layer index:
   https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Aliblinebreak
so remove it.

The upstream is has not been maintained for some time:
   https://vimgadgets.sourceforge.net/liblinebreak/
and they say that liblinebreak has been superceded by libunibreak,
an equivalent library that works in more languages:
   https://vimgadgets.sourceforge.net/libunibreak/

Since there are no users of liblinebreak, libunibreak was not packaged.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../packagegroups/packagegroup-meta-oe.bb          |  1 -
 .../liblinebreak/liblinebreak_1.2.bb               | 14 --------------
 2 files changed, 15 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e11afcd4e..f9b3e742a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -816,7 +816,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     lockdev \
     logwarn \
     libjs-sizzle \
-    liblinebreak \
     mailcap \
     liboauth \
     mg \
diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
deleted file mode 100644
index 539b58bc5..000000000
--- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Liblinebreak is an implementation of the line breaking algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
-HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/"
-SECTION = "libs"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
-SRC_URI[md5sum] = "d18039259001ccb24b5dd4648c49c5ad"
-SRC_URI[sha256sum] = "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/vimgadgets/files/liblinebreak/"
-UPSTREAM_CHECK_REGEX = "${BPN}/(?P<pver>\d+(\.\d+)+)"
-
-inherit autotools
-- 
2.34.1


