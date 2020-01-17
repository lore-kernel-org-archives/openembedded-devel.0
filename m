Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 558 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Jan 2020 06:03:09 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC757F856
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 06:03:09 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 909CA280318; Thu, 16 Jan 2020 21:57:29 -0800 (PST)
Date: Thu, 16 Jan 2020 21:57:29 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20200117055729.6wmadn4oqodkeykq@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: [meta-oe][PATCH] lcov: geninfo needs another perl module
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
X-List-Received-Date: Fri, 17 Jan 2020 06:03:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes error when running geninfo:

  Can't locate Digest/MD5.pm in @INC (you may need to install the
  Digest::MD5 module) (@INC contains: <snip>) at geninfo line 58.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index fd02f4a..26e797a 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -13,6 +13,7 @@ RDEPENDS_${PN} += " \
     perl \
     perl-module-filehandle \
     perl-module-getopt-std \
+    perl-module-digest-md5 \
     perl-module-digest-sha \
     perl-module-constant \
     perl-module-cwd \
-- 
1.9.4


