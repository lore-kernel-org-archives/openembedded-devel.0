Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 21FBB781DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:39:40 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v7SGaDDk019512; Mon, 28 Aug 2017 11:39:41 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2cmfkeksmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 28 Aug 2017 11:39:41 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod2.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v7SGdeu1011860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2017 11:39:40 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 28 Aug 2017 11:39:40 -0500
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 28 Aug 2017 11:39:39 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <martin.jansa@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Aug 2017 19:39:36 +0300
Message-ID: <20170828163937.29460-2-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170828163937.29460-1-adrian.ratiu@ni.com>
References: <20170828163937.29460-1-adrian.ratiu@ni.com>
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
Subject: [meta-oe][PATCH 2/3] system-setup-keyboard: unblacklist recipe
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

It's dependency got fixed by commit 7f502e72397b0
(system-config-keyboard: fix depends to work correctly with RSS)

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../system-setup-keyboard/system-setup-keyboard_0.8.8.bb                | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
index 0bd7af734..fbbfa3dd8 100644
--- a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
+++ b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
@@ -29,5 +29,3 @@ do_install() {
 }
 
 FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
-
-PNBLACKLIST[system-setup-keyboard] ?= "Depends on blacklisted system-config-keyboard-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.14.1


