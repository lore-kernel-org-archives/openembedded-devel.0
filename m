Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD3B714E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 05:56:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H5uiQD011888
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 22:56:44 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 22:56:44 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Sep 2014 01:56:39 -0400
Message-ID: <6e4c40833f63ef374fde8aab5feb21c7e6f6aa7e.1410932659.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410932659.git.wenzong.fan@windriver.com>
References: <cover.1410932659.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][meta-oe] talloc: fixes for sstate cache reuse
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
X-List-Received-Date: Wed, 17 Sep 2014 05:56:45 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Fixes for sstate cache reuse between different build dirs. The
${SWIGLIBDIR##${STAGING_DIR_NATIVE}} had confused bitbake, bitbake would
add the "SWIGLIBDIR##${STAGING_DIR_NATIVE}" to the deps of do_install,
which caused the sstate cached can't be re-used.

Use another way for SWIGLIBDIR to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 9cf3e43..7bbfbc2 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -23,7 +23,15 @@ DEPENDS += "swig-native"
 do_install_prepend() {
     # Hack the way swig interface for talloc is installed
     # This hack is accompanied by install-swig-interface-in-SWINGLIBDIR.patch
-    type swig > /dev/null 2>&1 && SWIGLIBDIR=`swig -swiglib` && SWIGLIBDIR=`readlink -f ${SWIGLIBDIR}` && SWIGLIBDIR=${SWIGLIBDIR##${STAGING_DIR_NATIVE}} && export SWIGLIBDIR || echo "No swig found"
+    if which swig > /dev/null; then
+        SWIGLIBDIR="$(echo $(readlink -f $(swig -swiglib)) | \
+            sed -e 's#^${STAGING_DIR_NATIVE}##')"
+    fi
+    if [ -n "$SWIGLIBDIR" ]; then
+        export SWIGLIBDIR
+    else
+        echo "No swig found"
+    fi
 }
 
 do_install_append() {
-- 
1.7.9.5


