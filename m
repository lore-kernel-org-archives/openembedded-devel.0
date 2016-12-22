Return-Path: <bogdan.hopulele@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5168177590
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:49:12 +0000 (UTC)
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBM9nDsb022403
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2016 03:49:13 -0600
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Dec 2016 03:49:13 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Dec 2016 03:49:12 -0600
Received: from bogdan-arch64.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 22 Dec 2016 03:49:12 -0600
From: Bogdan Hopulele <bogdan.hopulele@ni.com>
To: <martin.jansa@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Dec 2016 09:49:11 +0000
Message-ID: <20161222094911.1103-1-bogdan.hopulele@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-22_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612220167
Subject: [meta-oe][PATCH] cryptsetup: Add kernel-module-xts to RRECOMMENDS
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
X-List-Received-Date: Thu, 22 Dec 2016 09:49:14 -0000
Content-Type: text/plain

cryptsetup luksOpen (luksFormat) uses xts by default.
When the module is not installed, cryptsetup prints:

Check that kernel supports aes-xts-plain64 cipher (check syslog for more info)

Signed-off-by: Bogdan Hopulele <bogdan.hopulele@ni.com>
---
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
index d160a0932..d560625db 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
@@ -28,6 +28,7 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
                      kernel-module-md5 \
                      kernel-module-cbc \
                      kernel-module-sha256-generic \
+                     kernel-module-xts \
 "
 
 EXTRA_OECONF = "--enable-static"
-- 
2.11.0


