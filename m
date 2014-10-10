Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B296071844
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 12:01:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Oct 2014 05:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="616397845"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 10 Oct 2014 05:00:40 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Oct 2014 15:00:29 +0300
Message-Id: <1412942429-14728-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
References: <1412942429-14728-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/2] ecj: fix unpackpost task
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
X-List-Received-Date: Fri, 10 Oct 2014 12:01:21 -0000

ecj recipe is built as initial and as native,
as such, unpackpost is run multiple times over
the same code source. Added check if a move
operation hasn't been already executed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 recipes-core/ecj/libecj-bootstrap.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
index 9e1cc1d..cd9d90f 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -29,7 +29,7 @@ do_unpackpost() {
   rm -rf META-INF
 
   # Move source into separate subdir.
-  if [ -d org ]; then
+  if [ -d org  -a ! -d source/org ]; then
     mv org source/
   fi
   # Remove stuff unneeded for the bootstrap compiler.
-- 
1.9.1


