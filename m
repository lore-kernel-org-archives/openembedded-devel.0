Return-Path: <prvs=604521429f=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 32EF179CE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:51:38 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4MGkZGa006897 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 11:51:39 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2smewsvv1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 11:51:39 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x4MGpcEF018918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 11:51:38 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 22 May 2019 11:51:37 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 22 May 2019 11:51:37 -0500
Received: from delcastillo3.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 22 May 2019 11:51:37 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 May 2019 11:51:26 -0500
Message-ID: <20190522165126.20958-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAMKF1spQMMOoKqt0zD1MwBnX3D8MF4PPjO=1eBe_y5RKGdWZTQ@mail.gmail.com>
References: <CAMKF1spQMMOoKqt0zD1MwBnX3D8MF4PPjO=1eBe_y5RKGdWZTQ@mail.gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-22_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-webserver][PATCH v2] apache2: add all extra/*.conf to conffiles
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
X-List-Received-Date: Wed, 22 May 2019 16:51:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index 4cdf36ca5..da96086e4 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -181,7 +181,8 @@ PACKAGES = "${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 
 CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
                    ${sysconfdir}/${BPN}/magic \
-                   ${sysconfdir}/${BPN}/mime.types"
+                   ${sysconfdir}/${BPN}/mime.types \
+                   ${sysconfdir}/${BPN}/extra/*"
 
 # We override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
-- 
2.21.0


