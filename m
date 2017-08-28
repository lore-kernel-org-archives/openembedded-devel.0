Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id E37FB781DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:39:39 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7SGa9Ku008542; Mon, 28 Aug 2017 11:39:40 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2cmjtpantq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Aug 2017 11:39:40 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v7SGddAF009287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2017 11:39:39 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 28 Aug 2017 11:39:39 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 28 Aug 2017 11:39:38 -0500
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 28 Aug 2017 11:39:38 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <martin.jansa@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Aug 2017 19:39:35 +0300
Message-ID: <20170828163937.29460-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1708280265
Subject: [meta-oe][PATCH 1/3] terminus-font: fix RSS breakage and unblacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Aug 2017 16:39:40 -0000
Content-Type: text/plain

Depend on bdftopcf-native to fix errors like:

| perl ./ucstoany.pl ter-u12b.bdf ISO8859 1 uni/x11gr.uni uni/ascii-h.uni uni/win-1252.uni | bdftopcf -o ter-112b.pcf
| /bin/sh: bdftopcf: command not found

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index 4c8399d7d..c460fc35c 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -8,7 +8,7 @@ SECTION = "fonts"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9cadb26f4c5c005618c5ae74f041ec54"
 
-DEPENDS = "hostperl-runtime-native gzip-native"
+DEPENDS = "hostperl-runtime-native gzip-native bdftopcf-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "a8e792fe6e84c86ed2b6ed3e2a12ba66"
@@ -43,5 +43,3 @@ PACKAGES += "${PN}-consolefonts ${PN}-consoletrans ${PN}-pcf"
 FILES_${PN}-consolefonts = "${datadir}/consolefonts"
 FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-pcf = "${datadir}/fonts/terminus"
-
-PNBLACKLIST[terminus-font] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130638/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.14.1


