Return-Path: <prvs=29209906af=adrian.ratiu@ni.com>
X-Greylist: delayed 3638 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Jan 2019 16:39:11 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 808D27C164
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:39:11 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x0HFa0YB009568 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:38:34 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2q1nnvyht5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:38:34 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x0HFcXxU008781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:38:33 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 17 Jan 2019 09:38:33 -0600
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 17 Jan 2019 09:38:32 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jan 2019 17:38:22 +0200
Message-ID: <20190117153822.970-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-01-17_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-python][PATCH] python-pyinotify.inc: add RDEPEND on ${PYTHON_PN}-smtpd
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
X-List-Received-Date: Thu, 17 Jan 2019 16:39:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

pyinotify depends on having asyncore.py available which is provided by
python2/3-smtpd.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-python/recipes-devtools/python/python-pyinotify.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pyinotify.inc b/meta-python/recipes-devtools/python/python-pyinotify.inc
index 975f11c10..21abdb84f 100644
--- a/meta-python/recipes-devtools/python/python-pyinotify.inc
+++ b/meta-python/recipes-devtools/python/python-pyinotify.inc
@@ -7,6 +7,7 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-smtpd \
 "
 
 SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
-- 
2.20.1


