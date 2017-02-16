Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id CF7B9730BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 11:31:46 +0000 (UTC)
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v1GBVkTd031205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 05:31:46 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 16 Feb 2017 05:31:45 -0600
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 16 Feb 2017 05:31:45 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 13:29:51 +0200
Message-ID: <20170216112951.6961-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-02-16_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1702160116
Subject: [meta-python][PATCH] python-pyconnman: rdepend on connman
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
X-List-Received-Date: Thu, 16 Feb 2017 11:31:48 -0000
Content-Type: text/plain

Having pyconnman installed without connman is useless, so make sure
it's pulled at runtime. Connman can also be installed via a 'base'
image packagegroup, but let's also add it to rdepend to be safe.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
index 6eeab7e47..4d76cc536 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
@@ -11,4 +11,4 @@ PYPI_PACKAGE = "pyconnman"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-dbus python-pprint"
\ No newline at end of file
+RDEPENDS_${PN} = "connman python-dbus python-pprint"
-- 
2.11.1


