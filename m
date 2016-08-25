Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 534F770034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 01:43:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7P1h2uN028820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 18:43:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 18:43:02 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Aug 2016 09:41:32 +0800
Message-ID: <1472089292-26226-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libhugetlbfs: add libhugetlbfs-perl to RDEPENDS
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
X-List-Received-Date: Thu, 25 Aug 2016 01:43:02 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add libhugetlbfs-perl to RDEPENDS for libhugetlbfs
  as some perl scripts in package libhugetlbfs depend
  on the perl module provided by libhugetlbfs-perl

* Update the perl module install folder to
  $(LIBDIR64)/perl/${@get_perl_version(d)}/TLBC such as
  /usr/lib64/perl/5.22.1/TLBC/OpCollect.pm otherwise the
  perl scripts can't find the perl module as below:

  Can't locate TLBC/OpCollect.pm in @INC (you may need to install
  the TLBC::OpCollect module) (@INC contains: /usr/bin
  /etc/perl /usr/lib64/perl/site_perl/5.22.1/
  /usr/lib64/perl/site_perl/5.22.1
  /usr/lib64/perl/vendor_perl/5.22.1/
  /usr/lib64/perl/vendor_perl/5.22.1 /usr/lib64/perl/5.22.1/
  /usr/lib64/perl/5.22.1 /usr/local/lib/site_perl .)
  at /usr/bin/cpupcstat line 12.
  BEGIN failed--compilation aborted at /usr/bin/cpupcstat line 12.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index accbffd..301b550 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "sysfsutils perl"
-RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource"
+RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource ${PN}-perl"
 RDEPENDS_${PN}-tests += "bash"
 
 PV = "2.19"
@@ -37,6 +37,7 @@ CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 #The CUSTOM_LDSCRIPTS doesn't work with the gold linker
+inherit cpan-base
 do_configure() {
     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
       sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
@@ -44,6 +45,11 @@ do_configure() {
 
     # fixup perl module directory hardcoded to perl5
     sed -i 's/perl5/perl/g'  Makefile
+
+    # fixup to install perl module under $(LIBDIR)/perl/${@get_perl_version(d)}/TLBC
+    # to avoid below error
+    # Can't locate TLBC/OpCollect.pm in @INC
+    sed -i '/^PMDIR/ s:perl:perl/${@get_perl_version(d)}:g' Makefile
 }
 
 do_install() {
-- 
2.8.1


