Return-Path: <prvs=60446d21bb=alejandro.delcastillo@ni.com>
X-Greylist: delayed 10071 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 May 2019 19:01:40 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 78FA07E284
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 19:01:40 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4LG1OX1009853 for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 11:13:50 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2sky4f3pay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 11:13:50 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x4LGDnii020948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 11:13:49 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 21 May 2019 11:13:49 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 21 May 2019 11:13:49 -0500
Received: from delcastillo3.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Tue, 21 May 2019 11:13:49 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 May 2019 11:13:48 -0500
Message-ID: <20190521161348.20347-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-21_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-webserver][PATCH] apache2: add all extra/*.conf to conffiles
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
X-List-Received-Date: Tue, 21 May 2019 19:01:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
index 6642f2bda..87e41c20e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
@@ -152,7 +152,8 @@ PACKAGES = "${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
                    ${sysconfdir}/${BPN}/magic \
                    ${sysconfdir}/${BPN}/mime.types \
-                   ${sysconfdir}/init.d/${BPN} "
+                   ${sysconfdir}/${BPN}/extra/* \
+                   ${sysconfdir}/init.d/${BPN}"
 
 # we override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
-- 
2.21.0


