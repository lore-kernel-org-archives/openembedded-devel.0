Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E50FF7E189
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 08:06:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4N86CRr004593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 May 2019 01:06:33 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 23 May 2019 01:06:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 23 May 2019 16:06:19 +0800
Message-ID: <1558598779-12826-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rrdtool: improve reproducibility
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
X-List-Received-Date: Thu, 23 May 2019 08:06:59 -0000
Content-Type: text/plain

- Pass var-CFLAGS (contains -fdebug-prefix-map) to perl Makefile.pl
  to strip build path prefix

- Do not generate .packlist which contains build path.
  (it refers cpan_do_configure in cpan.bbclass)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
index 63cdb7a..eaa5c71 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
@@ -35,7 +35,7 @@ am_cv_python_pyexecdir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packag
 --disable-python,python,"
 
 PACKAGECONFIG[perl] = \
-"--enable-perl=yes --with-perl-options='INSTALLDIRS="vendor"' \
+"--enable-perl=yes --with-perl-options='INSTALLDIRS="vendor" CCFLAGS="${CFLAGS}" NO_PACKLIST=1' \
 ac_cv_path_PERL_CC='${CC}',  \
 --disable-perl,perl,"
 
-- 
2.7.4


