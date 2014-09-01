Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80167712F7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIjVx029626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:46 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:35 -0700
Message-ID: <84e691892bfaad00254ad77d9b10b13577e8a828.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] rrdtool: use rrdtool rather than PN
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Sep 2014 15:18:45 -0000
Content-Type: text/plain

The "${datadir}/${PN}" will be changed to "${datadir}/lib32-rrdtool"
when multilib which isn't what need, use rrdtool to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
index c3d3b7c..449a923 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
@@ -108,7 +108,7 @@ FILES_${PN}-doc += "${datadir}/examples"
 
 DESCRIPTION_${PN}-perl = \
 "The ${PN}-perl package includes RRDtool bindings for perl."
-FILES_${PN}-perl = "${libdir}/perl/vendor_perl/*/*.pm ${datadir}/${PN}/examples \
+FILES_${PN}-perl = "${libdir}/perl/vendor_perl/*/*.pm ${datadir}/rrdtool/examples \
     ${libdir}/perl/vendor_perl/*/auto/RRDs/RRDs.*"
 RDEPENDS_${PN}-perl = "perl perl-module-lib perl-module-getopt-long perl-module-time-hires \
     perl-module-io-file perl-module-ipc-open2 perl-module-io-socket"
-- 
1.7.9.5


