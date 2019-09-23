Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 07B817CDC0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 02:15:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2019 19:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,538,1559545200"; d="scan'208";a="389327123"
Received: from saininav-desk1.png.intel.com ([172.30.199.130])
	by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2019 19:15:41 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2019 10:18:32 +0800
Message-Id: <20190923021832.6859-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] rrdtool: suppress appending of installation to perllocal.pod
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
X-List-Received-Date: Mon, 23 Sep 2019 02:15:41 -0000

perl modules when gets installed can produce a perllocal.pod
file for documenting a list of locally installed perl modules.
This can conflict if multiple packages generate the file.

Hits the conflict with apparmor & rrdtool packages.
Error: Transaction check error:
  file /usr/lib/perl5/5.30.0/x86_64-linux/perllocal.pod conflicts between attempted installs of rrdtool-1.7.2-r0.corei7_64 and apparmor-2.13.3-r0.corei7_64

perllocal.pod files are for documentation purpose, so
disabling does not harm. Generating perllocal.pod for perl
module is disabled by passing NO_PERLLOCAL=1
with ExtUtils::MakeMaker utility.

https://perldoc.perl.org/5.30.0/ExtUtils/MakeMaker.html#Using-Attributes-and-Parameters

[YOCTO #13491]

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
index 1962a2dd4..b39ceda80 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
@@ -32,7 +32,7 @@ am_cv_python_pyexecdir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packag
 --disable-python,python,"
 
 PACKAGECONFIG[perl] = \
-"--enable-perl=yes --with-perl-options='INSTALLDIRS="vendor" CCFLAGS="${CFLAGS}" NO_PACKLIST=1' \
+"--enable-perl=yes --with-perl-options='INSTALLDIRS="vendor" CCFLAGS="${CFLAGS}" NO_PACKLIST=1 NO_PERLLOCAL=1' \
 ac_cv_path_PERL_CC='${CC}',  \
 --disable-perl,perl,"
 
-- 
2.17.1


