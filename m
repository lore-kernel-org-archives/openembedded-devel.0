Received: from perceval.ideasonboard.com ([95.142.166.194])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurent.pinchart@ideasonboard.com>)
	id 1RQjLm-0004ZV-Dl for openembedded-devel@lists.openembedded.org;
	Wed, 16 Nov 2011 18:32:42 +0100
Received: from localhost.localdomain (unknown [91.178.181.166])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B84BB35BEF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2011 17:26:19 +0000 (UTC)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2011 18:26:31 +0100
Message-Id: <1321464391-10992-1-git-send-email-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] Don't use host version of libblas and liblapack for python-numpy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2011 17:32:42 -0000

When trying to locate libblas and liblapack, numpy will use the host
versions of those libraries if available. This breaks compilation when
linking.

Fix the problem by disabling libblas and liblapack support completely,
as OpenEmbedded doesn't provide recipes for those libraries anyway.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../python-numpy/00-numpy-1.4.1-no-atlas.patch     |   28 ++++++++++++++++++++
 recipes/python/python-numpy_1.4.1.bb               |    3 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes/python/python-numpy/00-numpy-1.4.1-no-atlas.patch

diff --git a/recipes/python/python-numpy/00-numpy-1.4.1-no-atlas.patch b/recipes/python/python-numpy/00-numpy-1.4.1-no-atlas.patch
new file mode 100644
index 0000000..925aeb6
--- /dev/null
+++ b/recipes/python/python-numpy/00-numpy-1.4.1-no-atlas.patch
@@ -0,0 +1,28 @@
+When trying to locate libblas and liblapack, numpy will use the host
+versions of those libraries if available. This breaks compilation when
+linking.
+
+diff -Naur numpy-1.4.1/numpy/core/setup.py numpy-1.4.1/numpy/core/setup.py
+--- numpy-1.4.1/numpy/core/setup.py	2010-04-22 11:35:23.000000000 +0200
++++ numpy-1.4.1/numpy/core/setup.py	2011-11-16 17:11:22.000000000 +0100
+@@ -777,7 +777,7 @@
+ 
+     # Configure blasdot
+     blas_info = get_info('blas_opt',0)
+-    #blas_info = {}
++    blas_info = {}
+     def get_dotblas_sources(ext, build_dir):
+         if blas_info:
+             if ('NO_ATLAS_INFO',1) in blas_info.get('define_macros',[]):
+diff -Naur numpy-1.4.1/numpy/linalg/setup.py numpy-1.4.1/numpy/linalg/setup.py
+--- numpy-1.4.1/numpy/linalg/setup.py	2010-04-18 12:06:18.000000000 +0200
++++ numpy-1.4.1/numpy/linalg/setup.py	2011-11-16 17:11:35.000000000 +0100
+@@ -9,7 +9,7 @@
+     config.add_data_dir('tests')
+ 
+     # Configure lapack_lite
+-    lapack_info = get_info('lapack_opt',0) # and {}
++    lapack_info = get_info('lapack_opt',0) and {}
+     def get_lapack_lite_sources(ext, build_dir):
+         if not lapack_info:
+             print "### Warning:  Using unoptimized lapack ###"
diff --git a/recipes/python/python-numpy_1.4.1.bb b/recipes/python/python-numpy_1.4.1.bb
index f4941cf..fbe9d8d 100644
--- a/recipes/python/python-numpy_1.4.1.bb
+++ b/recipes/python/python-numpy_1.4.1.bb
@@ -2,9 +2,10 @@ DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 PRIORITY = "optional"
 LICENSE = "PSF"
-PR = "ml0"
+PR = "ml1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
+           file://00-numpy-1.4.1-no-atlas.patch \
 	   file://config.h \
 	   file://numpyconfig.h \
 	  "
-- 
Regards,

Laurent Pinchart



