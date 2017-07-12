Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 393 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Jul 2017 08:42:41 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 637FF71DD2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 08:42:41 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id E0C872803FE; Wed, 12 Jul 2017 01:36:34 -0700 (PDT)
Date: Wed, 12 Jul 2017 01:36:34 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170712083634.GZ22446@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-java][PATCH] java-library.bbclass: compatibility with per-recipe sysroots
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
X-List-Received-Date: Wed, 12 Jul 2017 08:42:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The removebinaries task was intended to remove pre-built .jar and .class files
from the unpacked source, but when per-recipe sysroots were implemented and
ended up under WORKDIR, .jar or .class in those sysroots inadvertently started 
getting killed as well.

For instance, ${WORKDIR}/recipe-sysroot-native/usr/share/java/ecj-bootstrap.jar
was deleted when attempting to build jlex-native... which made javac in
that sysroot rather unhappy.

Solve by excluding both recipe-sysroot and recipe-sysroot-native dirs
from the search-and-destroy operation.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 classes/java-library.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 58d5a40..ce1cd28 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -50,8 +50,10 @@ ALTJARFILENAMES = "${BPN}.jar"
 # Java "source" distributions often contain precompiled things
 # we want to delete first.
 do_removebinaries() {
-  find ${WORKDIR} -name "*.jar" -exec rm {} \;
-  find ${WORKDIR} -name "*.class" -exec rm {} \;
+  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
+                  -name "*.jar" -exec rm {} \;
+  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path "${RECIPE_SYSROOT_NATIVE}/*" \
+                  -name "*.class" -exec rm {} \;
 }
 
 addtask removebinaries after do_unpack before do_patch
-- 
1.9.4


