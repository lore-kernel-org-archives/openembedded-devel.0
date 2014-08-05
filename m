Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1227365D59
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 13:21:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 06:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,804,1400050800"; d="scan'208";a="465149408"
Received: from tskannan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 06:21:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:20:42 +0100
Message-Id: <e1023ee4e19fcc2f56733b3b4586ad9bda814ede.1407244194.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/5] apache2: do not patch generated file
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
X-List-Received-Date: Tue, 05 Aug 2014 13:21:34 -0000

We already patch configure.ac and we're not bypassing autoreconf,
so we don't need to patch configure as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../apache2/apache2/apache-configure_perlbin.patch      | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
index baa739f..c90279d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
@@ -4,23 +4,6 @@
 #
 # Upstream-Status: Inappropriate [configuration]
 
---- a/configure
-+++ b/configure
-@@ -22365,13 +22365,7 @@
- #define APACHE_MPM_DIR "$MPM_DIR"
- _ACEOF
-
--
--perlbin=`$ac_aux_dir/PrintPath perl`
--if test "x$perlbin" = "x"; then
--    perlbin="/replace/with/path/to/perl/interpreter"
--fi
--
--
-+perlbin='/usr/bin/perl'
-
- BSD_MAKEFILE=no
- ap_make_include=include
 --- a/configure.in
 +++ b/configure.in
 @@ -638,10 +638,7 @@
-- 
1.9.3


