Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B015460589
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 22:58:04 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tB2Mw4WX001119 for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Dec 2015 16:58:04 -0600
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015120216580408-679209 ;
	Wed, 2 Dec 2015 16:58:04 -0600 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Dec 2015 16:57:50 -0600
Message-Id: <1449097070-28665-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/02/2015 04:58:04 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/02/2015 04:58:04 PM,
	Serialize complete at 12/02/2015 04:58:04 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-02_13:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [meta-oe] [PATCH] python-jinja2: Disable `make clean`
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
X-List-Received-Date: Wed, 02 Dec 2015 22:58:04 -0000

Makefile doesn't define "clean". Unless disabled, base_do_configure()
will fail the build attempting to run `make clean` when rebuilding
this recipe.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Natinst-ReviewBoard-ID: 119389
---
 meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb b/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
index e66077a..aa5c082 100644
--- a/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb
@@ -17,3 +17,5 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit setuptools
 
 RDEPENDS_${PN} += "python-io python-pickle python-crypt python-math python-netclient python-re python-textutils python-lang python-pprint python-shell python-markupsafe"
+
+CLEANBROKEN = "1"
-- 
2.6.2


