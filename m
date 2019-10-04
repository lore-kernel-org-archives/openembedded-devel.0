Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31D077F2DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 14:20:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x94EKh1s008708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Oct 2019 07:20:44 -0700
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 4 Oct 2019 07:20:37 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Oct 2019 17:16:49 +0300
Message-ID: <20191004141649.14409-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] kea: Disable parallel install
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
X-List-Received-Date: Fri, 04 Oct 2019 14:20:43 -0000
Content-Type: text/plain

According to configure.ac, make install might fail when run with multiple jobs:

$ tail -15 log.do_configure
...
When running "make install" do not use any form of parallel or job
server options (such as GNU make's -j option). Doing so may cause
errors.
...

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-networking/recipes-connectivity/kea/kea_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
index fb166df60..08e9923ba 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.0.bb
@@ -60,3 +60,5 @@ FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} += "${libdir}/hooks/*.so"
 
 BBCLASSEXTEND += "native"
+
+PARALLEL_MAKEINST = ""
-- 
2.20.1


