Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9957B605FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 05:51:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u445p2Vx026273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 May 2016 22:51:02 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 3 May 2016 22:51:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 May 2016 13:43:19 +0800
Message-ID: <1462340599-26232-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rrdtool: fix do_configure failure on some hosts
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
X-List-Received-Date: Wed, 04 May 2016 05:51:04 -0000
Content-Type: text/plain

On some hosts, when building rrdtool, we would meet do_configure error like
below.

| *** Module name IN: /usr/lib64/perl/5.22.0/POSIX.pm
| *** p1: /usr/lib64/  p3: perl/5.22.0/  p5: POSIX.pm
| *** Module name OUT: /path/to/builddir/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.1/POSIX.pm
| POSIX object version 1.53_01 does not match $POSIX::VERSION 1.53 at /usr/lib64/perl/5.22.0/XSLoader.pm line 108.

Set PERLHOSTLIB to "" to fix the above error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 8999dbe..82924f0 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -57,6 +57,8 @@ export STAGING_INCDIR
 
 # emulate cpan_do_configure
 EXTRA_OEMAKE = ' PERL5LIB="${PERL_ARCHLIB}" '
+# Avoid do_configure error on some hosts
+export PERLHOSTLIB = ""
 
 do_configure() {
     #fix the pkglib problem with newer automake
-- 
2.8.1


