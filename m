Return-Path: <bogdan.hopulele@ni.com>
X-Greylist: delayed 1985 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Dec 2016 14:54:43 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD43571D99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:54:43 +0000 (UTC)
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBKELdE3000796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 08:21:39 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Dec 2016 08:21:39 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Dec 2016 08:21:38 -0600
Received: from bogdan-arch64.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 20 Dec 2016 08:21:38 -0600
From: Bogdan Hopulele <bogdan.hopulele@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Dec 2016 14:21:37 +0000
Message-ID: <20161220142137.20922-1-bogdan.hopulele@ni.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612200178
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
X-List-Received-Date: Tue, 20 Dec 2016 14:54:46 -0000
Content-Type: text/plain

cryptsetup luksOpen (luksFormat) uses xts by default.
When the module is not installed, cryptsetup prints:

Check that kernel supports aes-xts-plain64 cipher (check syslog for more info)

Signed-off-by: Bogdan Hopulele <bogdan.hopulele@ni.com>
---
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
index 16c21d3..3470c5d 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.0.bb
@@ -28,6 +28,7 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
                      kernel-module-md5 \
                      kernel-module-cbc \
                      kernel-module-sha256-generic \
+                     kernel-module-xts \
 "
 
 EXTRA_OECONF = "--enable-static"
-- 
2.10.2


