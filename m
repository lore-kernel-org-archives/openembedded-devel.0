Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 79A0471AD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:39:22 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v8J7aeDw030071; Tue, 19 Sep 2017 02:39:22 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2d2xpgg747-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 19 Sep 2017 02:39:22 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v8J7dL9c027154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2017 02:39:21 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 19 Sep 2017 02:39:21 -0500
Received: from haris-ro.emea.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 19 Sep 2017 02:39:20 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-devel@lists.openembedded.org>, <flihp@twobit.us>
Date: Tue, 19 Sep 2017 10:39:32 +0300
Message-ID: <1505806772-29423-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1709190109
Cc: haris.okanovic@ni.com
Subject: [PATCH] tpm2-tools_git: Fix S (source dir) to match `destsuffix` of SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 07:39:23 -0000
Content-Type: text/plain

SRC_URI defines `destsuffix=tpm2.0-tools` which doesn't match
`S = "${WORKDIR}/${BPN}-${PV}"` defined by tpm2-tools.inc.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 recipes-tpm/tpm2-tools/tpm2-tools_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-tpm/tpm2-tools/tpm2-tools_git.bb b/recipes-tpm/tpm2-tools/tpm2-tools_git.bb
index be68a5f..dde9c84 100644
--- a/recipes-tpm/tpm2-tools/tpm2-tools_git.bb
+++ b/recipes-tpm/tpm2-tools/tpm2-tools_git.bb
@@ -7,6 +7,7 @@ SRCREV = "${AUTOREV}"
 PVBASE := "${PV}"
 PV = "${PVBASE}.${SRCPV}"
 
+S = "${WORKDIR}/tpm2.0-tools"
 SRC_URI = " \
     git://github.com/01org/tpm2.0-tools.git;protocol=git;branch=master;name=tpm2.0-tools;destsuffix=tpm2.0-tools \
 "
-- 
2.1.4


