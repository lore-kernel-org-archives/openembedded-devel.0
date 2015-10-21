Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8467766F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:00:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L80EXH001575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Oct 2015 01:00:14 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 21 Oct 2015 01:00:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Wed, 21 Oct 2015 15:47:38 +0800
Message-ID: <1445413660-30085-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445413660-30085-1-git-send-email-Qi.Chen@windriver.com>
References: <1445413660-30085-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 2/4] rrdtool: fix file locations
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
X-List-Received-Date: Wed, 21 Oct 2015 08:00:14 -0000
Content-Type: text/plain

When we build rrdtool, we would meet the following QA issue.

  QA Issue: /usr/share/rrdtool/examples/stripes.py_rrdtool-perl contained
  in package rrdtool-perl requires /usr/bin/python, but no providers found
  in its RDEPENDS [file-rdeps]

The problem is that /usr/share/rrdtool/examples not only contain perl examples,
but also contains python examples.

Besides, ${datadir}/examples don't exist, fix it to be ${datadir}/rrdtool/examples.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index d4f9834..14e1966 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -102,11 +102,11 @@ do_configure() {
 
 PACKAGES =+ "${PN}-perl ${PN}-python"
 
-FILES_${PN}-doc += "${datadir}/examples"
+FILES_${PN}-doc += "${datadir}/rrdtool/examples"
 
 DESCRIPTION_${PN}-perl = \
 "The ${PN}-perl package includes RRDtool bindings for perl."
-FILES_${PN}-perl = "${libdir}/perl/vendor_perl/*/*.pm ${datadir}/rrdtool/examples \
+FILES_${PN}-perl = "${libdir}/perl/vendor_perl/*/*.pm \
     ${libdir}/perl/vendor_perl/*/auto/RRDs/RRDs.*"
 RDEPENDS_${PN}-perl = "perl perl-module-lib perl-module-getopt-long perl-module-time-hires \
     perl-module-io-file perl-module-ipc-open2 perl-module-io-socket"
-- 
1.9.1


