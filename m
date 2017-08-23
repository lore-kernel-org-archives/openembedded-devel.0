Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 843F66E672
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 16:02:29 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7NFu7Wk013232; Wed, 23 Aug 2017 11:02:30 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2chcrj819c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 23 Aug 2017 11:02:30 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v7NG2T5O024365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2017 11:02:29 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 23 Aug 2017 11:02:29 -0500
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 23 Aug 2017 11:02:28 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <martin.jansa@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Aug 2017 19:02:27 +0300
Message-ID: <20170823160227.26159-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1708230240
Subject: [meta-oe][PATCH] xorg-fonts-100dpi: unblacklist recipe
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
X-List-Received-Date: Wed, 23 Aug 2017 16:02:30 -0000
Content-Type: text/plain

All dependencies have been fixed by the following commits:

b3d7a464c font-adobe-100dpi: update depends to fix builds with RSS
8de29d274 font-bh-100dpi: update depends to fix builds with RSS
bac94456a font-adobe-utopia-100dpi: update depends to fix builds with RSS
5fecd31c6 font-bh-lucidatypewriter-100dpi: update depends to fix builds with RSS

Unblacklist it so it won't get auto-deleted in about a week when the
2.4 dev cycle starts.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index fcf68262c..45e3f7b59 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -12,13 +12,3 @@ RDEPENDS_${PN} = "\
     font-bh-lucidatypewriter-100dpi \
     font-bitstream-100dpi \
 "
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted xorg-fonts-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-utopia-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.14.1


