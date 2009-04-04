Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LqBX5-000742-8r
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 21:28:02 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090404192518.KVGW27308.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 4 Apr 2009 15:25:18 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id bXRH1b0034dMFYL04XRHyZ; Sat, 04 Apr 2009 15:25:17 -0400
X-Authority-Analysis: v=1.0 c=1 a=2yB6cCmgc6EA:10 a=OEGDzFAyAw4A:10
	a=rKjlFMSrdqnj3h1DRB4A:9 a=ihvHmtRkdj8D1H25o-z7zlELtqgA:4
	a=0oFHZcPLJ8YA:10
X-CM-Score: 0.00
Date: Sat, 4 Apr 2009 12:25:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090404192517.GP30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
	<20090403221751.GJ30840@smtp.west.cox.net>
	<20090403221813.GK30840@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090403221813.GK30840@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.45
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] task-slugos-toolchain-target: Add libstdc++-dev for C++	heades, bump PR
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
X-List-Received-Date: Sat, 04 Apr 2009 19:28:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After checking with mwester, this is the correct thing to do.
---

task-slugos-toolchain-target: Add libstdc++-dev for C++ heades, bump PR

---
 recipes/tasks/task-slugos-toolchain-target.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-slugos-toolchain-target.bb b/recipes/tasks/task-slugos-toolchain-target.bb
index 489a412..4f9df9b 100644
--- a/recipes/tasks/task-slugos-toolchain-target.bb
+++ b/recipes/tasks/task-slugos-toolchain-target.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Packages for a standalone SDK or external toolchain"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-PR = "r1"
+PR = "r2"
 
 PACKAGES = "${PN}"
 
@@ -18,6 +18,7 @@ RDEPENDS_${PN} = "\
     libcrypto \
     openssl-dev \
     libstdc++ \
+    libstdc++-dev \
     "
 
 # Not sure if we need these or not...
-- 
1.5.6.3


-- 
Tom Rini


